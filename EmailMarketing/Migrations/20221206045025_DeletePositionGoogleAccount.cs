using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class DeletePositionGoogleAccount : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Position",
                table: "google_account");

            migrationBuilder.AlterColumn<string>(
                name: "StatusMessage",
                table: "operation_detail",
                type: "char(20)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<sbyte>(
                name: "Male",
                table: "contact",
                type: "tinyint",
                nullable: false,
                defaultValue: (sbyte)0,
                oldClrType: typeof(sbyte),
                oldType: "tinyint",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "StatusMessage",
                table: "operation_detail",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "char(20)")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "Position",
                table: "google_account",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<sbyte>(
                name: "Male",
                table: "contact",
                type: "tinyint",
                nullable: true,
                oldClrType: typeof(sbyte),
                oldType: "tinyint");
        }
    }
}
