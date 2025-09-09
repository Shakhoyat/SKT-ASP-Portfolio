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
        /// Get education by ID from database
        /// </summary>
        private EducationModel GetEducationById(int educationId)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return null;
                }

                var query = "SELECT * FROM Education WHERE EducationId = @EducationId";
                var parameters = new[] { new System.Data.SqlClient.SqlParameter("@EducationId", educationId) };
                
                var dt = DatabaseHelper.ExecuteQuery(query, parameters);
                if (dt.Rows.Count > 0)
                {
                    var row = dt.Rows[0];
                    return new EducationModel
                    {
                        EducationId = Convert.ToInt32(row["EducationId"]),
                        Institution = row["InstitutionName"].ToString(),
                        Degree = row["Degree"].ToString(),
                        FieldOfStudy = row["FieldOfStudy"]?.ToString() ?? "",
                        StartDate = Convert.ToDateTime(row["StartDate"]),
                        EndDate = row["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["EndDate"]),
                        IsActive = Convert.ToBoolean(row["IsActive"]),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
                    };
                }
                return null;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting education by ID: {ex.Message}");
                return null;
            }
        }

        private void LoadEducationData()
        {
            try
            {
                if (EducationId > 0)
                {
                    ltlFormTitle.Text = "Edit Education";
                    
                    var education = GetEducationById(EducationId);
                    if (education != null)
                    {
                        txtInstitution.Text = education.Institution;
                        txtDegree.Text = education.Degree;
                        txtFieldOfStudy.Text = education.FieldOfStudy;
                        txtStartDate.Text = education.StartDate.ToString("yyyy-MM-dd");
                        txtEndDate.Text = education.EndDate?.ToString("yyyy-MM-dd") ?? "";
                        chkIsActive.Checked = education.IsActive;
                    }
                    else
                    {
                        ShowError("Education record not found.");
                    }
                    
                    LogAdminActivity($"Opened education edit form for ID: {EducationId}");
                }
                else
                {
                    ltlFormTitle.Text = "Add New Education";
                    chkIsActive.Checked = true;
                    LogAdminActivity("Opened new education form");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading education data: {ex.Message}");
                ShowError($"Error loading education data: {ex.Message}");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveEducation(false);
            }
        }

        protected void btnSaveAndAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveEducation(true);
            }
        }

        private void SaveEducation(bool addAnother)
        {
            try
            {
                DateTime startDate = DateTime.Parse(txtStartDate.Text);
                DateTime? endDate = null;
                if (!string.IsNullOrEmpty(txtEndDate.Text))
                {
                    endDate = DateTime.Parse(txtEndDate.Text);
                }

                var education = new EducationModel
                {
                    EducationId = EducationId,
                    Institution = txtInstitution.Text.Trim(),
                    Degree = txtDegree.Text.Trim(),
                    FieldOfStudy = txtFieldOfStudy.Text.Trim(),
                    StartDate = startDate,
                    EndDate = endDate,
                    IsActive = chkIsActive.Checked,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now
                };

                bool success = false;
                string message = "";

                if (EducationId > 0)
                {
                    success = UpdateEducation(education);
                    message = success ? "Education record updated successfully!" : "Failed to update education record.";
                    LogAdminActivity($"Updated education: {education.Degree} at {education.Institution}");
                }
                else
                {
                    success = CreateEducation(education);
                    message = success ? "Education record created successfully!" : "Failed to create education record.";
                    LogAdminActivity($"Created new education: {education.Degree} at {education.Institution}");
                }

                if (success)
                {
                    ShowSuccess(message);
                    
                    if (addAnother)
                    {
                        ClearForm();
                    }
                    else
                    {
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
        /// Create new education
        /// </summary>
        private bool CreateEducation(EducationModel education)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"INSERT INTO Education (InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, 
                             IsActive, DisplayOrder, CreatedDate, UpdatedDate)
                             VALUES (@Institution, @Degree, @FieldOfStudy, @StartDate, @EndDate, 
                             @IsActive, @DisplayOrder, GETDATE(), GETDATE())";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@Institution", education.Institution),
                    new System.Data.SqlClient.SqlParameter("@Degree", education.Degree),
                    new System.Data.SqlClient.SqlParameter("@FieldOfStudy", education.FieldOfStudy),
                    new System.Data.SqlClient.SqlParameter("@StartDate", education.StartDate),
                    new System.Data.SqlClient.SqlParameter("@EndDate", (object)education.EndDate ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@IsActive", education.IsActive),
                    new System.Data.SqlClient.SqlParameter("@DisplayOrder", 1)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating education: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Update existing education
        /// </summary>
        private bool UpdateEducation(EducationModel education)
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"UPDATE Education SET InstitutionName = @Institution, Degree = @Degree, 
                             FieldOfStudy = @FieldOfStudy, StartDate = @StartDate, EndDate = @EndDate, 
                             IsActive = @IsActive, UpdatedDate = GETDATE()
                             WHERE EducationId = @EducationId";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@Institution", education.Institution),
                    new System.Data.SqlClient.SqlParameter("@Degree", education.Degree),
                    new System.Data.SqlClient.SqlParameter("@FieldOfStudy", education.FieldOfStudy),
                    new System.Data.SqlClient.SqlParameter("@StartDate", education.StartDate),
                    new System.Data.SqlClient.SqlParameter("@EndDate", (object)education.EndDate ?? DBNull.Value),
                    new System.Data.SqlClient.SqlParameter("@IsActive", education.IsActive),
                    new System.Data.SqlClient.SqlParameter("@EducationId", education.EducationId)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating education: {ex.Message}");
                return false;
            }
        }

        private void ClearForm()
        {
            txtInstitution.Text = "";
            txtDegree.Text = "";
            txtFieldOfStudy.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            chkIsActive.Checked = true;
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

        private void ShowInfo(string message)
        {
            ltlSuccessMessage.Text = message;
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
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