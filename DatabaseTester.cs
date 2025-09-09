using System;
using System.Data;
using System.Data.SqlClient;

namespace DatabaseTester
{
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("DATABASE TEST");
            Console.WriteLine();
            
            try
            {
                Console.WriteLine("Testing connection...");
                bool connected = TestConnection();
                Console.WriteLine($"Connection: {(connected ? "OK" : "FAILED")}");
                
                if (!connected) return;
                
                Console.WriteLine("\nChecking tables...");
                var tables = new[] { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                bool allExist = true;
                
                foreach (var table in tables)
                {
                    bool exists = TableExists(table);
                    Console.WriteLine($"{table}: {(exists ? "OK" : "MISSING")}");
                    if (!exists) allExist = false;
                }
                
                if (allExist)
                {
                    Console.WriteLine("\nTesting CRUD operations...");
                    TestProjects();
                    TestSkills();
                    TestAchievements();
                    TestEducation();
                    TestMessages();
                }
                
                Console.WriteLine("\nTests complete!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            
            Console.ReadKey();
        }
        
        static bool TestConnection()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    return conn.State == ConnectionState.Open;
                }
            }
            catch { return false; }
        }
        
        static bool TableExists(string table)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    var cmd = new SqlCommand("SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @name", conn);
                    cmd.Parameters.AddWithValue("@name", table);
                    conn.Open();
                    return (int)cmd.ExecuteScalar() > 0;
                }
            }
            catch { return false; }
        }
        
        static void TestProjects()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand(@"INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, StartDate, IsActive, DisplayOrder) 
                                             VALUES ('Test', 'Test Desc', 'Short', 'Tech', GETDATE(), 1, 1); SELECT SCOPE_IDENTITY()", conn);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    cmd = new SqlCommand("DELETE FROM Projects WHERE ProjectId = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Projects: OK");
                }
            }
            catch { Console.WriteLine("Projects: FAILED"); }
        }
        
        static void TestSkills()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand("INSERT INTO Skills (SkillName, SkillLevel) VALUES ('Test', 80); SELECT SCOPE_IDENTITY()", conn);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    cmd = new SqlCommand("DELETE FROM Skills WHERE SkillId = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Skills: OK");
                }
            }
            catch { Console.WriteLine("Skills: FAILED"); }
        }
        
        static void TestAchievements()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand("INSERT INTO Achievements (Title, AchievementDate) VALUES ('Test', GETDATE()); SELECT SCOPE_IDENTITY()", conn);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    cmd = new SqlCommand("DELETE FROM Achievements WHERE AchievementId = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Achievements: OK");
                }
            }
            catch { Console.WriteLine("Achievements: FAILED"); }
        }
        
        static void TestEducation()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand("INSERT INTO Education (InstitutionName, Degree, StartDate) VALUES ('Test', 'Test', GETDATE()); SELECT SCOPE_IDENTITY()", conn);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    cmd = new SqlCommand("DELETE FROM Education WHERE EducationId = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Education: OK");
                }
            }
            catch { Console.WriteLine("Education: FAILED"); }
        }
        
        static void TestMessages()
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    var cmd = new SqlCommand("INSERT INTO ContactMessages (Name, Email, MessageBody) VALUES ('Test', 'test@test.com', 'Test'); SELECT SCOPE_IDENTITY()", conn);
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    cmd = new SqlCommand("DELETE FROM ContactMessages WHERE MessageId = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Console.WriteLine("Messages: OK");
                }
            }
            catch { Console.WriteLine("Messages: FAILED"); }
        }
    }
}