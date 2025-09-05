using System;
using System.Collections.Generic;
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
                // Page loads normally - no redirect needed
                LogAdminActivity("Viewed Achievements management page");
            }
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