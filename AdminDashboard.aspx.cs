using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                LoadDashboardData();
            }
        }

        /// <summary>
        /// Load dashboard data and statistics
        /// </summary>
        private void LoadDashboardData()
        {
            try
            {
                // Set admin name
                ltlAdminName.Text = AdminLogin.GetAdminUsername() ?? "Administrator";

                // Load statistics
                LoadStatistics();

                // Load recent activity
                LoadRecentActivity();

                System.Diagnostics.Debug.WriteLine("Admin dashboard loaded successfully");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading dashboard data: {ex.Message}");
                // Set default values
                SetDefaultValues();
            }
        }

        /// <summary>
        /// Load portfolio statistics
        /// </summary>
        private void LoadStatistics()
        {
            try
            {
                // Check if database is available
                if (!DatabaseHelper.TestConnection())
                {
                    SetDefaultValues();
                    ltlDbStatus.Text = "Not Connected";
                    return;
                }

                // Load project count
                if (DatabaseHelper.TableExists("Projects"))
                {
                    string projectQuery = "SELECT COUNT(*) FROM Projects WHERE IsActive = 1";
                    object projectResult = DatabaseHelper.ExecuteScalar(projectQuery);
                    ltlProjectCount.Text = projectResult?.ToString() ?? "0";
                }
                else
                {
                    ltlProjectCount.Text = "4"; // Sample data count
                }

                // Load skill count
                if (DatabaseHelper.TableExists("Skills"))
                {
                    string skillQuery = "SELECT COUNT(*) FROM Skills WHERE IsActive = 1";
                    object skillResult = DatabaseHelper.ExecuteScalar(skillQuery);
                    ltlSkillCount.Text = skillResult?.ToString() ?? "0";
                }
                else
                {
                    ltlSkillCount.Text = "12"; // Sample data count
                }

                // Load achievement count
                if (DatabaseHelper.TableExists("Achievements"))
                {
                    string achievementQuery = "SELECT COUNT(*) FROM Achievements WHERE IsActive = 1";
                    object achievementResult = DatabaseHelper.ExecuteScalar(achievementQuery);
                    ltlAchievementCount.Text = achievementResult?.ToString() ?? "0";
                }
                else
                {
                    ltlAchievementCount.Text = "8"; // Sample data count
                }

                // Load message count
                if (DatabaseHelper.TableExists("ContactMessages"))
                {
                    string messageQuery = "SELECT COUNT(*) FROM ContactMessages";
                    object messageResult = DatabaseHelper.ExecuteScalar(messageQuery);
                    ltlMessageCount.Text = messageResult?.ToString() ?? "0";

                    // Load unread message count
                    string unreadQuery = "SELECT COUNT(*) FROM ContactMessages WHERE IsRead = 0";
                    object unreadResult = DatabaseHelper.ExecuteScalar(unreadQuery);
                    ltlUnreadMessages.Text = unreadResult?.ToString() ?? "0";
                }
                else
                {
                    ltlMessageCount.Text = "0";
                    ltlUnreadMessages.Text = "0";
                }

                ltlDbStatus.Text = "Connected";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading statistics: {ex.Message}");
                SetDefaultValues();
                ltlDbStatus.Text = "Error";
            }
        }

        /// <summary>
        /// Set default values when database is not available
        /// </summary>
        private void SetDefaultValues()
        {
            ltlProjectCount.Text = "4";
            ltlSkillCount.Text = "12";
            ltlAchievementCount.Text = "8";
            ltlMessageCount.Text = "0";
            ltlUnreadMessages.Text = "0";
        }

        /// <summary>
        /// Load recent admin activity
        /// </summary>
        private void LoadRecentActivity()
        {
            try
            {
                List<AdminActivity> activities = GetRecentActivities();
                
                if (activities.Count > 0)
                {
                    rptRecentActivity.DataSource = activities;
                    rptRecentActivity.DataBind();
                    pnlNoActivity.Visible = false;
                }
                else
                {
                    pnlNoActivity.Visible = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading recent activity: {ex.Message}");
                pnlNoActivity.Visible = true;
            }
        }

        /// <summary>
        /// Get recent admin activities (placeholder implementation)
        /// </summary>
        private List<AdminActivity> GetRecentActivities()
        {
            // In a real application, this would query the database for admin activity logs
            // For now, return sample activities
            return new List<AdminActivity>
            {
                new AdminActivity
                {
                    Description = "Admin logged in to dashboard",
                    Timestamp = DateTime.Now.ToString("MMM dd, yyyy HH:mm")
                },
                new AdminActivity
                {
                    Description = "Portfolio statistics refreshed",
                    Timestamp = DateTime.Now.AddMinutes(-15).ToString("MMM dd, yyyy HH:mm")
                },
                new AdminActivity
                {
                    Description = "Database connection verified",
                    Timestamp = DateTime.Now.AddHours(-2).ToString("MMM dd, yyyy HH:mm")
                }
            };
        }

        /// <summary>
        /// Handle logout button click
        /// </summary>
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                // Log logout activity
                LogAdminActivity($"Admin {AdminLogin.GetAdminUsername()} logged out");

                // Perform logout
                AdminLogin.LogoutAdmin();

                // Redirect to login page
                Response.Redirect("AdminLogin.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error during logout: {ex.Message}");
                // Force redirect even if there's an error
                Response.Redirect("AdminLogin.aspx");
            }
        }

        /// <summary>
        /// Log admin activity
        /// </summary>
        private void LogAdminActivity(string activity)
        {
            try
            {
                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] {activity}";
                System.Diagnostics.Debug.WriteLine(logEntry);

                // In production, save to database
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("AdminActivityLog"))
                {
                    string query = @"
                        INSERT INTO AdminActivityLog (Activity, AdminUser, ActivityDate, IPAddress)
                        VALUES (@Activity, @AdminUser, GETDATE(), @IPAddress)";

                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@Activity", activity),
                        new System.Data.SqlClient.SqlParameter("@AdminUser", AdminLogin.GetAdminUsername() ?? "Unknown"),
                        new System.Data.SqlClient.SqlParameter("@IPAddress", GetClientIP())
                    };

                    DatabaseHelper.ExecuteNonQuery(query, parameters);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error logging admin activity: {ex.Message}");
            }
        }

        /// <summary>
        /// Get client IP address
        /// </summary>
        private string GetClientIP()
        {
            string ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ip))
            {
                ip = Request.ServerVariables["REMOTE_ADDR"];
            }
            return ip ?? "Unknown";
        }
    }

    /// <summary>
    /// Admin activity model for displaying recent activities
    /// </summary>
    public class AdminActivity
    {
        public string Description { get; set; }
        public string Timestamp { get; set; }
    }
}