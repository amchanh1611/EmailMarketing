using EmailMarketing.AppSetting;
using Microsoft.Extensions.Options;
using System.Text.Json;
using System.Text.Json.Serialization;
using static EmailMarketing.Common.GoogleServices.Services.GoogleServices;

namespace EmailMarketing.Common.GoogleServices.Services
{
    public interface IGoogleServices
    {
        string AuthUri(string state);
        Task<TokenResult> TokenAsync(string code);
        Task<UserInfoResult> UserInfoAsync(string refreshToken);
    }
    public class GoogleServices : IGoogleServices
    {
        private readonly AppSettings appSettings;
        public GoogleServices(IOptions<AppSettings> appSettings)
        {
            this.appSettings = appSettings.Value;
        }


        public string AuthUri(string state)
        {
            Google google = appSettings.Google!;
            return $"{google.IdentityPlatform!.AuthUri}?scope=email%20profile%20openid%20https://www.googleapis.com/auth/gmail.send" +
                $"&access_type=offline&include_granted_scopes=true&response_type=code" +
                $"&redirect_uri={google.RedirectUri}&client_id={google.ClientId}&state={state}";
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

            string refreshcontent = await refreshResponse.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<TokenResult>(refreshcontent)!;
        }

        public class UserInfoResult
        {
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
    }
}
