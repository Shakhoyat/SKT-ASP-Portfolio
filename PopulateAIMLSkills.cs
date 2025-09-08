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
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("AI/ML SKILLS POPULATOR");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                List<AIMLSkill> skills = GetAIMLSkills();
                
                Console.WriteLine($"Preparing to add {skills.Count} AI/ML skills to your portfolio...");
                Console.WriteLine();
                
                int successCount = 0;
                foreach (var skill in skills)
                {
                    try
                    {
                        int skillId = InsertSkill(skill);
                        Console.WriteLine($"? Added: {skill.SkillName} ({skill.SkillLevel}%) - ID: {skillId}");
                        successCount++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"? Failed to add: {skill.SkillName} - {ex.Message}");
                    }
                }
                
                Console.WriteLine();
                Console.WriteLine($"Successfully added {successCount} out of {skills.Count} skills!");
                Console.WriteLine();
                Console.WriteLine("Your portfolio now includes skills in:");
                Console.WriteLine("• Machine Learning Frameworks");
                Console.WriteLine("• Deep Learning & Neural Networks");
                Console.WriteLine("• Natural Language Processing");
                Console.WriteLine("• Computer Vision");
                Console.WriteLine("• Data Science Tools");
                Console.WriteLine("• Cloud & DevOps");
                Console.WriteLine("• Programming Languages");
                
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
        
        static List<AIMLSkill> GetAIMLSkills()
        {
            return new List<AIMLSkill>
            {
                // Programming Languages
                new AIMLSkill { SkillName = "Python", SkillLevel = 95, CategoryId = 1, DisplayOrder = 1 },
                new AIMLSkill { SkillName = "R", SkillLevel = 80, CategoryId = 1, DisplayOrder = 2 },
                new AIMLSkill { SkillName = "SQL", SkillLevel = 90, CategoryId = 1, DisplayOrder = 3 },
                new AIMLSkill { SkillName = "JavaScript", SkillLevel = 85, CategoryId = 1, DisplayOrder = 4 },
                new AIMLSkill { SkillName = "C#", SkillLevel = 88, CategoryId = 1, DisplayOrder = 5 },
                
                // Machine Learning Frameworks
                new AIMLSkill { SkillName = "TensorFlow", SkillLevel = 92, CategoryId = 2, DisplayOrder = 6 },
                new AIMLSkill { SkillName = "PyTorch", SkillLevel = 90, CategoryId = 2, DisplayOrder = 7 },
                new AIMLSkill { SkillName = "Scikit-learn", SkillLevel = 95, CategoryId = 2, DisplayOrder = 8 },
                new AIMLSkill { SkillName = "Keras", SkillLevel = 88, CategoryId = 2, DisplayOrder = 9 },
                new AIMLSkill { SkillName = "XGBoost", SkillLevel = 85, CategoryId = 2, DisplayOrder = 10 },
                
                // Deep Learning Specializations
                new AIMLSkill { SkillName = "CNN (Computer Vision)", SkillLevel = 90, CategoryId = 3, DisplayOrder = 11 },
                new AIMLSkill { SkillName = "RNN/LSTM/GRU", SkillLevel = 87, CategoryId = 3, DisplayOrder = 12 },
                new AIMLSkill { SkillName = "Transformers/BERT", SkillLevel = 85, CategoryId = 3, DisplayOrder = 13 },
                new AIMLSkill { SkillName = "GANs", SkillLevel = 80, CategoryId = 3, DisplayOrder = 14 },
                new AIMLSkill { SkillName = "Reinforcement Learning", SkillLevel = 75, CategoryId = 3, DisplayOrder = 15 },
                
                // NLP Technologies
                new AIMLSkill { SkillName = "NLTK", SkillLevel = 88, CategoryId = 4, DisplayOrder = 16 },
                new AIMLSkill { SkillName = "spaCy", SkillLevel = 90, CategoryId = 4, DisplayOrder = 17 },
                new AIMLSkill { SkillName = "Transformers Library", SkillLevel = 85, CategoryId = 4, DisplayOrder = 18 },
                new AIMLSkill { SkillName = "LangChain", SkillLevel = 82, CategoryId = 4, DisplayOrder = 19 },
                new AIMLSkill { SkillName = "OpenAI API", SkillLevel = 87, CategoryId = 4, DisplayOrder = 20 },
                
                // Computer Vision
                new AIMLSkill { SkillName = "OpenCV", SkillLevel = 90, CategoryId = 5, DisplayOrder = 21 },
                new AIMLSkill { SkillName = "YOLO", SkillLevel = 85, CategoryId = 5, DisplayOrder = 22 },
                new AIMLSkill { SkillName = "Image Processing", SkillLevel = 88, CategoryId = 5, DisplayOrder = 23 },
                new AIMLSkill { SkillName = "Object Detection", SkillLevel = 87, CategoryId = 5, DisplayOrder = 24 },
                new AIMLSkill { SkillName = "Image Segmentation", SkillLevel = 83, CategoryId = 5, DisplayOrder = 25 },
                
                // Data Science Tools
                new AIMLSkill { SkillName = "Pandas", SkillLevel = 95, CategoryId = 6, DisplayOrder = 26 },
                new AIMLSkill { SkillName = "NumPy", SkillLevel = 93, CategoryId = 6, DisplayOrder = 27 },
                new AIMLSkill { SkillName = "Matplotlib", SkillLevel = 90, CategoryId = 6, DisplayOrder = 28 },
                new AIMLSkill { SkillName = "Seaborn", SkillLevel = 88, CategoryId = 6, DisplayOrder = 29 },
                new AIMLSkill { SkillName = "Plotly", SkillLevel = 85, CategoryId = 6, DisplayOrder = 30 },
                new AIMLSkill { SkillName = "Jupyter Notebooks", SkillLevel = 92, CategoryId = 6, DisplayOrder = 31 },
                
                // MLOps & Deployment
                new AIMLSkill { SkillName = "Docker", SkillLevel = 87, CategoryId = 7, DisplayOrder = 32 },
                new AIMLSkill { SkillName = "Kubernetes", SkillLevel = 80, CategoryId = 7, DisplayOrder = 33 },
                new AIMLSkill { SkillName = "MLflow", SkillLevel = 82, CategoryId = 7, DisplayOrder = 34 },
                new AIMLSkill { SkillName = "Apache Airflow", SkillLevel = 78, CategoryId = 7, DisplayOrder = 35 },
                new AIMLSkill { SkillName = "FastAPI", SkillLevel = 88, CategoryId = 7, DisplayOrder = 36 },
                new AIMLSkill { SkillName = "Flask", SkillLevel = 90, CategoryId = 7, DisplayOrder = 37 },
                
                // Cloud Platforms
                new AIMLSkill { SkillName = "AWS", SkillLevel = 83, CategoryId = 8, DisplayOrder = 38 },
                new AIMLSkill { SkillName = "Google Cloud Platform", SkillLevel = 80, CategoryId = 8, DisplayOrder = 39 },
                new AIMLSkill { SkillName = "Azure", SkillLevel = 78, CategoryId = 8, DisplayOrder = 40 },
                new AIMLSkill { SkillName = "Heroku", SkillLevel = 85, CategoryId = 8, DisplayOrder = 41 },
                
                // Databases & Big Data
                new AIMLSkill { SkillName = "PostgreSQL", SkillLevel = 85, CategoryId = 9, DisplayOrder = 42 },
                new AIMLSkill { SkillName = "MongoDB", SkillLevel = 80, CategoryId = 9, DisplayOrder = 43 },
                new AIMLSkill { SkillName = "Redis", SkillLevel = 78, CategoryId = 9, DisplayOrder = 44 },
                new AIMLSkill { SkillName = "Apache Spark", SkillLevel = 75, CategoryId = 9, DisplayOrder = 45 },
                new AIMLSkill { SkillName = "Elasticsearch", SkillLevel = 73, CategoryId = 9, DisplayOrder = 46 },
                
                // Vector Databases & Search
                new AIMLSkill { SkillName = "Pinecone", SkillLevel = 82, CategoryId = 10, DisplayOrder = 47 },
                new AIMLSkill { SkillName = "FAISS", SkillLevel = 80, CategoryId = 10, DisplayOrder = 48 },
                new AIMLSkill { SkillName = "Chroma", SkillLevel = 78, CategoryId = 10, DisplayOrder = 49 },
                new AIMLSkill { SkillName = "Weaviate", SkillLevel = 75, CategoryId = 10, DisplayOrder = 50 }
            };
        }
        
        static int InsertSkill(AIMLSkill skill)
        {
            string query = @"
                INSERT INTO Skills (SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder)
                VALUES (@SkillName, @SkillLevel, @CategoryId, @IsActive, @DisplayOrder);
                SELECT SCOPE_IDENTITY();";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SkillName", skill.SkillName);
                    command.Parameters.AddWithValue("@SkillLevel", skill.SkillLevel);
                    command.Parameters.AddWithValue("@CategoryId", skill.CategoryId);
                    command.Parameters.AddWithValue("@IsActive", true);
                    command.Parameters.AddWithValue("@DisplayOrder", skill.DisplayOrder);
                    
                    connection.Open();
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
}