using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminAchievements : System.Web.UI.Page
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
                LoadAchievements();
            }
            else
            {
                // Log postback events for debugging
                System.Diagnostics.Debug.WriteLine($"AdminAchievements postback occurred. EventTarget: {Request.Form["__EVENTTARGET"]}");
            }
        }

        /// <summary>
        /// Load achievements data
        /// </summary>
        private void LoadAchievements()
        {
            try
            {
                List<Achievement> achievements = GetSampleAchievements();
                System.Diagnostics.Debug.WriteLine($"Admin: Loaded {achievements.Count} achievements.");

                gvAchievements.DataSource = achievements;
                gvAchievements.DataBind();

                // Log the admin action
                LogAdminActivity($"Viewed achievements list ({achievements.Count} achievements)");

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievements: {ex.Message}");
                ShowError($"Error loading achievements: {ex.Message}");
            }
        }

        /// <summary>
        /// Get sample achievements for demonstration
        /// </summary>
        private List<Achievement> GetSampleAchievements()
        {
            return new List<Achievement>
            {
                new Achievement
                {
                    AchievementId = 1,
                    Title = "Project Excellence Award",
                    Type = "Award",
                    Description = "Outstanding performance in web development project delivery with innovative solutions",
                    Organization = "Tech Solutions Inc.",
                    AchievementDate = new DateTime(2024, 6, 15),
                    IsActive = true
                },
                new Achievement
                {
                    AchievementId = 2,
                    Title = "Microsoft Azure Fundamentals",
                    Type = "Certification",
                    Description = "Successfully completed Microsoft Azure Fundamentals certification (AZ-900)",
                    Organization = "Microsoft",
                    AchievementDate = new DateTime(2023, 11, 20),
                    IsActive = true
                },
                new Achievement
                {
                    AchievementId = 3,
                    Title = "Best Code Quality",
                    Type = "Recognition",
                    Description = "Recognized for maintaining the highest code quality standards in the development team",
                    Organization = "Dev Team",
                    AchievementDate = new DateTime(2023, 9, 10),
                    IsActive = true
                },
                new Achievement
                {
                    AchievementId = 4,
                    Title = "Open Source Contributor",
                    Type = "Milestone",
                    Description = "Significant contributions to open-source projects with over 100 GitHub commits",
                    Organization = "GitHub Community",
                    AchievementDate = new DateTime(2023, 12, 1),
                    IsActive = true
                },
                new Achievement
                {
                    AchievementId = 5,
                    Title = "Team Leadership Excellence",
                    Type = "Award",
                    Description = "Successfully led a team of 5 developers for major client project completion",
                    Organization = "WebDev Solutions",
                    AchievementDate = new DateTime(2022, 8, 25),
                    IsActive = false
                }
            };
        }

        /// <summary>
        /// Handle grid view row command
        /// </summary>
        protected void gvAchievements_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int achievementId = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "EditAchievement":
                        EditAchievement(achievementId);
                        break;
                    case "ToggleStatus":
                        ToggleAchievementStatus(achievementId);
                        break;
                    case "DeleteAchievement":
                        DeleteAchievement(achievementId);
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in achievements row command: {ex.Message}");
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle grid view row data bound
        /// </summary>
        protected void gvAchievements_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Additional row customization if needed
            }
        }

        /// <summary>
        /// Edit achievement
        /// </summary>
        private void EditAchievement(int achievementId)
        {
            // Redirect to the achievement form (will be created)
            Response.Redirect($"AdminAchievementForm.aspx?id={achievementId}");
        }

        /// <summary>
        /// Toggle achievement active status
        /// </summary>
        private void ToggleAchievementStatus(int achievementId)
        {
            try
            {
                // For now, just show a success message (later will update database)
                ShowSuccess($"Achievement status toggled successfully. (Achievement ID: {achievementId})");
                LogAdminActivity($"Toggled status for achievement ID: {achievementId}");
                LoadAchievements(); // Refresh grid
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error toggling achievement status: {ex.Message}");
                ShowError($"Error updating achievement status: {ex.Message}");
            }
        }

        /// <summary>
        /// Delete achievement
        /// </summary>
        private void DeleteAchievement(int achievementId)
        {
            try
            {
                // For now, just show a success message (later will update database)
                ShowSuccess($"Achievement deleted successfully. (Achievement ID: {achievementId})");
                LogAdminActivity($"Deleted achievement ID: {achievementId}");
                LoadAchievements(); // Refresh grid
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting achievement: {ex.Message}");
                ShowError($"Error deleting achievement: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle add achievement button click
        /// </summary>
        protected void btnAddAchievement_Click(object sender, EventArgs e)
        {
            try
            {
                // Log the button click for debugging
                System.Diagnostics.Debug.WriteLine("Add Achievement button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Achievement button");
                
                // Redirect to the add form (will be created)
                System.Diagnostics.Debug.WriteLine("Redirecting to AdminAchievementForm.aspx");
                Response.Redirect("AdminAchievementForm.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in btnAddAchievement_Click: {ex.Message}");
                ShowError($"Error navigating to add achievement form: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle refresh button click
        /// </summary>
        protected void btnRefreshAchievements_Click(object sender, EventArgs e)
        {
            LoadAchievements();
            ShowSuccess("Achievements list refreshed successfully.");
        }

        /// <summary>
        /// Get achievement icon based on type
        /// </summary>
        protected string GetAchievementIcon(string type)
        {
            switch (type?.ToLower())
            {
                case "award":
                    return "fas fa-trophy";
                case "certification":
                    return "fas fa-certificate";
                case "recognition":
                    return "fas fa-star";
                case "milestone":
                    return "fas fa-flag-checkered";
                default:
                    return "fas fa-medal";
            }
        }

        /// <summary>
        /// Get achievement class based on type
        /// </summary>
        protected string GetAchievementClass(string type)
        {
            switch (type?.ToLower())
            {
                case "award":
                    return "gold";
                case "certification":
                    return "silver";
                case "recognition":
                    return "bronze";
                case "milestone":
                    return "special";
                default:
                    return "special";
            }
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

    /// <summary>
    /// Achievement model class
    /// </summary>
    public class Achievement
    {
        public int AchievementId { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string Organization { get; set; }
        public DateTime AchievementDate { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}