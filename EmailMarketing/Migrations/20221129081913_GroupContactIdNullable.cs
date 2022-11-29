using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class GroupContactIdNullable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_contact_group_contact_GroupContactId",
                table: "contact");

            migrationBuilder.AlterColumn<int>(
                name: "GroupContactId",
                table: "contact",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_contact_group_contact_GroupContactId",
                table: "contact",
                column: "GroupContactId",
                principalTable: "group_contact",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_contact_group_contact_GroupContactId",
                table: "contact");

            migrationBuilder.AlterColumn<int>(
                name: "GroupContactId",
                table: "contact",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_contact_group_contact_GroupContactId",
                table: "contact",
                column: "GroupContactId",
                principalTable: "group_contact",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
