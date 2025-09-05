using System;
using System.Web.UI;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Master page for the SKT Portfolio website
    /// Provides common layout and navigation for all pages
    /// </summary>
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set active navigation item based on current page
            SetActiveNavigation();
        }

        /// <summary>
        /// Highlights the active navigation menu item based on current page
        /// </summary>
        private void SetActiveNavigation()
        {
            string currentPage = System.IO.Path.GetFileName(Page.Request.Url.AbsolutePath);
            
            // Add logic here to highlight active menu item
            // This can be expanded when we add more sophisticated navigation handling
        }
    }
}