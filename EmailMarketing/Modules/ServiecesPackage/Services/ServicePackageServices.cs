using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.ServiecesPackage.Request;
using EmailMarketing.Persistences.Repositories;

namespace EmailMarketing.Modules.ServiecesPackage.Services
{
    public interface IServicePackageServices
    {
        void Create(CreateServicePackageRequest request);
        void Update(int id, UpdateServicePackageRequest request);
        void Delete(int id);
        PaggingResponse<ServicePackage> Get(GetServicePackageRequest request);
    }
    public class ServicePackageServices : IServicePackageServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;

        public ServicePackageServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(CreateServicePackageRequest request)
        {
            repository.ServicePackage.Create(mapper.Map<CreateServicePackageRequest, ServicePackage>(request));
            repository.Save();
        }

        public void Delete(int id)
        {
            ServicePackage? servicePackage = repository.ServicePackage.FindByCondition(x => x.Id == id).FirstOrDefault();
            repository.ServicePackage.Delete(servicePackage!);
            repository.Save();
        }

        public PaggingResponse<ServicePackage> Get(GetServicePackageRequest request)
        {
            return repository.ServicePackage.FindAll()
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby is null ? "Quantity" : request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }

        public void Update(int id, UpdateServicePackageRequest request)
        {
            ServicePackage? servicePackage = repository.ServicePackage.FindByCondition(x => x.Id == id).FirstOrDefault();
            repository.ServicePackage.Update(mapper.Map(request!, servicePackage!));
            repository.Save();
        }
    }
}
