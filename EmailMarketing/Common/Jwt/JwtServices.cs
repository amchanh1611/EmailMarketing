﻿using EmailMarketing.AppSetting;
using EmailMarketing.Modules.Users.Entities;
using FluentValidation;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace EmailMarketing.Common.JWT
{
    public interface IJwtServices
    {
        public string GenerateAccessToken(User user);
        public string GenerateRefreshToken();
        public bool ValidateJwtToken(string token);
    }
    public class JwtServices : IJwtServices
    {
        private readonly AppSettings appSettings;

        public JwtServices(IOptions<AppSettings> appSettings)
        {
            this.appSettings = appSettings.Value;
        }

        public string GenerateAccessToken(User user)
        {
            List<Claim> claims = user.Role!.RolePermissions.Select(x => new Claim(ClaimTypes.Role, x.PermissionCode)).ToList();
            claims.AddRange(new List<Claim> 
            {
                new Claim("email", user.Email),
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString())
            });

            // generate token that is valid for 7 days
            JwtSecurityTokenHandler tokenHandler = new();
            byte[] key = Encoding.ASCII.GetBytes(appSettings!.Jwt!.AccessKey!);
            SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = appSettings.Jwt.Issuer,
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
        public string GenerateRefreshToken()
        {
            // generate token that is valid for 7 days
            JwtSecurityTokenHandler tokenHandler = new();
            byte[] key = Encoding.ASCII.GetBytes(appSettings!.Jwt!.RefreshKey!);
            SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = appSettings.Jwt.Issuer,
                Expires = DateTime.UtcNow.AddMonths(6),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
        public bool ValidateJwtToken(string token)
        {
            if (token == null)
                return false;

            JwtSecurityTokenHandler tokenHandler = new();
            byte[] key = Encoding.ASCII.GetBytes(appSettings.Jwt!.RefreshKey!);
            try
            {
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = true,
                    ValidIssuer = appSettings.Jwt.Issuer,
                    ValidateAudience = false,
                    // set clockskew to zero so tokens expire exactly at token expiration time (instead of 5 minutes later)
                    ClockSkew = TimeSpan.Zero
                }, out SecurityToken validatedToken);

                // return true from JWT token if validation successful
                return true;
            }
            catch
            {
                // return false if validation fails
                return false;
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
}