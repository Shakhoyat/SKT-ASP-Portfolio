using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class DatabaseSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDatabaseInfo();
                CheckConnectionStatus();
                CheckSchemaStatus();
                CheckDataStatus();
            }
        }

        private void LoadDatabaseInfo()
        {
            try
            {
                string connectionString = DatabaseHelper.ConnectionString;
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
                
                lblServerName.Text = builder.DataSource ?? "Unknown";
                lblDatabaseName.Text = builder.InitialCatalog ?? "Unknown";
                lblConnectionString.Text = connectionString;
                
                lblManualServer.Text = builder.DataSource ?? "Unknown";
                lblManualDatabase.Text = builder.InitialCatalog ?? "Unknown";
            }
            catch (Exception ex)
            {
                lblServerName.Text = "Error loading";
                lblDatabaseName.Text = "Error loading";
                lblConnectionString.Text = $"Error: {ex.Message}";
            }
        }

        private void CheckConnectionStatus()
        {
            if (DatabaseHelper.TestConnection())
            {
                SetStatusMessage(lblConnectionStatus, "? Database connection successful!", "status-success");
            }
            else
            {
                SetStatusMessage(lblConnectionStatus, "? Database connection failed! Check your connection string in Web.config.", "status-error");
            }
        }

        private void CheckSchemaStatus()
        {
            try
            {
                if (DatabaseHelper.TestConnection())
                {
                    if (DatabaseHelper.IsDatabaseInitialized())
                    {
                        SetStatusMessage(lblSchemaStatus, "? All required tables exist in the database.", "status-success");
                        btnCreateSchema.Enabled = false;
                        btnCreateSchema.Text = "Schema Already Created";
                    }
                    else
                    {
                        SetStatusMessage(lblSchemaStatus, "?? Database tables are missing. Click the button below to create them.", "status-warning");
                    }
                }
                else
                {
                    SetStatusMessage(lblSchemaStatus, "? Cannot check schema status - database connection failed.", "status-error");
                    btnCreateSchema.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblSchemaStatus, $"? Error checking schema: {ex.Message}", "status-error");
            }
        }

        private void CheckDataStatus()
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    string query = "SELECT COUNT(*) FROM Projects WHERE IsActive = 1";
                    object result = DatabaseHelper.ExecuteScalar(query);
                    int projectCount = Convert.ToInt32(result);

                    if (projectCount > 0)
                    {
                        SetStatusMessage(lblDataStatus, $"? Database contains {projectCount} projects.", "status-success");
                        btnInsertSampleData.Enabled = false;
                        btnInsertSampleData.Text = "Sample Data Already Exists";
                    }
                    else
                    {
                        SetStatusMessage(lblDataStatus, "?? No projects found in database. Click the button below to insert sample data.", "status-warning");
                    }
                }
                else
                {
                    SetStatusMessage(lblDataStatus, "? Cannot check data status - tables don't exist or connection failed.", "status-error");
                    btnInsertSampleData.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblDataStatus, $"? Error checking data status: {ex.Message}", "status-error");
            }
        }

        protected void btnTestConnection_Click(object sender, EventArgs e)
        {
            CheckConnectionStatus();
        }

        protected void btnCreateSchema_Click(object sender, EventArgs e)
        {
            try
            {
                SetStatusMessage(lblSchemaStatus, "? Creating database schema...", "status-info");
                
                bool success = CreateDatabaseSchema();
                
                if (success)
                {
                    SetStatusMessage(lblSchemaStatus, "? Database schema created successfully!", "status-success");
                    btnCreateSchema.Enabled = false;
                    btnCreateSchema.Text = "Schema Created";
                    CheckDataStatus(); // Refresh data status
                }
                else
                {
                    SetStatusMessage(lblSchemaStatus, "? Failed to create database schema. Check the debug output for details.", "status-error");
                }
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblSchemaStatus, $"? Error creating schema: {ex.Message}", "status-error");
            }
        }

        protected void btnInsertSampleData_Click(object sender, EventArgs e)
        {
            try
            {
                SetStatusMessage(lblDataStatus, "? Inserting sample data...", "status-info");
                
                bool success = DatabaseHelper.InitializeSampleData();
                
                if (success)
                {
                    SetStatusMessage(lblDataStatus, "? Sample data inserted successfully!", "status-success");
                    btnInsertSampleData.Enabled = false;
                    btnInsertSampleData.Text = "Sample Data Inserted";
                }
                else
                {
                    SetStatusMessage(lblDataStatus, "? Failed to insert sample data. Check the debug output for details.", "status-error");
                }
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblDataStatus, $"? Error inserting sample data: {ex.Message}", "status-error");
            }
        }

        protected void btnFullSetup_Click(object sender, EventArgs e)
        {
            try
            {
                bool schemaSuccess = true;
                bool dataSuccess = true;

                // Create schema if needed
                if (!DatabaseHelper.IsDatabaseInitialized())
                {
                    SetStatusMessage(lblSchemaStatus, "? Creating database schema...", "status-info");
                    schemaSuccess = CreateDatabaseSchema();
                }

                // Insert sample data if needed
                if (schemaSuccess)
                {
                    SetStatusMessage(lblDataStatus, "? Inserting sample data...", "status-info");
                    dataSuccess = DatabaseHelper.InitializeSampleData();
                }

                if (schemaSuccess && dataSuccess)
                {
                    SetStatusMessage(lblSchemaStatus, "? Database setup completed successfully!", "status-success");
                    SetStatusMessage(lblDataStatus, "? Sample data inserted successfully!", "status-success");
                    
                    // Disable buttons
                    btnCreateSchema.Enabled = false;
                    btnInsertSampleData.Enabled = false;
                    btnFullSetup.Enabled = false;
                    btnFullSetup.Text = "Setup Complete";
                    
                    // Show success message
                    ClientScript.RegisterStartupScript(this.GetType(), "success", 
                        "alert('Database setup completed successfully! You can now view your projects.');", true);
                }
                else
                {
                    SetStatusMessage(lblSchemaStatus, "? Setup failed. Check the debug output for details.", "status-error");
                }
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblSchemaStatus, $"? Error during full setup: {ex.Message}", "status-error");
            }
        }

        protected void btnResetDatabase_Click(object sender, EventArgs e)
        {
            try
            {
                // Drop and recreate tables
                string[] dropCommands = {
                    "IF OBJECT_ID('ContactMessages', 'U') IS NOT NULL DROP TABLE ContactMessages",
                    "IF OBJECT_ID('Education', 'U') IS NOT NULL DROP TABLE Education",
                    "IF OBJECT_ID('Achievements', 'U') IS NOT NULL DROP TABLE Achievements",
                    "IF OBJECT_ID('Skills', 'U') IS NOT NULL DROP TABLE Skills",
                    "IF OBJECT_ID('Projects', 'U') IS NOT NULL DROP TABLE Projects"
                };

                foreach (string command in dropCommands)
                {
                    DatabaseHelper.ExecuteNonQuery(command);
                }

                SetStatusMessage(lblSchemaStatus, "? Database reset successfully! You can now recreate the schema.", "status-success");
                SetStatusMessage(lblDataStatus, "?? All data has been deleted.", "status-warning");
                
                // Re-enable buttons
                btnCreateSchema.Enabled = true;
                btnCreateSchema.Text = "Create Database Schema";
                btnInsertSampleData.Enabled = false;
                btnFullSetup.Enabled = true;
                btnFullSetup.Text = "Complete Setup (Schema + Data)";
            }
            catch (Exception ex)
            {
                SetStatusMessage(lblSchemaStatus, $"? Error resetting database: {ex.Message}", "status-error");
            }
        }

        private bool CreateDatabaseSchema()
        {
            try
            {
                // Create Projects table
                string createProjectsTable = @"
                    IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Projects' AND xtype='U')
                    BEGIN
                        CREATE TABLE Projects (
                            ProjectId INT IDENTITY(1,1) PRIMARY KEY,
                            Title NVARCHAR(200) NOT NULL,
                            Description NTEXT NOT NULL,
                            ShortDescription NVARCHAR(500) NOT NULL,
                            TechnologiesUsed NVARCHAR(500) NOT NULL,
                            ProjectUrl NVARCHAR(500) NULL,
                            GitHubUrl NVARCHAR(500) NULL,
                            ImageUrl NVARCHAR(500) NULL,
                            StartDate DATE NOT NULL,
                            EndDate DATE NULL,
                            IsActive BIT NOT NULL DEFAULT 1,
                            DisplayOrder INT NOT NULL DEFAULT 0,
                            CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
                            UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
                        )
                    END";

                DatabaseHelper.ExecuteNonQuery(createProjectsTable);

                // Create other tables
                string[] createTableCommands = {
                    @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Skills' AND xtype='U')
                      BEGIN
                          CREATE TABLE Skills (
                              SkillId INT IDENTITY(1,1) PRIMARY KEY,
                              SkillName NVARCHAR(100) NOT NULL,
                              Category NVARCHAR(50) NOT NULL,
                              ProficiencyLevel INT NOT NULL,
                              Description NVARCHAR(1000) NULL,
                              IconClass NVARCHAR(100) NULL,
                              IconColor NVARCHAR(20) NULL,
                              IsActive BIT NOT NULL DEFAULT 1,
                              DisplayOrder INT NOT NULL DEFAULT 0,
                              CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
                          )
                      END",

                    @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Achievements' AND xtype='U')
                      BEGIN
                          CREATE TABLE Achievements (
                              AchievementId INT IDENTITY(1,1) PRIMARY KEY,
                              Title NVARCHAR(200) NOT NULL,
                              Description NTEXT NOT NULL,
                              AchievementDate DATE NOT NULL,
                              Organization NVARCHAR(200) NULL,
                              CertificateUrl NVARCHAR(500) NULL,
                              ImageUrl NVARCHAR(500) NULL,
                              IsActive BIT NOT NULL DEFAULT 1,
                              DisplayOrder INT NOT NULL DEFAULT 0,
                              CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
                          )
                      END",

                    @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Education' AND xtype='U')
                      BEGIN
                          CREATE TABLE Education (
                              EducationId INT IDENTITY(1,1) PRIMARY KEY,
                              Institution NVARCHAR(200) NOT NULL,
                              Degree NVARCHAR(200) NOT NULL,
                              FieldOfStudy NVARCHAR(200) NOT NULL,
                              StartDate DATE NOT NULL,
                              EndDate DATE NULL,
                              Grade NVARCHAR(20) NULL,
                              Description NTEXT NULL,
                              IsActive BIT NOT NULL DEFAULT 1,
                              DisplayOrder INT NOT NULL DEFAULT 0,
                              CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
                          )
                      END",

                    @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ContactMessages' AND xtype='U')
                      BEGIN
                          CREATE TABLE ContactMessages (
                              MessageId INT IDENTITY(1,1) PRIMARY KEY,
                              Name NVARCHAR(100) NOT NULL,
                              Email NVARCHAR(200) NOT NULL,
                              Subject NVARCHAR(200) NOT NULL,
                              Message NTEXT NOT NULL,
                              IsRead BIT NOT NULL DEFAULT 0,
                              CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
                              ReadDate DATETIME NULL
                          )
                      END"
                };

                foreach (string command in createTableCommands)
                {
                    DatabaseHelper.ExecuteNonQuery(command);
                }

                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error creating database schema: {ex.Message}");
                return false;
            }
        }

        private void SetStatusMessage(Label label, string message, string cssClass)
        {
            label.Text = message;
            label.CssClass = $"status-message {cssClass}";
        }
    }
}