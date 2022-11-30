using AutoMapper;
using DocumentFormat.OpenXml.Office2016.Excel;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using EmailMarketing.Common.Extensions;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.ReadExelFile;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Modules.Contacts.Services
{
    public interface IContactServices
    {
        void Create(int userId, CreateContactRequest request);
        void CreateByExcel(int userId, CreateContactByExcelRequest request);
        PaggingResponse<Contact> Get(int userId, GetContactRequest request);
    }
    public class ContactServices : IContactServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;
        public ContactServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(int userId, CreateContactRequest request)
        {
            Contact contact = mapper.Map<CreateContactRequest, Contact>(request);
            contact.UserId = userId;
            repository.Contact.Create(contact);

            repository.Save();
        }

        public void CreateByExcel(int userId, CreateContactByExcelRequest request)
        {
            List<CreateContactRequest> createContacts = ReadExcelFile(request.File!);
            List<Contact> contacts = mapper.Map<List<CreateContactRequest>, List<Contact>>(createContacts);
            if (request.GroupContactId != null)
            {
                foreach(Contact contact in contacts)
                {
                    contact.GroupContactId = request.GroupContactId;
                    contact.UserId = userId;
                }
            }

            repository.Contact.CreateMulti(contacts);
            repository.Save();
        }

        public PaggingResponse<Contact> Get(int userId, GetContactRequest request)
        {
            var a = repository.Contact.FindByCondition(x => x.UserId == userId);
            return repository.Contact.FindByCondition(x=>x.UserId==userId)
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }
        private List<CreateContactRequest> ReadExcelFile(IFormFile file)
        {
            using Stream fileStream = file.OpenReadStream();

            using SpreadsheetDocument doc = SpreadsheetDocument.Open(fileStream, false);

            WorkbookPart workbookPart = doc.WorkbookPart!;

            SheetData sheetData = workbookPart.GetSheetData();

            List<CreateContactRequest> createContacts = new();

            foreach (Row row in sheetData)
            {
                if (row.RowIndex! == 1)
                    continue;

                CreateContactRequest contact = new();
                contact.Name = sheetData.GetCell($"A{int.Parse(row.RowIndex!)}").GetCellValue(workbookPart);
                contact.Email = sheetData.GetCell($"B{int.Parse(row.RowIndex!)}").GetCellValue(workbookPart);
                contact.Male = sheetData.GetCell($"C{int.Parse(row.RowIndex!)}").GetCellValue(workbookPart).ParseEnum<ContactMale>();
                createContacts.Add(contact);
            }
            return createContacts;
        }
    }
}
