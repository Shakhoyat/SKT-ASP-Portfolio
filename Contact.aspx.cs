using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace WebApplication1
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page
            }
        }

        /// <summary>
        /// Handle contact form submission
        /// </summary>
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Save message to database
                    bool success = SaveContactMessage();
                    
                    if (success)
                    {
                        // Clear form
                        ClearContactForm();
                        
                        // Show success message
                        ShowSuccess();
                    }
                    else
                    {
                        ShowError();
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error sending contact message: {ex.Message}");
                    ShowError();
                }
            }
        }

        /// <summary>
        /// Save contact message to database
        /// </summary>
        private bool SaveContactMessage()
        {
            try
            {
                if (!DatabaseHelper.TestConnection())
                {
                    return false;
                }

                var query = @"INSERT INTO ContactMessages (Name, Email, Subject, MessageBody, Phone, ProjectType, 
                             IsRead, IsReplied, MessageDate, AdminNotes)
                             VALUES (@Name, @Email, @Subject, @MessageBody, @Phone, @ProjectType, 
                             0, 0, GETDATE(), NULL)";

                var parameters = new[]
                {
                    new System.Data.SqlClient.SqlParameter("@Name", txtName.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@Email", txtEmail.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@Subject", ddlSubject.SelectedItem.Text),
                    new System.Data.SqlClient.SqlParameter("@MessageBody", txtMessage.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@Phone", txtPhone.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@ProjectType", ddlSubject.SelectedValue)
                };

                return DatabaseHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving contact message to database: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear contact form fields
        /// </summary>
        private void ClearContactForm()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlSubject.SelectedIndex = 0;
            txtMessage.Text = "";
        }

        /// <summary>
        /// Show success message
        /// </summary>
        private void ShowSuccess()
        {
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
        }

        /// <summary>
        /// Show error message
        /// </summary>
        private void ShowError()
        {
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
        }
    }
}