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
        /// Load projects data from database with fallback to sample data
        /// </summary>
        private void LoadProjectsData()
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Starting to load projects data...");
                
                // Step 1: Test database connection
                if (!DatabaseHelper.TestConnection())
                {
                    System.Diagnostics.Debug.WriteLine("Database connection failed. Loading sample data.");
                    LoadSampleProjectsData();
                    ShowMessage("Database connection unavailable. Displaying sample projects.", "warning");
                    return;
                }

                // Step 2: Check if database is properly initialized
                if (!DatabaseHelper.IsDatabaseInitialized())
                {
                    System.Diagnostics.Debug.WriteLine("Database not initialized. Loading sample data.");
                    LoadSampleProjectsData();
                    ShowMessage("Database tables not found. Please run the database schema script. Displaying sample projects.", "warning");
                    return;
                }

                // Step 3: Try to load projects from database
                List<Project> projects = ProjectsDAL.GetAllProjects();
                
                if (projects.Count == 0)
                {
                    System.Diagnostics.Debug.WriteLine("No projects found in database. Trying to initialize sample data...");
                    
                    // Try to initialize sample data
                    if (DatabaseHelper.InitializeSampleData())
                    {
                        // Reload projects after sample data insertion
                        projects = ProjectsDAL.GetAllProjects();
                        if (projects.Count > 0)
                        {
                            System.Diagnostics.Debug.WriteLine($"Sample data initialized successfully. Loaded {projects.Count} projects.");
                            BindProjectsData(projects);
                            ShowMessage("Welcome! Sample projects have been loaded into your database.", "success");
                            return;
                        }
                    }
                    
                    // If sample data initialization failed, fall back to hardcoded sample data
                    System.Diagnostics.Debug.WriteLine("Sample data initialization failed. Loading hardcoded sample data.");
                    LoadSampleProjectsData();
                    ShowMessage("Unable to initialize database. Displaying hardcoded sample projects.", "warning");
                    return;
                }

                // Step 4: Successfully loaded projects from database
                System.Diagnostics.Debug.WriteLine($"Successfully loaded {projects.Count} projects from database.");
                BindProjectsData(projects);
                ShowMessage($"Successfully loaded {projects.Count} projects from database.", "success");
            }
            catch (Exception ex)
            {
                // Log error and load sample data as fallback
                System.Diagnostics.Debug.WriteLine($"Error loading projects from database: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
                
                LoadSampleProjectsData();
                ShowMessage($"Error accessing database: {ex.Message}. Displaying sample projects.", "error");
            }
        }

        /// <summary>
        /// Load sample projects data (fallback when database is not available)
        /// </summary>
        private void LoadSampleProjectsData()
        {
            System.Diagnostics.Debug.WriteLine("Loading hardcoded sample projects data...");
            
            List<Project> sampleProjects = new List<Project>
            {
                new Project
                {
                    ProjectId = 1,
                    Title = "E-Commerce Platform",
                    Description = "A comprehensive e-commerce solution built with ASP.NET Web Forms featuring user authentication, product catalog, shopping cart functionality, and payment integration. The application includes an admin panel for managing products, orders, and customer data. Implemented with responsive design and modern UI components.",
                    ShortDescription = "Full-featured e-commerce solution with shopping cart, payment integration, and admin panel",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, HTML5, CSS3, JavaScript, PayPal API",
                    ProjectUrl = "https://demo-ecommerce.example.com",
                    GitHubUrl = "https://github.com/Shakhoyat/ecommerce-platform",
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
                    Description = "A collaborative task management application designed for teams to organize, track, and manage projects efficiently. Features include task assignment, progress tracking, deadline management, file attachments, and real-time notifications. Built with a focus on user experience and productivity.",
                    ShortDescription = "Team collaboration tool for project and task management with real-time updates",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, AJAX, jQuery, SignalR",
                    ProjectUrl = "https://taskmanager.example.com",
                    GitHubUrl = "https://github.com/Shakhoyat/task-manager",
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
                    Description = "A personal finance management application that helps users track income, expenses, budgets, and financial goals. Includes data visualization with charts and graphs, category-based expense tracking, and financial reporting. Designed with security and privacy as top priorities.",
                    ShortDescription = "Personal finance management tool with budgeting and expense tracking",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, Chart.js, Pure CSS",
                    ProjectUrl = null,
                    GitHubUrl = "https://github.com/Shakhoyat/finance-tracker",
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
                    Title = "Portfolio Website",
                    Description = "A professional portfolio website built with ASP.NET Web Forms showcasing technical skills, projects, and achievements. Features responsive design, database integration, and admin panel for content management. This very website you're viewing!",
                    ShortDescription = "Professional portfolio website with database integration and admin panel",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, Pure CSS, JavaScript",
                    ProjectUrl = null,
                    GitHubUrl = "https://github.com/Shakhoyat/SKT-ASP-Portfolio",
                    ImageUrl = "/Content/images/projects/portfolio.jpg",
                    StartDate = new DateTime(2024, 1, 1),
                    EndDate = null, // Ongoing project
                    IsActive = true,
                    DisplayOrder = 4,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };

            BindProjectsData(sampleProjects);
            System.Diagnostics.Debug.WriteLine($"Loaded {sampleProjects.Count} hardcoded sample projects.");
        }

        /// <summary>
        /// Bind projects data to the repeater and set statistics
        /// </summary>
        /// <param name="projects">List of projects to bind</param>
        private void BindProjectsData(List<Project> projects)
        {
            try
            {
                rptProjects.DataSource = projects;
                rptProjects.DataBind();

                // Set total projects count
                ltlTotalProjects.Text = projects.Count.ToString();
                
                System.Diagnostics.Debug.WriteLine($"Successfully bound {projects.Count} projects to repeater.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error binding projects data: {ex.Message}");
                throw;
            }
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
                try
                {
                    // Find the nested technologies repeater
                    Repeater rptTechnologies = (Repeater)e.Item.FindControl("rptTechnologies");
                    
                    if (rptTechnologies != null)
                    {
                        // Get the current project
                        Project project = (Project)e.Item.DataItem;
                        
                        if (project != null && project.TechnologiesList != null)
                        {
                            // Bind the technologies list
                            rptTechnologies.DataSource = project.TechnologiesList;
                            rptTechnologies.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error in rptProjects_ItemDataBound: {ex.Message}");
                }
            }
        }

        /// <summary>
        /// Show a message to the user (for debugging purposes)
        /// In a real application, this would show a user-friendly notification
        /// </summary>
        /// <param name="message">Message to show</param>
        /// <param name="type">Type of message (success, warning, error)</param>
        private void ShowMessage(string message, string type)
        {
            // For now, just log to debug output
            // In a real application, you might show this in a panel or use JavaScript alerts
            System.Diagnostics.Debug.WriteLine($"[{type.ToUpper()}] {message}");
            
            // You can uncomment this line to see messages in the browser console
            // ClientScript.RegisterStartupScript(this.GetType(), "showMessage", $"console.log('[{type.ToUpper()}] {message}');", true);
        }
    }
}