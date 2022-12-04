using EmailMarketing.AppSetting;
using EmailMarketing.Common.Extensions;
using EmailMarketing.Middleware;
using Microsoft.Extensions.Options;
using MimeKit;
using System.Text.Json;
using System.Text.Json.Serialization;
using static EmailMarketing.Common.GoogleServices.GoogleService;

namespace EmailMarketing.Common.GoogleServices
{
    public interface IGoogleServices
    {
        string AuthUri(string state);
        Task<TokenResult> TokenAsync(string code);
        Task<UserInfoResult> UserInfoAsync(string refreshToken);
        Task<bool> SendMailAsync(string from, List<string> to, string subject, string content,string refreshToken);
    }
    public class GoogleService : IGoogleServices
    {
        private readonly AppSettings appSettings;
        public GoogleService(IOptions<AppSettings> appSettings)
        {
            this.appSettings = appSettings.Value;
        }


        public string AuthUri(string state)
        {
            Google google = appSettings.Google!;
            return $"{google.IdentityPlatform!.AuthUri}" +
                $"?scope=email%20profile%20openid%20https://www.googleapis.com/auth/gmail.send%20https://www.googleapis.com/auth/user.gender.read" +
                $"&access_type=offline&include_granted_scopes=true&response_type=code" +
                $"&redirect_uri={google.RedirectUri}&client_id={google.ClientId}&state={state}";
        }

        public async Task<bool> SendMailAsync(string from, List<string> to, string subject, string content, string refreshToken)
        {
            using HttpClient client = new();

            TokenResult tokenResult = await RefreshTokenAsync(refreshToken);

            Message message = new Message(from,to, subject, content);
            MimeMessage mimeMessage = message.CreateMimeMessage();

            object dataRequestSendMessage = new
            {
                raw = mimeMessage.ToString().Base64Encode()
            };

            client.DefaultRequestHeaders.Add("Authorization", $"Bearer {tokenResult.AccessToken}");

            HttpResponseMessage response = await client.PostAsync($"{appSettings.Google!.Gmail!.GmailUri}/me/messages/send", new StringContent(JsonSerializer.Serialize(dataRequestSendMessage)));

            return response.IsSuccessStatusCode;
        }

        public async Task<TokenResult> TokenAsync(string code)
        {
            Google google = appSettings.Google!;
            using HttpClient client = new();
            HttpResponseMessage tokenMessage = await client.PostAsync($"{google.IdentityPlatform!.TokenUri}" +
                $"?grant_type=authorization_code" +
                $"&code={code}" +
                $"&client_id={google.ClientId}" +
                $"&client_secret={google.ClientSecret}" +
                $"&redirect_uri={google.RedirectUri}", new StringContent(""));

            string tokenContent = await tokenMessage.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<TokenResult>(tokenContent)!;
        }
        public async Task<UserInfoResult> UserInfoAsync(string refreshToken)
        {
            Google google = appSettings.Google!;
            using HttpClient client = new();

            TokenResult token = await RefreshTokenAsync(refreshToken);

            HttpResponseMessage userInfoMessage = await client.PostAsync($"{google.IdentityPlatform!.UserInfoUri}" +
                $"?access_token={token.AccessToken}", new StringContent(""));

            string unserInfoContent = await userInfoMessage.Content.ReadAsStringAsync();

            return JsonSerializer.Deserialize<UserInfoResult>(unserInfoContent)!;
        }
        private async Task<TokenResult> RefreshTokenAsync(string refreshToken)
        {
            Google google = appSettings.Google!;
            using HttpClient client = new();

            HttpResponseMessage refreshResponse = await client.PostAsync($"{google.IdentityPlatform!.TokenUri}?grant_type=refresh_token" +
                $"&client_id={google.ClientId}&client_secret={google.ClientSecret}&refresh_token={refreshToken}", new StringContent(""));

            if (refreshResponse.IsSuccessStatusCode is false)
                throw new BadRequestException("Refreshtoken has expired");

            string refreshcontent = await refreshResponse.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<TokenResult>(refreshcontent)!;
        }

        public class UserInfoResult
        {
            [JsonPropertyName("name")]
            public string? Name { get; set; }
            [JsonPropertyName("given_name")]
            public string? FirstName { get; set; }

            [JsonPropertyName("family_name")]
            public string? LastName { get; set; }

            [JsonPropertyName("picture")]
            public string? Avatar { get; set; }

            [JsonPropertyName("email")]
            public string? Email { get; set; }


        }
        public class TokenResult
        {
            [JsonPropertyName("access_token")]
            public string? AccessToken { get; set; }

            [JsonPropertyName("expires_in")]
            public int? Expires { get; set; }

            [JsonPropertyName("refresh_token")]
            public string? RefreshToken { get; set; }

            [JsonPropertyName("scope")]
            public string? Scope { get; set; }

            [JsonPropertyName("token_type")]
            public string? TokenType { get; set; }
        }
        public class Message
        {
            public List<MailboxAddress> To { get; set; }
            public string From { get; set; }
            public string Subject { get; set; }
            public string Content { get; set; }
            
            public Message(string from, List<string> to, string subject, string content)
            {
                From = from;
                To = new List<MailboxAddress>();
                To.AddRange(to.Select(x => new MailboxAddress("EmailMarketing",x)));
                Subject = subject;
                Content = content;
            }
        }
    }
}
