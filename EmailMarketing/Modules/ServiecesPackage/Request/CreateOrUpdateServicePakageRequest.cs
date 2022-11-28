using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.ServiecesPackage.Request
{
    public class CreateOrUpdateServicePakageRequest
    {
        public string? Name { get; set; }
        public int? Quantity { get; set; }
    }

    public class CreateServicePackageRequest : CreateOrUpdateServicePakageRequest { }

    public class UpdateServicePackageRequest : CreateOrUpdateServicePakageRequest { }

    public class CreateOrUpdateServicePakageValidator : AbstractValidator<CreateOrUpdateServicePakageRequest>
    {
        public CreateOrUpdateServicePakageValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.Quantity).NotNull().NotEqual(0).WithMessage("{PropertyName is required}");
        }
    }

    public class CreateServicePakageValidator : AbstractValidator<CreateServicePackageRequest>
    {
        public CreateServicePakageValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateServicePakageValidator(repository));
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName is required}")
               .Must((_, name) =>
               {
                   return !(repository.ServicePackage.FindByCondition(x => x.Name == name).Any());
               }).WithMessage("{PropertyName} already exists");
        }
    }

    public class UpdateServicePakageValidator : AbstractValidator<UpdateServicePackageRequest>
    {
        public UpdateServicePakageValidator(IRepositoryWrapper repository,IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateServicePakageValidator(repository));
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName is required}")
              .Must((_, name) =>
              {
                  int userId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("servicePackageId")!.ToString()!);
                  return !repository.ServicePackage.FindByCondition(
                      x => x.Name == name!.Trim()
                      &&
                      x.Id != userId)
                  .Any();
              }).WithMessage("{PropertyName} already exists");
        }
    }
}