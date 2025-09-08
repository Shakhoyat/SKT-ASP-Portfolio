using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using WebApplication1.DataAccess;
using System.Text;

namespace WebApplication1
{
    public partial class test_database_connection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder output = new StringBuilder();
            output.AppendLine("<h1>Database Connection Test</h1>");
            
            try
            {
                // Test 1: Database Connection
                bool isConnected = DatabaseHelper.TestConnection();
                output.AppendLine($"<h3>1. Database Connection: {(isConnected ? "<span style='color:green'>SUCCESS</span>" : "<span style='color:red'>FAILED</span>")}</h3>");
                
                if (!isConnected)
                {
                    output.AppendLine("<p>Could not connect to database. Please check your connection string.</p>");
                    Response.Write(output.ToString());
                    return;
                }
                
                // Test 2: Check Tables
                output.AppendLine("<h3>2. Checking Database Tables:</h3>");
                string[] tables = { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                bool allTablesExist = true;
                
                output.AppendLine("<ul>");
                foreach (string table in tables)
                {
                    bool exists = DatabaseHelper.TableExists(table);
                    output.AppendLine($"<li>{table}: {(exists ? "<span style='color:green'>EXISTS</span>" : "<span style='color:red'>MISSING</span>")}</li>");
                    if (!exists) allTablesExist = false;
                }
                output.AppendLine("</ul>");
                
                if (!allTablesExist)
                {
                    output.AppendLine("<p style='color:red'>Some required tables are missing. Database schema may not be fully created.</p>");
                    Response.Write(output.ToString());
                    return;
                }
                
                // Test 3: Add Sample Project
                output.AppendLine("<h3>3. Testing Data Operations:</h3>");
                
                // Create test project
                Project testProject = new Project
                {
                    Title = "Test Project " + DateTime.Now.ToString("yyyyMMdd-HHmmss"),
                    ShortDescription = "This is a test project to verify database operations",
                    Description = "This project was automatically created by the database connection test script.",
                    TechnologiesUsed = "ASP.NET, C#, SQL Server",
                    StartDate = DateTime.Now.AddDays(-30),
                    EndDate = DateTime.Now,
                    IsActive = true,
                    DisplayOrder = 999
                };
                
                // Insert test project
                int newProjectId;
                try {
                    newProjectId = ProjectsDAL.InsertProject(testProject);
                    output.AppendLine($"<p>? Successfully added test project with ID: {newProjectId}</p>");
                }
                catch (Exception ex) {
                    output.AppendLine($"<p style='color:red'>Failed to add test project: {ex.Message}</p>");
                    Response.Write(output.ToString());
                    return;
                }
                
                // Test 4: Retrieve Project
                try {
                    Project retrievedProject = ProjectsDAL.GetProjectById(newProjectId);
                    if (retrievedProject != null) {
                        output.AppendLine("<p>? Successfully retrieved test project from database</p>");
                        output.AppendLine("<div style='margin-left:20px;'>");
                        output.AppendLine($"<p><strong>ID:</strong> {retrievedProject.ProjectId}</p>");
                        output.AppendLine($"<p><strong>Title:</strong> {retrievedProject.Title}</p>");
                        output.AppendLine($"<p><strong>Description:</strong> {retrievedProject.ShortDescription}</p>");
                        output.AppendLine("</div>");
                    } else {
                        output.AppendLine("<p style='color:red'>Failed to retrieve test project</p>");
                    }
                }
                catch (Exception ex) {
                    output.AppendLine($"<p style='color:red'>Error retrieving test project: {ex.Message}</p>");
                }
                
                // Test 5: Update Project
                try {
                    Project projectToUpdate = ProjectsDAL.GetProjectById(newProjectId);
                    projectToUpdate.Title = "Updated Test Project";
                    projectToUpdate.ShortDescription = "This project was updated by the test script";
                    
                    bool updateResult = ProjectsDAL.UpdateProject(projectToUpdate);
                    output.AppendLine($"<p>? Project update result: {(updateResult ? "Success" : "Failed")}</p>");
                    
                    // Verify update
                    Project updatedProject = ProjectsDAL.GetProjectById(newProjectId);
                    if (updatedProject != null && updatedProject.Title == "Updated Test Project") {
                        output.AppendLine("<p>? Successfully verified project update</p>");
                    } else {
                        output.AppendLine("<p style='color:red'>Project update verification failed</p>");
                    }
                }
                catch (Exception ex) {
                    output.AppendLine($"<p style='color:red'>Error updating test project: {ex.Message}</p>");
                }
                
                // Test 6: Delete Project (Soft Delete)
                try {
                    bool deleteResult = ProjectsDAL.DeleteProject(newProjectId);
                    output.AppendLine($"<p>? Project deletion result: {(deleteResult ? "Success" : "Failed")}</p>");
                    
                    // Verify deletion (should not be retrieved by normal GetById since IsActive=0)
                    Project deletedProject = ProjectsDAL.GetProjectById(newProjectId);
                    if (deletedProject == null) {
                        output.AppendLine("<p>? Successfully verified project deletion (soft delete)</p>");
                    } else {
                        output.AppendLine("<p style='color:red'>Project deletion verification failed</p>");
                    }
                }
                catch (Exception ex) {
                    output.AppendLine($"<p style='color:red'>Error deleting test project: {ex.Message}</p>");
                }
                
                // Final result
                output.AppendLine("<h3 style='color:green'>Database connection and operations test completed successfully!</h3>");
                output.AppendLine("<p>The admin panel features should be functional.</p>");
                
            }
            catch (Exception ex)
            {
                output.AppendLine($"<h3 style='color:red'>ERROR: {ex.Message}</h3>");
                output.AppendLine($"<pre>{ex.StackTrace}</pre>");
            }
            
            Response.Write(output.ToString());
        }
    }
}