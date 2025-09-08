using System;
using System.Data.SqlClient;

namespace PortfolioVerification
{
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("PORTFOLIO DATA VERIFICATION");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                // Verify Projects
                string projectQuery = "SELECT COUNT(*) FROM Projects WHERE IsActive = 1";
                int projectCount = GetCount(projectQuery);
                Console.WriteLine($"? Projects: {projectCount} records");
                
                // Show sample projects
                string sampleProjectQuery = "SELECT TOP 3 Title FROM Projects WHERE IsActive = 1 ORDER BY DisplayOrder";
                Console.WriteLine("   Sample Projects:");
                ShowSampleData(sampleProjectQuery, "   - ");
                
                Console.WriteLine();
                
                // Verify Skills
                string skillQuery = "SELECT COUNT(*) FROM Skills WHERE IsActive = 1";
                int skillCount = GetCount(skillQuery);
                Console.WriteLine($"? Skills: {skillCount} records");
                
                // Show sample skills
                string sampleSkillQuery = "SELECT TOP 5 SkillName + ' (' + CAST(SkillLevel AS VARCHAR) + '%)' FROM Skills WHERE IsActive = 1 ORDER BY SkillLevel DESC";
                Console.WriteLine("   Top Skills:");
                ShowSampleData(sampleSkillQuery, "   - ");
                
                Console.WriteLine();
                
                // Verify Achievements
                string achievementQuery = "SELECT COUNT(*) FROM Achievements WHERE IsActive = 1";
                int achievementCount = GetCount(achievementQuery);
                Console.WriteLine($"? Achievements: {achievementCount} records");
                
                // Show sample achievements
                string sampleAchievementQuery = "SELECT TOP 3 Title FROM Achievements WHERE IsActive = 1 ORDER BY AchievementDate DESC";
                Console.WriteLine("   Recent Achievements:");
                ShowSampleData(sampleAchievementQuery, "   - ");
                
                Console.WriteLine();
                
                // Verify Education
                string educationQuery = "SELECT COUNT(*) FROM Education WHERE IsActive = 1";
                int educationCount = GetCount(educationQuery);
                Console.WriteLine($"? Education: {educationCount} records");
                
                // Show sample education
                string sampleEducationQuery = "SELECT TOP 3 Degree + ' in ' + FieldOfStudy + ' from ' + InstitutionName FROM Education WHERE IsActive = 1 ORDER BY EndDate DESC";
                Console.WriteLine("   Education Records:");
                ShowSampleData(sampleEducationQuery, "   - ");
                
                Console.WriteLine();
                Console.WriteLine("=================================");
                Console.WriteLine("PORTFOLIO SUMMARY");
                Console.WriteLine("=================================");
                Console.WriteLine($"Total Projects: {projectCount}");
                Console.WriteLine($"Total Skills: {skillCount}");
                Console.WriteLine($"Total Achievements: {achievementCount}");
                Console.WriteLine($"Total Education Records: {educationCount}");
                Console.WriteLine();
                Console.WriteLine("Your AI/ML portfolio is now fully populated!");
                Console.WriteLine("Access your Admin Dashboard to view and manage all data.");
                
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
        
        static int GetCount(string query)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
        
        static void ShowSampleData(string query, string prefix)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine($"{prefix}{reader[0]}");
                        }
                    }
                }
            }
        }
    }
}