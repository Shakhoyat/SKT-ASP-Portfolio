using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ProjectPopulator
{
    public class AIMLProject
    {
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public string TechnologiesUsed { get; set; }
        public string ProjectUrl { get; set; }
        public string GitHubUrl { get; set; }
        public string ImageUrl { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int DisplayOrder { get; set; }
    }
    
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("AI/ML PROJECTS POPULATOR");
            Console.WriteLine();
            
            try
            {
                var projects = GetProjects();
                Console.WriteLine($"Adding {projects.Count} AI/ML projects...");
                
                int success = 0;
                foreach (var project in projects)
                {
                    try
                    {
                        int id = InsertProject(project);
                        Console.WriteLine($"Added: {project.Title} (ID: {id})");
                        success++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Failed: {project.Title} - {ex.Message}");
                    }
                }
                
                Console.WriteLine($"\nSuccessfully added {success}/{projects.Count} projects!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
            
            Console.ReadKey();
        }
        
        static List<AIMLProject> GetProjects()
        {
            return new List<AIMLProject>
            {
                new AIMLProject
                {
                    Title = "Sentiment Analysis API with BERT",
                    ShortDescription = "Real-time sentiment analysis using BERT models",
                    Description = "Advanced sentiment analysis API using pre-trained BERT models with REST endpoints, batch processing, and multilingual support.",
                    TechnologiesUsed = "Python, PyTorch, BERT, FastAPI, Docker, Redis",
                    ProjectUrl = "https://sentiment-api.demo.com",
                    GitHubUrl = "https://github.com/user/bert-sentiment",
                    ImageUrl = "/Content/images/projects/sentiment.jpg",
                    StartDate = DateTime.Now.AddMonths(-8),
                    EndDate = DateTime.Now.AddMonths(-6),
                    DisplayOrder = 1
                },
                
                new AIMLProject
                {
                    Title = "Object Detection with YOLOv8",
                    ShortDescription = "Real-time object detection using YOLOv8",
                    Description = "Advanced object detection system using YOLOv8 with real-time video processing and 95% accuracy.",
                    TechnologiesUsed = "Python, YOLOv8, OpenCV, PyTorch, Flask",
                    ProjectUrl = "https://detection.demo.com",
                    GitHubUrl = "https://github.com/user/yolov8",
                    ImageUrl = "/Content/images/projects/detection.jpg",
                    StartDate = DateTime.Now.AddMonths(-10),
                    EndDate = DateTime.Now.AddMonths(-8),
                    DisplayOrder = 2
                },
                
                new AIMLProject
                {
                    Title = "AI Content Generator",
                    ShortDescription = "Content generation platform using GPT models",
                    Description = "Intelligent content generation platform leveraging GPT models for articles, social media, and marketing copy.",
                    TechnologiesUsed = "Python, OpenAI GPT, LangChain, React, MongoDB",
                    ProjectUrl = "https://content-gen.demo.com",
                    GitHubUrl = "https://github.com/user/ai-content",
                    ImageUrl = "/Content/images/projects/content.jpg",
                    StartDate = DateTime.Now.AddMonths(-6),
                    EndDate = DateTime.Now.AddMonths(-4),
                    DisplayOrder = 3
                },
                
                new AIMLProject
                {
                    Title = "Fraud Detection System",
                    ShortDescription = "Real-time fraud detection using ML",
                    Description = "Machine learning system for detecting fraudulent transactions using ensemble methods and anomaly detection.",
                    TechnologiesUsed = "Python, XGBoost, Kafka, Spark, Elasticsearch",
                    ProjectUrl = "https://fraud.demo.com",
                    GitHubUrl = "https://github.com/user/fraud-detection",
                    ImageUrl = "/Content/images/projects/fraud.jpg",
                    StartDate = DateTime.Now.AddMonths(-13),
                    EndDate = DateTime.Now.AddMonths(-10),
                    DisplayOrder = 4
                }
            };
        }
        
        static int InsertProject(AIMLProject project)
        {
            var query = @"INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                         ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, DisplayOrder, UpdatedDate)
                         VALUES (@Title, @Description, @ShortDescription, @TechnologiesUsed, 
                         @ProjectUrl, @GitHubUrl, @ImageUrl, @StartDate, @EndDate, 1, @DisplayOrder, GETDATE());
                         SELECT SCOPE_IDENTITY()";
            
            using (var conn = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", project.Title);
                    cmd.Parameters.AddWithValue("@Description", project.Description);
                    cmd.Parameters.AddWithValue("@ShortDescription", project.ShortDescription);
                    cmd.Parameters.AddWithValue("@TechnologiesUsed", project.TechnologiesUsed);
                    cmd.Parameters.AddWithValue("@ProjectUrl", (object)project.ProjectUrl ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@GitHubUrl", (object)project.GitHubUrl ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ImageUrl", (object)project.ImageUrl ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@StartDate", project.StartDate);
                    cmd.Parameters.AddWithValue("@EndDate", (object)project.EndDate ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@DisplayOrder", project.DisplayOrder);
                    
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}