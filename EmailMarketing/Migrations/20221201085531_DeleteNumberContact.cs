using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class DeleteNumberContact : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NumberContact",
                table: "group_contact");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "NumberContact",
                table: "group_contact",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
