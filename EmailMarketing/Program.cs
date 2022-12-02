using EmailMarketing.AppSetting;
using EmailMarketing.Common.GoogleServices.Services;
using EmailMarketing.Common.JWT;
using EmailMarketing.Mapping;
using EmailMarketing.Middleware;
using EmailMarketing.Modules.Contacts.Services;
using EmailMarketing.Modules.Projects.Services;
using EmailMarketing.Modules.Roles.Services;
using EmailMarketing.Modules.ServiecesPackage.Services;
using EmailMarketing.Modules.Users.Services;
using EmailMarketing.Persistences.Context;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddJsonOptions(options =>
    options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "API",
        Description = "QPIN API with ASP.NET Core 3.0",
        Contact = new OpenApiContact()
        {
            Name = "Name Au Minh Canh",
            Email = "am.chanh16111@gmail.com"
        }
    });
    var securitySchema = new OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        Reference = new OpenApiReference
        {
            Type = ReferenceType.SecurityScheme,
            Id = "Bearer"
        }
    };
    c.AddSecurityDefinition("Bearer", securitySchema);

    var securityRequirement = new OpenApiSecurityRequirement();
    securityRequirement.Add(securitySchema, new[] { "Bearer" });
    c.AddSecurityRequirement(securityRequirement);
});

//Repository
builder.Services.AddScoped<IRepositoryWrapper, RepositoryWrapper>();

//Services
builder.Services.AddScoped<IUserServices, UserServices>();
builder.Services.AddScoped<IRoleServices, RoleServices>();
builder.Services.AddScoped<IJwtUtils, JwtUtils>();
builder.Services.AddScoped<IServicePackageServices, ServicePackageServices>();
builder.Services.AddScoped<IProjectServices, ProjectServices>();
builder.Services.AddScoped<IGroupContactServices, GroupContactServices>();
builder.Services.AddScoped<IContactServices, ContactServices>();
builder.Services.AddScoped<IGoogleServices, GoogleServices>();
//Appsettings
builder.Services.Configure<AppSettings>(builder.Configuration.GetSection("AppSettings"));

//AutoMapper
builder.Services.AddAutoMapper(typeof(Profiles));

//Fluent Validation
builder.Services.AddFluentValidationAutoValidation()
            .AddFluentValidationClientsideAdapters()
            .AddValidatorsFromAssemblyContaining(typeof(Program));

//HttpContext
builder.Services.AddHttpContextAccessor();

//Add JwtBearer
builder.Services.AddAuthentication(option =>
{
    option.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    option.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    option.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
})
    .AddJwtBearer(option =>
    {
        option.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["AppSettings:Jwt:Issuer"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(builder.Configuration["AppSettings:Jwt:Key"])),
            ValidateIssuer = true,
            ValidateAudience = false,
            ClockSkew = TimeSpan.Zero,
        };
    });

//ConnectionString

builder.Services.AddDbContextPool<AppDbContext>(option =>
    option.UseMySql(builder.Configuration["Appsettings:Database:ConnectionString"],
    ServerVersion.AutoDetect(builder.Configuration["Appsettings:Database:ConnectionString"])));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//Use JwtBearer
app.UseAuthentication();

//ErorHanldeMiddleware
app.UseMiddleware<ErrorResponseMiddleware>();

//JwtMiddleware
app.UseMiddleware<JwtMiddleware>();

app.UseHttpsRedirection();

app.UseAuthorization();

//StaticFile
app.UseStaticFiles();

app.MapControllers();

app.Run();