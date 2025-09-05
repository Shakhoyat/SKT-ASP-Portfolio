using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// About page showcasing professional background, skills, and personal story
    /// </summary>
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSkillsData();
            }
        }

        /// <summary>
        /// Loads skills data for display on the about page
        /// This will be replaced with database data in future steps
        /// </summary>
        private void LoadSkillsData()
        {
            LoadBackendSkills();
            LoadFrontendSkills();
            LoadToolsSkills();
        }

        /// <summary>
        /// Loads backend development skills
        /// </summary>
        private void LoadBackendSkills()
        {
            var backendSkills = new List<object>
            {
                new { Name = "C#", Level = 90 },
                new { Name = "ASP.NET Web Forms", Level = 85 },
                new { Name = "ASP.NET MVC", Level = 75 },
                new { Name = ".NET Framework", Level = 88 },
                new { Name = "Web API", Level = 80 },
                new { Name = "Entity Framework", Level = 70 }
            };

            BackendSkillsRepeater.DataSource = backendSkills;
            BackendSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads frontend development skills
        /// </summary>
        private void LoadFrontendSkills()
        {
            var frontendSkills = new List<object>
            {
                new { Name = "HTML5", Level = 95 },
                new { Name = "CSS3", Level = 90 },
                new { Name = "JavaScript", Level = 85 },
                new { Name = "Bootstrap", Level = 88 },
                new { Name = "jQuery", Level = 80 },
                new { Name = "Responsive Design", Level = 92 }
            };

            FrontendSkillsRepeater.DataSource = frontendSkills;
            FrontendSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads tools and database skills
        /// </summary>
        private void LoadToolsSkills()
        {
            var toolsSkills = new List<object>
            {
                new { Name = "SQL Server", Level = 85 },
                new { Name = "T-SQL", Level = 82 },
                new { Name = "Visual Studio", Level = 90 },
                new { Name = "Git & GitHub", Level = 80 },
                new { Name = "Azure DevOps", Level = 70 },
                new { Name = "IIS", Level = 75 }
            };

            ToolsSkillsRepeater.DataSource = toolsSkills;
            ToolsSkillsRepeater.DataBind();
        }
    }
}