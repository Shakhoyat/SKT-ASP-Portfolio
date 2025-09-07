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
        /// Load skills data - updated for data science theme
        /// </summary>
        private void LoadSkillsData()
        {
            try
            {
                LoadProgrammingLanguages();
                LoadFrameworks();
                LoadTools();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading skills data: " + ex.Message);
            }
        }

        /// <summary>
        /// Load programming languages data - data science focused
        /// </summary>
        private void LoadProgrammingLanguages()
        {
            var programmingLanguages = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "Python",
                    ProficiencyLevel = 95,
                    Description = "Expert-level Python programming for data science, machine learning, and automation. Extensive experience with scientific computing libraries.",
                    IconClass = "fab fa-python",
                    IconColor = "#3776ab"
                },
                new SkillItem
                {
                    SkillName = "Java",
                    ProficiencyLevel = 88,
                    Description = "Advanced Java programming with focus on enterprise applications, object-oriented design, and algorithmic problem solving.",
                    IconClass = "fab fa-java",
                    IconColor = "#f89820"
                },
                new SkillItem
                {
                    SkillName = "C++",
                    ProficiencyLevel = 85,
                    Description = "Strong foundation in C++ for competitive programming, algorithm implementation, and system-level programming.",
                    IconClass = "fas fa-code",
                    IconColor = "#00599c"
                },
                new SkillItem
                {
                    SkillName = "JavaScript",
                    ProficiencyLevel = 82,
                    Description = "Modern JavaScript ES6+ for web development, interactive data visualizations, and full-stack applications.",
                    IconClass = "fab fa-js-square",
                    IconColor = "#f7df1e"
                },
                new SkillItem
                {
                    SkillName = "SQL",
                    ProficiencyLevel = 90,
                    Description = "Advanced database querying, optimization, and design. Experience with complex analytical queries and data warehousing.",
                    IconClass = "fas fa-database",
                    IconColor = "#336791"
                },
                new SkillItem
                {
                    SkillName = "R",
                    ProficiencyLevel = 75,
                    Description = "Statistical computing and data analysis with R. Experience in statistical modeling and data visualization.",
                    IconClass = "fas fa-chart-bar",
                    IconColor = "#276dc3"
                }
            };

            rptProgrammingLanguages.DataSource = programmingLanguages;
            rptProgrammingLanguages.DataBind();
        }

        /// <summary>
        /// Load frameworks and technologies data - ML/DS focused
        /// </summary>
        private void LoadFrameworks()
        {
            var frameworks = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "TensorFlow",
                    ProficiencyLevel = "Advanced",
                    Description = "Deep learning framework for building and deploying neural networks, computer vision, and NLP models.",
                    IconClass = "fas fa-brain",
                    IconColor = "#ff6f00"
                },
                new SkillItem
                {
                    SkillName = "PyTorch",
                    ProficiencyLevel = "Advanced",
                    Description = "Dynamic neural network framework for research and production deep learning applications.",
                    IconClass = "fas fa-fire",
                    IconColor = "#ee4c2c"
                },
                new SkillItem
                {
                    SkillName = "Scikit-Learn",
                    ProficiencyLevel = "Expert",
                    Description = "Comprehensive machine learning library for classification, regression, clustering, and model evaluation.",
                    IconClass = "fas fa-cogs",
                    IconColor = "#f7931e"
                },
                new SkillItem
                {
                    SkillName = "Pandas & NumPy",
                    ProficiencyLevel = "Expert",
                    Description = "Data manipulation, analysis, and numerical computing. Foundation for all data science workflows.",
                    IconClass = "fas fa-table",
                    IconColor = "#150458"
                },
                new SkillItem
                {
                    SkillName = "React.js",
                    ProficiencyLevel = "Intermediate",
                    Description = "Modern React development for building interactive data dashboards and web applications.",
                    IconClass = "fab fa-react",
                    IconColor = "#61dafb"
                },
                new SkillItem
                {
                    SkillName = "Node.js",
                    ProficiencyLevel = "Intermediate",
                    Description = "Server-side JavaScript for building APIs and real-time data processing applications.",
                    IconClass = "fab fa-node-js",
                    IconColor = "#339933"
                }
            };

            rptFrameworks.DataSource = frameworks;
            rptFrameworks.DataBind();
        }

        /// <summary>
        /// Load tools and software data - data science tools
        /// </summary>
        private void LoadTools()
        {
            var tools = new List<SkillItem>
            {
                new SkillItem
                {
                    SkillName = "Jupyter Notebook",
                    Description = "Interactive data analysis and machine learning experimentation",
                    IconClass = "fas fa-book",
                    IconColor = "#f37626"
                },
                new SkillItem
                {
                    SkillName = "Kaggle",
                    Description = "Data science competitions and collaborative machine learning",
                    IconClass = "fab fa-kaggle",
                    IconColor = "#20beff"
                },
                new SkillItem
                {
                    SkillName = "Git & GitHub",
                    Description = "Version control for data science projects and collaboration",
                    IconClass = "fab fa-github",
                    IconColor = "#333"
                },
                new SkillItem
                {
                    SkillName = "Docker",
                    Description = "Containerization for machine learning model deployment",
                    IconClass = "fab fa-docker",
                    IconColor = "#2496ed"
                },
                new SkillItem
                {
                    SkillName = "AWS",
                    Description = "Cloud computing for scalable ML model deployment",
                    IconClass = "fab fa-aws",
                    IconColor = "#ff9900"
                },
                new SkillItem
                {
                    SkillName = "Streamlit",
                    Description = "Rapid prototyping of data apps and ML model interfaces",
                    IconClass = "fas fa-rocket",
                    IconColor = "#ff4b4b"
                },
                new SkillItem
                {
                    SkillName = "Arduino & IoT",
                    Description = "Hardware integration and IoT data collection systems",
                    IconClass = "fas fa-microchip",
                    IconColor = "#00979d"
                },
                new SkillItem
                {
                    SkillName = "Matplotlib & Plotly",
                    Description = "Data visualization and interactive dashboard creation",
                    IconClass = "fas fa-chart-line",
                    IconColor = "#11557c"
                }
            };

            rptTools.DataSource = tools;
            rptTools.DataBind();
        }

        /// <summary>
        /// Helper method to convert proficiency level to text
        /// </summary>
        protected string GetProficiencyText(object proficiencyLevel)
        {
            if (proficiencyLevel == null) return "Beginner";
            
            string level = proficiencyLevel.ToString();
            
            // If it's a numeric value, convert to text
            if (int.TryParse(level, out int numericLevel))
            {
                if (numericLevel >= 90) return "Expert";
                if (numericLevel >= 80) return "Advanced";
                if (numericLevel >= 65) return "Intermediate";
                return "Beginner";
            }
            
            return level; // Return as-is if it's already text
        }

        /// <summary>
        /// Helper method to get proficiency level for styling
        /// </summary>
        protected string GetProficiencyLevel(object proficiencyLevel)
        {
            string text = GetProficiencyText(proficiencyLevel);
            return text.ToLower();
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