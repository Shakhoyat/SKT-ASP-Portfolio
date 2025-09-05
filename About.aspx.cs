using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication1
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You can add dynamic content loading here
                // For example, loading personal information from database
                LoadPersonalInfo();
            }
        }

        /// <summary>
        /// Load personal information from configuration or database
        /// This method can be expanded to load from database in future iterations
        /// </summary>
        private void LoadPersonalInfo()
        {
            try
            {
                // Example of reading from Web.config appSettings
                string ownerName = ConfigurationManager.AppSettings["PortfolioOwnerName"];
                string ownerEmail = ConfigurationManager.AppSettings["PortfolioOwnerEmail"];
                
                // You can use these values to populate page content dynamically
                // For now, they're available for future use
            }
            catch (Exception ex)
            {
                // Log error (in a real application, use proper logging)
                // For now, we'll handle gracefully without breaking the page
                System.Diagnostics.Debug.WriteLine("Error loading personal info: " + ex.Message);
            }
        }
    }
}