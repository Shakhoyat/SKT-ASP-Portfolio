using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class Skills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSkillsData();
            }
        }

        /// <summary>
        /// Load skills data from database or static data
        /// In future iterations, this will load from database
        /// </summary>
        private void LoadSkillsData()
        {
            try
            {
                // For now, we'll use static data
                // In future steps, this will be replaced with database calls
                LoadProgrammingLanguages();
                LoadFrameworks();
                LoadTools();
            }
            catch (Exception ex)
            {
                // Log error and show user-friendly message
                System.Diagnostics.Debug.WriteLine("Error loading skills data: " + ex.Message);
                // In production, implement proper error handling
            }
        }

        /// <summary>
        /// Load programming languages data
        /// </summary>
        private void LoadProgrammingLanguages()
        {
            var programmingLanguages = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "C#",
                    ProficiencyLevel = 90,
                    Description = "Advanced knowledge in C# programming with .NET Framework. Experience in object-oriented programming, LINQ, and async programming.",
                    IconClass = "fab fa-microsoft",
                    IconColor = "#239120"
                },
                new SkillItem
                {
                    SkillName = "SQL",
                    ProficiencyLevel = 85,
                    Description = "Strong database skills including query optimization, stored procedures, triggers, and database design principles.",
                    IconClass = "fas fa-database",
                    IconColor = "#336791"
                },
                new SkillItem
                {
                    SkillName = "JavaScript",
                    ProficiencyLevel = 75,
                    Description = "Solid understanding of JavaScript ES6+, DOM manipulation, event handling, and modern JavaScript features.",
                    IconClass = "fab fa-js-square",
                    IconColor = "#f7df1e"
                },
                new SkillItem
                {
                    SkillName = "HTML5 & CSS3",
                    ProficiencyLevel = 80,
                    Description = "Proficient in semantic HTML5, modern CSS3 features, Flexbox, Grid, and responsive design principles.",
                    IconClass = "fab fa-html5",
                    IconColor = "#e34f26"
                }
            };

            rptProgrammingLanguages.DataSource = programmingLanguages;
            rptProgrammingLanguages.DataBind();
        }

        /// <summary>
        /// Load frameworks and technologies data
        /// </summary>
        private void LoadFrameworks()
        {
            var frameworks = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "ASP.NET Web Forms",
                    ProficiencyLevel = "Advanced",
                    Description = "Extensive experience building web applications using ASP.NET Web Forms, server controls, and state management.",
                    IconClass = "fas fa-globe",
                    IconColor = "#512bd4"
                },
                new SkillItem
                {
                    SkillName = ".NET Framework",
                    ProficiencyLevel = "Advanced",
                    Description = "Deep understanding of .NET Framework architecture, BCL, and various .NET technologies.",
                    IconClass = "fab fa-microsoft",
                    IconColor = "#239120"
                },
                new SkillItem
                {
                    SkillName = "SQL Server",
                    ProficiencyLevel = "Intermediate",
                    Description = "Experience with SQL Server database development, administration, and performance optimization.",
                    IconClass = "fas fa-server",
                    IconColor = "#cc2927"
                },
                new SkillItem
                {
                    SkillName = "Entity Framework",
                    ProficiencyLevel = "Intermediate",
                    Description = "Knowledge of ORM concepts, Code First approach, and LINQ to Entities for data access.",
                    IconClass = "fas fa-sitemap",
                    IconColor = "#68217a"
                },
                new SkillItem
                {
                    SkillName = "Bootstrap",
                    ProficiencyLevel = "Intermediate",
                    Description = "Experience with responsive web design using Bootstrap framework and CSS preprocessors.",
                    IconClass = "fab fa-bootstrap",
                    IconColor = "#7952b3"
                },
                new SkillItem
                {
                    SkillName = "jQuery",
                    ProficiencyLevel = "Intermediate",
                    Description = "Proficient in jQuery for DOM manipulation, AJAX calls, and creating interactive user interfaces.",
                    IconClass = "fab fa-js",
                    IconColor = "#0769ad"
                }
            };

            rptFrameworks.DataSource = frameworks;
            rptFrameworks.DataBind();
        }

        /// <summary>
        /// Load tools and software data
        /// </summary>
        private void LoadTools()
        {
            var tools = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "Visual Studio",
                    Description = "Primary IDE for .NET development",
                    IconClass = "fas fa-code",
                    IconColor = "#5c2d91"
                },
                new SkillItem
                {
                    SkillName = "SQL Server Management Studio",
                    Description = "Database administration and development",
                    IconClass = "fas fa-database",
                    IconColor = "#cc2927"
                },
                new SkillItem
                {
                    SkillName = "Git",
                    Description = "Version control and collaboration",
                    IconClass = "fab fa-git-alt",
                    IconColor = "#f05032"
                },
                new SkillItem
                {
                    SkillName = "GitHub",
                    Description = "Code repository and project management",
                    IconClass = "fab fa-github",
                    IconColor = "#333"
                },
                new SkillItem
                {
                    SkillName = "IIS",
                    Description = "Web server configuration and deployment",
                    IconClass = "fas fa-server",
                    IconColor = "#1ba1e2"
                },
                new SkillItem
                {
                    SkillName = "Postman",
                    Description = "API testing and development",
                    IconClass = "fas fa-paper-plane",
                    IconColor = "#ff6c37"
                },
                new SkillItem
                {
                    SkillName = "VS Code",
                    Description = "Lightweight code editor for various languages",
                    IconClass = "fas fa-file-code",
                    IconColor = "#007acc"
                },
                new SkillItem
                {
                    SkillName = "NuGet",
                    Description = "Package management for .NET",
                    IconClass = "fas fa-cube",
                    IconColor = "#004880"
                }
            };

            rptTools.DataSource = tools;
            rptTools.DataBind();
        }

        /// <summary>
        /// Helper method to convert proficiency level to text
        /// </summary>
        /// <param name="proficiencyLevel">Proficiency level object</param>
        /// <returns>Formatted proficiency text</returns>
        protected string GetProficiencyText(object proficiencyLevel)
        {
            if (proficiencyLevel == null) return "Beginner";
            
            string level = proficiencyLevel.ToString();
            
            // If it's a numeric value, convert to text
            if (int.TryParse(level, out int numericLevel))
            {
                if (numericLevel >= 90) return "Expert";
                if (numericLevel >= 75) return "Advanced";
                if (numericLevel >= 60) return "Intermediate";
                return "Beginner";
            }
            
            return level; // Return as-is if it's already text
        }
    }

    /// <summary>
    /// Data model for skill items
    /// </summary>
    public class SkillItem
    {
        public string SkillName { get; set; }
        public object ProficiencyLevel { get; set; } // Can be int (percentage) or string (level)
        public string Description { get; set; }
        public string IconClass { get; set; }
        public string IconColor { get; set; }
        public string Category { get; set; }
    }
}