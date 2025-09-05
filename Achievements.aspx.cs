using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Achievements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAchievementData();
            }
        }

        /// <summary>
        /// Load achievement statistics and data
        /// </summary>
        private void LoadAchievementData()
        {
            try
            {
                // In a real application, these would come from the database
                // For now, we'll use static data that matches the achievement content
                
                // Set achievement statistics
                ltlTotalAchievements.Text = "8+";
                ltlCertifications.Text = "5+";
                ltlAwards.Text = "3+";
                ltlEducation.Text = "1+";
                
                System.Diagnostics.Debug.WriteLine("Achievement data loaded successfully.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievement data: {ex.Message}");
                // Set default values in case of error
                ltlTotalAchievements.Text = "8+";
                ltlCertifications.Text = "5+";
                ltlAwards.Text = "3+";
                ltlEducation.Text = "1+";
            }
        }

        /// <summary>
        /// Method to get achievements from database (for future implementation)
        /// </summary>
        /// <returns>List of achievements</returns>
        private List<Achievement> GetAchievementsFromDatabase()
        {
            // This method would fetch achievements from the database
            // For now, return empty list since we're using static content
            return new List<Achievement>();
        }
    }

    /// <summary>
    /// Achievement model class (for future database implementation)
    /// </summary>
    public class Achievement
    {
        public int AchievementId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime AchievementDate { get; set; }
        public string Category { get; set; }
        public string Organization { get; set; }
        public string CertificateUrl { get; set; }
        public string ImageUrl { get; set; }
        public bool IsActive { get; set; }
        public int DisplayOrder { get; set; }
        public DateTime CreatedDate { get; set; }

        public string FormattedDate
        {
            get
            {
                return AchievementDate.Year.ToString();
            }
        }
    }
}