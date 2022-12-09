using AutoMapper;
using EmailMarketing.Common.Extensions;
using EmailMarketing.Common.GoogleServices;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Services;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Operations.Request;
using EmailMarketing.Modules.Operations.Response;
using EmailMarketing.Modules.Projects.Services;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Services;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Modules.Operations.Services
{
    public interface IOperationServices
    {
        Task<Operation> CreateAsync(int userId, CreateOperationRequest request);
        void UpdateStatus(int operationId, OperationStatus status);
        Task SendMailAsync(int operationId);
        void CreateOperationDetail(int operationId);
        void Update(int operationId, UpdateOperationRequest request);
        void Delete(DeleteOperationRequest request);
        GetOperationDetailResponse GetOperationDetail(int operationId, GetOperationDetailRequest request);
        PaggingResponse<GetOperationResponse> Get(int userId, GetOperationRequest request);
        GetContentOperationResponse ContentOfOperation(int userId, int operationId);
    }
    public class OperationServices : IOperationServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IUserServices userServices;
        private readonly IGroupContactServices groupContactServices;
        private readonly IGoogleServices googleServices;
        private readonly IProjectServices projectServices;
        private readonly IMapper mapper;
        public OperationServices(IRepositoryWrapper repository, IMapper mapper, IGroupContactServices groupContactServices, IUserServices userServices, IGoogleServices googleServices, IProjectServices projectServices)
        {
            this.repository = repository;
            this.mapper = mapper;
            this.groupContactServices = groupContactServices;
            this.userServices = userServices;
            this.googleServices = googleServices;
            this.projectServices = projectServices;
        }

        public GetContentOperationResponse ContentOfOperation(int userId, int operationId)
        {
            return repository.Operation.FindByCondition(x => x.Id == operationId && x.UserId == userId).Include(x => x.GoogleAccount)
                .Select(x => new GetContentOperationResponse
                {
                    Id = x.Id,
                    Subject = x.Subject,
                    EmailSend = x.GoogleAccount.Email,
                    Content = x.Content,
                    DateSend = x.DateSend
                }).FirstOrDefault()!;
        }

        public async Task<Operation> CreateAsync(int userId, CreateOperationRequest request)
        {
            Operation operation = mapper.Map<CreateOperationRequest, Operation>(request);
            operation.UserId = userId;

            if (request.File != null)
            {
                operation.FileContent = await request.File.UploadFilesAsync("FileContents");
                operation.FileName = request.File.FileName;
            }

            repository.Operation.Create(operation);
            repository.Save();
            return operation;
        }

        public void CreateOperationDetail(int operationId)
        {
            Operation? operation = repository.Operation.FindByCondition(x => x.Id == operationId).FirstOrDefault();
            List<Contact> contacts = groupContactServices.GetDetail(operation!.UserId, operation.GroupContactId).Contacts.ToList();
            List<OperationDetail> entities = contacts.Select(x => new OperationDetail { ContactId = x.Id, OperationId = operationId }).ToList();

            repository.OperationDetail.CreateMulti(entities);
            repository.Save();
        }

        public void Delete(DeleteOperationRequest request)
        {
            List<Operation> operations = repository.Operation.FindByCondition(x => request.OperationIds!.Contains(x.Id)).ToList();
            repository.Operation.DeleteMulti(operations);
            repository.Save();
        }

        public PaggingResponse<GetOperationResponse> Get(int userId, GetOperationRequest request)
        {
            return repository.Operation.FindByCondition(x => x.UserId == userId)
                .Include(x => x.Project).Include(x => x.GroupContact).Include(x => x.GoogleAccount)
                .Select(x => new GetOperationResponse
                {
                    Id = x.Id,
                    ProjectName = x.Project.Name,
                    Name = x.Name,
                    EmailSend = x.GoogleAccount.Email,
                    DateSend = x.DateSend,
                    CreatedDate = x.CreatedDate,
                    UserId = x.UserId,
                    Status = x.Status
                })
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }

        public GetOperationDetailResponse GetOperationDetail(int operationId, GetOperationDetailRequest request)
        {
            IQueryable<OperationDetail> entities = repository.OperationDetail.FindByCondition(x => x.OperationId == operationId);

            return new GetOperationDetailResponse
            {
                Complete = entities.Count(x => x.Status == OperationStatus.Complete),
                Processing = entities.Count(x => x.Status == OperationStatus.Processing),
                Fail = entities.Count(x => x.Status == OperationStatus.Fail),
                OperationDetail = entities.ApplySearch(request.InfoSearch!).ApplySort(request.Orderby).ApplyPagging(request.Current, request.PageSize)
            };
        }

        public async Task SendMailAsync(int operationId)
        {
            Operation? operation = repository.Operation.FindByCondition(x => x.Id == operationId)
                .Include(x => x.OperationDetails).ThenInclude(x => x.Contact).FirstOrDefault();
            operation!.Status = OperationStatus.Processing;
            repository.Save();

            GoogleAccount googleAccount = userServices.GetDetailGoogleAccount(operation!.UserId, operation.GoogleAccountId);
            List<OperationDetail> operationDetails = operation.OperationDetails.ToList();

            foreach (OperationDetail operationDetail in operationDetails)
            {
                if (operationDetail.Status == OperationStatus.Complete)
                    continue;

                string male = operationDetail.Contact.Male == ContactMale.Male ? "Anh" : "Chị";

                string dynamicContent = operation.Content.Replace("[gender]", male, StringComparison.OrdinalIgnoreCase)
                    .Replace("[name]", operationDetail.Contact.Name, StringComparison.OrdinalIgnoreCase);

                string? path = operation.FileContent is null ? null : Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", operation.FileContent);

                bool? status = await googleServices.SendMailAsync(googleAccount.Email, operation.Subject, dynamicContent, googleAccount.RefreshToken, path!, operation.FileName!, operationDetail.Contact.Email);

                if (status is null)
                {
                    operationDetail.StatusMessage = "Authenticate error";
                    operationDetail.Status = OperationStatus.Fail;
                    break;
                }

                if (status!.Value)
                {
                    operationDetail.Status = OperationStatus.Complete;
                    operationDetail.StatusMessage = "Complete";
                    projectServices.UpdateUsed(operation.ProjectId);
                }
                else
                {
                    operationDetail.StatusMessage = "Fail";
                    operationDetail.Status = OperationStatus.Fail;
                }

            }

            UpdateStatus(operationId, operationDetails.Any(x => x.Status == OperationStatus.Fail) ? OperationStatus.Fail : OperationStatus.Complete);
        }

        public void Update(int operationId, UpdateOperationRequest request)
        {
            Operation? operation = repository.Operation.FindByCondition(x => x.Id == operationId).FirstOrDefault();
            repository.Operation.Update(mapper.Map(request, operation!));
            repository.Save();
        }

        public void UpdateStatus(int operationId, OperationStatus status)
        {
            Operation? operation = repository.Operation.FindByCondition(x => x.Id == operationId).FirstOrDefault();
            operation!.Status = status;
            repository.Save();
        }
    }
}
