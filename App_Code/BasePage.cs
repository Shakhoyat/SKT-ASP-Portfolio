using System;
using System.Web.UI;

namespace WebApplication1
{
    /// <summary>
    /// Base page class with integrated session and cookie management
    /// All portfolio pages should inherit from this class
    /// </summary>
    public class BasePage : Page
    {
        /// <summary>
        /// Current page name for tracking
        /// </summary>
        protected virtual string PageName
        {
            get
            {
                return this.GetType().Name.Replace("_", ".");
            }
        }

        /// <summary>
        /// Indicates if this page requires admin authentication
        /// </summary>
        protected virtual bool RequiresAdminAuth
        {
            get { return false; }
        }

        /// <summary>
        /// Indicates if this page should be tracked for analytics
        /// </summary>
        protected virtual bool EnableTracking
        {
            get { return true; }
        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            
            try
            {
                // Check admin authentication if required
                if (RequiresAdminAuth && !AdminLogin.IsAdminLoggedIn())
                {
                    Response.Redirect("~/AdminLogin.aspx");
                    return;
                }

                // Session management will be added later
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in BasePage.OnPreInit: {ex.Message}");
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            
            try
            {
                if (EnableTracking)
                {
                    // Tracking will be added later
                    ApplyUserPreferences();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in BasePage.OnLoad: {ex.Message}");
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            
            try
            {
                if (EnableTracking)
                {
                    // Client-side features will be added later
                    SetClientPreferences();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in BasePage.OnPreRender: {ex.Message}");
            }
        }

        /// <summary>
        /// Apply user preferences to the page
        /// </summary>
        protected virtual void ApplyUserPreferences()
        {
            try
            {
                // Theme and language preferences will be implemented later
                var theme = "dark";
                var language = "en";

                // Set theme class on body (if master page supports it)
                if (Master != null)
                {
                    var body = Master.FindControl("bodyTag") as System.Web.UI.HtmlControls.HtmlGenericControl;
                    if (body != null)
                    {
                        body.Attributes["class"] = $"theme-{theme} lang-{language}";
                    }
                }

                // Store preferences in ViewState for client-side access
                ViewState["CurrentTheme"] = theme;
                ViewState["CurrentLanguage"] = language;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error applying user preferences: {ex.Message}");
            }
        }

        /// <summary>
        /// Set client-side preference variables
        /// </summary>
        protected virtual void SetClientPreferences()
        {
            try
            {
                var theme = "dark";
                var language = "en";

                var preferencesScript = $@"
                <script type='text/javascript'>
                    window.PortfolioPreferences = {{
                        theme: '{theme}',
                        language: '{language}',
                        lastVisit: null,
                        recentProjectsCount: 0,
                        isReturningVisitor: false
                    }};
                    
                    // Apply theme immediately
                    document.documentElement.setAttribute('data-theme', '{theme}');
                    document.documentElement.setAttribute('data-lang', '{language}');
                </script>";

                ClientScript.RegisterStartupScript(this.GetType(), "PortfolioPreferences", preferencesScript, false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error setting client preferences: {ex.Message}");
            }
        }
    }
}