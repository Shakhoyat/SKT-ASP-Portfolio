using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SkillsPopulator
{
    public class AIMLSkill
    {
        public string SkillName { get; set; }
        public int SkillLevel { get; set; }
        public int CategoryId { get; set; }
        public int DisplayOrder { get; set; }
    }
    
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("AI/ML SKILLS POPULATOR");
            Console.WriteLine();
            
            try
            {
                var skills = GetSkills();
                Console.WriteLine($"Adding {skills.Count} AI/ML skills...");
                
                int success = 0;
                foreach (var skill in skills)
                {
                    try
                    {
                        int id = InsertSkill(skill);
                        Console.WriteLine($"Added: {skill.SkillName} ({skill.SkillLevel}%)");
                        success++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Failed: {skill.SkillName} - {ex.Message}");
                    }
                }
                
                Console.WriteLine($"\nSuccessfully added {success}/{skills.Count} skills!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            
            Console.ReadKey();
        }
        
        static List<AIMLSkill> GetSkills()
        {
            return new List<AIMLSkill>
            {
                new AIMLSkill { SkillName = "Python", SkillLevel = 95, CategoryId = 1, DisplayOrder = 1 },
                new AIMLSkill { SkillName = "TensorFlow", SkillLevel = 92, CategoryId = 2, DisplayOrder = 2 },
                new AIMLSkill { SkillName = "PyTorch", SkillLevel = 90, CategoryId = 2, DisplayOrder = 3 },
                new AIMLSkill { SkillName = "Scikit-learn", SkillLevel = 95, CategoryId = 2, DisplayOrder = 4 },
                new AIMLSkill { SkillName = "Pandas", SkillLevel = 95, CategoryId = 3, DisplayOrder = 5 },
                new AIMLSkill { SkillName = "NumPy", SkillLevel = 93, CategoryId = 3, DisplayOrder = 6 },
                new AIMLSkill { SkillName = "OpenCV", SkillLevel = 90, CategoryId = 4, DisplayOrder = 7 },
                new AIMLSkill { SkillName = "NLTK", SkillLevel = 88, CategoryId = 4, DisplayOrder = 8 },
                new AIMLSkill { SkillName = "Docker", SkillLevel = 87, CategoryId = 5, DisplayOrder = 9 },
                new AIMLSkill { SkillName = "AWS", SkillLevel = 83, CategoryId = 5, DisplayOrder = 10 }
            };
        }
        
        static int InsertSkill(AIMLSkill skill)
        {
            var query = @"INSERT INTO Skills (SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder)
                         VALUES (@SkillName, @SkillLevel, @CategoryId, 1, @DisplayOrder);
                         SELECT SCOPE_IDENTITY()";
            
            using (var conn = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SkillName", skill.SkillName);
                    cmd.Parameters.AddWithValue("@SkillLevel", skill.SkillLevel);
                    cmd.Parameters.AddWithValue("@CategoryId", skill.CategoryId);
                    cmd.Parameters.AddWithValue("@DisplayOrder", skill.DisplayOrder);
                    
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}