using System;
using System.Web;
using System.Web.Routing;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Global application class for SKT Portfolio
    /// Handles application-level events and initialization
    /// </summary>
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }

        void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends
        }
    }
}