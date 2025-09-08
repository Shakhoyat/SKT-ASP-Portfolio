using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SessionDemo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSessionData();
                LoadPageViews();
                
                // Track demo page visit (commented out for now)
                // try
                // {
                //     var visitData = SessionCookieManager.GetVisitData();
                //     if (visitData != null)
                //     {
                //         visitData.PagesViewed.Add($"EVENT:DemoPageVisited|SessionCookieDemo|{DateTime.Now:HH:mm:ss}");
                //     }
                // }
                // catch (Exception ex)
                // {
                //     System.Diagnostics.Debug.WriteLine($"Error tracking demo visit: {ex.Message}");
                // }
            }
        }

        private void LoadSessionData()
        {
            try
            {
                // Session information
                ltlSessionId.Text = Session.SessionID;

                // Placeholder values for now
                ltlVisitStart.Text = DateTime.Now.ToString("MMM dd, yyyy HH:mm:ss");
                ltlTimeOnSite.Text = "0 minutes";
                ltlPagesViewed.Text = "1";

                // Preferences (placeholder values)
                ltlCurrentTheme.Text = "dark";
                ltlCurrentLanguage.Text = "en";
                ltlLastVisit.Text = "First visit";

                // Device info
                ltlDeviceType.Text = GetDeviceType();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading session data: {ex.Message}");
            }
        }

        private void LoadPageViews()
        {
            try
            {
                // Placeholder data for now
                rptPageViews.DataSource = new[] 
                { 
                    new { Page = "SessionDemo", Time = DateTime.Now.ToString("HH:mm:ss") } 
                };
                rptPageViews.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading page views: {ex.Message}");
            }
        }

        private string GetDeviceType()
        {
            var userAgent = Request.UserAgent ?? "";
            
            if (userAgent.Contains("Mobile") || userAgent.Contains("Android") || userAgent.Contains("iPhone"))
                return "Mobile";
            else if (userAgent.Contains("Tablet") || userAgent.Contains("iPad"))
                return "Tablet";
            else
                return "Desktop";
        }

        protected bool IsReturningVisitor()
        {
            return false; // Placeholder for now
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            
            // Add real-time update script
            var updateScript = @"
            <script type='text/javascript'>
                // Update session duration in real-time
                setInterval(function() {
                    var startTime = new Date();
                    var now = new Date();
                    var diffMinutes = Math.round((now - startTime) / (1000 * 60) * 10) / 10;
                    
                    var timeElement = document.getElementById('timeOnSite');
                    if (timeElement && timeElement.textContent) {
                        timeElement.textContent = diffMinutes + ' minutes';
                    }
                }, 5000);
            </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "SessionUpdate", updateScript, false);
        }
    }
}