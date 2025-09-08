using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace AchievementsPopulator
{
    public class AIMLAchievement
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime AchievementDate { get; set; }
        public int DisplayOrder { get; set; }
    }
    
    class Program
    {
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("AI/ML ACHIEVEMENTS POPULATOR");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                List<AIMLAchievement> achievements = GetAIMLAchievements();
                
                Console.WriteLine($"Preparing to add {achievements.Count} AI/ML achievements to your portfolio...");
                Console.WriteLine();
                
                int successCount = 0;
                foreach (var achievement in achievements)
                {
                    try
                    {
                        int achievementId = InsertAchievement(achievement);
                        Console.WriteLine($"? Added: {achievement.Title} - ID: {achievementId}");
                        successCount++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"? Failed to add: {achievement.Title} - {ex.Message}");
                    }
                }
                
                Console.WriteLine();
                Console.WriteLine($"Successfully added {successCount} out of {achievements.Count} achievements!");
                Console.WriteLine();
                Console.WriteLine("Your portfolio now showcases achievements in:");
                Console.WriteLine("• AI/ML Competition Success");
                Console.WriteLine("• Research & Publications");
                Console.WriteLine("• Industry Recognition");
                Console.WriteLine("• Open Source Contributions");
                Console.WriteLine("• Technical Certifications");
                
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
        
        static List<AIMLAchievement> GetAIMLAchievements()
        {
            return new List<AIMLAchievement>
            {
                new AIMLAchievement
                {
                    Title = "Kaggle Competition - Top 5% Global Ranking",
                    Description = "Achieved top 5% ranking in Kaggle's 'Natural Language Processing with Disaster Tweets' competition with 95.2% accuracy using BERT-based ensemble models and advanced text preprocessing techniques.",
                    AchievementDate = DateTime.Now.AddMonths(-8),
                    DisplayOrder = 1
                },
                
                new AIMLAchievement
                {
                    Title = "Published Research Paper on Computer Vision",
                    Description = "Co-authored and published a research paper titled 'Enhanced Object Detection in Medical Imaging using Multi-Scale Feature Fusion' in IEEE Conference on Computer Vision and Pattern Recognition (CVPR).",
                    AchievementDate = DateTime.Now.AddMonths(-6),
                    DisplayOrder = 2
                },
                
                new AIMLAchievement
                {
                    Title = "AWS Machine Learning Specialty Certification",
                    Description = "Successfully obtained AWS Certified Machine Learning - Specialty certification, demonstrating expertise in designing, implementing, deploying, and maintaining machine learning solutions on AWS.",
                    AchievementDate = DateTime.Now.AddMonths(-10),
                    DisplayOrder = 3
                },
                
                new AIMLAchievement
                {
                    Title = "Open Source Contribution - 1000+ GitHub Stars",
                    Description = "Developed and maintained an open-source deep learning framework for time series forecasting that has gained over 1000 stars on GitHub and is actively used by the ML community.",
                    AchievementDate = DateTime.Now.AddMonths(-12),
                    DisplayOrder = 4
                },
                
                new AIMLAchievement
                {
                    Title = "AI Hackathon Winner - Best Innovation Award",
                    Description = "Won the 'Best Innovation Award' at the Global AI Hackathon 2024 for developing a real-time emotion recognition system using multimodal deep learning approaches.",
                    AchievementDate = DateTime.Now.AddMonths(-4),
                    DisplayOrder = 5
                },
                
                new AIMLAchievement
                {
                    Title = "TensorFlow Developer Certificate",
                    Description = "Earned the TensorFlow Developer Certificate from Google, showcasing proficiency in building and training neural networks using TensorFlow for various machine learning applications.",
                    AchievementDate = DateTime.Now.AddMonths(-14),
                    DisplayOrder = 6
                },
                
                new AIMLAchievement
                {
                    Title = "Industry Recognition - AI Excellence Award",
                    Description = "Received the 'AI Excellence Award' from the Association of Computing Machinery (ACM) for outstanding contributions to the field of artificial intelligence and machine learning.",
                    AchievementDate = DateTime.Now.AddMonths(-5),
                    DisplayOrder = 7
                },
                
                new AIMLAchievement
                {
                    Title = "Deep Learning Specialization - Stanford University",
                    Description = "Completed the comprehensive Deep Learning Specialization from Stanford University through Coursera, covering neural networks, CNN, RNN, and advanced deep learning concepts.",
                    AchievementDate = DateTime.Now.AddMonths(-18),
                    DisplayOrder = 8
                },
                
                new AIMLAchievement
                {
                    Title = "MLOps Best Practices Implementation",
                    Description = "Successfully designed and implemented a production-ready MLOps pipeline that reduced model deployment time by 80% and improved model reliability across multiple projects.",
                    AchievementDate = DateTime.Now.AddMonths(-7),
                    DisplayOrder = 9
                },
                
                new AIMLAchievement
                {
                    Title = "Conference Speaker - PyData Global 2024",
                    Description = "Delivered a keynote presentation on 'Scaling Machine Learning in Production' at PyData Global 2024, sharing insights on MLOps best practices with 500+ attendees.",
                    AchievementDate = DateTime.Now.AddMonths(-3),
                    DisplayOrder = 10
                },
                
                new AIMLAchievement
                {
                    Title = "Google Cloud Professional ML Engineer Certification",
                    Description = "Achieved Google Cloud Professional Machine Learning Engineer certification, demonstrating expertise in designing, building, and productionizing ML models on Google Cloud Platform.",
                    AchievementDate = DateTime.Now.AddMonths(-9),
                    DisplayOrder = 11
                },
                
                new AIMLAchievement
                {
                    Title = "Neural Network Research Publication",
                    Description = "Published research on 'Efficient Training of Large-Scale Neural Networks using Novel Optimization Techniques' in the Journal of Machine Learning Research (JMLR).",
                    AchievementDate = DateTime.Now.AddMonths(-11),
                    DisplayOrder = 12
                }
            };
        }
        
        static int InsertAchievement(AIMLAchievement achievement)
        {
            string query = @"
                INSERT INTO Achievements (Title, Description, AchievementDate, IsActive, DisplayOrder)
                VALUES (@Title, @Description, @AchievementDate, @IsActive, @DisplayOrder);
                SELECT SCOPE_IDENTITY();";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Title", achievement.Title);
                    command.Parameters.AddWithValue("@Description", achievement.Description);
                    command.Parameters.AddWithValue("@AchievementDate", achievement.AchievementDate);
                    command.Parameters.AddWithValue("@IsActive", true);
                    command.Parameters.AddWithValue("@DisplayOrder", achievement.DisplayOrder);
                    
                    connection.Open();
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
}