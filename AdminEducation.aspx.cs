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
            // Check if admin is logged in
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
                // Log postback events for debugging
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
                List<EducationModel> educationList = GetSampleEducation();
                System.Diagnostics.Debug.WriteLine($"Admin: Loaded {educationList.Count} education records.");

                gvEducation.DataSource = educationList;
                gvEducation.DataBind();

                // Log the admin action
                LogAdminActivity($"Viewed education list ({educationList.Count} records)");

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading education: {ex.Message}");
                ShowError($"Error loading education: {ex.Message}");
            }
        }

        /// <summary>
        /// Get sample education for demonstration
        /// </summary>
        private List<EducationModel> GetSampleEducation()
        {
            return new List<EducationModel>
            {
                new EducationModel
                {
                    EducationId = 1,
                    Degree = "Bachelor of Science in Computer Science",
                    FieldOfStudy = "Computer Science",
                    Institution = "University of Technology",
                    Location = "Dhaka, Bangladesh",
                    StartDate = new DateTime(2018, 1, 15),
                    EndDate = new DateTime(2022, 6, 30),
                    GPA = "3.75",
                    Type = "Degree",
                    IsActive = true
                },
                new EducationModel
                {
                    EducationId = 2,
                    Degree = "Microsoft Certified: Azure Fundamentals",
                    FieldOfStudy = "Cloud Computing",
                    Institution = "Microsoft",
                    Location = "Online",
                    StartDate = new DateTime(2023, 10, 1),
                    EndDate = new DateTime(2023, 11, 15),
                    GPA = "Pass",
                    Type = "Certification",
                    IsActive = true
                },
                new EducationModel
                {
                    EducationId = 3,
                    Degree = "Full Stack Web Development",
                    FieldOfStudy = "Web Development",
                    Institution = "Programming Hero",
                    Location = "Online",
                    StartDate = new DateTime(2022, 7, 1),
                    EndDate = new DateTime(2023, 2, 28),
                    GPA = "A+",
                    Type = "Course",
                    IsActive = true
                },
                new EducationModel
                {
                    EducationId = 4,
                    Degree = "Higher Secondary Certificate",
                    FieldOfStudy = "Science",
                    Institution = "Dhaka College",
                    Location = "Dhaka, Bangladesh",
                    StartDate = new DateTime(2016, 7, 1),
                    EndDate = new DateTime(2018, 6, 30),
                    GPA = "5.00",
                    Type = "Degree",
                    IsActive = false
                }
            };
        }

        /// <summary>
        /// Handle grid view row command
        /// </summary>
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

        /// <summary>
        /// Handle grid view row data bound
        /// </summary>
        protected void gvEducation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Additional row customization if needed
            }
        }

        /// <summary>
        /// Edit education
        /// </summary>
        private void EditEducation(int educationId)
        {
            // Redirect to the education form (will be created)
            Response.Redirect($"AdminEducationForm.aspx?id={educationId}");
        }

        /// <summary>
        /// Toggle education active status
        /// </summary>
        private void ToggleEducationStatus(int educationId)
        {
            try
            {
                // For now, just show a success message (later will update database)
                ShowSuccess($"Education status toggled successfully. (Education ID: {educationId})");
                LogAdminActivity($"Toggled status for education ID: {educationId}");
                LoadEducation(); // Refresh grid
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
                // For now, just show a success message (later will update database)
                ShowSuccess($"Education deleted successfully. (Education ID: {educationId})");
                LogAdminActivity($"Deleted education ID: {educationId}");
                LoadEducation(); // Refresh grid
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting education: {ex.Message}");
                ShowError($"Error deleting education: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle add education button click
        /// </summary>
        protected void btnAddEducation_Click(object sender, EventArgs e)
        {
            try
            {
                // Log the button click for debugging
                System.Diagnostics.Debug.WriteLine("Add Education button clicked by admin: " + AdminLogin.GetAdminUsername());
                LogAdminActivity("Clicked Add New Education button");
                
                // Redirect to the add form (will be created)
                System.Diagnostics.Debug.WriteLine("Redirecting to AdminEducationForm.aspx");
                Response.Redirect("AdminEducationForm.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in btnAddEducation_Click: {ex.Message}");
                ShowError($"Error navigating to add education form: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle refresh button click
        /// </summary>
        protected void btnRefreshEducation_Click(object sender, EventArgs e)
        {
            LoadEducation();
            ShowSuccess("Education list refreshed successfully.");
        }

        /// <summary>
        /// Get education icon based on type
        /// </summary>
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

        /// <summary>
        /// Get education class based on type
        /// </summary>
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

        /// <summary>
        /// Get duration string from start and end dates
        /// </summary>
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