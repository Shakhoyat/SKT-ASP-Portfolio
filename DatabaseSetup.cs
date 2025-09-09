using System;
using System.Data.SqlClient;

namespace DatabaseSetup
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("DATABASE SETUP");
            Console.WriteLine();
            
            try
            {
                string masterConn = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=master; Integrated Security=True";
                string portfolioConn = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True";
                
                Console.WriteLine("Testing master connection...");
                using (var conn = new SqlConnection(masterConn))
                {
                    conn.Open();
                    Console.WriteLine("Connected to master");
                }
                
                Console.WriteLine("Checking database...");
                using (var conn = new SqlConnection(masterConn))
                {
                    conn.Open();
                    var cmd = new SqlCommand("SELECT COUNT(*) FROM sys.databases WHERE name = 'personal-portfolio-ASP'", conn);
                    if ((int)cmd.ExecuteScalar() == 0)
                    {
                        Console.WriteLine("Creating database...");
                        new SqlCommand("CREATE DATABASE [personal-portfolio-ASP]", conn).ExecuteNonQuery();
                    }
                }
                
                Console.WriteLine("Testing portfolio connection...");
                using (var conn = new SqlConnection(portfolioConn))
                {
                    conn.Open();
                    Console.WriteLine("Connected to portfolio database");
                }
                
                Console.WriteLine("Checking tables...");
                var tables = new[] { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                bool needsTables = false;
                
                using (var conn = new SqlConnection(portfolioConn))
                {
                    conn.Open();
                    foreach (var table in tables)
                    {
                        var cmd = new SqlCommand("SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @name", conn);
                        cmd.Parameters.AddWithValue("@name", table);
                        if ((int)cmd.ExecuteScalar() == 0)
                        {
                            Console.WriteLine($"Missing: {table}");
                            needsTables = true;
                        }
                    }
                }
                
                if (needsTables)
                {
                    Console.WriteLine("Creating tables...");
                    CreateTables(portfolioConn);
                }
                
                Console.WriteLine("Setup complete!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            
            Console.ReadKey();
        }
        
        static void CreateTables(string conn)
        {
            var sql = @"
                CREATE TABLE Projects (
                    ProjectId int IDENTITY(1,1) PRIMARY KEY,
                    Title nvarchar(255) NOT NULL,
                    Description ntext,
                    ShortDescription nvarchar(500),
                    TechnologiesUsed nvarchar(500),
                    ProjectUrl nvarchar(500),
                    GitHubUrl nvarchar(500),
                    ImageUrl nvarchar(500),
                    StartDate datetime NOT NULL,
                    EndDate datetime,
                    IsActive bit NOT NULL DEFAULT 1,
                    DisplayOrder int NOT NULL DEFAULT 1,
                    CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                    UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                );

                CREATE TABLE Skills (
                    SkillId int IDENTITY(1,1) PRIMARY KEY,
                    SkillName nvarchar(255) NOT NULL,
                    SkillLevel int NOT NULL,
                    CategoryId int NOT NULL DEFAULT 1,
                    IsActive bit NOT NULL DEFAULT 1,
                    DisplayOrder int NOT NULL DEFAULT 1,
                    CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                    UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                );

                CREATE TABLE Achievements (
                    AchievementId int IDENTITY(1,1) PRIMARY KEY,
                    Title nvarchar(255) NOT NULL,
                    Description ntext,
                    AchievementDate datetime NOT NULL,
                    IsActive bit NOT NULL DEFAULT 1,
                    DisplayOrder int NOT NULL DEFAULT 1,
                    CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                    UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                );

                CREATE TABLE Education (
                    EducationId int IDENTITY(1,1) PRIMARY KEY,
                    InstitutionName nvarchar(255) NOT NULL,
                    Degree nvarchar(255) NOT NULL,
                    FieldOfStudy nvarchar(255),
                    StartDate datetime NOT NULL,
                    EndDate datetime,
                    IsActive bit NOT NULL DEFAULT 1,
                    DisplayOrder int NOT NULL DEFAULT 1,
                    CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                    UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                );

                CREATE TABLE ContactMessages (
                    MessageId int IDENTITY(1,1) PRIMARY KEY,
                    Name nvarchar(255) NOT NULL,
                    Email nvarchar(255) NOT NULL,
                    Subject nvarchar(255),
                    MessageBody ntext NOT NULL,
                    IsRead bit NOT NULL DEFAULT 0,
                    MessageDate datetime NOT NULL DEFAULT GETDATE()
                );";

            using (var connection = new SqlConnection(conn))
            {
                connection.Open();
                new SqlCommand(sql, connection).ExecuteNonQuery();
                Console.WriteLine("Tables created");
            }
        }
    }
}