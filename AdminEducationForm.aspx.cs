using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class AdminEducationForm : System.Web.UI.Page
    {
        private int EducationId
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
                LoadEducationData();
            }
        }

        /// <summary>
        /// Load education data for editing (if ID is provided)
        /// </summary>
        private void LoadEducationData()
        {
            try
            {
                if (EducationId > 0)
                {
                    // This is an edit operation
                    ltlFormTitle.Text = "Edit Education";
                    
                    // In a real application, you would load the education from database
                    // For now, we'll show a placeholder message
                    ShowInfo("Edit functionality will be implemented when database integration is complete.");
                    
                    LogAdminActivity($"Opened education edit form for ID: {EducationId}");
                }
                else
                {
                    // This is a new education record
                    ltlFormTitle.Text = "Add New Education";
                    chkIsActive.Checked = true; // Default to active
                    LogAdminActivity("Opened new education form");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading education data: {ex.Message}");
                ShowError($"Error loading education data: {ex.Message}");
            }
        }

        /// <summary>
        /// Handle save button click
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveEducation(false);
            }
        }

        /// <summary>
        /// Handle save and add another button click
        /// </summary>
        protected void btnSaveAndAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveEducation(true);
            }
        }

        /// <summary>
        /// Save education data
        /// </summary>
        private void SaveEducation(bool addAnother)
        {
            try
            {
                // Parse dates
                DateTime startDate = DateTime.Parse(txtStartDate.Text);
                DateTime? endDate = null;
                if (!string.IsNullOrEmpty(txtEndDate.Text))
                {
                    endDate = DateTime.Parse(txtEndDate.Text);
                }

                // Create education model from form data
                var education = new EducationModel
                {
                    EducationId = EducationId,
                    Type = ddlType.SelectedValue,
                    Degree = txtDegree.Text.Trim(),
                    FieldOfStudy = txtFieldOfStudy.Text.Trim(),
                    Institution = txtInstitution.Text.Trim(),
                    Location = txtLocation.Text.Trim(),
                    StartDate = startDate,
                    EndDate = endDate,
                    GPA = txtGPA.Text.Trim(),
                    IsActive = chkIsActive.Checked,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                bool success = false;
                string message = "";

                if (EducationId > 0)
                {
                    // Update existing education
                    success = UpdateEducation(education);
                    message = success ? "Education record updated successfully!" : "Failed to update education record.";
                    LogAdminActivity($"Updated education: {education.Degree} at {education.Institution}");
                }
                else
                {
                    // Create new education
                    success = CreateEducation(education);
                    message = success ? "Education record created successfully!" : "Failed to create education record.";
                    LogAdminActivity($"Created new education: {education.Degree} at {education.Institution}");
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
                        // Redirect back to education list after a short delay
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", 
                            "setTimeout(function() { window.location = 'AdminEducation.aspx'; }, 2000);", true);
                    }
                }
                else
                {
                    ShowError(message);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving education: {ex.Message}");
                ShowError($"Error saving education: {ex.Message}");
            }
        }

        /// <summary>
        /// Create new education (placeholder for database integration)
        /// </summary>
        private bool CreateEducation(EducationModel education)
        {
            try
            {
                // In a real application, this would save to database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Creating education: {education.Degree} at {education.Institution}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating education: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing education (placeholder for database integration)
        /// </summary>
        private bool UpdateEducation(EducationModel education)
        {
            try
            {
                // In a real application, this would update database
                // For now, we'll just simulate success
                System.Diagnostics.Debug.WriteLine($"Updating education: {education.Degree} at {education.Institution}");
                
                // Simulate database operation
                System.Threading.Thread.Sleep(500);
                
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating education: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear form fields
        /// </summary>
        private void ClearForm()
        {
            ddlType.SelectedIndex = 0;
            txtDegree.Text = "";
            txtFieldOfStudy.Text = "";
            txtInstitution.Text = "";
            txtLocation.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtGPA.Text = "";
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