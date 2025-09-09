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
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("AI/ML EDUCATION POPULATOR");
            Console.WriteLine();
            
            try
            {
                var education = GetEducation();
                Console.WriteLine($"Adding {education.Count} education records...");
                
                int success = 0;
                foreach (var edu in education)
                {
                    try
                    {
                        int id = InsertEducation(edu);
                        Console.WriteLine($"Added: {edu.Degree} - {edu.InstitutionName}");
                        success++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Failed: {edu.Degree} - {ex.Message}");
                    }
                }
                
                Console.WriteLine($"\nSuccessfully added {success}/{education.Count} education records!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            
            Console.ReadKey();
        }
        
        static List<AIMLEducation> GetEducation()
        {
            return new List<AIMLEducation>
            {
                new AIMLEducation
                {
                    InstitutionName = "Stanford University",
                    Degree = "Master of Science",
                    FieldOfStudy = "Computer Science - AI",
                    StartDate = new DateTime(2020, 9, 1),
                    EndDate = new DateTime(2022, 6, 15),
                    DisplayOrder = 1
                },
                
                new AIMLEducation
                {
                    InstitutionName = "MIT",
                    Degree = "Bachelor of Science",
                    FieldOfStudy = "Computer Science",
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
                }
            };
        }
        
        static int InsertEducation(AIMLEducation education)
        {
            var query = @"INSERT INTO Education (InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, IsActive, DisplayOrder)
                         VALUES (@InstitutionName, @Degree, @FieldOfStudy, @StartDate, @EndDate, 1, @DisplayOrder);
                         SELECT SCOPE_IDENTITY()";
            
            using (var conn = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@InstitutionName", education.InstitutionName);
                    cmd.Parameters.AddWithValue("@Degree", education.Degree);
                    cmd.Parameters.AddWithValue("@FieldOfStudy", education.FieldOfStudy);
                    cmd.Parameters.AddWithValue("@StartDate", education.StartDate);
                    cmd.Parameters.AddWithValue("@EndDate", (object)education.EndDate ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@DisplayOrder", education.DisplayOrder);
                    
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}