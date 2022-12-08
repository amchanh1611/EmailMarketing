using MimeKit;
using System.IO;
using System.Net.Mail;
using System.Text;
using static EmailMarketing.Common.GoogleServices.GoogleService;

namespace EmailMarketing.Common.Extensions
{
    public static class Helper
    {
        public static MimeMessage CreateMimeMessage(this Message message,MemoryStream file,string fileName)
        {
            MimeMessage emailMessage = new();
            emailMessage.From.Add(new MailboxAddress("EmailMarketing ", message.From));
            emailMessage.To.AddRange(message.To);
            emailMessage.Subject = message.Subject;
            BodyBuilder bodyBuilder = new BodyBuilder { HtmlBody = string.Format(message.Content) };

            if(file != null)
                bodyBuilder.Attachments.Add(fileName, file);

            emailMessage.Body = bodyBuilder.ToMessageBody();
            return emailMessage;
        }
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
        public static async Task<MemoryStream> ReadFile(this string relativePath)
        {
            MemoryStream memoryStream = new();

            string absolutePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", relativePath);

            using (Stream stream = new FileStream(absolutePath, FileMode.Open))
            {
                await stream.CopyToAsync(memoryStream);
            }

            return memoryStream;
        }
        public static string ReadAsLink(this string path, HttpContext context)
        {
            return $"{context.Request.Scheme}://{context.Request.Host}/{path}";
        }
        public static T ParseEnum<T>(this string value)
        {
            return (T)Enum.Parse(typeof(T), value, true);
        }
        public static string Base64Encode(this string plainText)
        {
            byte[] inputByte = Encoding.UTF8.GetBytes(plainText);

            return Convert.ToBase64String(inputByte).TrimEnd('=').Replace('+', '-').Replace('/', '_');
        }
        public static string Base64UrlSafeEncode(this MimeMessage message)
        {
            using MemoryStream memoryStream = new();
            message.WriteTo(memoryStream);
            return Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length)
                .Replace('+', '-')
                .Replace('/', '_')
                .Replace("=", "");
        }
        public static string Base64Decode(this string encodedData)
        {
            byte[] outputByte = Convert.FromBase64String(encodedData.Pad().Replace('-', '+').Replace('_', '/'));

            return Encoding.UTF8.GetString(outputByte);
        }
        private static string Pad(this string text)
        {
            var padding = 3 - ((text.Length + 3) % 4);
            if (padding == 0)
            {
                return text;
            }
            return text + new string('=', padding);
        }
    }
}
