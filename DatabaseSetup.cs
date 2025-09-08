using System;
using System.Data.SqlClient;

namespace DatabaseSetup
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("DATABASE SETUP AND VERIFICATION");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                // Test connection to master database first
                string masterConnectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=master; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
                
                Console.WriteLine("1. Testing connection to master database...");
                using (SqlConnection connection = new SqlConnection(masterConnectionString))
                {
                    connection.Open();
                    Console.WriteLine("   ? Successfully connected to master database");
                }
                
                // Check if our database exists
                Console.WriteLine();
                Console.WriteLine("2. Checking if 'personal-portfolio-ASP' database exists...");
                
                string checkDbQuery = "SELECT COUNT(*) FROM sys.databases WHERE name = 'personal-portfolio-ASP'";
                using (SqlConnection connection = new SqlConnection(masterConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(checkDbQuery, connection))
                    {
                        connection.Open();
                        int dbExists = (int)command.ExecuteScalar();
                        
                        if (dbExists > 0)
                        {
                            Console.WriteLine("   ? Database 'personal-portfolio-ASP' exists");
                        }
                        else
                        {
                            Console.WriteLine("   ? Database 'personal-portfolio-ASP' does not exist");
                            Console.WriteLine("   Creating database...");
                            
                            // Create database
                            string createDbQuery = "CREATE DATABASE [personal-portfolio-ASP]";
                            using (SqlCommand createCommand = new SqlCommand(createDbQuery, connection))
                            {
                                createCommand.ExecuteNonQuery();
                                Console.WriteLine("   ? Database 'personal-portfolio-ASP' created successfully");
                            }
                        }
                    }
                }
                
                // Test connection to our database
                Console.WriteLine();
                Console.WriteLine("3. Testing connection to 'personal-portfolio-ASP' database...");
                
                string portfolioConnectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(portfolioConnectionString))
                {
                    connection.Open();
                    Console.WriteLine("   ? Successfully connected to 'personal-portfolio-ASP' database");
                }
                
                // Check tables
                Console.WriteLine();
                Console.WriteLine("4. Checking required tables...");
                
                string[] requiredTables = { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                bool needsTableCreation = false;
                
                using (SqlConnection connection = new SqlConnection(portfolioConnectionString))
                {
                    connection.Open();
                    
                    foreach (string tableName in requiredTables)
                    {
                        string checkTableQuery = @"
                            SELECT COUNT(*) 
                            FROM INFORMATION_SCHEMA.TABLES 
                            WHERE TABLE_NAME = @TableName";
                        
                        using (SqlCommand command = new SqlCommand(checkTableQuery, connection))
                        {
                            command.Parameters.AddWithValue("@TableName", tableName);
                            int tableExists = (int)command.ExecuteScalar();
                            
                            if (tableExists > 0)
                            {
                                Console.WriteLine($"   ? Table '{tableName}' exists");
                            }
                            else
                            {
                                Console.WriteLine($"   ? Table '{tableName}' missing");
                                needsTableCreation = true;
                            }
                        }
                    }
                }
                
                if (needsTableCreation)
                {
                    Console.WriteLine();
                    Console.WriteLine("5. Creating missing tables...");
                    CreateTables(portfolioConnectionString);
                }
                
                Console.WriteLine();
                Console.WriteLine("=================================");
                Console.WriteLine("DATABASE SETUP COMPLETED!");
                Console.WriteLine("=================================");
                Console.WriteLine();
                Console.WriteLine("You can now run the admin features tests.");
                
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ERROR: {ex.Message}");
                Console.WriteLine($"Stack Trace: {ex.StackTrace}");
            }
            
            Console.WriteLine();
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
        
        static void CreateTables(string connectionString)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    
                    // Create Projects table
                    string createProjectsTable = @"
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
                        )";
                    
                    using (SqlCommand command = new SqlCommand(createProjectsTable, connection))
                    {
                        command.ExecuteNonQuery();
                        Console.WriteLine("   ? Created Projects table");
                    }
                    
                    // Create Skills table
                    string createSkillsTable = @"
                        CREATE TABLE Skills (
                            SkillId int IDENTITY(1,1) PRIMARY KEY,
                            SkillName nvarchar(255) NOT NULL,
                            SkillLevel int NOT NULL,
                            CategoryId int NOT NULL DEFAULT 1,
                            IsActive bit NOT NULL DEFAULT 1,
                            DisplayOrder int NOT NULL DEFAULT 1,
                            CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                            UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                        )";
                    
                    using (SqlCommand command = new SqlCommand(createSkillsTable, connection))
                    {
                        command.ExecuteNonQuery();
                        Console.WriteLine("   ? Created Skills table");
                    }
                    
                    // Create Achievements table
                    string createAchievementsTable = @"
                        CREATE TABLE Achievements (
                            AchievementId int IDENTITY(1,1) PRIMARY KEY,
                            Title nvarchar(255) NOT NULL,
                            Description ntext,
                            AchievementDate datetime NOT NULL,
                            IsActive bit NOT NULL DEFAULT 1,
                            DisplayOrder int NOT NULL DEFAULT 1,
                            CreatedDate datetime NOT NULL DEFAULT GETDATE(),
                            UpdatedDate datetime NOT NULL DEFAULT GETDATE()
                        )";
                    
                    using (SqlCommand command = new SqlCommand(createAchievementsTable, connection))
                    {
                        command.ExecuteNonQuery();
                        Console.WriteLine("   ? Created Achievements table");
                    }
                    
                    // Create Education table
                    string createEducationTable = @"
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
                        )";
                    
                    using (SqlCommand command = new SqlCommand(createEducationTable, connection))
                    {
                        command.ExecuteNonQuery();
                        Console.WriteLine("   ? Created Education table");
                    }
                    
                    // Create ContactMessages table
                    string createContactMessagesTable = @"
                        CREATE TABLE ContactMessages (
                            MessageId int IDENTITY(1,1) PRIMARY KEY,
                            Name nvarchar(255) NOT NULL,
                            Email nvarchar(255) NOT NULL,
                            Subject nvarchar(255),
                            MessageBody ntext NOT NULL,
                            IsRead bit NOT NULL DEFAULT 0,
                            MessageDate datetime NOT NULL DEFAULT GETDATE()
                        )";
                    
                    using (SqlCommand command = new SqlCommand(createContactMessagesTable, connection))
                    {
                        command.ExecuteNonQuery();
                        Console.WriteLine("   ? Created ContactMessages table");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error creating tables: {ex.Message}");
                throw;
            }
        }
    }
}