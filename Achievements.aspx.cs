using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Achievements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAchievements();
            }
        }

        /// <summary>
        /// Main method to load and display achievements
        /// </summary>
        private void LoadAchievements()
        {
            try
            {
                var achievements = GetAchievementsFromDatabase();
                var filteredAchievements = ApplyFilters(achievements);
                var sortedAchievements = ApplySorting(filteredAchievements);

                // Update overview statistics
                UpdateOverviewStats(achievements);

                // Update results count
                UpdateResultsCount(sortedAchievements.Count, achievements.Count);

                // Display achievements
                DisplayAchievements(sortedAchievements);

                // Show/hide no results panel
                pnlNoResults.Visible = sortedAchievements.Count == 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievements: {ex.Message}");
                ShowError("Unable to load achievements. Please try again later.");
            }
        }

        /// <summary>
        /// Get achievements from database
        /// </summary>
        private List<AchievementModel> GetAchievementsFromDatabase()
        {
            var achievements = new List<AchievementModel>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Achievements"))
                {
                    return GetSampleAchievements(); // Fallback to sample data
                }

                var query = @"SELECT AchievementId, Title, AchievementType, Organization, Description, 
                             AchievementDate, IsActive, CreatedDate, UpdatedDate 
                             FROM Achievements WHERE IsActive = 1 
                             ORDER BY DisplayOrder, AchievementDate DESC";
                
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    achievements.Add(new AchievementModel
                    {
                        AchievementId = Convert.ToInt32(row["AchievementId"]),
                        Title = row["Title"].ToString(),
                        Type = row["AchievementType"]?.ToString() ?? "Other",
                        Organization = row["Organization"]?.ToString() ?? "",
                        Description = row["Description"]?.ToString() ?? "",
                        AchievementDate = Convert.ToDateTime(row["AchievementDate"]),
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting achievements from database: {ex.Message}");
                return GetSampleAchievements(); // Fallback to sample data
            }
            
            return achievements.Count > 0 ? achievements : GetSampleAchievements();
        }

        /// <summary>
        /// Apply type and other filters
        /// </summary>
        private List<AchievementModel> ApplyFilters(List<AchievementModel> achievements)
        {
            var filtered = achievements;

            // Filter by type
            string selectedType = ddlAchievementType.SelectedValue;
            if (selectedType != "All")
            {
                filtered = filtered.Where(a => a.Type.Equals(selectedType, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            return filtered;
        }

        /// <summary>
        /// Apply sorting
        /// </summary>
        private List<AchievementModel> ApplySorting(List<AchievementModel> achievements)
        {
            string sortOrder = ddlSortOrder.SelectedValue;

            switch (sortOrder)
            {
                case "DateDesc":
                    return achievements.OrderByDescending(a => a.AchievementDate).ToList();
                case "DateAsc":
                    return achievements.OrderBy(a => a.AchievementDate).ToList();
                case "TitleAsc":
                    return achievements.OrderBy(a => a.Title).ToList();
                case "TitleDesc":
                    return achievements.OrderByDescending(a => a.Title).ToList();
                case "Type":
                    return achievements.OrderBy(a => a.Type).ThenByDescending(a => a.AchievementDate).ToList();
                default:
                    return achievements.OrderByDescending(a => a.AchievementDate).ToList();
            }
        }

        /// <summary>
        /// Display achievements grouped by type or as a single list
        /// </summary>
        private void DisplayAchievements(List<AchievementModel> achievements)
        {
            phAchievementSections.Controls.Clear();

            if (achievements.Count == 0)
                return;

            // Group by type if "Type" sorting is selected, otherwise show as single list
            if (ddlSortOrder.SelectedValue == "Type" && ddlAchievementType.SelectedValue == "All")
            {
                var groupedAchievements = achievements.GroupBy(a => a.Type).OrderBy(g => g.Key);
                
                foreach (var group in groupedAchievements)
                {
                    CreateAchievementTypeSection(group.Key, group.ToList());
                }
            }
            else
            {
                // Show all in single section
                string sectionTitle = ddlAchievementType.SelectedValue == "All" ? "All Achievements" : GetTypeDisplayName(ddlAchievementType.SelectedValue);
                CreateAchievementTypeSection(sectionTitle, achievements);
            }
        }

        /// <summary>
        /// Create a section for a specific achievement type
        /// </summary>
        private void CreateAchievementTypeSection(string typeName, List<AchievementModel> achievements)
        {
            if (achievements.Count == 0) return;

            // Create section div
            var sectionDiv = new LiteralControl($@"
                <div class='achievement-type-section'>
                    <div class='container'>
                        <div class='type-header'>
                            <h2 class='type-title'>{HttpUtility.HtmlEncode(GetTypeDisplayName(typeName))}</h2>
                            <p class='type-description'>{HttpUtility.HtmlEncode(GetTypeDescription(typeName))}</p>
                            <div class='type-count'>{achievements.Count} Achievement{(achievements.Count != 1 ? "s" : "")}</div>
                        </div>
                        <div class='achievements-grid'>");
            
            phAchievementSections.Controls.Add(sectionDiv);

            // Add achievement cards
            foreach (var achievement in achievements)
            {
                CreateAchievementCard(achievement);
            }

            // Close grid and section
            var closingDiv = new LiteralControl("</div></div></div>");
            phAchievementSections.Controls.Add(closingDiv);
        }

        /// <summary>
        /// Create individual achievement card
        /// </summary>
        private void CreateAchievementCard(AchievementModel achievement)
        {
            string iconClass = GetTypeIconClass(achievement.Type);
            string formattedDate = achievement.AchievementDate.ToString("MMMM yyyy");

            var cardHtml = $@"
                <div class='achievement-card'>
                    <div class='achievement-header'>
                        <div class='achievement-icon {iconClass.ToLower()}'>
                            {GetTypeIcon(achievement.Type)}
                        </div>
                        <div class='achievement-info'>
                            <h3 class='achievement-title'>{HttpUtility.HtmlEncode(achievement.Title)}</h3>
                            <div class='achievement-meta'>
                                {(!string.IsNullOrEmpty(achievement.Organization) ? $"<span class='achievement-organization'>{HttpUtility.HtmlEncode(achievement.Organization)}</span>" : "")}
                                <span class='achievement-date'>{formattedDate}</span>
                                <span class='achievement-type-badge'>{HttpUtility.HtmlEncode(GetTypeDisplayName(achievement.Type))}</span>
                            </div>
                        </div>
                    </div>
                    <div class='achievement-description'>
                        {HttpUtility.HtmlEncode(achievement.Description)}
                    </div>
                </div>";

            phAchievementSections.Controls.Add(new LiteralControl(cardHtml));
        }

        /// <summary>
        /// Update overview statistics
        /// </summary>
        private void UpdateOverviewStats(List<AchievementModel> allAchievements)
        {
            int totalCount = allAchievements.Count;
            int certCount = allAchievements.Count(a => a.Type.Equals("Certification", StringComparison.OrdinalIgnoreCase));
            int awardCount = allAchievements.Count(a => a.Type.Equals("Award", StringComparison.OrdinalIgnoreCase));

            ltlTotalAchievements.Text = $@"
                <div class='overview-stat'>
                    <div class='overview-number'>{totalCount}+</div>
                    <div class='overview-label'>Total Achievements</div>
                </div>";

            ltlCertifications.Text = $@"
                <div class='overview-stat'>
                    <div class='overview-number'>{certCount}+</div>
                    <div class='overview-label'>Certifications</div>
                </div>";

            ltlAwards.Text = $@"
                <div class='overview-stat'>
                    <div class='overview-number'>{awardCount}+</div>
                    <div class='overview-label'>Awards & Honors</div>
                </div>";
        }

        /// <summary>
        /// Update results count display
        /// </summary>
        private void UpdateResultsCount(int filteredCount, int totalCount)
        {
            if (ddlAchievementType.SelectedValue == "All" && ddlSortOrder.SelectedValue == "DateDesc")
            {
                ltlResultsCount.Text = $"Showing all {totalCount} achievements";
            }
            else
            {
                ltlResultsCount.Text = $"Showing {filteredCount} of {totalCount} achievements";
            }
        }

        /// <summary>
        /// Get type display name
        /// </summary>
        private string GetTypeDisplayName(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": return "Certifications";
                case "award": return "Awards & Honors";
                case "research": return "Research & Publications";
                case "expert": return "Expert Status";
                case "competition": return "Competitions";
                case "all achievements": return "All Achievements";
                default: return "Other Achievements";
            }
        }

        /// <summary>
        /// Get type description
        /// </summary>
        private string GetTypeDescription(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": 
                case "certifications":
                    return "Professional certifications and technical qualifications that validate expertise in various technologies and methodologies.";
                case "award": 
                case "awards & honors":
                    return "Recognition and honors received for outstanding performance, innovation, and contributions to the field.";
                case "research": 
                case "research & publications":
                    return "Academic contributions, research publications, and scholarly work in data science and machine learning.";
                case "expert": 
                case "expert status":
                    return "Expert-level recognition and status achieved on competitive platforms and professional communities.";
                case "competition": 
                case "competitions":
                    return "Wins and achievements from hackathons, datathons, and competitive programming contests.";
                case "all achievements":
                    return "A comprehensive showcase of all professional accomplishments, certifications, and milestones.";
                default: 
                    return "Other significant achievements and milestones in professional development and career growth.";
            }
        }

        /// <summary>
        /// Get type icon class
        /// </summary>
        private string GetTypeIconClass(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": return "certification";
                case "award": return "award";
                case "research": return "research";
                case "expert": return "expert";
                case "competition": return "competition";
                default: return "other";
            }
        }

        /// <summary>
        /// Get type icon HTML
        /// </summary>
        private string GetTypeIcon(string type)
        {
            switch (type?.ToLower())
            {
                case "certification": return "<i class='fab fa-microsoft'></i>";
                case "award": return "<i class='fas fa-trophy'></i>";
                case "research": return "<i class='fas fa-graduation-cap'></i>";
                case "expert": return "<i class='fab fa-kaggle'></i>";
                case "competition": return "<i class='fas fa-medal'></i>";
                default: return "<i class='fas fa-star'></i>";
            }
        }

        /// <summary>
        /// Handle achievement type filter change
        /// </summary>
        protected void ddlAchievementType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAchievements();
        }

        /// <summary>
        /// Handle sort order change
        /// </summary>
        protected void ddlSortOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAchievements();
        }

        /// <summary>
        /// Handle clear filters button click
        /// </summary>
        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            ddlAchievementType.SelectedValue = "All";
            ddlSortOrder.SelectedValue = "DateDesc";
            LoadAchievements();
        }

        /// <summary>
        /// Show error message
        /// </summary>
        private void ShowError(string message)
        {
            // You can implement error display here if needed
            System.Diagnostics.Debug.WriteLine($"Achievement page error: {message}");
        }

        /// <summary>
        /// Fallback sample achievements if database is unavailable
        /// </summary>
        private List<AchievementModel> GetSampleAchievements()
        {
            return new List<AchievementModel>
            {
                new AchievementModel
                {
                    AchievementId = 1,
                    Title = "Kaggle Expert Status",
                    Type = "Expert",
                    Description = "Achieved Expert status on Kaggle through consistent participation in data science competitions with multiple medal wins.",
                    Organization = "Kaggle",
                    AchievementDate = new DateTime(2023, 6, 1),
                    IsActive = true,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new AchievementModel
                {
                    AchievementId = 2,
                    Title = "Microsoft Azure Developer Associate",
                    Type = "Certification",
                    Description = "Demonstrated expertise in developing cloud applications and services on Microsoft Azure platform.",
                    Organization = "Microsoft",
                    AchievementDate = new DateTime(2023, 8, 15),
                    IsActive = true,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new AchievementModel
                {
                    AchievementId = 3,
                    Title = "Best Innovation Award",
                    Type = "Award",
                    Description = "Recognized for innovative machine learning solution in healthcare during Tech Innovation Conference 2023.",
                    Organization = "Tech Innovation Conference",
                    AchievementDate = new DateTime(2023, 9, 25),
                    IsActive = true,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new AchievementModel
                {
                    AchievementId = 4,
                    Title = "Research Publication in ML",
                    Type = "Research",
                    Description = "Published research paper on advanced machine learning techniques in IoT data processing and edge computing.",
                    Organization = "Academic Conference",
                    AchievementDate = new DateTime(2023, 7, 10),
                    IsActive = true,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                },
                new AchievementModel
                {
                    AchievementId = 5,
                    Title = "National Hackathon Winner",
                    Type = "Competition",
                    Description = "First place winner in National AI/ML Hackathon with innovative healthcare solution using deep learning.",
                    Organization = "National Tech Association",
                    AchievementDate = new DateTime(2023, 5, 20),
                    IsActive = true,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                }
            };
        }
    }
}