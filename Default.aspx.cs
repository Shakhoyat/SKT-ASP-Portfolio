using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDynamicContent();
            }
        }

        /// <summary>
        /// Load dynamic content from database
        /// </summary>
        private void LoadDynamicContent()
        {
            try
            {
                // Load projects and achievements from database
                var projects = GetProjectsFromDatabase();
                var achievements = GetAchievementsFromDatabase();

                // Bind data to repeaters
                rptProjects.DataSource = projects;
                rptProjects.DataBind();

                rptAchievements.DataSource = achievements;
                rptAchievements.DataBind();

                // Also duplicate for infinite scroll effect
                rptProjectsDuplicate.DataSource = projects;
                rptProjectsDuplicate.DataBind();

                rptAchievementsDuplicate.DataSource = achievements;
                rptAchievementsDuplicate.DataBind();

                // Update dynamic stats
                UpdateDynamicStats(projects.Count, achievements.Count);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading dynamic content: {ex.Message}");
            }
        }

        /// <summary>
        /// Update statistics with dynamic data
        /// </summary>
        private void UpdateDynamicStats(int projectCount, int achievementCount)
        {
            try
            {
                // You can update these stats based on your actual data
                // For now, we'll use the existing impressive numbers but you can modify as needed
                
                // Example: If you want to show actual project count
                // You could update the frontend JS to use these values
                // or create literal controls to inject the real numbers
                
                System.Diagnostics.Debug.WriteLine($"Loaded {projectCount} projects and {achievementCount} achievements from database");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating stats: {ex.Message}");
            }
        }

        /// <summary>
        /// Get featured projects from database
        /// </summary>
        private List<object> GetProjectsFromDatabase()
        {
            var projects = new List<object>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Projects"))
                {
                    return GetSampleProjects(); // Fallback to sample data
                }

                var query = @"SELECT TOP 5 ProjectId, Title, ShortDescription, TechnologiesUsed, ProjectUrl, GitHubUrl 
                             FROM Projects WHERE IsActive = 1 ORDER BY DisplayOrder, StartDate DESC";
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    projects.Add(new
                    {
                        ProjectId = Convert.ToInt32(row["ProjectId"]),
                        Title = row["Title"].ToString(),
                        Description = row["ShortDescription"]?.ToString() ?? "",
                        TechnologiesUsed = row["TechnologiesUsed"]?.ToString() ?? "",
                        ProjectUrl = row["ProjectUrl"]?.ToString() ?? "",
                        GitHubUrl = row["GitHubUrl"]?.ToString() ?? "",
                        ProjectIcon = GetProjectIcon(row["Title"].ToString()),
                        ProjectGradient = GetProjectGradient(row["Title"].ToString()),
                        TechBadges = BuildTechBadgesHtml(row["TechnologiesUsed"]?.ToString())
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting projects from database: {ex.Message}");
                return GetSampleProjects(); // Fallback to sample data
            }
            
            return projects.Count > 0 ? projects : GetSampleProjects();
        }

        /// <summary>
        /// Get featured achievements from database
        /// </summary>
        private List<object> GetAchievementsFromDatabase()
        {
            var achievements = new List<object>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Achievements"))
                {
                    return GetSampleAchievements(); // Fallback to sample data
                }

                var query = @"SELECT TOP 6 AchievementId, Title, Organization, Description, AchievementDate, AchievementType 
                             FROM Achievements WHERE IsActive = 1 ORDER BY DisplayOrder, AchievementDate DESC";
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    achievements.Add(new
                    {
                        AchievementId = Convert.ToInt32(row["AchievementId"]),
                        Title = row["Title"].ToString(),
                        Organization = row["Organization"]?.ToString() ?? "",
                        Description = row["Description"]?.ToString() ?? "",
                        Year = Convert.ToDateTime(row["AchievementDate"]).Year.ToString(),
                        Type = row["AchievementType"]?.ToString() ?? "Achievement",
                        IconClass = GetAchievementIcon(row["AchievementType"]?.ToString()),
                        TypeClass = GetAchievementTypeClass(row["AchievementType"]?.ToString())
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting achievements from database: {ex.Message}");
                return GetSampleAchievements(); // Fallback to sample data
            }
            
            return achievements.Count > 0 ? achievements : GetSampleAchievements();
        }

        /// <summary>
        /// Get project icon based on title
        /// </summary>
        private string GetProjectIcon(string title)
        {
            var lowerTitle = title.ToLower();
            if (lowerTitle.Contains("doctor") || lowerTitle.Contains("health") || lowerTitle.Contains("medical"))
                return "fas fa-user-md";
            else if (lowerTitle.Contains("data") || lowerTitle.Contains("analytics") || lowerTitle.Contains("eda"))
                return "fas fa-chart-line";
            else if (lowerTitle.Contains("weather") || lowerTitle.Contains("climate"))
                return "fas fa-cloud-sun";
            else if (lowerTitle.Contains("iot") || lowerTitle.Contains("sensor"))
                return "fas fa-wifi";
            else if (lowerTitle.Contains("vision") || lowerTitle.Contains("image") || lowerTitle.Contains("detection"))
                return "fas fa-eye";
            else
                return "fas fa-project-diagram";
        }

        /// <summary>
        /// Get project gradient based on title
        /// </summary>
        private string GetProjectGradient(string title)
        {
            var lowerTitle = title.ToLower();
            if (lowerTitle.Contains("doctor") || lowerTitle.Contains("health") || lowerTitle.Contains("medical"))
                return "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);";
            else if (lowerTitle.Contains("data") || lowerTitle.Contains("analytics") || lowerTitle.Contains("eda"))
                return "background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);";
            else if (lowerTitle.Contains("weather") || lowerTitle.Contains("climate"))
                return "background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);";
            else if (lowerTitle.Contains("iot") || lowerTitle.Contains("sensor"))
                return "background: linear-gradient(135deg, #FF9A56 0%, #FF6B95 100%);";
            else if (lowerTitle.Contains("vision") || lowerTitle.Contains("image") || lowerTitle.Contains("detection"))
                return "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);";
            else
                return "background: linear-gradient(135deg, #4ECDC4 0%, #44A08D 100%);";
        }

        /// <summary>
        /// Build tech badges HTML from technologies string
        /// </summary>
        private string BuildTechBadgesHtml(string techList)
        {
            if (string.IsNullOrWhiteSpace(techList)) return "";
            
            var parts = techList.Split(new[] {',', ';'}, StringSplitOptions.RemoveEmptyEntries)
                                .Select(t => t.Trim())
                                .Where(t => t.Length > 0)
                                .Take(4); // Limit to 4 badges for UI
            
            var html = "";
            foreach (var tech in parts)
            {
                var className = "tech-badge";
                if (tech.ToLower().Contains("java")) className += " java";
                else if (tech.ToLower().Contains("python")) className += " python";
                else if (tech.ToLower().Contains("react")) className += " react";
                
                html += $"<span class=\"{className}\">{HttpUtility.HtmlEncode(tech)}</span>";
            }
            return html;
        }

        /// <summary>
        /// Get achievement icon based on type
        /// </summary>
        private string GetAchievementIcon(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": return "azure-cert";
                case "award": return "hackathon-winner";
                case "expert": return "kaggle-expert";
                case "research": return "research";
                case "achievement": return "coding-master";
                default: return "opensource";
            }
        }

        /// <summary>
        /// Get achievement type class based on type
        /// </summary>
        private string GetAchievementTypeClass(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": return "certification";
                case "award": return "award";
                case "expert": return "expert";
                case "research": return "research";
                case "achievement": return "achievement";
                default: return "milestone";
            }
        }

        /// <summary>
        /// Fallback sample projects if database is unavailable
        /// </summary>
        private List<object> GetSampleProjects()
        {
            return new List<object>
            {
                new {
                    ProjectId = 1,
                    Title = "Doctor Appointment System",
                    Description = "Healthcare management with ML-powered resource allocation",
                    TechnologiesUsed = "Java, JavaFX, MySQL, ML",
                    ProjectUrl = "",
                    GitHubUrl = "https://github.com/Shakhoyat",
                    ProjectIcon = "fas fa-user-md",
                    ProjectGradient = "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);",
                    TechBadges = "<span class=\"tech-badge java\">Java</span><span class=\"tech-badge\">JavaFX</span><span class=\"tech-badge\">MySQL</span><span class=\"tech-badge\">ML</span>"
                },
                new {
                    ProjectId = 2,
                    Title = "Automated EDA Platform",
                    Description = "Reduces data exploration time by 70% with automated insights",
                    TechnologiesUsed = "Python, Streamlit, Pandas, Plotly",
                    ProjectUrl = "",
                    GitHubUrl = "https://github.com/Shakhoyat",
                    ProjectIcon = "fas fa-chart-line",
                    ProjectGradient = "background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);",
                    TechBadges = "<span class=\"tech-badge python\">Python</span><span class=\"tech-badge\">Streamlit</span><span class=\"tech-badge\">Pandas</span><span class=\"tech-badge\">Plotly</span>"
                }
            };
        }

        /// <summary>
        /// Fallback sample achievements if database is unavailable
        /// </summary>
        private List<object> GetSampleAchievements()
        {
            return new List<object>
            {
                new {
                    AchievementId = 1,
                    Title = "Kaggle Expert",
                    Organization = "Kaggle Platform",
                    Description = "Achieved Expert status on Kaggle through consistent participation in data science competitions",
                    Year = "2023",
                    Type = "Expert Status",
                    IconClass = "kaggle-expert",
                    TypeClass = "expert"
                },
                new {
                    AchievementId = 2,
                    Title = "Azure Developer Associate",
                    Organization = "Microsoft",
                    Description = "Demonstrated expertise in developing cloud applications and services on Microsoft Azure",
                    Year = "2023",
                    Type = "Certification",
                    IconClass = "azure-cert",
                    TypeClass = "certification"
                }
            };
        }

        /// <summary>
        /// Get achievement icon HTML based on icon class
        /// </summary>
        protected string GetAchievementIconHtml(string iconClass)
        {
            switch (iconClass)
            {
                case "kaggle-expert":
                    return "<i class=\"fab fa-kaggle\"></i>";
                case "azure-cert":
                    return "<i class=\"fab fa-microsoft\"></i>";
                case "hackathon-winner":
                    return "<i class=\"fas fa-trophy\"></i>";
                case "research":
                    return "<i class=\"fas fa-graduation-cap\"></i>";
                case "opensource":
                    return "<i class=\"fab fa-github\"></i>";
                case "coding-master":
                    return "<i class=\"fas fa-code\"></i>";
                default:
                    return "<i class=\"fas fa-star\"></i>";
            }
        }
    }
}