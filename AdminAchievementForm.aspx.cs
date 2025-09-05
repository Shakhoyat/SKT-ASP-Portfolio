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
                    
                    // In a real application, you would load the achievement from database
                    // For now, we'll show a placeholder message
                    ShowInfo("Edit functionality will be implemented when database integration is complete.");
                    
                    // Example of how you would load achievement data:
                    /*
                    var achievement = GetAchievementById(AchievementId);
                    if (achievement != null)
                    {
                        txtTitle.Text = achievement.Title;
                        ddlType.SelectedValue = achievement.Type;
                        txtOrganization.Text = achievement.Organization;
                        txtAchievementDate.Text = achievement.AchievementDate.ToString("yyyy-MM-dd");
                        txtDescription.Text = achievement.Description;
                        chkIsActive.Checked = achievement.IsActive;
                    }
                    */
                    
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
        /// Create new achievement (placeholder for database integration)
        /// </summary>
        private bool CreateAchievement(AchievementModel achievement)
        {
            try
            {
                // In a real application, this would save to database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Creating achievement: {achievement.Title}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating achievement: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing achievement (placeholder for database integration)
        /// </summary>
        private bool UpdateAchievement(AchievementModel achievement)
        {
            try
            {
                // In a real application, this would update database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Updating achievement: {achievement.Title}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
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