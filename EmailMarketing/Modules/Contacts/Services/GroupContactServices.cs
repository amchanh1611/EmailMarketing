using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Response;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Modules.Contacts.Services
{
    public interface IGroupContactServices
    {
        void Create(int userId, CreateGroupContactRequest request);
        void Update(int userId, int groupId, UpdateGroupContactRequest request);
        void Delete(int userId, DeleteGroupContactRequest request);
        PaggingResponse<GroupContactResponse> Get(int userId, GetGroupContactRequest request);
    }
    public class GroupContactServices : IGroupContactServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;
        public GroupContactServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(int userId, CreateGroupContactRequest request)
        {
            GroupContact groupContact = mapper.Map<CreateGroupContactRequest, GroupContact>(request);
            groupContact.UserId = userId;
            repository.GroupContact.Create(groupContact);
            repository.Save();
        }

        public void Delete(int userId, DeleteGroupContactRequest request)
        {
            List<GroupContact>? groupContact = repository.GroupContact
                .FindByCondition(x => request.ids!.Contains(x.Id)  && x.UserId == userId).ToList();
            repository.GroupContact.DeleteMulti(groupContact!);
            repository.Save();
        }

        public PaggingResponse<GroupContactResponse> Get(int userId, GetGroupContactRequest request)
        {
            return repository.GroupContact.FindByCondition(x => x.UserId == userId)
                .Include(x => x.Contacts)
                .Select(x => new GroupContactResponse { Id = x.Id, Name = x.Name, NumberContact = x.Contacts.Count() })
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize); 
        }

        public void Update(int userId,int groupId, UpdateGroupContactRequest request)
        {
            GroupContact? groupContact = repository.GroupContact.FindByCondition(x => x.Id == groupId && x.UserId == userId).FirstOrDefault();
            repository.GroupContact.Update(mapper.Map(request, groupContact!));
            repository.Save();
        }
    }
}
