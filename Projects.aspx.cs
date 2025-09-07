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
        /// Load projects data with priority on database content
        /// Note: This method now primarily logs information and prepares for future dynamic content
        /// </summary>
        private void LoadProjectsData()
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Loading projects data...");
                
                List<Project> projects = new List<Project>();
                bool usingDatabase = false;

                // Step 1: Test database connection first
                if (DatabaseHelper.TestConnection())
                {
                    System.Diagnostics.Debug.WriteLine("Database connection successful.");
                    
                    // Step 2: Check if Projects table exists
                    if (DatabaseHelper.TableExists("Projects"))
                    {
                        System.Diagnostics.Debug.WriteLine("Projects table found.");
                        
                        try
                        {
                            // Step 3: Load projects from database
                            projects = ProjectsDAL.GetAllProjects();
                            usingDatabase = true;
                            
                            System.Diagnostics.Debug.WriteLine($"Successfully loaded {projects.Count} projects from database.");
                            
                            if (projects.Count == 0)
                            {
                                System.Diagnostics.Debug.WriteLine("No projects found in database. This could mean:");
                                System.Diagnostics.Debug.WriteLine("1. No projects have been added yet");
                                System.Diagnostics.Debug.WriteLine("2. All projects are marked as inactive");
                                System.Diagnostics.Debug.WriteLine("3. Database needs to be initialized with sample data");
                            }
                        }
                        catch (Exception dbEx)
                        {
                            System.Diagnostics.Debug.WriteLine($"Error querying Projects table: {dbEx.Message}");
                            throw;
                        }
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Projects table not found. Database needs to be initialized.");
                    }
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Database connection failed. Using static content.");
                }

                // Step 4: Set page information based on data source
                SetPageInformation(projects, usingDatabase);
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in LoadProjectsData: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
                
                // Set fallback information
                SetPageInformation(new List<Project>(), false);
            }
        }

        /// <summary>
        /// Set page information and title based on data source
        /// </summary>
        /// <param name="projects">List of projects from database</param>
        /// <param name="usingDatabase">Whether data is from database</param>
        private void SetPageInformation(List<Project> projects, bool usingDatabase)
        {
            try
            {
                // Update page title to indicate data source
                if (usingDatabase && projects.Count > 0)
                {
                    Page.Title = "Projects (Live Data)";
                    System.Diagnostics.Debug.WriteLine($"Page configured with {projects.Count} database projects.");
                }
                else if (usingDatabase && projects.Count == 0)
                {
                    Page.Title = "Projects (Database Ready)";
                    System.Diagnostics.Debug.WriteLine("Page configured with database connection but no projects.");
                }
                else
                {
                    Page.Title = "Projects (Demo Data)";
                    System.Diagnostics.Debug.WriteLine("Page configured with static demonstration content.");
                }
                
                // Future enhancement: You can add code here to dynamically update the static content
                // based on database projects when available
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error setting page information: {ex.Message}");
            }
        }

        /// <summary>
        /// Get sample projects data for future use or comparison
        /// This method is retained for potential future dynamic content generation
        /// </summary>
        private List<Project> GetSampleProjectsData()
        {
            return new List<Project>
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
                }
            };
        }
    }
}