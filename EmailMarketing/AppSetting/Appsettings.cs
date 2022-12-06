namespace EmailMarketing.AppSetting
{
    public class AppSettings
    {
        public Database? Database { get; set; }
        public Jwt? Jwt { get; set; }
        public Google? Google { get; set; }
    }
    public class Database
    {
        public string? ConnectionString { get; set; }
    }
    public class Jwt
    {
        public string? Issuer { get; set; }
        public string? AccessKey { get; set; }
        public string? RefreshKey { get; set; }
    }
    public class Google
    {
        public string? ClientId { get; set; }
        public string? ClientSecret { get; set; }
        public string? RedirectUri { get; set; }
        public IdentityPlatform? IdentityPlatform { get; set; }
        public Gmail? Gmail { get; set; }
    }
    public class IdentityPlatform
    {
        public string? AuthUri { get; set; }
        public string? TokenUri { get; set; }
        public string? UserInfoUri { get; set; }
    }
    public class Gmail
    {
        public string? GmailUri { get; set; }
    }
}
