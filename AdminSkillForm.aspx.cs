using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class AdminSkillForm : System.Web.UI.Page
    {
        private int SkillId
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
                LoadSkillData();
            }
        }

        /// <summary>
        /// Load skill data for editing (if ID is provided)
        /// </summary>
        private void LoadSkillData()
        {
            try
            {
                if (SkillId > 0)
                {
                    // This is an edit operation
                    ltlFormTitle.Text = "Edit Skill";
                    
                    // In a real application, you would load the skill from database
                    // For now, we'll show a placeholder message
                    ShowInfo("Edit functionality will be implemented when database integration is complete.");
                    
                    LogAdminActivity($"Opened skill edit form for ID: {SkillId}");
                }
                else
                {
                    // This is a new skill
                    ltlFormTitle.Text = "Add New Skill";
                    chkIsActive.Checked = true; // Default to active
                    LogAdminActivity("Opened new skill form");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading skill data: {ex.Message}");
                ShowError($"Error loading skill data: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle save button click
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveSkill(false);
            }
        }

        /// <summary>
        /// Handle save and add another button click
        /// </summary>
        protected void btnSaveAndAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveSkill(true);
            }
        }

        /// <summary>
        /// Save skill data
        /// </summary>
        private void SaveSkill(bool addAnother)
        {
            try
            {
                // Create skill model from form data
                var skill = new SkillModel
                {
                    SkillId = SkillId,
                    SkillName = txtSkillName.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    ProficiencyLevel = int.Parse(rblProficiencyLevel.SelectedValue),
                    Description = txtDescription.Text.Trim(),
                    IsActive = chkIsActive.Checked,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                bool success = false;
                string message = "";

                if (SkillId > 0)
                {
                    // Update existing skill
                    success = UpdateSkill(skill);
                    message = success ? "Skill updated successfully!" : "Failed to update skill.";
                    LogAdminActivity($"Updated skill: {skill.SkillName}");
                }
                else
                {
                    // Create new skill
                    success = CreateSkill(skill);
                    message = success ? "Skill created successfully!" : "Failed to create skill.";
                    LogAdminActivity($"Created new skill: {skill.SkillName}");
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
                        // Redirect back to skills list after a short delay
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", 
                            "setTimeout(function() { window.location = 'AdminSkills.aspx'; }, 2000);", true);
                    }
                }
                else
                {
                    ShowError(message);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving skill: {ex.Message}");
                ShowError($"Error saving skill: {ex.Message}");
            }
        }

        /// <summary>
        /// Create new skill (placeholder for database integration)
        /// </summary>
        private bool CreateSkill(SkillModel skill)
        {
            try
            {
                // In a real application, this would save to database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Creating skill: {skill.SkillName}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating skill: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing skill (placeholder for database integration)
        /// </summary>
        private bool UpdateSkill(SkillModel skill)
        {
            try
            {
                // In a real application, this would update database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Updating skill: {skill.SkillName}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating skill: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear form fields
        /// </summary>
        private void ClearForm()
        {
            txtSkillName.Text = "";
            ddlCategory.SelectedIndex = 0;
            rblProficiencyLevel.ClearSelection();
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