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
    public partial class AdminEducation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AdminLogin.IsAdminLoggedIn())
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEducation();
            }
            else
            {
                System.Diagnostics.Debug.WriteLine($"AdminEducation postback occurred. EventTarget: {Request.Form["__EVENTTARGET"]}");
            }
        }

        /// <summary>
        /// Load education data
        /// </summary>
        private void LoadEducation()
        {
            try
            {
                List<EducationModel> educationList = GetEducationFromDatabase();
                System.Diagnostics.Debug.WriteLine($"Admin: Loaded {educationList.Count} education records.");

                gvEducation.DataSource = educationList;
                gvEducation.DataBind();

                LogAdminActivity($"Viewed education list ({educationList.Count} records)");

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading education: {ex.Message}");
                ShowError($"Error loading education: {ex.Message}");
            }
        }

        /// <summary>
        /// Get education from database
        /// </summary>
        private List<EducationModel> GetEducationFromDatabase()
        {
            var educationList = new List<EducationModel>();
            try
            {
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("Education"))
                {
                    return educationList;
                }

                var query = "SELECT EducationId, InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, GPA, Location, IsActive, DisplayOrder, CreatedDate, UpdatedDate FROM Education ORDER BY DisplayOrder, StartDate DESC";
                var dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    educationList.Add(new EducationModel
                    {
                        EducationId = Convert.ToInt32(row["EducationId"]),
                        Institution = row["InstitutionName"].ToString(),
                        Degree = row["Degree"].ToString(),
                        FieldOfStudy = row["FieldOfStudy"]?.ToString() ?? "",
                        StartDate = Convert.ToDateTime(row["StartDate"]),
                        EndDate = row["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["EndDate"]),
                        GPA = row["GPA"]?.ToString() ?? "",
                        Location = row["Location"]?.ToString() ?? "",
                        Type = GetEducationType(row["Degree"].ToString()),
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting education from database: {ex.Message}");
            }
            
            return educationList;
        }

        /// <summary>
        /// Get education type from degree name
        /// </summary>
        private string GetEducationType(string degree)
        {
            if (string.IsNullOrEmpty(degree)) return "Course";
            
            var lowerDegree = degree.ToLower();
            if (lowerDegree.Contains("bachelor") || lowerDegree.Contains("master") || lowerDegree.Contains("phd") || 
                lowerDegree.Contains("diploma") || lowerDegree.Contains("certificate") && lowerDegree.Contains("secondary"))
                return "Degree";
            else if (lowerDegree.Contains("certified") || lowerDegree.Contains("certification"))
                return "Certification";
            else if (lowerDegree.Contains("training") || lowerDegree.Contains("workshop"))
                return "Training";
            else
                return "Course";
        }

        protected void gvEducation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int educationId = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "EditEducation":
                        EditEducation(educationId);
                        break;
                    case "ToggleStatus":
                        ToggleEducationStatus(educationId);
                        break;
                    case "DeleteEducation":
                        DeleteEducation(educationId);
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in education row command: {ex.Message}");
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        protected void gvEducation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Additional row customization if needed
            }
        }

        private void EditEducation(int educationId)
        {
            Response.Redirect($"AdminEducationForm.aspx?id={educationId}");
        }

        /// <summary>
        /// Toggle education active status
        /// </summary>
        private void ToggleEducationStatus(int educationId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "UPDATE Education SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END, UpdatedDate = GETDATE() WHERE EducationId = @EducationId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@EducationId", educationId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Education status updated successfully.");
                    LogAdminActivity($"Toggled status for education ID: {educationId}");
                    LoadEducation();
                }
                else
                {
                    ShowError("Failed to update education status.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error toggling education status: {ex.Message}");
                ShowError($"Error updating education status: {ex.Message}");
            }
        }

        /// <summary>
        /// Delete education
        /// </summary>
        private void DeleteEducation(int educationId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    ShowError("Database connection failed.");
                    return;
                }

                var query = "DELETE FROM Education WHERE EducationId = @EducationId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@EducationId", educationId) };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                if (rowsAffected > 0)
                {
                    ShowSuccess("Education deleted successfully.");
                    LogAdminActivity($"Deleted education ID: {educationId}");
                    LoadEducation();
                }
                else
                {
                    ShowError("Failed to delete education.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting education: {ex.Message}");
                ShowError($"Error deleting education: {ex.Message}");
            }
        }

        protected void btnAddEducation_Click(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Add Education button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Education button");
                Response.Redirect("AdminEducationForm.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in btnAddEducation_Click: {ex.Message}");
                ShowError($"Error navigating to add education form: {ex.Message}");
            }
        }

        protected void btnRefreshEducation_Click(object sender, EventArgs e)
        {
            LoadEducation();
            ShowSuccess("Education list refreshed successfully.");
        }

        protected string GetEducationIcon(string type)
        {
            switch (type?.ToLower())
            {
                case "degree":
                    return "fas fa-graduation-cap";
                case "certification":
                    return "fas fa-certificate";
                case "course":
                    return "fas fa-laptop-code";
                case "training":
                    return "fas fa-chalkboard-teacher";
                default:
                    return "fas fa-book";
            }
        }

        protected string GetEducationClass(string type)
        {
            switch (type?.ToLower())
            {
                case "degree":
                    return "degree";
                case "certification":
                    return "certification";
                case "course":
                    return "course";
                case "training":
                    return "training";
                default:
                    return "course";
            }
        }

        protected string GetDuration(DateTime startDate, DateTime? endDate)
        {
            DateTime end = endDate ?? DateTime.Now;
            TimeSpan duration = end - startDate;
            
            int years = (int)(duration.TotalDays / 365.25);
            int months = (int)((duration.TotalDays % 365.25) / 30.44);

            if (years > 0)
            {
                return months > 0 ? $"{years} year{(years > 1 ? "s" : "")} {months} month{(months > 1 ? "s" : "")}" : $"{years} year{(years > 1 ? "s" : "")}";
            }
            else if (months > 0)
            {
                return $"{months} month{(months > 1 ? "s" : "")}";
            }
            else
            {
                int days = (int)duration.TotalDays;
                return $"{days} day{(days > 1 ? "s" : "")}";
            }
        }

        private void ShowSuccess(string message)
        {
            ltlSuccessMessage.Text = message;
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
            pnlMessages.Visible = true;
        }

        private void ShowError(string message)
        {
            ltlErrorMessage.Text = message;
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
            pnlMessages.Visible = true;
        }

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