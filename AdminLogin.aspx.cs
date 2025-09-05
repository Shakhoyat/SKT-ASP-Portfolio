using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // Default admin credentials (in production, store these securely)
        private const string DEFAULT_USERNAME = "admin";
        private const string DEFAULT_PASSWORD = "portfolio123"; // This should be hashed in production

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is already logged in
                if (IsAdminLoggedIn())
                {
                    Response.Redirect("AdminDashboard.aspx");
                    return;
                }

                // Show info panel for first-time users
                pnlInfo.Visible = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();

                if (ValidateCredentials(username, password))
                {
                    // Set session variables
                    Session["IsAdminLoggedIn"] = true;
                    Session["AdminUsername"] = username;
                    Session["AdminLoginTime"] = DateTime.Now;

                    // Set remember me cookie if checked
                    if (chkRememberMe.Checked)
                    {
                        HttpCookie rememberCookie = new HttpCookie("AdminRemember");
                        rememberCookie.Value = EncryptString(username);
                        rememberCookie.Expires = DateTime.Now.AddDays(30);
                        rememberCookie.HttpOnly = true;
                        Response.Cookies.Add(rememberCookie);
                    }

                    // Log successful login
                    LogAdminActivity($"Admin login successful for user: {username}");

                    // Redirect to admin dashboard
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    // Show error message
                    ShowError("Invalid username or password. Please try again.");
                    
                    // Log failed login attempt
                    LogAdminActivity($"Failed login attempt for user: {username}");
                    
                    // Clear password field
                    txtPassword.Text = "";
                }
            }
        }

        /// <summary>
        /// Validate admin credentials
        /// </summary>
        private bool ValidateCredentials(string username, string password)
        {
            try
            {
                // Check default credentials
                if (username.Equals(DEFAULT_USERNAME, StringComparison.OrdinalIgnoreCase) && 
                    password == DEFAULT_PASSWORD)
                {
                    return true;
                }

                // In future, check database for additional admin users
                // For now, only use default credentials
                return false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error validating credentials: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Check if admin is currently logged in
        /// </summary>
        public static bool IsAdminLoggedIn()
        {
            return HttpContext.Current.Session["IsAdminLoggedIn"] != null && 
                   (bool)HttpContext.Current.Session["IsAdminLoggedIn"];
        }

        /// <summary>
        /// Get current admin username
        /// </summary>
        public static string GetAdminUsername()
        {
            if (IsAdminLoggedIn())
            {
                return HttpContext.Current.Session["AdminUsername"]?.ToString() ?? "Unknown";
            }
            return null;
        }

        /// <summary>
        /// Log admin activity
        /// </summary>
        private void LogAdminActivity(string activity)
        {
            try
            {
                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] {activity} (IP: {GetClientIP()})";
                System.Diagnostics.Debug.WriteLine(logEntry);
                
                // In production, save to database or log file
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

        /// <summary>
        /// Show error message
        /// </summary>
        private void ShowError(string message)
        {
            lblErrorMessage.InnerText = message;
            pnlError.Visible = true;
            pnlInfo.Visible = false;
        }

        /// <summary>
        /// Simple encryption for remember me cookie
        /// </summary>
        private string EncryptString(string text)
        {
            try
            {
                byte[] data = Encoding.UTF8.GetBytes(text);
                return Convert.ToBase64String(data);
            }
            catch
            {
                return text;
            }
        }

        /// <summary>
        /// Simple decryption for remember me cookie
        /// </summary>
        private string DecryptString(string encryptedText)
        {
            try
            {
                byte[] data = Convert.FromBase64String(encryptedText);
                return Encoding.UTF8.GetString(data);
            }
            catch
            {
                return encryptedText;
            }
        }

        /// <summary>
        /// Admin logout function (static for use from other pages)
        /// </summary>
        public static void LogoutAdmin()
        {
            HttpContext.Current.Session.Remove("IsAdminLoggedIn");
            HttpContext.Current.Session.Remove("AdminUsername");
            HttpContext.Current.Session.Remove("AdminLoginTime");
            
            // Remove remember me cookie
            if (HttpContext.Current.Request.Cookies["AdminRemember"] != null)
            {
                HttpCookie cookie = new HttpCookie("AdminRemember");
                cookie.Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
        }
    }
}