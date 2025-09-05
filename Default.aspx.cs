using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Home page for the SKT Portfolio website
    /// Displays overview of skills, featured projects, and contact information
    /// </summary>
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeaturedProjects();
            }
        }

        /// <summary>
        /// Loads featured projects to display on the home page
        /// This will be replaced with database data in future steps
        /// </summary>
        private void LoadFeaturedProjects()
        {
            // For now, create sample data - this will be replaced with database calls
            var featuredProjects = new List<object>
            {
                new {
                    Title = "E-Commerce Platform",
                    Description = "A full-featured e-commerce solution built with ASP.NET Web Forms and SQL Server.",
                    ImageUrl = "Images/project1-placeholder.jpg",
                    Technologies = "<span class='project-tag'>ASP.NET</span><span class='project-tag'>SQL Server</span><span class='project-tag'>Bootstrap</span>",
                    DemoUrl = "#",
                    SourceUrl = "#"
                },
                new {
                    Title = "Task Management System",
                    Description = "A collaborative task management application with real-time updates and team collaboration features.",
                    ImageUrl = "Images/project2-placeholder.jpg",
                    Technologies = "<span class='project-tag'>C#</span><span class='project-tag'>Web Forms</span><span class='project-tag'>JavaScript</span>",
                    DemoUrl = "#",
                    SourceUrl = "#"
                },
                new {
                    Title = "Inventory Management",
                    Description = "A comprehensive inventory tracking system for small to medium businesses.",
                    ImageUrl = "Images/project3-placeholder.jpg",
                    Technologies = "<span class='project-tag'>.NET Framework</span><span class='project-tag'>Entity Framework</span><span class='project-tag'>CSS3</span>",
                    DemoUrl = "#",
                    SourceUrl = "#"
                }
            };

            FeaturedProjectsRepeater.DataSource = featuredProjects;
            FeaturedProjectsRepeater.DataBind();
        }
    }
}