using EmailMarketing.AppSettings;
using EmailMarketing.Mapping;
using EmailMarketing.Modules.Roles.Services;
using EmailMarketing.Modules.Users.Services;
using EmailMarketing.Persistences.Context;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Repository
builder.Services.AddScoped<IRepositoryWrapper, RepositoryWrapper>();

//Services
builder.Services.AddScoped<IUserServices, UserServices>();
builder.Services.AddScoped<IRoleServices, RoleServices>();

//Appsettings
builder.Services.Configure<AppSettings>(builder.Configuration.GetSection("AppSettings"));

//AutoMapper
builder.Services.AddAutoMapper(typeof(Profiles));

//Fluent Validation
builder.Services.AddFluentValidationAutoValidation()
            .AddFluentValidationClientsideAdapters()
            .AddValidatorsFromAssemblyContaining(typeof(Program));

//ConnectionString

builder.Services.AddDbContextPool<AppDbContext>(option =>
    option.UseMySql("server=localhost;user id=root;password='';port=3306;database=emailmarketing;",
    ServerVersion.AutoDetect("server=localhost;user id=root;password='';port=3306;database=emailmarketing;")));


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
