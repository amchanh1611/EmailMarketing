using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Services;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Operations.Request;
using EmailMarketing.Modules.Operations.Response;
using EmailMarketing.Modules.Users.Services;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Modules.Operations.Services
{
    public interface IOperationServices
    {
        Operation Create(int userId, CreateOperationRequest request);
        void UpdateStatus(int userId, int operationId, OperationStatus status);
        PaggingResponse<GetOperationResponse> Get(int userId, GetOperationRequest request);
        GetContentOperationResponse ContentOfOperation(int userId, int operationId);
        GetOperationDetailResponse GetDetailOperation(int userId, int OperationId, GetOperationRequest request);

    }
    public class OperationServices : IOperationServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;
        public OperationServices(IRepositoryWrapper repository, IMapper mapper, IUserServices userServices, IGroupContactServices groupContactServices)
        {
            this.repository = repository;
            this.mapper = mapper;
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

        public Operation Create(int userId, CreateOperationRequest request)
        {
            Operation operation = mapper.Map<CreateOperationRequest, Operation>(request);
            operation.UserId = userId;
            repository.Operation.Create(operation);
            repository.Save();
            return operation;
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

        public GetOperationDetailResponse GetDetailOperation(int userId, int operationId, GetOperationRequest request)
        {
            return repository.Operation.FindByCondition(x => x.Id == operationId && x.UserId == userId).Include(x => x.GroupContact)
                .Select(x => new GetOperationDetailResponse 
                {
                    Contacts = x.GroupContact.Contacts.AsQueryable()
                    .ApplySearch(request.InfoSearch!)
                    .ApplySort(request.Orderby)
                    .ApplyPagging(request.Current,request.PageSize)
                })
                .FirstOrDefault()!;
        }

        public void UpdateStatus(int userId, int operationId, OperationStatus status)
        {
            Operation? operation = repository.Operation.FindByCondition(x => x.Id == operationId && x.UserId == userId).FirstOrDefault();
            operation!.Status = status;
            repository.Save();
        }
    }
}
