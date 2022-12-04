using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class EditModeDelete : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_operation_google_account_GoogleAccountId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_group_contact_GroupContactId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_project_ProjectId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_user_UserId",
                table: "operation");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_google_account_GoogleAccountId",
                table: "operation",
                column: "GoogleAccountId",
                principalTable: "google_account",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_group_contact_GroupContactId",
                table: "operation",
                column: "GroupContactId",
                principalTable: "group_contact",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_project_ProjectId",
                table: "operation",
                column: "ProjectId",
                principalTable: "project",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_user_UserId",
                table: "operation",
                column: "UserId",
                principalTable: "user",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_operation_google_account_GoogleAccountId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_group_contact_GroupContactId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_project_ProjectId",
                table: "operation");

            migrationBuilder.DropForeignKey(
                name: "FK_operation_user_UserId",
                table: "operation");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_google_account_GoogleAccountId",
                table: "operation",
                column: "GoogleAccountId",
                principalTable: "google_account",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_operation_group_contact_GroupContactId",
                table: "operation",
                column: "GroupContactId",
                principalTable: "group_contact",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_operation_project_ProjectId",
                table: "operation",
                column: "ProjectId",
                principalTable: "project",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_operation_user_UserId",
                table: "operation",
                column: "UserId",
                principalTable: "user",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
