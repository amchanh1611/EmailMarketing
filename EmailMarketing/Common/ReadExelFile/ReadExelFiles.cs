using DocumentFormat.OpenXml.Office2016.Excel;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.Text.RegularExpressions;

namespace EmailMarketing.Common.ReadExelFile
{
    public static class ReadExelFiles
    {
        public static SheetData GetSheetData(this WorkbookPart workbookPart)
        {
            Sheets thesheetcollection = workbookPart.Workbook.GetFirstChild<Sheets>()!;

            Worksheet theWorksheet = ((WorksheetPart)workbookPart.GetPartById(thesheetcollection!.GetFirstChild<Sheet>()!.Id!)).Worksheet;

            return theWorksheet.GetFirstChild<SheetData>()!;
        }
        public static Cell GetCell(this SheetData sheetData, string cellAddress)
        {
            uint rowIndex = uint.Parse(Regex.Match(cellAddress, @"[0-9]+").Value);
            return sheetData.Descendants<Row>().FirstOrDefault(p => p.RowIndex! == rowIndex)!.Descendants<Cell>().FirstOrDefault(p => p.CellReference == cellAddress)!;
        }
        public static string GetCellValue(this Cell cell, WorkbookPart workbookPart)
        {
            string value = cell.InnerText;
            SharedStringItem item = new();
            if (cell.DataType != null)
            {
                item = workbookPart.SharedStringTablePart!.SharedStringTable.Elements<SharedStringItem>().ElementAt(int.Parse(value));
            }

            return item.Text!.Text;
        }
    }
}