using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class UpdateDatabase2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "permission",
                columns: table => new
                {
                    Code = table.Column<string>(type: "char(25)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Name = table.Column<string>(type: "varchar(50)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    UserType = table.Column<string>(type: "char(100)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Modules = table.Column<string>(type: "text", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_permission", x => x.Code);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "role",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "varchar(100)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    UserType = table.Column<sbyte>(type: "tinyint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_role", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "role_permission",
                columns: table => new
                {
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    PermissionCode = table.Column<string>(type: "char(25)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_role_permission", x => new { x.RoleId, x.PermissionCode });
                    table.ForeignKey(
                        name: "FK_role_permission_permission_PermissionCode",
                        column: x => x.PermissionCode,
                        principalTable: "permission",
                        principalColumn: "Code",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_role_permission_role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "user",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "text", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Email = table.Column<string>(type: "text", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Password = table.Column<string>(type: "text", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    Phone = table.Column<string>(type: "char(11)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Male = table.Column<sbyte>(type: "tinyint", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Status = table.Column<sbyte>(type: "tinyint", nullable: false),
                    Avatar = table.Column<string>(type: "text", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user", x => x.Id);
                    table.ForeignKey(
                        name: "FK_user_role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_role_permission_PermissionCode",
                table: "role_permission",
                column: "PermissionCode");

            migrationBuilder.CreateIndex(
                name: "IX_user_RoleId",
                table: "user",
                column: "RoleId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "role_permission");

            migrationBuilder.DropTable(
                name: "user");

            migrationBuilder.DropTable(
                name: "permission");

            migrationBuilder.DropTable(
                name: "role");
        }
    }
}
