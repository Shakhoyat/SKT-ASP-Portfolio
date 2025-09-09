using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class AdminMessages : System.Web.UI.Page
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
                LoadMessages();
            }
        }

        /// <summary>
        /// Load contact messages
        /// </summary>
        private void LoadMessages()
        {
            try
            {
                List<ContactMessage> messages = new List<ContactMessage>();

                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("ContactMessages"))
                {
                    // Load from database
                    messages = GetMessagesFromDatabase();
                }
                else
                {
                    // Return empty list if no database available
                    messages = new List<ContactMessage>();
                }

                if (messages.Count > 0)
                {
                    rptMessages.DataSource = messages;
                    rptMessages.DataBind();
                    pnlEmptyState.Visible = false;
                }
                else
                {
                    pnlEmptyState.Visible = true;
                }

                System.Diagnostics.Debug.WriteLine($"Loaded {messages.Count} contact messages for admin");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading messages: {ex.Message}");
                ShowError($"Error loading messages: {ex.Message}");
                pnlEmptyState.Visible = true;
            }
        }

        /// <summary>
        /// Get messages from database
        /// </summary>
        private List<ContactMessage> GetMessagesFromDatabase()
        {
            List<ContactMessage> messages = new List<ContactMessage>();

            try
            {
                string query = @"
                    SELECT MessageId, Name, Email, Phone, Subject, MessageBody, ProjectType, 
                           IsRead, IsReplied, MessageDate, AdminNotes
                    FROM ContactMessages 
                    ORDER BY MessageDate DESC";

                DataTable dt = DatabaseHelper.ExecuteQuery(query);

                foreach (DataRow row in dt.Rows)
                {
                    messages.Add(new ContactMessage
                    {
                        ContactMessageId = Convert.ToInt32(row["MessageId"]),
                        Name = row["Name"].ToString(),
                        Email = row["Email"].ToString(),
                        Phone = row["Phone"]?.ToString(),
                        Subject = row["Subject"]?.ToString() ?? GetSubjectFromProjectType(row["ProjectType"]?.ToString()),
                        Message = row["MessageBody"].ToString(),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        CreatedDate = Convert.ToDateTime(row["MessageDate"])
                    });
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting messages from database: {ex.Message}");
            }

            return messages;
        }

        /// <summary>
        /// Get subject from project type
        /// </summary>
        private string GetSubjectFromProjectType(string projectType)
        {
            switch (projectType?.ToLower())
            {
                case "datascience": return "Data Science Project";
                case "machinelearning": return "Machine Learning Project";
                case "web": return "Web Development";
                case "iot": return "IoT Project";
                case "research": return "Research Collaboration";
                case "consultation": return "Technical Consultation";
                default: return "General Inquiry";
            }
        }

        /// <summary>
        /// Handle repeater item command
        /// </summary>
        protected void rptMessages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                int messageId = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "Reply":
                        ReplyToMessage(messageId);
                        break;
                    case "ToggleRead":
                        ToggleReadStatus(messageId);
                        break;
                    case "Delete":
                        DeleteMessage(messageId);
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in repeater command: {ex.Message}");
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        /// <summary>
        /// Reply to message (opens email client)
        /// </summary>
        private void ReplyToMessage(int messageId)
        {
            try
            {
                // Get message details
                ContactMessage message = GetMessageById(messageId);
                if (message != null)
                {
                    // Create mailto link
                    string subject = $"Re: {GetSubjectDisplay(message.Subject)} - Portfolio Inquiry";
                    string body = $"Hi {message.Name},\n\nThank you for your message regarding...\n\nBest regards,\nShakhoyat Rahman";
                    
                    string mailtoLink = $"mailto:{message.Email}?subject={Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";
                    
                    // Register script to open email client
                    ClientScript.RegisterStartupScript(this.GetType(), "OpenEmail", 
                        $"window.open('{mailtoLink}', '_blank');", true);
                    
                    LogAdminActivity($"Replied to message from {message.Name} ({message.Email})");
                    ShowSuccess("Email client opened. Please send your reply.");
                }
                else
                {
                    ShowError("Message not found.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error replying to message: {ex.Message}");
                ShowError($"Error opening email client: {ex.Message}");
            }
        }

        /// <summary>
        /// Toggle read status of message
        /// </summary>
        private void ToggleReadStatus(int messageId)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("ContactMessages"))
                {
                    string query = @"UPDATE ContactMessages 
                                   SET IsRead = CASE WHEN IsRead = 1 THEN 0 ELSE 1 END, 
                                       ReadDate = CASE WHEN IsRead = 0 THEN GETDATE() ELSE NULL END
                                   WHERE MessageId = @MessageId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@MessageId", messageId)
                    };

                    int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                    if (rowsAffected > 0)
                    {
                        ShowSuccess("Message status updated successfully.");
                        LogAdminActivity($"Toggled read status for message ID: {messageId}");
                        LoadMessages();
                    }
                    else
                    {
                        ShowError("Message not found or could not be updated.");
                    }
                }
                else
                {
                    ShowSuccess("Read status toggled (demonstration mode - database not available).");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error toggling read status: {ex.Message}");
                ShowError($"Error updating message status: {ex.Message}");
            }
        }

        /// <summary>
        /// Delete message
        /// </summary>
        private void DeleteMessage(int messageId)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("ContactMessages"))
                {
                    string query = "DELETE FROM ContactMessages WHERE MessageId = @MessageId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@MessageId", messageId)
                    };

                    int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                    if (rowsAffected > 0)
                    {
                        ShowSuccess("Message deleted successfully.");
                        LogAdminActivity($"Deleted message ID: {messageId}");
                        LoadMessages();
                    }
                    else
                    {
                        ShowError("Message not found or could not be deleted.");
                    }
                }
                else
                {
                    ShowSuccess("Message deleted (demonstration mode - database not available).");
                    LoadMessages();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error deleting message: {ex.Message}");
                ShowError($"Error deleting message: {ex.Message}");
            }
        }

        /// <summary>
        /// Get message by ID
        /// </summary>
        private ContactMessage GetMessageById(int messageId)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("ContactMessages"))
                {
                    string query = "SELECT * FROM ContactMessages WHERE MessageId = @MessageId";
                    var parameters = new System.Data.SqlClient.SqlParameter[]
                    {
                        new System.Data.SqlClient.SqlParameter("@MessageId", messageId)
                    };

                    DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        return new ContactMessage
                        {
                            ContactMessageId = Convert.ToInt32(row["MessageId"]),
                            Name = row["Name"].ToString(),
                            Email = row["Email"].ToString(),
                            Phone = row["Phone"]?.ToString(),
                            Subject = row["Subject"]?.ToString() ?? GetSubjectFromProjectType(row["ProjectType"]?.ToString()),
                            Message = row["MessageBody"].ToString(),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            CreatedDate = Convert.ToDateTime(row["MessageDate"])
                        };
                    }
                }
                else
                {
                    // Return null if database not available
                    return null;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting message by ID: {ex.Message}");
            }

            return null;
        }

        /// <summary>
        /// Mark all messages as read
        /// </summary>
        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("ContactMessages"))
                {
                    string query = "UPDATE ContactMessages SET IsRead = 1";
                    int rowsAffected = DatabaseHelper.ExecuteNonQuery(query);
                    
                    ShowSuccess($"Marked {rowsAffected} messages as read.");
                    LogAdminActivity($"Marked all messages as read ({rowsAffected} messages)");
                }
                else
                {
                    ShowSuccess("All messages marked as read (demonstration mode).");
                }
                
                LoadMessages(); // Refresh list
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error marking all as read: {ex.Message}");
                ShowError($"Error marking messages as read: {ex.Message}");
            }
        }

        /// <summary>
        /// Refresh messages list
        /// </summary>
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadMessages();
            ShowSuccess("Messages list refreshed successfully.");
        }

        /// <summary>
        /// Get sender initials for avatar
        /// </summary>
        protected string GetSenderInitials(string name)
        {
            if (string.IsNullOrEmpty(name)) return "?";
            
            string[] parts = name.Trim().Split(' ');
            if (parts.Length >= 2)
            {
                return (parts[0][0].ToString() + parts[1][0].ToString()).ToUpper();
            }
            else if (parts.Length == 1 && parts[0].Length > 0)
            {
                return parts[0][0].ToString().ToUpper();
            }
            
            return "?";
        }

        /// <summary>
        /// Get subject display name
        /// </summary>
        protected string GetSubjectDisplay(string subject)
        {
            switch (subject?.ToLower())
            {
                case "project":
                    return "New Project";
                case "freelance":
                    return "Freelance Opportunity";
                case "consultation":
                    return "Consultation";
                case "collaboration":
                    return "Collaboration";
                case "other":
                    return "General Inquiry";
                default:
                    return "Contact";
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

    /// <summary>
    /// Contact message model
    /// </summary>
    public class ContactMessage
    {
        public int ContactMessageId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public bool IsRead { get; set; }
        public DateTime CreatedDate { get; set; }

        public string FormattedCreatedDate
        {
            get
            {
                TimeSpan timeAgo = DateTime.Now - CreatedDate;
                if (timeAgo.TotalMinutes < 60)
                    return $"{(int)timeAgo.TotalMinutes} minutes ago";
                else if (timeAgo.TotalHours < 24)
                    return $"{(int)timeAgo.TotalHours} hours ago";
                else if (timeAgo.TotalDays < 7)
                    return $"{(int)timeAgo.TotalDays} days ago";
                else
                    return CreatedDate.ToString("MMM dd, yyyy");
            }
        }
    }
}