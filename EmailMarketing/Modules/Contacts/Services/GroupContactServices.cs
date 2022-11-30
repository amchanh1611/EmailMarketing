using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Persistences.Repositories;

namespace EmailMarketing.Modules.Contacts.Services
{
    public interface IGroupContactServices
    {
        void Create(int userId, CreateGroupContactRequest request);
        void Update(int userId, int groupId, UpdateGroupContactRequest request);
        void Delete(int userId, int groupId);
        PaggingResponse<GroupContact> Get(int userId, GetGroupContactRequest request);
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

        public void Delete(int userId, int groupId)
        {
            GroupContact? groupContact = repository.GroupContact.FindByCondition(x => x.Id == groupId && x.UserId == userId).FirstOrDefault();
            repository.GroupContact.Delete(groupContact!);
            repository.Save();
        }

        public PaggingResponse<GroupContact> Get(int userId, GetGroupContactRequest request)
        {
            return repository.GroupContact.FindByCondition(x=>x.UserId==userId)
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
