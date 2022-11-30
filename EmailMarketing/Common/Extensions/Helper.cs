namespace EmailMarketing.Common.Extensions
{
    public static class Helper
    {
        public static async Task<string> UploadFilesAsync(this IFormFile file, string path)
        {

            string relativePath = $"{path}/{DateTime.UtcNow.Ticks + file.FileName}";

            string absolutePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", relativePath);

            using (Stream stream = new FileStream(absolutePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return relativePath;
        }
        public static string ReadAsLink(this string path, HttpContext context)
        {
            return $"{context.Request.Scheme}://{context.Request.Host}/{path}";
        }
        public static T ParseEnum<T>(this string value)
        {
            return (T)Enum.Parse(typeof(T), value, true);
        }
    }
}
