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
    public partial class AdminSkills : System.Web.UI.Page
    {
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
                LoadSkills();
            }
            else
            {
                // Log postback events for debugging
                System.Diagnostics.Debug.WriteLine($"AdminSkills postback occurred. EventTarget: {Request.Form["__EVENTTARGET"]}");
            }
        }

        /// <summary>
        /// Load skills data
        /// </summary>
        private void LoadSkills()
        {
            try
            {
                List<SkillModel> skills = GetSkillsFromDatabase();
                System.Diagnostics.Debug.WriteLine($"Admin: Loaded {skills.Count} skills.");

                gvSkills.DataSource = skills;
                gvSkills.DataBind();

                // Log the admin action
                LogAdminActivity($"Viewed skills list ({skills.Count} skills)");

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading skills: {ex.Message}");
                ShowError($"Error loading skills: {ex.Message}");
            }
        }

        /// <summary>
        /// Get skills from database
        /// </summary>
        private List<SkillModel> GetSkillsFromDatabase()
        {
            var skills = new List<SkillModel>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Skills"))
                {
                    return skills; // Return empty list if no database
                }

                var query = "SELECT SkillId, SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder, CreatedDate, UpdatedDate FROM Skills ORDER BY DisplayOrder, SkillName";
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    skills.Add(new SkillModel
                    {
                        SkillId = Convert.ToInt32(row["SkillId"]),
                        SkillName = row["SkillName"].ToString(),
                        Category = GetCategoryName(Convert.ToInt32(row["CategoryId"])),
                        ProficiencyLevel = Convert.ToInt32(row["SkillLevel"]),
                        Description = "", // Description not stored in Skills table
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting skills from database: {ex.Message}");
            }
            
            return skills;
        }

        /// <summary>
        /// Get category name from category ID
        /// </summary>
        private string GetCategoryName(int categoryId)
        {
            switch (categoryId)
            {
                case 1: return "Programming";
                case 2: return "Framework";
                case 3: return "Database";
                case 4: return "Frontend";
                case 5: return "Tools";
                default: return "Programming";
            }
        }

        /// <summary>
        /// Handle grid view row command
        /// </summary>
        protected void gvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int skillId = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "EditSkill":
                        EditSkill(skillId);
                        break;
                    case "ToggleStatus":
                        ToggleSkillStatus(skillId);
                        break;
                    case "DeleteSkill":
                        DeleteSkill(skillId);
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in skills row command: {ex.Message}");
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle grid view row data bound
        /// </summary>
        protected void gvSkills_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Additional row customization if needed
            }
        }

        /// <summary>
        /// Edit skill
        /// </summary>
        private void EditSkill(int skillId)
        {
            Response.Redirect($"AdminSkillForm.aspx?id={skillId}");
        }

        /// <summary>
        /// Toggle skill active status
        /// </summary>
        private void ToggleSkillStatus(int skillId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "UPDATE Skills SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END, UpdatedDate = GETDATE() WHERE SkillId = @SkillId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@SkillId", skillId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Skill status updated successfully.");
                    LogAdminActivity($"Toggled status for skill ID: {skillId}");
                    LoadSkills(); // Refresh grid
                }
                else
                {
                    ShowError("Failed to update skill status.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error toggling skill status: {ex.Message}");
                ShowError($"Error updating skill status: {ex.Message}");
            }
        }

        /// <summary>
        /// Delete skill
        /// </summary>
        private void DeleteSkill(int skillId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "DELETE FROM Skills WHERE SkillId = @SkillId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@SkillId", skillId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Skill deleted successfully.");
                    LogAdminActivity($"Deleted skill ID: {skillId}");
                    LoadSkills(); // Refresh grid
                }
                else
                {
                    ShowError("Failed to delete skill.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting skill: {ex.Message}");
                ShowError($"Error deleting skill: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle add skill button click
        /// </summary>
        protected void btnAddSkill_Click(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Add Skill button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Skill button");
                Response.Redirect("AdminSkillForm.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in btnAddSkill_Click: {ex.Message}");
                ShowError($"Error navigating to add skill form: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle refresh button click
        /// </summary>
        protected void btnRefreshSkills_Click(object sender, EventArgs e)
        {
            LoadSkills();
            ShowSuccess("Skills list refreshed successfully.");
        }

        /// <summary>
        /// Get skill icon based on category
        /// </summary>
        protected string GetSkillIcon(string category)
        {
            switch (category?.ToLower())
            {
                case "programming":
                    return "fas fa-code";
                case "framework":
                    return "fas fa-layer-group";
                case "database":
                    return "fas fa-database";
                case "frontend":
                    return "fab fa-html5";
                case "backend":
                    return "fas fa-server";
                case "tools":
                    return "fas fa-tools";
                default:
                    return "fas fa-cog";
            }
        }

        /// <summary>
        /// Get proficiency text based on level
        /// </summary>
        protected string GetProficiencyText(int level)
        {
            if (level >= 90) return "Expert";
            if (level >= 80) return "Advanced";
            if (level >= 70) return "Intermediate";
            if (level >= 50) return "Basic";
            return "Beginner";
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