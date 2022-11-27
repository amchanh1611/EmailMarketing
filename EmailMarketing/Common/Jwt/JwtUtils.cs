using EmailMarketing.AppSetting;
using EmailMarketing.Modules.Users.Entities;
using FluentValidation;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace EmailMarketing.Common.JWT
{
    public interface IJwtUtils
    {
        public string GenerateJwtToken(User user);
    }
    public class JwtUtils : IJwtUtils
    {
        private readonly AppSettings appSettings;

        public JwtUtils(IOptions<AppSettings> appSettings)
        {
            this.appSettings = appSettings.Value;
        }

        public string GenerateJwtToken(User user)
        {
            // generate token that is valid for 7 days
            JwtSecurityTokenHandler tokenHandler = new();
            byte[] key = Encoding.ASCII.GetBytes(appSettings!.Jwt!.Key!);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = appSettings.Jwt.Issuer,
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("email",user.Email),
                    new Claim(ClaimTypes.NameIdentifier,user.Id.ToString())
                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
    public class UserLogin
    {
        public string? Email { get; set; }
        public string? Password { get; set; }
    }
    public class UserLoginValidator : AbstractValidator<UserLogin>
    {
        public UserLoginValidator()
        {
            RuleFor(user => user.Email).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(user => user.Password).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }
}