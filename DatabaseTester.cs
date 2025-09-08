using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DatabaseTester
{
    class Program
    {
        // Connection string - update this to match your Web.config
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("DATABASE CONNECTION & ADMIN FEATURES TEST");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                // Test 1: Database Connection
                Console.WriteLine("1. Testing Database Connection...");
                bool isConnected = TestConnection();
                Console.WriteLine($"   Result: {(isConnected ? "SUCCESS" : "FAILED")}");
                
                if (!isConnected)
                {
                    Console.WriteLine("   Could not connect to database. Please check your connection string.");
                    Console.WriteLine("   Press any key to exit...");
                    Console.ReadKey();
                    return;
                }
                
                Console.WriteLine();
                
                // Test 2: Check Tables
                Console.WriteLine("2. Checking Database Tables...");
                string[] tables = { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                bool allTablesExist = true;
                
                foreach (string table in tables)
                {
                    bool exists = TableExists(table);
                    Console.WriteLine($"   {table}: {(exists ? "EXISTS" : "MISSING")}");
                    if (!exists) allTablesExist = false;
                }
                
                Console.WriteLine();
                
                if (!allTablesExist)
                {
                    Console.WriteLine("   Some required tables are missing. Database schema may not be fully created.");
                }
                else
                {
                    // Test 3: Projects Feature
                    Console.WriteLine("3. Testing Projects Feature...");
                    TestProjectsFeature();
                    
                    Console.WriteLine();
                    
                    // Test 4: Skills Feature
                    Console.WriteLine("4. Testing Skills Feature...");
                    TestSkillsFeature();
                    
                    Console.WriteLine();
                    
                    // Test 5: Achievements Feature
                    Console.WriteLine("5. Testing Achievements Feature...");
                    TestAchievementsFeature();
                    
                    Console.WriteLine();
                    
                    // Test 6: Education Feature
                    Console.WriteLine("6. Testing Education Feature...");
                    TestEducationFeature();
                    
                    Console.WriteLine();
                    
                    // Test 7: Contact Messages Feature
                    Console.WriteLine("7. Testing Contact Messages Feature...");
                    TestContactMessagesFeature();
                }
                
                Console.WriteLine();
                Console.WriteLine("=================================");
                Console.WriteLine("ALL TESTS COMPLETED!");
                Console.WriteLine("=================================");
                
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
        
        static bool TestConnection()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    return connection.State == ConnectionState.Open;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   Connection Error: {ex.Message}");
                return false;
            }
        }
        
        static bool TableExists(string tableName)
        {
            try
            {
                string query = @"
                    SELECT COUNT(*) 
                    FROM INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_NAME = @TableName";
                
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@TableName", tableName);
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   Error checking table {tableName}: {ex.Message}");
                return false;
            }
        }
        
        static void TestProjectsFeature()
        {
            try
            {
                // Insert test project
                string insertQuery = @"
                    INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                                        StartDate, EndDate, IsActive, DisplayOrder, UpdatedDate)
                    VALUES (@Title, @Description, @ShortDescription, @TechnologiesUsed, 
                            @StartDate, @EndDate, @IsActive, @DisplayOrder, GETDATE());
                    SELECT SCOPE_IDENTITY();";
                
                int newProjectId;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Title", "Test Project " + DateTime.Now.ToString("yyyyMMdd-HHmmss"));
                        command.Parameters.AddWithValue("@Description", "This is a test project to verify database operations");
                        command.Parameters.AddWithValue("@ShortDescription", "Test project for admin features");
                        command.Parameters.AddWithValue("@TechnologiesUsed", "ASP.NET, C#, SQL Server");
                        command.Parameters.AddWithValue("@StartDate", DateTime.Now.AddDays(-30));
                        command.Parameters.AddWithValue("@EndDate", DateTime.Now);
                        command.Parameters.AddWithValue("@IsActive", true);
                        command.Parameters.AddWithValue("@DisplayOrder", 999);
                        
                        connection.Open();
                        newProjectId = Convert.ToInt32(command.ExecuteScalar());
                    }
                }
                
                Console.WriteLine($"   ? Successfully added test project with ID: {newProjectId}");
                
                // Retrieve project
                string selectQuery = "SELECT * FROM Projects WHERE ProjectId = @ProjectId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(selectQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ProjectId", newProjectId);
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Console.WriteLine($"   ? Successfully retrieved project: {reader["Title"]}");
                            }
                        }
                    }
                }
                
                // Update project
                string updateQuery = "UPDATE Projects SET Title = @NewTitle WHERE ProjectId = @ProjectId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@NewTitle", "Updated Test Project");
                        command.Parameters.AddWithValue("@ProjectId", newProjectId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Successfully updated project: {rowsAffected} row(s) affected");
                    }
                }
                
                // Delete project (soft delete)
                string deleteQuery = "UPDATE Projects SET IsActive = 0 WHERE ProjectId = @ProjectId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ProjectId", newProjectId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Successfully deleted project: {rowsAffected} row(s) affected");
                    }
                }
                
                Console.WriteLine("   ? Projects feature is working correctly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error testing Projects feature: {ex.Message}");
            }
        }
        
        static void TestSkillsFeature()
        {
            try
            {
                // Get count
                string countQuery = "SELECT COUNT(*) FROM Skills";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(countQuery, connection))
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        Console.WriteLine($"   ? Found {count} skills in database");
                    }
                }
                
                // Insert test skill
                string insertQuery = @"
                    INSERT INTO Skills (SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder)
                    VALUES (@SkillName, @SkillLevel, @CategoryId, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                int newSkillId;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@SkillName", "Test Skill");
                        command.Parameters.AddWithValue("@SkillLevel", 85);
                        command.Parameters.AddWithValue("@CategoryId", 1);
                        command.Parameters.AddWithValue("@IsActive", true);
                        command.Parameters.AddWithValue("@DisplayOrder", 999);
                        
                        connection.Open();
                        newSkillId = Convert.ToInt32(command.ExecuteScalar());
                    }
                }
                
                Console.WriteLine($"   ? Successfully added test skill with ID: {newSkillId}");
                
                // Clean up
                string deleteQuery = "DELETE FROM Skills WHERE SkillId = @SkillId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("@SkillId", newSkillId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Test skill cleanup: {rowsAffected} row(s) deleted");
                    }
                }
                
                Console.WriteLine("   ? Skills feature is working correctly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error testing Skills feature: {ex.Message}");
            }
        }
        
        static void TestAchievementsFeature()
        {
            try
            {
                // Get count
                string countQuery = "SELECT COUNT(*) FROM Achievements";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(countQuery, connection))
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        Console.WriteLine($"   ? Found {count} achievements in database");
                    }
                }
                
                // Insert test achievement
                string insertQuery = @"
                    INSERT INTO Achievements (Title, Description, AchievementDate, IsActive, DisplayOrder)
                    VALUES (@Title, @Description, @AchievementDate, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                int newAchievementId;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Title", "Test Achievement");
                        command.Parameters.AddWithValue("@Description", "This is a test achievement");
                        command.Parameters.AddWithValue("@AchievementDate", DateTime.Now);
                        command.Parameters.AddWithValue("@IsActive", true);
                        command.Parameters.AddWithValue("@DisplayOrder", 999);
                        
                        connection.Open();
                        newAchievementId = Convert.ToInt32(command.ExecuteScalar());
                    }
                }
                
                Console.WriteLine($"   ? Successfully added test achievement with ID: {newAchievementId}");
                
                // Clean up
                string deleteQuery = "DELETE FROM Achievements WHERE AchievementId = @AchievementId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("@AchievementId", newAchievementId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Test achievement cleanup: {rowsAffected} row(s) deleted");
                    }
                }
                
                Console.WriteLine("   ? Achievements feature is working correctly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error testing Achievements feature: {ex.Message}");
            }
        }
        
        static void TestEducationFeature()
        {
            try
            {
                // Get count
                string countQuery = "SELECT COUNT(*) FROM Education";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(countQuery, connection))
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        Console.WriteLine($"   ? Found {count} education records in database");
                    }
                }
                
                // Insert test education
                string insertQuery = @"
                    INSERT INTO Education (InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, IsActive, DisplayOrder)
                    VALUES (@InstitutionName, @Degree, @FieldOfStudy, @StartDate, @EndDate, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                int newEducationId;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@InstitutionName", "Test University");
                        command.Parameters.AddWithValue("@Degree", "Test Degree");
                        command.Parameters.AddWithValue("@FieldOfStudy", "Testing");
                        command.Parameters.AddWithValue("@StartDate", DateTime.Now.AddYears(-4));
                        command.Parameters.AddWithValue("@EndDate", DateTime.Now);
                        command.Parameters.AddWithValue("@IsActive", true);
                        command.Parameters.AddWithValue("@DisplayOrder", 999);
                        
                        connection.Open();
                        newEducationId = Convert.ToInt32(command.ExecuteScalar());
                    }
                }
                
                Console.WriteLine($"   ? Successfully added test education record with ID: {newEducationId}");
                
                // Clean up
                string deleteQuery = "DELETE FROM Education WHERE EducationId = @EducationId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("@EducationId", newEducationId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Test education record cleanup: {rowsAffected} row(s) deleted");
                    }
                }
                
                Console.WriteLine("   ? Education feature is working correctly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error testing Education feature: {ex.Message}");
            }
        }
        
        static void TestContactMessagesFeature()
        {
            try
            {
                // Get count
                string countQuery = "SELECT COUNT(*) FROM ContactMessages";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(countQuery, connection))
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        Console.WriteLine($"   ? Found {count} contact messages in database");
                    }
                }
                
                // Insert test message
                string insertQuery = @"
                    INSERT INTO ContactMessages (Name, Email, Subject, MessageBody, IsRead, MessageDate)
                    VALUES (@Name, @Email, @Subject, @MessageBody, @IsRead, @MessageDate);
                    SELECT SCOPE_IDENTITY();";
                
                int newMessageId;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Name", "Test User");
                        command.Parameters.AddWithValue("@Email", "test@example.com");
                        command.Parameters.AddWithValue("@Subject", "Test Message");
                        command.Parameters.AddWithValue("@MessageBody", "This is a test message to verify contact messages feature.");
                        command.Parameters.AddWithValue("@IsRead", false);
                        command.Parameters.AddWithValue("@MessageDate", DateTime.Now);
                        
                        connection.Open();
                        newMessageId = Convert.ToInt32(command.ExecuteScalar());
                    }
                }
                
                Console.WriteLine($"   ? Successfully added test message with ID: {newMessageId}");
                
                // Update to mark as read
                string updateQuery = "UPDATE ContactMessages SET IsRead = 1 WHERE MessageId = @MessageId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@MessageId", newMessageId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Marked test message as read: {rowsAffected} row(s) updated");
                    }
                }
                
                // Clean up
                string deleteQuery = "DELETE FROM ContactMessages WHERE MessageId = @MessageId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("@MessageId", newMessageId);
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"   ? Test message cleanup: {rowsAffected} row(s) deleted");
                    }
                }
                
                Console.WriteLine("   ? Contact Messages feature is working correctly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"   ? Error testing Contact Messages feature: {ex.Message}");
            }
        }
    }
}