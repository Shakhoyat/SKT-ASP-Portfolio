using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class AdminProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if admin is logged in
            if (!AdminLogin.IsAdminLoggedIn())
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProjects();
            }
            else
            {
                // Log postback events for debugging
                System.Diagnostics.Debug.WriteLine($"AdminProjects postback occurred. EventTarget: {Request.Form["__EVENTTARGET"]}");
            }
        }

        /// <summary>
        /// Load projects data
        /// </summary>
        private void LoadProjects()
        {
            try
            {
                List<Project> projects = new List<Project>();

                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    // Load all projects (including inactive ones for admin management)
                    string query = @"
                        SELECT ProjectId, Title, Description, ShortDescription, TechnologiesUsed, 
                               ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, 
                               DisplayOrder, CreatedDate, UpdatedDate
                        FROM Projects 
                        ORDER BY DisplayOrder, CreatedDate DESC";
                    
                    DataTable dt = DatabaseHelper.ExecuteQuery(query);
                    
                    foreach (DataRow row in dt.Rows)
                    {
                        projects.Add(new Project
                        {
                            ProjectId = Convert.ToInt32(row["ProjectId"]),
                            Title = row["Title"].ToString(),
                            Description = row["Description"].ToString(),
                            ShortDescription = row["ShortDescription"].ToString(),
                            TechnologiesUsed = row["TechnologiesUsed"].ToString(),
                            ProjectUrl = row["ProjectUrl"] == DBNull.Value ? null : row["ProjectUrl"].ToString(),
                            GitHubUrl = row["GitHubUrl"] == DBNull.Value ? null : row["GitHubUrl"].ToString(),
                            ImageUrl = row["ImageUrl"] == DBNull.Value ? null : row["ImageUrl"].ToString(),
                            StartDate = Convert.ToDateTime(row["StartDate"]),
                            EndDate = row["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["EndDate"]),
                            IsActive = Convert.ToBoolean(row["IsActive"]),
                            DisplayOrder = Convert.ToInt32(row["DisplayOrder"]),
                            CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                            UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                        });
                    }
                    
                    System.Diagnostics.Debug.WriteLine($"Admin: Loaded {projects.Count} projects from database (including inactive).");
                }
                else
                {
                    // Load sample data only if database is not available
                    projects = GetSampleProjects();
                    System.Diagnostics.Debug.WriteLine($"Admin: Database not available, loaded {projects.Count} sample projects.");
                }

                gvProjects.DataSource = projects;
                gvProjects.DataBind();

                // Log the admin action
                LogAdminActivity($"Viewed projects list ({projects.Count} projects)");

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading projects: {ex.Message}");
                ShowError($"Error loading projects: {ex.Message}");
            }
        }

        /// <summary>
        /// Get sample projects for demonstration
        /// </summary>
        private List<Project> GetSampleProjects()
        {
            return new List<Project>
            {
                new Project
                {
                    ProjectId = 1,
                    Title = "E-Commerce Platform",
                    Description = "A comprehensive e-commerce solution built with ASP.NET Web Forms featuring user authentication, product catalog, shopping cart functionality, and payment integration.",
                    ShortDescription = "Full-featured e-commerce solution with shopping cart and payment integration",
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
                    Description = "A collaborative task management application designed for teams to organize, track, and manage projects efficiently.",
                    ShortDescription = "Team collaboration tool for project and task management",
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
                    Description = "A personal finance management application that helps users track income, expenses, budgets, and financial goals.",
                    ShortDescription = "Personal finance management tool with budgeting features",
                    TechnologiesUsed = "ASP.NET Web Forms, C#, SQL Server, Chart.js, Pure CSS",
                    ProjectUrl = null,
                    GitHubUrl = "https://github.com/Shakhoyat/finance-tracker",
                    ImageUrl = "/Content/images/projects/finance.jpg",
                    StartDate = new DateTime(2023, 9, 1),
                    EndDate = null,
                    IsActive = false,
                    DisplayOrder = 3,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };
        }

        /// <summary>
        /// Handle grid view row command
        /// </summary>
        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int projectId = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "EditProject":
                        EditProject(projectId);
                        break;
                    case "ToggleStatus":
                        ToggleProjectStatus(projectId);
                        break;
                    case "DeleteProject":
                        DeleteProject(projectId);
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in row command: {ex.Message}");
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle grid view row data bound
        /// </summary>
        protected void gvProjects_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Additional row customization if needed
            }
        }

        /// <summary>
        /// Edit project (placeholder - would redirect to edit form)
        /// </summary>
        private void EditProject(int projectId)
        {
            // Redirect to the actual edit form
            Response.Redirect($"AdminProjectForm.aspx?id={projectId}");
        }

        /// <summary>
        /// Toggle project active status
        /// </summary>
        private void ToggleProjectStatus(int projectId)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    // Update in database
                    string query = "UPDATE Projects SET IsActive = ~IsActive, UpdatedDate = GETDATE() WHERE ProjectId = @ProjectId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@ProjectId", projectId)
                    };

                    int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                    if (rowsAffected > 0)
                    {
                        ShowSuccess("Project status updated successfully.");
                        LogAdminActivity($"Toggled status for project ID: {projectId}");
                        LoadProjects(); // Refresh grid
                    }
                    else
                    {
                        ShowError("Project not found or could not be updated.");
                    }
                }
                else
                {
                    ShowError("Database not available. Cannot update project status.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error toggling project status: {ex.Message}");
                ShowError($"Error updating project status: {ex.Message}");
            }
        }

        /// <summary>
        /// Delete project
        /// </summary>
        private void DeleteProject(int projectId)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    // Delete from database
                    string query = "DELETE FROM Projects WHERE ProjectId = @ProjectId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@ProjectId", projectId)
                    };

                    int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                    if (rowsAffected > 0)
                    {
                        ShowSuccess("Project deleted successfully.");
                        LogAdminActivity($"Deleted project ID: {projectId}");
                        LoadProjects(); // Refresh grid
                    }
                    else
                    {
                        ShowError("Project not found or could not be deleted.");
                    }
                }
                else
                {
                    ShowError("Database not available. Cannot delete project.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting project: {ex.Message}");
                ShowError($"Error deleting project: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle add project button click
        /// </summary>
        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            try
            {
                // Log the button click for debugging
                System.Diagnostics.Debug.WriteLine("Add Project button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Project button");
                
                // Redirect to the add form
                System.Diagnostics.Debug.WriteLine("Redirecting to AdminProjectForm.aspx");
                Response.Redirect("AdminProjectForm.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in btnAddProject_Click: {ex.Message}");
                ShowError($"Error navigating to add project form: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle refresh button click
        /// </summary>
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadProjects();
            ShowSuccess("Projects list refreshed successfully.");
        }

        /// <summary>
        /// Get project image URL with fallback
        /// </summary>
        protected string GetProjectImageUrl(object imageUrl)
        {
            string url = imageUrl?.ToString();
            if (string.IsNullOrEmpty(url))
            {
                return "/Content/images/placeholder-project.jpg";
            }
            return url;
        }

        /// <summary>
        /// Show success message
        /// </summary>
        private void ShowSuccess(string message)
        {
            ltlSuccessMessage.Text = message;
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
            pnlMessages.Visible = true;
        }

        /// <summary>
        /// Show error message
        /// </summary>
        private void ShowError(string message)
        {
            ltlErrorMessage.Text = message;
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
            pnlMessages.Visible = true;
        }

        /// <summary>
        /// Log admin activity
        /// </summary>
        private void LogAdminActivity(string activity)
        {
            try
            {
                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] {activity} by {AdminLogin.GetAdminUsername()}";
                System.Diagnostics.Debug.WriteLine(logEntry);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error logging admin activity: {ex.Message}");
            }
        }
    }
}