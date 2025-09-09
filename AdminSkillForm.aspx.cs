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
        /// Get skill by ID from database
        /// </summary>
        private SkillModel GetSkillById(int skillId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return null;
                }

                var query = "SELECT SkillId, SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder, CreatedDate, UpdatedDate FROM Skills WHERE SkillId = @SkillId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@SkillId", skillId) };
                
                var dt = DatabaseHelper.ExecuteQuery(query, parameters);
                if (dt.Rows.Count > 0)
                {
                    var row = dt.Rows[0];
                    return new SkillModel
                    {
                        SkillId = Convert.ToInt32(row["SkillId"]),
                        SkillName = row["SkillName"].ToString(),
                        Category = GetCategoryName(Convert.ToInt32(row["CategoryId"])),
                        ProficiencyLevel = Convert.ToInt32(row["SkillLevel"]),
                        Description = "", // Description not stored in database
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    };
                }
                return null;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting skill by ID: {ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Get category ID from category name
        /// </summary>
        private int GetCategoryId(string categoryName)
        {
            switch (categoryName?.ToLower())
            {
                case "programming": return 1;
                case "frameworks": return 2;
                case "databases": return 3;
                case "tools": return 4;
                case "cloud": return 5;
                default: return 1;
            }
        }

        /// <summary>
        /// Get category name from category ID
        /// </summary>
        private string GetCategoryName(int categoryId)
        {
            switch (categoryId)
            {
                case 1: return "programming";
                case 2: return "frameworks";
                case 3: return "databases";
                case 4: return "tools";
                case 5: return "cloud";
                default: return "programming";
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
                    
                    // Load skill from database
                    var skill = GetSkillById(SkillId);
                    if (skill != null)
                    {
                        txtSkillName.Text = skill.SkillName;
                        ddlCategory.SelectedValue = skill.Category;
                        rblProficiencyLevel.SelectedValue = skill.ProficiencyLevel.ToString();
                        txtDescription.Text = skill.Description;
                        chkIsActive.Checked = skill.IsActive;
                    }
                    else
                    {
                        ShowError("Skill not found.");
                    }
                    
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
        /// Create new skill
        /// </summary>
        private bool CreateSkill(SkillModel skill)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"INSERT INTO Skills (SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder, CreatedDate, UpdatedDate)
                             VALUES (@SkillName, @SkillLevel, @CategoryId, @IsActive, @DisplayOrder, GETDATE(), GETDATE())";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@SkillName", skill.SkillName),
                    new System.Data.SqlClient.SqlParameter("@SkillLevel", skill.ProficiencyLevel),
                    new System.Data.SqlClient.SqlParameter("@CategoryId", GetCategoryId(skill.Category)),
                    new System.Data.SqlClient.SqlParameter("@IsActive", skill.IsActive),
                    new System.Data.SqlClient.SqlParameter("@DisplayOrder", 1)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating skill: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing skill
        /// </summary>
        private bool UpdateSkill(SkillModel skill)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"UPDATE Skills SET SkillName = @SkillName, SkillLevel = @SkillLevel, 
                             CategoryId = @CategoryId, IsActive = @IsActive, UpdatedDate = GETDATE()
                             WHERE SkillId = @SkillId";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@SkillName", skill.SkillName),
                    new System.Data.SqlClient.SqlParameter("@SkillLevel", skill.ProficiencyLevel),
                    new System.Data.SqlClient.SqlParameter("@CategoryId", GetCategoryId(skill.Category)),
                    new System.Data.SqlClient.SqlParameter("@IsActive", skill.IsActive),
                    new System.Data.SqlClient.SqlParameter("@SkillId", skill.SkillId)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
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