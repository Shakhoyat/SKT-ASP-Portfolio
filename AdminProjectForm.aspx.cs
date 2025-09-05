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
    public partial class AdminProjectForm : System.Web.UI.Page
    {
        private int ProjectId
        {
            get
            {
                int id;
                if (int.TryParse(hdnProjectId.Value, out id))
                    return id;
                return 0;
            }
            set
            {
                hdnProjectId.Value = value.ToString();
            }
        }

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
                InitializePage();
            }
        }

        /// <summary>
        /// Initialize page for add or edit mode
        /// </summary>
        private void InitializePage()
        {
            try
            {
                // Check if we're editing an existing project
                string projectIdParam = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(projectIdParam) && int.TryParse(projectIdParam, out int projectId))
                {
                    // Edit mode
                    ProjectId = projectId;
                    LoadProjectForEdit(projectId);
                    
                    ltlPageTitle.Text = "Edit Project";
                    ltlPageDescription.Text = "Update project details and save changes to your portfolio.";
                    btnSave.Text = "Update Project";
                    btnSaveAndAdd.Visible = false;
                }
                else
                {
                    // Add mode
                    ProjectId = 0;
                    SetDefaultValues();
                    
                    ltlPageTitle.Text = "Add New Project";
                    ltlPageDescription.Text = "Create a new project to showcase in your portfolio.";
                    btnSave.Text = "Save Project";
                    btnSaveAndAdd.Visible = true;
                }

                LogAdminActivity($"Opened project form in {(ProjectId > 0 ? "edit" : "add")} mode");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error initializing project form: {ex.Message}");
                ShowError($"Error loading page: {ex.Message}");
            }
        }

        /// <summary>
        /// Load project data for editing
        /// </summary>
        private void LoadProjectForEdit(int projectId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Projects"))
                {
                    ShowError("Database not available. Cannot edit projects.");
                    return;
                }

                Project project = ProjectsDAL.GetProjectById(projectId);
                if (project == null)
                {
                    // Try getting project including inactive ones for admin
                    string query = "SELECT * FROM Projects WHERE ProjectId = @ProjectId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@ProjectId", projectId)
                    };

                    var dt = DatabaseHelper.ExecuteQuery(query, parameters);
                    if (dt.Rows.Count > 0)
                    {
                        var row = dt.Rows[0];
                        project = new Project
                        {
                            ProjectId = Convert.ToInt32(row["ProjectId"]),
                            Title = row["Title"].ToString(),
                            Description = row["Description"].ToString(),
                            ShortDescription = row["ShortDescription"].ToString(),
                            TechnologiesUsed = row["TechnologiesUsed"].ToString(),
                            ProjectUrl = row["ProjectUrl"] == DBNull.Value ? "" : row["ProjectUrl"].ToString(),
                            GitHubUrl = row["GitHubUrl"] == DBNull.Value ? "" : row["GitHubUrl"].ToString(),
                            ImageUrl = row["ImageUrl"] == DBNull.Value ? "" : row["ImageUrl"].ToString(),
                            StartDate = Convert.ToDateTime(row["StartDate"]),
                            EndDate = row["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["EndDate"]),
                            IsActive = Convert.ToBoolean(row["IsActive"]),
                            DisplayOrder = Convert.ToInt32(row["DisplayOrder"])
                        };
                    }
                }

                if (project != null)
                {
                    txtTitle.Text = project.Title;
                    txtShortDescription.Text = project.ShortDescription;
                    txtDescription.Text = project.Description;
                    txtTechnologies.Text = project.TechnologiesUsed;
                    txtProjectUrl.Text = project.ProjectUrl ?? "";
                    txtGitHubUrl.Text = project.GitHubUrl ?? "";
                    txtImageUrl.Text = project.ImageUrl ?? "";
                    txtStartDate.Text = project.StartDate.ToString("yyyy-MM-dd");
                    txtEndDate.Text = project.EndDate?.ToString("yyyy-MM-dd") ?? "";
                    txtDisplayOrder.Text = project.DisplayOrder.ToString();
                    chkIsActive.Checked = project.IsActive;

                    System.Diagnostics.Debug.WriteLine($"Loaded project '{project.Title}' for editing.");
                }
                else
                {
                    ShowError("Project not found.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading project for edit: {ex.Message}");
                ShowError($"Error loading project: {ex.Message}");
            }
        }

        /// <summary>
        /// Set default values for new project
        /// </summary>
        private void SetDefaultValues()
        {
            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtDisplayOrder.Text = "1";
            chkIsActive.Checked = true;
        }

        /// <summary>
        /// Handle save button click
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (SaveProject())
                {
                    Response.Redirect("AdminProjects.aspx");
                }
            }
        }

        /// <summary>
        /// Handle save and add another button click
        /// </summary>
        protected void btnSaveAndAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (SaveProject())
                {
                    // Clear form for new project
                    ClearForm();
                    ShowSuccess("Project saved successfully. Add another project below.");
                }
            }
        }

        /// <summary>
        /// Save project to database
        /// </summary>
        private bool SaveProject()
        {
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Projects"))
                {
                    ShowError("Database not available. Cannot save project.");
                    return false;
                }

                // Create project object from form data
                Project project = new Project
                {
                    ProjectId = ProjectId,
                    Title = txtTitle.Text.Trim(),
                    ShortDescription = txtShortDescription.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    TechnologiesUsed = txtTechnologies.Text.Trim(),
                    ProjectUrl = string.IsNullOrEmpty(txtProjectUrl.Text.Trim()) ? null : txtProjectUrl.Text.Trim(),
                    GitHubUrl = string.IsNullOrEmpty(txtGitHubUrl.Text.Trim()) ? null : txtGitHubUrl.Text.Trim(),
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? null : txtImageUrl.Text.Trim(),
                    StartDate = DateTime.Parse(txtStartDate.Text),
                    EndDate = string.IsNullOrEmpty(txtEndDate.Text) ? (DateTime?)null : DateTime.Parse(txtEndDate.Text),
                    IsActive = chkIsActive.Checked,
                    DisplayOrder = string.IsNullOrEmpty(txtDisplayOrder.Text) ? 1 : int.Parse(txtDisplayOrder.Text)
                };

                bool success = false;
                string action = "";

                if (ProjectId == 0)
                {
                    // Insert new project
                    int newId = ProjectsDAL.InsertProject(project);
                    success = newId > 0;
                    if (success)
                    {
                        ProjectId = newId;
                        action = "added";
                    }
                }
                else
                {
                    // Update existing project
                    success = ProjectsDAL.UpdateProject(project);
                    action = "updated";
                }

                if (success)
                {
                    LogAdminActivity($"Successfully {action} project: {project.Title}");
                    ShowSuccess($"Project '{project.Title}' has been {action} successfully!");
                    
                    // Important: Changes are now immediately available in the database
                    // The portfolio pages will show the updated data on next load
                    System.Diagnostics.Debug.WriteLine($"Project {action} successfully. Changes will be visible on portfolio pages immediately.");
                    
                    return true;
                }
                else
                {
                    ShowError($"Failed to {(ProjectId == 0 ? "add" : "update")} project. Please try again.");
                    return false;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving project: {ex.Message}");
                ShowError($"Error saving project: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear form for new project
        /// </summary>
        private void ClearForm()
        {
            txtTitle.Text = "";
            txtShortDescription.Text = "";
            txtDescription.Text = "";
            txtTechnologies.Text = "";
            txtProjectUrl.Text = "";
            txtGitHubUrl.Text = "";
            txtImageUrl.Text = "";
            txtEndDate.Text = "";
            SetDefaultValues();
            ProjectId = 0;
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