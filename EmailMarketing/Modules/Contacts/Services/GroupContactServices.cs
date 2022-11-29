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
        void Create(CreateGroupContactRequest request);
        PaggingResponse<GroupContact> Get(GetGroupContactRequest request);
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

        public void Create(CreateGroupContactRequest request)
        {
            repository.GroupContact.Create(mapper.Map<CreateGroupContactRequest, GroupContact>(request));
            repository.Save();
        }

        public PaggingResponse<GroupContact> Get(GetGroupContactRequest request)
        {
            return repository.GroupContact.FindAll()
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }
    }
}
