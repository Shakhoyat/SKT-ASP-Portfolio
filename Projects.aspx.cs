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
                                
                                // Show a message to admin about empty database
                                projects = GetEmptyStateProjects();
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
                        projects = GetDatabaseNotInitializedProjects();
                    }
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Database connection failed. Using fallback sample data.");
                    projects = LoadSampleProjectsData();
                }

                // Step 4: Bind projects to UI
                BindProjectsData(projects, usingDatabase);
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in LoadProjectsData: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
                
                // Fallback to sample data
                var fallbackProjects = LoadSampleProjectsData();
                BindProjectsData(fallbackProjects, false);
            }
        }

        /// <summary>
        /// Create empty state projects message
        /// </summary>
        private List<Project> GetEmptyStateProjects()
        {
            return new List<Project>
            {
                new Project
                {
                    ProjectId = 0,
                    Title = "No Projects Found",
                    Description = "Your portfolio database is connected but no projects have been added yet. Use the Admin Panel to add your first project.",
                    ShortDescription = "Database is ready - add your first project through the Admin Panel",
                    TechnologiesUsed = "Admin Panel Ready",
                    ProjectUrl = "AdminLogin.aspx",
                    GitHubUrl = null,
                    ImageUrl = null,
                    StartDate = DateTime.Now,
                    EndDate = null,
                    IsActive = true,
                    DisplayOrder = 1,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };
        }

        /// <summary>
        /// Create database not initialized projects message
        /// </summary>
        private List<Project> GetDatabaseNotInitializedProjects()
        {
            return new List<Project>
            {
                new Project
                {
                    ProjectId = 0,
                    Title = "Database Not Initialized",
                    Description = "Your database connection is working, but the Projects table hasn't been created yet. Please run the Database Setup to initialize your portfolio database.",
                    ShortDescription = "Run Database Setup to initialize your portfolio database",
                    TechnologiesUsed = "Database Setup Required",
                    ProjectUrl = "DatabaseSetup.aspx",
                    GitHubUrl = null,
                    ImageUrl = null,
                    StartDate = DateTime.Now,
                    EndDate = null,
                    IsActive = true,
                    DisplayOrder = 1,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };
        }

        /// <summary>
        /// Load sample projects data (only used when database is completely unavailable)
        /// </summary>
        private List<Project> LoadSampleProjectsData()
        {
            System.Diagnostics.Debug.WriteLine("Loading demonstration sample projects...");
            
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
                    Title = "DEMO: Portfolio Website",
                    Description = "This is demonstration data. Connect your database and use the Admin Panel to replace this with your real projects. This portfolio website itself is built with ASP.NET Web Forms showcasing technical skills, projects, and achievements.",
                    ShortDescription = "DEMO DATA - Use Admin Panel to add your real projects",
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

            return sampleProjects;
        }

        /// <summary>
        /// Bind projects data to the repeater and set statistics
        /// </summary>
        /// <param name="projects">List of projects to bind</param>
        /// <param name="usingDatabase">Whether data is from database</param>
        private void BindProjectsData(List<Project> projects, bool usingDatabase)
        {
            try
            {
                rptProjects.DataSource = projects;
                rptProjects.DataBind();

                // Set total projects count
                ltlTotalProjects.Text = projects.Count.ToString();
                
                string dataSource = usingDatabase ? "database" : "demonstration";
                System.Diagnostics.Debug.WriteLine($"Successfully bound {projects.Count} projects from {dataSource} to repeater.");
                
                // Add data source indicator to page (for debugging)
                if (!usingDatabase && projects.Count > 0 && projects[0].ProjectId != 0)
                {
                    Page.Title += " (Demo Data)";
                }
                else if (usingDatabase)
                {
                    Page.Title += " (Live Data)";
                }
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error binding projects data: {ex.Message}");
                throw;
            }
        }

        /// <summary>
        /// Handle project item data binding to bind nested technologies repeater and generate URLs safely
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                try
                {
                    // Get the current project
                    Project project = (Project)e.Item.DataItem;
                    
                    if (project != null)
                    {
                        // Find and bind the nested technologies repeater
                        Repeater rptTechnologies = (Repeater)e.Item.FindControl("rptTechnologies");
                        if (rptTechnologies != null && project.TechnologiesList != null)
                        {
                            rptTechnologies.DataSource = project.TechnologiesList;
                            rptTechnologies.DataBind();
                        }

                        // Handle Project URL safely
                        Literal ltlProjectUrl = (Literal)e.Item.FindControl("ltlProjectUrl");
                        if (ltlProjectUrl != null)
                        {
                            if (!string.IsNullOrEmpty(project.ProjectUrl))
                            {
                                ltlProjectUrl.Text = $"<a href='{project.ProjectUrl}' target='_blank' class='btn btn-primary' title='View Live Demo'><i class='fas fa-external-link-alt'></i> Live Demo</a>";
                            }
                            else
                            {
                                ltlProjectUrl.Text = "";
                            }
                        }

                        // Handle GitHub URL safely
                        Literal ltlGitHubUrl = (Literal)e.Item.FindControl("ltlGitHubUrl");
                        if (ltlGitHubUrl != null)
                        {
                            if (!string.IsNullOrEmpty(project.GitHubUrl))
                            {
                                ltlGitHubUrl.Text = $"<a href='{project.GitHubUrl}' target='_blank' class='btn btn-secondary' title='View Source Code'><i class='fab fa-github'></i> Source</a>";
                            }
                            else
                            {
                                ltlGitHubUrl.Text = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error in rptProjects_ItemDataBound: {ex.Message}");
                }
            }
        }
    }
}