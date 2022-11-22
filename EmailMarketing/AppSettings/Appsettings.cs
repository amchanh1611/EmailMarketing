namespace EmailMarketing.AppSettings
{
    public class AppSettings
    {
        public Database? Database { get; set; }
    }
    public class Database
    {
        public string? ConnectionString { get; set; }
    }
}
