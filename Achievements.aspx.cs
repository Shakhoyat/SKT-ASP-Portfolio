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
        /// Note: This method now primarily logs information since the page uses static content
        /// </summary>
        private void LoadAchievementData()
        {
            try
            {
                // In a real application, these would come from the database
                // For now, we'll log the loading process for the static content
                
                System.Diagnostics.Debug.WriteLine("Achievement data loading...");
                
                // Set page title to indicate content source
                Page.Title = "Achievements (Demo Data)";
                
                // Future enhancement: You can add code here to dynamically update 
                // the static content based on database achievements when available
                
                System.Diagnostics.Debug.WriteLine("Achievement page configured with static demonstration content.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievement data: {ex.Message}");
                // No need to set literal controls as they don't exist in the current design
            }
        }

        /// <summary>
        /// Method to get achievements from database (for future implementation)
        /// </summary>
        /// <returns>List of achievements</returns>
        private List<Achievement> GetAchievementsFromDatabase()
        {
            // This method would fetch achievements from the database
            // For now, return sample data that matches the static content
            return new List<Achievement>
            {
                new Achievement
                {
                    AchievementId = 1,
                    Title = "Kaggle Expert",
                    Description = "Achieved expert status on Kaggle through consistent participation in data science competitions.",
                    AchievementDate = new DateTime(2023, 6, 1),
                    Category = "Data Science",
                    Organization = "Kaggle",
                    IsActive = true,
                    DisplayOrder = 1,
                    CreatedDate = DateTime.Now
                },
                new Achievement
                {
                    AchievementId = 2,
                    Title = "700+ Problems Solved",
                    Description = "Solved over 700 programming problems across various competitive programming platforms.",
                    AchievementDate = new DateTime(2023, 1, 1),
                    Category = "Algorithms",
                    Organization = "Multiple Platforms",
                    IsActive = true,
                    DisplayOrder = 2,
                    CreatedDate = DateTime.Now
                },
                new Achievement
                {
                    AchievementId = 3,
                    Title = "Research Publications",
                    Description = "Published research papers in machine learning and IoT domains.",
                    AchievementDate = new DateTime(2023, 8, 1),
                    Category = "Academic",
                    Organization = "Various Conferences",
                    IsActive = true,
                    DisplayOrder = 3,
                    CreatedDate = DateTime.Now
                },
                new Achievement
                {
                    AchievementId = 4,
                    Title = "National Hackathon Winner",
                    Description = "Won multiple national and international hackathons with innovative solutions.",
                    AchievementDate = new DateTime(2023, 9, 1),
                    Category = "Competition",
                    Organization = "Various Organizations",
                    IsActive = true,
                    DisplayOrder = 4,
                    CreatedDate = DateTime.Now
                }
            };
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