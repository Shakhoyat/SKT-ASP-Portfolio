using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

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
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed. Please check your connection settings.");
                    return;
                }

                // Check if table exists
                if (!DatabaseHelper.TableExists("Achievements"))
                {
                    ShowError("Achievements table does not exist. Please run database setup first.");
                    return;
                }

                // Get all achievements with ImageUrl and CertificateUrl
                var query = @"SELECT AchievementId, Title, AchievementType as Type, Organization, 
                             Description, AchievementDate, CertificateUrl, ImageUrl, IsActive, CreatedDate, UpdatedDate 
                             FROM Achievements ORDER BY AchievementDate DESC";
                
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                gvAchievements.DataSource = dt;
                gvAchievements.DataBind();

                // Log successful load
                LogAdminActivity($"Loaded {dt.Rows.Count} achievements");
                System.Diagnostics.Debug.WriteLine($"Successfully loaded {dt.Rows.Count} achievements from database");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievements: {ex.Message}");
                ShowError($"Error loading achievements: {ex.Message}");
            }
        }

        /// <summary>
        /// Get achievements from database
        /// </summary>
        private List<AchievementModel> GetAchievementsFromDatabase()
        {
            var achievements = new List<AchievementModel>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Achievements"))
                {
                    return achievements;
                }

                var query = "SELECT * FROM Achievements ORDER BY DisplayOrder, AchievementDate DESC";
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (System.Data.DataRow row in dt.Rows)
                {
                    achievements.Add(new AchievementModel
                    {
                        AchievementId = Convert.ToInt32(row["AchievementId"]),
                        Title = row["Title"].ToString(),
                        Type = row["AchievementType"]?.ToString() ?? "",
                        Organization = row["Organization"]?.ToString() ?? "",
                        AchievementDate = Convert.ToDateTime(row["AchievementDate"]),
                        Description = row["Description"]?.ToString() ?? "",
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting achievements from database: {ex.Message}");
            }
            
            return achievements;
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
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "UPDATE Achievements SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END, UpdatedDate = GETDATE() WHERE AchievementId = @AchievementId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@AchievementId", achievementId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Achievement status updated successfully.");
                    LogAdminActivity($"Toggled status for achievement ID: {achievementId}");
                    LoadAchievements();
                }
                else
                {
                    ShowError("Failed to update achievement status.");
                }
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
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "DELETE FROM Achievements WHERE AchievementId = @AchievementId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@AchievementId", achievementId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Achievement deleted successfully.");
                    LogAdminActivity($"Deleted achievement ID: {achievementId}");
                    LoadAchievements();
                }
                else
                {
                    ShowError("Failed to delete achievement.");
                }
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

        /// <summary>
        /// Get achievement image URL with fallback
        /// </summary>
        protected string GetAchievementImageUrl(object imageUrl)
        {
            string url = imageUrl?.ToString();
            if (string.IsNullOrEmpty(url))
            {
                return "/Content/images/placeholder-achievement.jpg";
            }
            return url;
        }

        /// <summary>
        /// Get certificate URL display text
        /// </summary>
        protected string GetCertificateDisplay(object certificateUrl)
        {
            string url = certificateUrl?.ToString();
            if (string.IsNullOrEmpty(url))
            {
                return "No certificate";
            }
            return "View Certificate";
        }

        /// <summary>
        /// Check if certificate URL exists
        /// </summary>
        protected bool HasCertificate(object certificateUrl)
        {
            string url = certificateUrl?.ToString();
            return !string.IsNullOrEmpty(url);
        }
    }
}