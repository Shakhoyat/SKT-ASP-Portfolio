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

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Get form values
                    string name = txtName.Text.Trim();
                    string email = txtEmail.Text.Trim();
                    string phone = txtPhone.Text.Trim();
                    string subject = ddlSubject.SelectedValue;
                    string message = txtMessage.Text.Trim();

                    // Save to database (if ContactMessages table exists)
                    bool savedToDatabase = SaveContactMessage(name, email, phone, subject, message);

                    // Send email notification (optional - requires SMTP configuration)
                    bool emailSent = SendEmailNotification(name, email, phone, subject, message);

                    if (savedToDatabase || emailSent)
                    {
                        // Show success message
                        pnlSuccess.Visible = true;
                        pnlError.Visible = false;

                        // Clear form
                        ClearForm();

                        System.Diagnostics.Debug.WriteLine($"Contact message received from {name} ({email})");
                    }
                    else
                    {
                        // Show error message
                        pnlSuccess.Visible = false;
                        pnlError.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error processing contact form: {ex.Message}");
                    
                    // Show error message
                    pnlSuccess.Visible = false;
                    pnlError.Visible = true;
                }
            }
        }

        /// <summary>
        /// Save contact message to database
        /// </summary>
        private bool SaveContactMessage(string name, string email, string phone, string subject, string message)
        {
            try
            {
                // Check if database is available and table exists
                if (!DatabaseHelper.TestConnection() || !DatabaseHelper.TableExists("ContactMessages"))
                {
                    System.Diagnostics.Debug.WriteLine("Database not available or ContactMessages table doesn't exist");
                    return false;
                }

                string query = @"
                    INSERT INTO ContactMessages (Name, Email, Phone, Subject, Message, IsRead, CreatedDate)
                    VALUES (@Name, @Email, @Phone, @Subject, @Message, 0, GETDATE())";

                var parameters = new System.Data.SqlClient.SqlParameter[]
                {
                    new System.Data.SqlClient.SqlParameter("@Name", name),
                    new System.Data.SqlClient.SqlParameter("@Email", email),
                    new System.Data.SqlClient.SqlParameter("@Phone", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone),
                    new System.Data.SqlClient.SqlParameter("@Subject", subject),
                    new System.Data.SqlClient.SqlParameter("@Message", message)
                };

                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error saving contact message to database: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Send email notification (optional - requires SMTP configuration)
        /// </summary>
        private bool SendEmailNotification(string name, string email, string phone, string subject, string message)
        {
            try
            {
                // Note: This requires SMTP configuration in Web.config
                // For now, we'll just log the message and return true
                
                string emailBody = $@"
                    New contact message received:
                    
                    Name: {name}
                    Email: {email}
                    Phone: {phone}
                    Subject: {subject}
                    
                    Message:
                    {message}
                    
                    Sent at: {DateTime.Now}
                ";

                System.Diagnostics.Debug.WriteLine("Email notification (simulated):");
                System.Diagnostics.Debug.WriteLine(emailBody);

                // In a real application, uncomment and configure the following:
                /*
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("noreply@yourportfolio.com");
                mail.To.Add("skt104.shujon@gmail.com");
                mail.Subject = $"New Contact Message: {subject}";
                mail.Body = emailBody;
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                */

                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error sending email notification: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Clear the contact form
        /// </summary>
        private void ClearForm()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlSubject.SelectedIndex = 0;
            txtMessage.Text = "";
        }
    }
}