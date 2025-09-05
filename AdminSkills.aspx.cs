using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                List<Skill> skills = GetSampleSkills();
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
        /// Get sample skills for demonstration
        /// </summary>
        private List<Skill> GetSampleSkills()
        {
            return new List<Skill>
            {
                new Skill
                {
                    SkillId = 1,
                    SkillName = "C#",
                    Category = "Programming",
                    ProficiencyLevel = 90,
                    Description = "Advanced knowledge of C# and .NET Framework",
                    IsActive = true
                },
                new Skill
                {
                    SkillId = 2,
                    SkillName = "ASP.NET Web Forms",
                    Category = "Framework",
                    ProficiencyLevel = 85,
                    Description = "Experienced in building web applications",
                    IsActive = true
                },
                new Skill
                {
                    SkillId = 3,
                    SkillName = "SQL Server",
                    Category = "Database",
                    ProficiencyLevel = 80,
                    Description = "Database design and T-SQL programming",
                    IsActive = true
                },
                new Skill
                {
                    SkillId = 4,
                    SkillName = "JavaScript",
                    Category = "Programming",
                    ProficiencyLevel = 75,
                    Description = "Frontend programming and DOM manipulation",
                    IsActive = true
                },
                new Skill
                {
                    SkillId = 5,
                    SkillName = "HTML/CSS",
                    Category = "Frontend",
                    ProficiencyLevel = 85,
                    Description = "Responsive web design and modern CSS",
                    IsActive = true
                }
            };
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
            // Redirect to the skill form (will be created)
            Response.Redirect($"AdminSkillForm.aspx?id={skillId}");
        }

        /// <summary>
        /// Toggle skill active status
        /// </summary>
        private void ToggleSkillStatus(int skillId)
        {
            try
            {
                // For now, just show a success message (later will update database)
                ShowSuccess($"Skill status toggled successfully. (Skill ID: {skillId})");
                LogAdminActivity($"Toggled status for skill ID: {skillId}");
                LoadSkills(); // Refresh grid
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
                // For now, just show a success message (later will update database)
                ShowSuccess($"Skill deleted successfully. (Skill ID: {skillId})");
                LogAdminActivity($"Deleted skill ID: {skillId}");
                LoadSkills(); // Refresh grid
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
                // Log the button click for debugging
                System.Diagnostics.Debug.WriteLine("Add Skill button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Skill button");
                
                // Redirect to the add form (will be created)
                System.Diagnostics.Debug.WriteLine("Redirecting to AdminSkillForm.aspx");
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

    /// <summary>
    /// Skill model class
    /// </summary>
    public class Skill
    {
        public int SkillId { get; set; }
        public string SkillName { get; set; }
        public string Category { get; set; }
        public int ProficiencyLevel { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}