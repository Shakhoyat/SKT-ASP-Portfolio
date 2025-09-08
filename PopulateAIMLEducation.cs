using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace EducationPopulator
{
    public class AIMLEducation
    {
        public string InstitutionName { get; set; }
        public string Degree { get; set; }
        public string FieldOfStudy { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int DisplayOrder { get; set; }
    }
    
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("AI/ML EDUCATION POPULATOR");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                List<AIMLEducation> educationRecords = GetAIMLEducation();
                
                Console.WriteLine($"Preparing to add {educationRecords.Count} education records to your portfolio...");
                Console.WriteLine();
                
                int successCount = 0;
                foreach (var education in educationRecords)
                {
                    try
                    {
                        int educationId = InsertEducation(education);
                        Console.WriteLine($"? Added: {education.Degree} in {education.FieldOfStudy} from {education.InstitutionName} - ID: {educationId}");
                        successCount++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"? Failed to add: {education.Degree} - {ex.Message}");
                    }
                }
                
                Console.WriteLine();
                Console.WriteLine($"Successfully added {successCount} out of {educationRecords.Count} education records!");
                Console.WriteLine();
                Console.WriteLine("Your portfolio now includes education in:");
                Console.WriteLine("• Computer Science & AI");
                Console.WriteLine("• Advanced Machine Learning");
                Console.WriteLine("• Data Science & Analytics");
                Console.WriteLine("• Professional Certifications");
                
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
        
        static List<AIMLEducation> GetAIMLEducation()
        {
            return new List<AIMLEducation>
            {
                new AIMLEducation
                {
                    InstitutionName = "Stanford University",
                    Degree = "Master of Science",
                    FieldOfStudy = "Computer Science - Artificial Intelligence",
                    StartDate = new DateTime(2020, 9, 1),
                    EndDate = new DateTime(2022, 6, 15),
                    DisplayOrder = 1
                },
                
                new AIMLEducation
                {
                    InstitutionName = "MIT (Massachusetts Institute of Technology)",
                    Degree = "Bachelor of Science",
                    FieldOfStudy = "Computer Science and Engineering",
                    StartDate = new DateTime(2016, 9, 1),
                    EndDate = new DateTime(2020, 5, 30),
                    DisplayOrder = 2
                },
                
                new AIMLEducation
                {
                    InstitutionName = "Coursera - DeepLearning.AI",
                    Degree = "Professional Certificate",
                    FieldOfStudy = "Deep Learning Specialization",
                    StartDate = new DateTime(2023, 1, 15),
                    EndDate = new DateTime(2023, 6, 30),
                    DisplayOrder = 3
                },
                
                new AIMLEducation
                {
                    InstitutionName = "edX - Harvard University",
                    Degree = "Professional Certificate",
                    FieldOfStudy = "Data Science and Machine Learning",
                    StartDate = new DateTime(2022, 8, 1),
                    EndDate = new DateTime(2023, 2, 28),
                    DisplayOrder = 4
                },
                
                new AIMLEducation
                {
                    InstitutionName = "Udacity",
                    Degree = "Nanodegree",
                    FieldOfStudy = "Machine Learning Engineer",
                    StartDate = new DateTime(2021, 3, 1),
                    EndDate = new DateTime(2021, 9, 30),
                    DisplayOrder = 5
                },
                
                new AIMLEducation
                {
                    InstitutionName = "Fast.ai",
                    Degree = "Course Completion",
                    FieldOfStudy = "Practical Deep Learning for Coders",
                    StartDate = new DateTime(2022, 1, 10),
                    EndDate = new DateTime(2022, 4, 15),
                    DisplayOrder = 6
                },
                
                new AIMLEducation
                {
                    InstitutionName = "Google Cloud",
                    Degree = "Professional Certificate",
                    FieldOfStudy = "Machine Learning Engineering",
                    StartDate = new DateTime(2023, 3, 1),
                    EndDate = new DateTime(2023, 8, 31),
                    DisplayOrder = 7
                },
                
                new AIMLEducation
                {
                    InstitutionName = "AWS Training",
                    Degree = "Certification",
                    FieldOfStudy = "Machine Learning Specialty",
                    StartDate = new DateTime(2022, 10, 1),
                    EndDate = new DateTime(2023, 1, 31),
                    DisplayOrder = 8
                }
            };
        }
        
        static int InsertEducation(AIMLEducation education)
        {
            string query = @"
                INSERT INTO Education (InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, IsActive, DisplayOrder)
                VALUES (@InstitutionName, @Degree, @FieldOfStudy, @StartDate, @EndDate, @IsActive, @DisplayOrder);
                SELECT SCOPE_IDENTITY();";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@InstitutionName", education.InstitutionName);
                    command.Parameters.AddWithValue("@Degree", education.Degree);
                    command.Parameters.AddWithValue("@FieldOfStudy", education.FieldOfStudy);
                    command.Parameters.AddWithValue("@StartDate", education.StartDate);
                    command.Parameters.AddWithValue("@EndDate", (object)education.EndDate ?? DBNull.Value);
                    command.Parameters.AddWithValue("@IsActive", true);
                    command.Parameters.AddWithValue("@DisplayOrder", education.DisplayOrder);
                    
                    connection.Open();
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
}