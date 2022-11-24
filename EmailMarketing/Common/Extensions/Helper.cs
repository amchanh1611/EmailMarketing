namespace ProjectExample.Common.Extentions
{
    public static class Helper
    {
        public static async Task<string> UploadFilesAsync(this IFormFile file, string folder)
        {

            string relativePath = $"{folder}/{DateTime.UtcNow.Ticks + file.FileName}";

            string absolutePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", relativePath);

            using (Stream stream = new FileStream(absolutePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return relativePath;
        }
        public static string DownloadFile(this string path,HttpContext context)
        {
            return $"{context.Request.Scheme}://{context.Request.Host}/{path}";
        }
    }
}
