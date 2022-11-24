namespace EmailMarketing.AppSetting
{
    public class AppSettings
    {
        public Database? Database { get; set; }
        public Jwt? Jwt { get; set; }
    }
    public class Database
    {
        public string? ConnectionString { get; set; }
    }
    public class Jwt
    {
        public string? Issuer { get; set; }
        public string? Key { get; set; }
    }
}
