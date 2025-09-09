using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class AdminAchievementForm : System.Web.UI.Page
    {
        private int AchievementId
        {
            get
            {
                int id = 0;
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out id);
                }
                return id;
            }
        }

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
                LoadAchievementData();
            }
        }

        /// <summary>
        /// Get achievement by ID from database
        /// </summary>
        private AchievementModel GetAchievementById(int achievementId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return null;
                }

                var query = "SELECT * FROM Achievements WHERE AchievementId = @AchievementId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@AchievementId", achievementId) };
                
                var dt = DatabaseHelper.ExecuteQuery(query, parameters);
                if (dt.Rows.Count > 0)
                {
                    var row = dt.Rows[0];
                    return new AchievementModel
                    {
                        AchievementId = Convert.ToInt32(row["AchievementId"]),
                        Title = row["Title"].ToString(),
                        Type = row["AchievementType"]?.ToString() ?? "",
                        Organization = row["Organization"]?.ToString() ?? "",
                        AchievementDate = Convert.ToDateTime(row["AchievementDate"]),
                        Description = row["Description"]?.ToString() ?? "",
                        CertificateUrl = row["CertificateUrl"]?.ToString() ?? "",
                        ImageUrl = row["ImageUrl"]?.ToString() ?? "",
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    };
                }
                return null;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting achievement by ID: {ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Load achievement data for editing (if ID is provided)
        /// </summary>
        private void LoadAchievementData()
        {
            try
            {
                if (AchievementId > 0)
                {
                    // This is an edit operation
                    ltlFormTitle.Text = "Edit Achievement";
                    
                    // Load achievement from database
                    var achievement = GetAchievementById(AchievementId);
                    if (achievement != null)
                    {
                        txtTitle.Text = achievement.Title;
                        ddlType.SelectedValue = achievement.Type;
                        txtOrganization.Text = achievement.Organization;
                        txtAchievementDate.Text = achievement.AchievementDate.ToString("yyyy-MM-dd");
                        txtImageUrl.Text = achievement.ImageUrl;
                        txtCertificateUrl.Text = achievement.CertificateUrl;
                        txtDescription.Text = achievement.Description;
                        chkIsActive.Checked = achievement.IsActive;
                    }
                    else
                    {
                        ShowError("Achievement not found.");
                    }
                    
                    LogAdminActivity($"Opened achievement edit form for ID: {AchievementId}");
                }
                else
                {
                    // This is a new achievement
                    ltlFormTitle.Text = "Add New Achievement";
                    chkIsActive.Checked = true; // Default to active
                    LogAdminActivity("Opened new achievement form");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading achievement data: {ex.Message}");
                ShowError($"Error loading achievement data: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle save button click
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveAchievement(false);
            }
        }

        /// <summary>
        /// Handle save and add another button click
        /// </summary>
        protected void btnSaveAndAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveAchievement(true);
            }
        }

        /// <summary>
        /// Save achievement data
        /// </summary>
        private void SaveAchievement(bool addAnother)
        {
            try
            {
                // Create achievement model from form data
                var achievement = new AchievementModel
                {
                    AchievementId = AchievementId,
                    Title = txtTitle.Text.Trim(),
                    Type = ddlType.SelectedValue,
                    Organization = txtOrganization.Text.Trim(),
                    AchievementDate = DateTime.Parse(txtAchievementDate.Text),
                    ImageUrl = txtImageUrl.Text.Trim(),
                    CertificateUrl = txtCertificateUrl.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    IsActive = chkIsActive.Checked,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                bool success = false;
                string message = "";

                if (AchievementId > 0)
                {
                    // Update existing achievement
                    success = UpdateAchievement(achievement);
                    message = success ? "Achievement updated successfully!" : "Failed to update achievement.";
                    LogAdminActivity($"Updated achievement: {achievement.Title}");
                }
                else
                {
                    // Create new achievement
                    success = CreateAchievement(achievement);
                    message = success ? "Achievement created successfully!" : "Failed to create achievement.";
                    LogAdminActivity($"Created new achievement: {achievement.Title}");
                }

                if (success)
                {
                    ShowSuccess(message);
                    
                    if (addAnother)
                    {
                        // Clear form for next entry
                        ClearForm();
                    }
                    else
                    {
                        // Redirect back to achievements list after a short delay
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", 
                            "setTimeout(function() { window.location = 'AdminAchievements.aspx'; }, 2000);", true);
                    }
                }
                else
                {
                    ShowError(message);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving achievement: {ex.Message}");
                ShowError($"Error saving achievement: {ex.Message}");
            }
        }

        /// <summary>
        /// Create new achievement
        /// </summary>
        private bool CreateAchievement(AchievementModel achievement)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"INSERT INTO Achievements (Title, AchievementType, Organization, AchievementDate, 
                             Description, CertificateUrl, ImageUrl, IsActive, DisplayOrder, CreatedDate, UpdatedDate)
                             VALUES (@Title, @Type, @Organization, @AchievementDate, @Description, 
                             @CertificateUrl, @ImageUrl, @IsActive, @DisplayOrder, GETDATE(), GETDATE())";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@Title", achievement.Title),
                    new System.Data.SqlClient.SqlParameter("@Type", achievement.Type),
                    new System.Data.SqlClient.SqlParameter("@Organization", achievement.Organization),
                    new System.Data.SqlClient.SqlParameter("@AchievementDate", achievement.AchievementDate),
                    new System.Data.SqlClient.SqlParameter("@Description", achievement.Description),
                    new System.Data.SqlClient.SqlParameter("@CertificateUrl", (object)achievement.CertificateUrl ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@ImageUrl", (object)achievement.ImageUrl ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@IsActive", achievement.IsActive),
                    new System.Data.SqlClient.SqlParameter("@DisplayOrder", 1)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating achievement: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing achievement
        /// </summary>
        private bool UpdateAchievement(AchievementModel achievement)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"UPDATE Achievements SET Title = @Title, AchievementType = @Type, 
                             Organization = @Organization, AchievementDate = @AchievementDate, 
                             Description = @Description, CertificateUrl = @CertificateUrl, 
                             ImageUrl = @ImageUrl, IsActive = @IsActive, UpdatedDate = GETDATE()
                             WHERE AchievementId = @AchievementId";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@Title", achievement.Title),
                    new System.Data.SqlClient.SqlParameter("@Type", achievement.Type),
                    new System.Data.SqlClient.SqlParameter("@Organization", achievement.Organization),
                    new System.Data.SqlClient.SqlParameter("@AchievementDate", achievement.AchievementDate),
                    new System.Data.SqlClient.SqlParameter("@Description", achievement.Description),
                    new System.Data.SqlClient.SqlParameter("@CertificateUrl", (object)achievement.CertificateUrl ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@ImageUrl", (object)achievement.ImageUrl ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@IsActive", achievement.IsActive),
                    new System.Data.SqlClient.SqlParameter("@AchievementId", achievement.AchievementId)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating achievement: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear form fields
        /// </summary>
        private void ClearForm()
        {
            txtTitle.Text = "";
            ddlType.SelectedIndex = 0;
            txtOrganization.Text = "";
            txtAchievementDate.Text = "";
            txtImageUrl.Text = "";
            txtCertificateUrl.Text = "";
            txtDescription.Text = "";
            chkIsActive.Checked = true;
        }

        /// <summary>
        /// Show success message
        /// </summary>
        private void ShowSuccess(string message)
        {
            ltlSuccessMessage.Text = message;
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
            pnlMessages.Visible = true;
        }

        /// <summary>
        /// Show error message
        /// </summary>
        private void ShowError(string message)
        {
            ltlErrorMessage.Text = message;
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
            pnlMessages.Visible = true;
        }

        /// <summary>
        /// Show info message
        /// </summary>
        private void ShowInfo(string message)
        {
            ltlSuccessMessage.Text = message;
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
            pnlMessages.Visible = true;
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