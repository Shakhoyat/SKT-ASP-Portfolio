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
        private static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
        
        static void Main(string[] args)
        {
            Console.WriteLine("=================================");
            Console.WriteLine("AI/ML PROJECTS POPULATOR");
            Console.WriteLine("=================================");
            Console.WriteLine();
            
            try
            {
                List<AIMLProject> projects = GetModernAIMLProjects();
                
                Console.WriteLine($"Preparing to add {projects.Count} modern AI/ML projects to your portfolio...");
                Console.WriteLine();
                
                int successCount = 0;
                foreach (var project in projects)
                {
                    try
                    {
                        int projectId = InsertProject(project);
                        Console.WriteLine($"? Added: {project.Title} (ID: {projectId})");
                        successCount++;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"? Failed to add: {project.Title} - {ex.Message}");
                    }
                }
                
                Console.WriteLine();
                Console.WriteLine($"Successfully added {successCount} out of {projects.Count} projects!");
                Console.WriteLine();
                Console.WriteLine("Your portfolio now includes modern AI/ML projects covering:");
                Console.WriteLine("• Machine Learning & Deep Learning");
                Console.WriteLine("• Natural Language Processing (NLP)");
                Console.WriteLine("• Computer Vision (CV)");
                Console.WriteLine("• Data Science & Analytics");
                Console.WriteLine("• AI Web Applications");
                Console.WriteLine();
                Console.WriteLine("You can now view and manage these projects through your Admin Panel!");
                
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
        
        static List<AIMLProject> GetModernAIMLProjects()
        {
            return new List<AIMLProject>
            {
                // 1. Advanced NLP Project
                new AIMLProject
                {
                    Title = "Advanced Sentiment Analysis API with BERT",
                    ShortDescription = "Real-time sentiment analysis API using pre-trained BERT models with REST endpoints",
                    Description = "Developed a production-ready sentiment analysis API leveraging state-of-the-art BERT transformer models. The system processes text in real-time, providing sentiment scores with confidence levels. Features include batch processing, multilingual support, and comprehensive API documentation. Deployed using Docker containers with Redis caching for optimal performance.",
                    TechnologiesUsed = "Python, PyTorch, Transformers, BERT, FastAPI, Docker, Redis, PostgreSQL, Swagger",
                    ProjectUrl = "https://sentiment-api-demo.herokuapp.com",
                    GitHubUrl = "https://github.com/your-username/bert-sentiment-api",
                    ImageUrl = "/Content/images/projects/sentiment-analysis.jpg",
                    StartDate = DateTime.Now.AddMonths(-8),
                    EndDate = DateTime.Now.AddMonths(-6),
                    DisplayOrder = 1
                },
                
                // 2. Computer Vision Project
                new AIMLProject
                {
                    Title = "Real-Time Object Detection with YOLOv8",
                    ShortDescription = "Advanced object detection system using YOLOv8 with real-time video processing capabilities",
                    Description = "Implemented a cutting-edge object detection system using YOLOv8 architecture. The application processes live video streams and static images, detecting and classifying multiple objects with bounding boxes and confidence scores. Features include custom model training, data augmentation, and deployment on edge devices. Achieved 95% accuracy on custom dataset.",
                    TechnologiesUsed = "Python, YOLOv8, OpenCV, PyTorch, Ultralytics, CUDA, Flask, WebRTC, TensorRT",
                    ProjectUrl = "https://object-detection-demo.streamlit.app",
                    GitHubUrl = "https://github.com/your-username/yolov8-detection",
                    ImageUrl = "/Content/images/projects/object-detection.jpg",
                    StartDate = DateTime.Now.AddMonths(-10),
                    EndDate = DateTime.Now.AddMonths(-8),
                    DisplayOrder = 2
                },
                
                // 3. Generative AI Project
                new AIMLProject
                {
                    Title = "AI-Powered Content Generator with GPT Integration",
                    ShortDescription = "Intelligent content generation platform using GPT models for automated writing and editing",
                    Description = "Built a comprehensive content generation platform that leverages GPT models for creating high-quality articles, social media posts, and marketing copy. The system includes custom fine-tuning capabilities, content optimization suggestions, and plagiarism detection. Features a modern web interface with real-time collaboration tools and content versioning.",
                    TechnologiesUsed = "Python, OpenAI GPT, Transformers, Streamlit, LangChain, Pinecone, React, Node.js, MongoDB",
                    ProjectUrl = "https://ai-content-gen.vercel.app",
                    GitHubUrl = "https://github.com/your-username/ai-content-generator",
                    ImageUrl = "/Content/images/projects/content-generator.jpg",
                    StartDate = DateTime.Now.AddMonths(-6),
                    EndDate = DateTime.Now.AddMonths(-4),
                    DisplayOrder = 3
                },
                
                // 4. Deep Learning Project
                new AIMLProject
                {
                    Title = "Neural Style Transfer Web Application",
                    ShortDescription = "Deep learning app for artistic style transfer using CNN architectures",
                    Description = "Developed an interactive web application that applies artistic styles to photographs using deep convolutional neural networks. Implemented multiple style transfer algorithms including Neural Style Transfer and Fast Style Transfer. The application features real-time preview, batch processing, and custom style training capabilities with an intuitive drag-and-drop interface.",
                    TechnologiesUsed = "TensorFlow, Keras, CNN, VGG19, Flask, JavaScript, HTML5 Canvas, AWS S3, Celery",
                    ProjectUrl = "https://neural-style-app.herokuapp.com",
                    GitHubUrl = "https://github.com/your-username/neural-style-transfer",
                    ImageUrl = "/Content/images/projects/style-transfer.jpg",
                    StartDate = DateTime.Now.AddMonths(-12),
                    EndDate = DateTime.Now.AddMonths(-10),
                    DisplayOrder = 4
                },
                
                // 5. MLOps Project
                new AIMLProject
                {
                    Title = "End-to-End MLOps Pipeline with Model Monitoring",
                    ShortDescription = "Complete MLOps pipeline with automated training, deployment, and monitoring using Kubernetes",
                    Description = "Designed and implemented a comprehensive MLOps pipeline that automates the entire machine learning workflow from data ingestion to model deployment and monitoring. Features include automated data validation, model versioning, A/B testing capabilities, and real-time performance monitoring with alerting systems. Built using cloud-native technologies for scalability.",
                    TechnologiesUsed = "MLflow, Kubeflow, Docker, Kubernetes, Apache Airflow, Prometheus, Grafana, GitLab CI/CD, AWS",
                    ProjectUrl = "https://mlops-demo.kubernetes.example.com",
                    GitHubUrl = "https://github.com/your-username/mlops-pipeline",
                    ImageUrl = "/Content/images/projects/mlops-pipeline.jpg",
                    StartDate = DateTime.Now.AddMonths(-14),
                    EndDate = DateTime.Now.AddMonths(-11),
                    DisplayOrder = 5
                },
                
                // 6. Recommendation System
                new AIMLProject
                {
                    Title = "Hybrid Recommendation Engine with Deep Learning",
                    ShortDescription = "Advanced recommendation system combining collaborative filtering with deep neural networks",
                    Description = "Built a sophisticated recommendation engine that combines collaborative filtering, content-based filtering, and deep learning approaches. The system handles cold start problems, provides explainable recommendations, and supports real-time updates. Implemented using neural collaborative filtering and autoencoders for feature learning with comprehensive evaluation metrics.",
                    TechnologiesUsed = "Python, TensorFlow, Scikit-learn, Pandas, Apache Spark, Redis, Neo4j, FastAPI, React",
                    ProjectUrl = "https://recommendation-demo.vercel.app",
                    GitHubUrl = "https://github.com/your-username/hybrid-recommender",
                    ImageUrl = "/Content/images/projects/recommendation-system.jpg",
                    StartDate = DateTime.Now.AddMonths(-9),
                    EndDate = DateTime.Now.AddMonths(-7),
                    DisplayOrder = 6
                },
                
                // 7. Time Series Forecasting
                new AIMLProject
                {
                    Title = "Multi-variate Time Series Forecasting with LSTM",
                    ShortDescription = "Advanced time series prediction using LSTM networks for financial and weather data",
                    Description = "Developed a robust time series forecasting system using LSTM and GRU networks for predicting stock prices, weather patterns, and energy consumption. The system handles multiple variables, seasonal decomposition, and provides uncertainty quantification. Features include automated hyperparameter tuning and ensemble methods for improved accuracy.",
                    TechnologiesUsed = "Python, PyTorch, LSTM, GRU, Prophet, Optuna, Plotly, Streamlit, PostgreSQL, Docker",
                    ProjectUrl = "https://timeseries-forecasting.streamlit.app",
                    GitHubUrl = "https://github.com/your-username/lstm-forecasting",
                    ImageUrl = "/Content/images/projects/time-series.jpg",
                    StartDate = DateTime.Now.AddMonths(-7),
                    EndDate = DateTime.Now.AddMonths(-5),
                    DisplayOrder = 7
                },
                
                // 8. Computer Vision - Medical AI
                new AIMLProject
                {
                    Title = "Medical Image Analysis with CNN for Disease Detection",
                    ShortDescription = "Deep learning system for automated medical diagnosis using chest X-rays and MRI scans",
                    Description = "Created an AI-powered medical imaging system that assists in diagnosing diseases from chest X-rays and MRI scans. The system uses advanced CNN architectures including ResNet and DenseNet with attention mechanisms. Features DICOM image processing, uncertainty estimation, and explainable AI capabilities with heat maps for clinical decision support.",
                    TechnologiesUsed = "Python, TensorFlow, Keras, ResNet, DenseNet, OpenCV, DICOM, Grad-CAM, Flask, Vue.js",
                    ProjectUrl = "https://medical-ai-demo.herokuapp.com",
                    GitHubUrl = "https://github.com/your-username/medical-image-ai",
                    ImageUrl = "/Content/images/projects/medical-ai.jpg",
                    StartDate = DateTime.Now.AddMonths(-11),
                    EndDate = DateTime.Now.AddMonths(-9),
                    DisplayOrder = 8
                },
                
                // 9. NLP - Chatbot
                new AIMLProject
                {
                    Title = "Intelligent Chatbot with RAG and Vector Database",
                    ShortDescription = "Advanced conversational AI using RAG architecture with semantic search capabilities",
                    Description = "Built an intelligent chatbot system using Retrieval-Augmented Generation (RAG) architecture that can answer questions from large document collections. The system combines vector databases for semantic search with large language models for natural response generation. Features include context awareness, conversation memory, and multi-modal support.",
                    TechnologiesUsed = "Python, LangChain, OpenAI, Pinecone, FAISS, Transformers, Streamlit, Chroma, Embeddings",
                    ProjectUrl = "https://intelligent-chatbot.streamlit.app",
                    GitHubUrl = "https://github.com/your-username/rag-chatbot",
                    ImageUrl = "/Content/images/projects/chatbot-rag.jpg",
                    StartDate = DateTime.Now.AddMonths(-5),
                    EndDate = DateTime.Now.AddMonths(-3),
                    DisplayOrder = 9
                },
                
                // 10. Data Science Project
                new AIMLProject
                {
                    Title = "Real-Time Fraud Detection System with Anomaly Detection",
                    ShortDescription = "Machine learning system for detecting fraudulent transactions using ensemble methods",
                    Description = "Developed a real-time fraud detection system that processes financial transactions and identifies potentially fraudulent activities. The system uses ensemble learning techniques, anomaly detection algorithms, and streaming data processing. Features include adaptive learning, false positive reduction, and real-time alerting with comprehensive reporting dashboards.",
                    TechnologiesUsed = "Python, Scikit-learn, XGBoost, Apache Kafka, Spark Streaming, Elasticsearch, Kibana, Docker",
                    ProjectUrl = "https://fraud-detection-dashboard.herokuapp.com",
                    GitHubUrl = "https://github.com/your-username/fraud-detection-ml",
                    ImageUrl = "/Content/images/projects/fraud-detection.jpg",
                    StartDate = DateTime.Now.AddMonths(-13),
                    EndDate = DateTime.Now.AddMonths(-10),
                    DisplayOrder = 10
                }
            };
        }
        
        static int InsertProject(AIMLProject project)
        {
            string query = @"
                INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                                    ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, 
                                    IsActive, DisplayOrder, UpdatedDate)
                VALUES (@Title, @Description, @ShortDescription, @TechnologiesUsed, 
                        @ProjectUrl, @GitHubUrl, @ImageUrl, @StartDate, @EndDate, 
                        @IsActive, @DisplayOrder, GETDATE());
                SELECT SCOPE_IDENTITY();";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Title", project.Title);
                    command.Parameters.AddWithValue("@Description", project.Description);
                    command.Parameters.AddWithValue("@ShortDescription", project.ShortDescription);
                    command.Parameters.AddWithValue("@TechnologiesUsed", project.TechnologiesUsed);
                    command.Parameters.AddWithValue("@ProjectUrl", (object)project.ProjectUrl ?? DBNull.Value);
                    command.Parameters.AddWithValue("@GitHubUrl", (object)project.GitHubUrl ?? DBNull.Value);
                    command.Parameters.AddWithValue("@ImageUrl", (object)project.ImageUrl ?? DBNull.Value);
                    command.Parameters.AddWithValue("@StartDate", project.StartDate);
                    command.Parameters.AddWithValue("@EndDate", (object)project.EndDate ?? DBNull.Value);
                    command.Parameters.AddWithValue("@IsActive", true);
                    command.Parameters.AddWithValue("@DisplayOrder", project.DisplayOrder);
                    
                    connection.Open();
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }
    }
}