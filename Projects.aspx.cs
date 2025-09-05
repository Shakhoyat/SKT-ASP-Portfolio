using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjectsData();
            }
        }

        /// <summary>
        /// Load projects data from database
        /// </summary>
        private void LoadProjectsData()
        {
            try
            {
                // Test database connection first
                if (!DatabaseHelper.TestConnection())
                {
                    // If database is not available, load sample data
                    LoadSampleProjectsData();
                    return;
                }

                // Load projects from database
                List<Project> projects = ProjectsDAL.GetAllProjects();
                
                if (projects.Count == 0)
                {
                    // If no projects in database, load sample data
                    LoadSampleProjectsData();
                    return;
                }

                BindProjectsData(projects);
            }
            catch (Exception ex)
            {
                // Log error and load sample data as fallback
                System.Diagnostics.Debug.WriteLine("Error loading projects from database: " + ex.Message);
                LoadSampleProjectsData();
            }
        }

        /// <summary>
        /// Load sample projects data (fallback when database is not available)
        /// </summary>
        private void LoadSampleProjectsData()
        {
            List<Project> sampleProjects = new List<Project>
            {
                new Project
                {
                    ProjectId = 1,
                    Title = "E-Commerce Platform",
                    Description = "A comprehensive e-commerce solution built with ASP.NET Web Forms featuring user authentication, product catalog, shopping cart functionality, and payment integration. The application includes an admin panel for managing products, orders, and customer data.",
                    ShortDescription = "Full-featured e-commerce solution with shopping cart, payment integration, and admin panel",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, HTML5, CSS3, JavaScript, PayPal API",
                    ProjectUrl = "https://demo-ecommerce.example.com",
                    GitHubUrl = "https://github.com/username/ecommerce-platform",
                    ImageUrl = "/Content/images/projects/ecommerce.jpg",
                    StartDate = new DateTime(2023, 1, 15),
                    EndDate = new DateTime(2023, 4, 30),
                    IsActive = true,
                    DisplayOrder = 1,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new Project
                {
                    ProjectId = 2,
                    Title = "Task Management System",
                    Description = "A collaborative task management application designed for teams to organize, track, and manage projects efficiently. Features include task assignment, progress tracking, deadline management, file attachments, and real-time notifications.",
                    ShortDescription = "Team collaboration tool for project and task management with real-time updates",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, AJAX, jQuery, SignalR",
                    ProjectUrl = "https://taskmanager.example.com",
                    GitHubUrl = "https://github.com/username/task-manager",
                    ImageUrl = "/Content/images/projects/taskmanager.jpg",
                    StartDate = new DateTime(2023, 5, 1),
                    EndDate = new DateTime(2023, 8, 15),
                    IsActive = true,
                    DisplayOrder = 2,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new Project
                {
                    ProjectId = 3,
                    Title = "Personal Finance Tracker",
                    Description = "A personal finance management application that helps users track income, expenses, budgets, and financial goals. Includes data visualization with charts and graphs, category-based expense tracking, and financial reporting.",
                    ShortDescription = "Personal finance management tool with budgeting and expense tracking",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, Chart.js, Bootstrap",
                    ProjectUrl = null,
                    GitHubUrl = "https://github.com/username/finance-tracker",
                    ImageUrl = "/Content/images/projects/finance.jpg",
                    StartDate = new DateTime(2023, 9, 1),
                    EndDate = null, // Ongoing project
                    IsActive = true,
                    DisplayOrder = 3,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new Project
                {
                    ProjectId = 4,
                    Title = "Customer Support Portal",
                    Description = "A customer support ticketing system that streamlines customer service operations. Features include ticket creation, assignment, status tracking, knowledge base integration, and automated email notifications.",
                    ShortDescription = "Customer support ticketing system with knowledge base and automation",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, SMTP Integration, HTML/CSS",
                    ProjectUrl = "https://support.example.com",
                    GitHubUrl = "https://github.com/username/support-portal",
                    ImageUrl = "/Content/images/projects/support.jpg",
                    StartDate = new DateTime(2022, 10, 1),
                    EndDate = new DateTime(2022, 12, 31),
                    IsActive = true,
                    DisplayOrder = 4,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };

            BindProjectsData(sampleProjects);
        }

        /// <summary>
        /// Bind projects data to the repeater and set statistics
        /// </summary>
        /// <param name="projects">List of projects to bind</param>
        private void BindProjectsData(List<Project> projects)
        {
            rptProjects.DataSource = projects;
            rptProjects.DataBind();

            // Set total projects count
            ltlTotalProjects.Text = projects.Count.ToString();
        }

        /// <summary>
        /// Handle project item data binding to bind nested technologies repeater
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the nested technologies repeater
                Repeater rptTechnologies = (Repeater)e.Item.FindControl("rptTechnologies");
                
                if (rptTechnologies != null)
                {
                    // Get the current project
                    Project project = (Project)e.Item.DataItem;
                    
                    // Bind the technologies list
                    rptTechnologies.DataSource = project.TechnologiesList;
                    rptTechnologies.DataBind();
                }
            }
        }
    }
}