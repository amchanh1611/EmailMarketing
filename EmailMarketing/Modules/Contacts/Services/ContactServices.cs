using AutoMapper;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Persistences.Repositories;
using ExcelDataReader;
using System.Data;
using System.Text;

namespace EmailMarketing.Modules.Contacts.Services
{
    public interface IContactServices
    {
        void Create(CreateContactRequest request);
        void CreateByExcel(CreateContactByExcelRequest request);
        PaggingResponse<Contact> Get(GetContactRequest request);
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

        public void Create(CreateContactRequest request)
        {
            repository.Contact.Create(mapper.Map<CreateContactRequest, Contact>(request));
            repository.Save();
        }

        //public void CreateByExcel(CreateContactByExcelRequest request)
        //{
        //    IExcelDataReader? reader = null;
        //    Stream FileStream = new FileStream(request.File.FileName, FileMode.Create);
        //    if (request.File.FileName.EndsWith(".xls"))
        //        reader = ExcelReaderFactory.CreateBinaryReader(FileStream);
        //    else
        //    if (request.File.FileName.EndsWith(".xlsx"))
        //        reader = ExcelReaderFactory.CreateOpenXmlReader(FileStream);

        //    DataSet dsexcelRecords = reader.AsDataSet();
        //}

        public void CreateByExcel(CreateContactByExcelRequest request)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory() ,request.File!.FileName);
            //Stream fileStream = new FileStream(path, FileMode.Create);
            Stream fileStream = new FileStream(request.File.FileName, FileMode.Create);
            using SpreadsheetDocument doc = SpreadsheetDocument.Open(fileStream,false);
            //create the object for workbook part  
            WorkbookPart workbookPart = doc.WorkbookPart;
            Sheets thesheetcollection = workbookPart.Workbook.GetFirstChild<Sheets>()!;
            StringBuilder excelResult = new StringBuilder();
            //using for each loop to get the sheet from the sheetcollection  
            foreach (Sheet thesheet in thesheetcollection)
            {
                excelResult.AppendLine("Excel Sheet Name : " + thesheet.Name);
                excelResult.AppendLine("----------------------------------------------- ");
                //statement to get the worksheet object by using the sheet id  
                Worksheet theWorksheet = ((WorksheetPart)workbookPart.GetPartById(thesheet.Id)).Worksheet;

                SheetData thesheetdata = (SheetData)theWorksheet.GetFirstChild<SheetData>();
                foreach (Row thecurrentrow in thesheetdata)
                {
                    foreach (Cell thecurrentcell in thecurrentrow)
                    {
                        //statement to take the integer value  
                        string currentcellvalue = string.Empty;
                        if (thecurrentcell.DataType != null)
                        {
                            if (thecurrentcell.DataType == CellValues.SharedString)
                            {
                                int id;
                                if (Int32.TryParse(thecurrentcell.InnerText, out id))
                                {
                                    SharedStringItem item = workbookPart.SharedStringTablePart!.SharedStringTable.Elements<SharedStringItem>().ElementAt(id);
                                    if (item.Text != null)
                                    {
                                        //code to take the string value  
                                        excelResult.Append(item.Text.Text + " ");
                                    }
                                    else if (item.InnerText != null)
                                    {
                                        currentcellvalue = item.InnerText;
                                    }
                                    else if (item.InnerXml != null)
                                    {
                                        currentcellvalue = item.InnerXml;
                                    }
                                }
                            }
                        }
                        else
                        {
                            excelResult.Append(Convert.ToInt16(thecurrentcell.InnerText) + " ");
                        }
                    }
                    excelResult.AppendLine();
                }
                excelResult.Append("");
                Console.WriteLine(excelResult.ToString());
                Console.ReadLine();
            }
        }


        public PaggingResponse<Contact> Get(GetContactRequest request)
        {
            return repository.Contact.FindAll()
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }
    }
}
