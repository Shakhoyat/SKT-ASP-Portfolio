using System;
using System.Net.Mail;
using System.Web.UI;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Contact page for visitor inquiries and communication
    /// Handles contact form submissions and email notifications
    /// </summary>
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize form
                ClearForm();
            }
        }

        /// <summary>
        /// Handles the Send Message button click event
        /// Processes form data and sends email notification
        /// </summary>
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid && ValidateCustomRules())
                {
                    // Create contact message object
                    var contactMessage = new ContactMessage
                    {
                        FirstName = txtFirstName.Text.Trim(),
                        LastName = txtLastName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Phone = txtPhone.Text.Trim(),
                        Subject = ddlSubject.SelectedValue,
                        Priority = ddlPriority.SelectedValue,
                        Message = txtMessage.Text.Trim(),
                        SendCopy = chkCopyEmail.Checked,
                        CreatedDate = DateTime.Now,
                        IPAddress = GetClientIPAddress(),
                        UserAgent = Request.UserAgent
                    };

                    // Save to database (will be implemented with database integration)
                    SaveContactMessage(contactMessage);

                    // Send email notification
                    SendEmailNotification(contactMessage);

                    // Show success message
                    ShowSuccessMessage();

                    // Clear form
                    ClearForm();
                }
                else
                {
                    ShowErrorMessage("Please check the form for errors and try again.");
                }
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging)
                System.Diagnostics.Debug.WriteLine($"Contact form error: {ex.Message}");
                ShowErrorMessage("An unexpected error occurred. Please try again later.");
            }
        }

        /// <summary>
        /// Handles the Clear Form button click event
        /// </summary>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            HideMessages();
        }

        /// <summary>
        /// Performs additional custom validation beyond the built-in validators
        /// </summary>
        private bool ValidateCustomRules()
        {
            bool isValid = true;

            // Validate message length
            if (txtMessage.Text.Trim().Length < 10)
            {
                ShowErrorMessage("Message must be at least 10 characters long.");
                isValid = false;
            }

            // Validate phone format if provided
            if (!string.IsNullOrEmpty(txtPhone.Text.Trim()))
            {
                string phone = txtPhone.Text.Trim();
                if (phone.Length < 10)
                {
                    ShowErrorMessage("Please enter a valid phone number.");
                    isValid = false;
                }
            }

            // Basic spam detection
            string message = txtMessage.Text.ToLower();
            string[] spamKeywords = { "viagra", "casino", "lottery", "prize", "winner" };
            foreach (string keyword in spamKeywords)
            {
                if (message.Contains(keyword))
                {
                    ShowErrorMessage("Your message contains content that appears to be spam.");
                    isValid = false;
                    break;
                }
            }

            return isValid;
        }

        /// <summary>
        /// Saves the contact message to the database
        /// This will be implemented when database integration is added
        /// </summary>
        private void SaveContactMessage(ContactMessage message)
        {
            // TODO: Implement database save functionality
            // For now, we'll simulate saving to database
            
            // In a real implementation, this would use Entity Framework or ADO.NET
            // to save the message to a ContactMessages table
            
            // Example SQL would be:
            // INSERT INTO ContactMessages (FirstName, LastName, Email, Phone, Subject, Priority, Message, SendCopy, CreatedDate, IPAddress, UserAgent, IsRead)
            // VALUES (@FirstName, @LastName, @Email, @Phone, @Subject, @Priority, @Message, @SendCopy, @CreatedDate, @IPAddress, @UserAgent, 0)
            
            System.Diagnostics.Debug.WriteLine($"Contact message saved: {message.FirstName} {message.LastName} - {message.Subject}");
        }

        /// <summary>
        /// Sends email notification for the contact form submission
        /// </summary>
        private void SendEmailNotification(ContactMessage message)
        {
            try
            {
                // In a production environment, you would configure SMTP settings in Web.config
                // and use proper email templates
                
                // For now, we'll simulate email sending
                System.Diagnostics.Debug.WriteLine($"Email notification sent for: {message.Email}");
                
                // Example implementation (commented out for demo):
                /*
                MailMessage mail = new MailMessage();
                mail.To.Add("your-email@domain.com");
                mail.From = new MailAddress("noreply@yourportfolio.com", "SKT Portfolio");
                mail.Subject = $"New Contact Form Submission: {message.Subject}";
                
                string emailBody = $@"
                    <h3>New Contact Form Submission</h3>
                    <p><strong>Name:</strong> {message.FirstName} {message.LastName}</p>
                    <p><strong>Email:</strong> {message.Email}</p>
                    <p><strong>Phone:</strong> {message.Phone}</p>
                    <p><strong>Subject:</strong> {message.Subject}</p>
                    <p><strong>Priority:</strong> {message.Priority}</p>
                    <p><strong>Message:</strong></p>
                    <p>{message.Message.Replace("\n", "<br>")}</p>
                    <p><strong>Submitted:</strong> {message.CreatedDate}</p>
                    <p><strong>IP Address:</strong> {message.IPAddress}</p>
                ";
                
                mail.Body = emailBody;
                mail.IsBodyHtml = true;
                
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                
                // Send copy to user if requested
                if (message.SendCopy)
                {
                    MailMessage copyMail = new MailMessage();
                    copyMail.To.Add(message.Email);
                    copyMail.From = new MailAddress("noreply@yourportfolio.com", "SKT Portfolio");
                    copyMail.Subject = "Copy of your message to SKT Portfolio";
                    copyMail.Body = $"Thank you for contacting me. Here's a copy of your message:\n\n{message.Message}";
                    smtp.Send(copyMail);
                }
                */
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Email sending failed: {ex.Message}");
                // In production, log this error but don't show it to the user
            }
        }

        /// <summary>
        /// Clears all form fields and resets to default values
        /// </summary>
        private void ClearForm()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            ddlSubject.SelectedIndex = 0;
            ddlPriority.SelectedValue = "Normal";
            txtMessage.Text = string.Empty;
            chkCopyEmail.Checked = false;
        }

        /// <summary>
        /// Shows success message to the user
        /// </summary>
        private void ShowSuccessMessage()
        {
            SuccessPanel.Visible = true;
            ErrorPanel.Visible = false;
        }

        /// <summary>
        /// Shows error message to the user
        /// </summary>
        private void ShowErrorMessage(string message)
        {
            ErrorPanel.Visible = true;
            SuccessPanel.Visible = false;
            // If you want to customize the error message, you can modify the ErrorPanel content
        }

        /// <summary>
        /// Hides all message panels
        /// </summary>
        private void HideMessages()
        {
            SuccessPanel.Visible = false;
            ErrorPanel.Visible = false;
        }

        /// <summary>
        /// Gets the client's IP address
        /// </summary>
        private string GetClientIPAddress()
        {
            string ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            
            if (string.IsNullOrEmpty(ipAddress) || ipAddress.ToLower() == "unknown")
            {
                ipAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            
            return ipAddress ?? "Unknown";
        }
    }

    /// <summary>
    /// Contact message data model
    /// This will be replaced with a proper database entity when database integration is added
    /// </summary>
    public class ContactMessage
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Subject { get; set; }
        public string Priority { get; set; }
        public string Message { get; set; }
        public bool SendCopy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string IPAddress { get; set; }
        public string UserAgent { get; set; }
        public bool IsRead { get; set; }
        
        public string FullName => $"{FirstName} {LastName}";
    }
}