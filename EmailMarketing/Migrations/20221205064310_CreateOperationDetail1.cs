using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EmailMarketing.Migrations
{
    public partial class CreateOperationDetail1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_operation_detail_user_UserId",
                table: "operation_detail");

            migrationBuilder.DropIndex(
                name: "IX_operation_detail_UserId",
                table: "operation_detail");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "operation_detail");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "operation_detail",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_operation_detail_UserId",
                table: "operation_detail",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_operation_detail_user_UserId",
                table: "operation_detail",
                column: "UserId",
                principalTable: "user",
                principalColumn: "Id");
        }
    }
}
