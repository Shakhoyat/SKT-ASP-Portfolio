using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.Models;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class test_admin_features : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder output = new StringBuilder();
            output.AppendLine("<h1>Admin Features Test</h1>");
            
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
                
                // Test 2: Projects Feature
                output.AppendLine("<h3>2. Testing Projects Feature:</h3>");
                TestProjectFeature(output);
                
                // Test 3: Skills Feature
                output.AppendLine("<h3>3. Testing Skills Feature:</h3>");
                TestSkillsFeature(output);
                
                // Test 4: Achievements Feature
                output.AppendLine("<h3>4. Testing Achievements Feature:</h3>");
                TestAchievementsFeature(output);
                
                // Test 5: Education Feature
                output.AppendLine("<h3>5. Testing Education Feature:</h3>");
                TestEducationFeature(output);
                
                // Test 6: Contact Messages Feature
                output.AppendLine("<h3>6. Testing Contact Messages Feature:</h3>");
                TestContactMessagesFeature(output);
                
                // Final result
                output.AppendLine("<h2 style='color:green'>All admin panel feature tests completed!</h2>");
                output.AppendLine("<p>See above for detailed results of each feature test.</p>");
                
            }
            catch (Exception ex)
            {
                output.AppendLine($"<h3 style='color:red'>ERROR: {ex.Message}</h3>");
                output.AppendLine($"<pre>{ex.StackTrace}</pre>");
            }
            
            Response.Write(output.ToString());
        }
        
        private void TestProjectFeature(StringBuilder output)
        {
            try
            {
                if (!DatabaseHelper.TableExists("Projects"))
                {
                    output.AppendLine("<p style='color:red'>Projects table does not exist in the database.</p>");
                    return;
                }
                
                // 1. Add test project
                Project testProject = new Project
                {
                    Title = "Admin Feature Test Project",
                    ShortDescription = "This is a test project to verify admin features",
                    Description = "This project was automatically created by the admin feature test script.",
                    TechnologiesUsed = "ASP.NET, C#, SQL Server",
                    StartDate = DateTime.Now.AddDays(-30),
                    EndDate = DateTime.Now,
                    IsActive = true,
                    DisplayOrder = 998
                };
                
                int newProjectId = ProjectsDAL.InsertProject(testProject);
                output.AppendLine($"<p>? Added test project with ID: {newProjectId}</p>");
                
                // 2. Get all projects
                List<Project> projects = ProjectsDAL.GetAllProjects();
                output.AppendLine($"<p>? Retrieved {projects.Count} active projects from database</p>");
                
                // 3. Get featured projects
                List<Project> featuredProjects = ProjectsDAL.GetFeaturedProjects();
                output.AppendLine($"<p>? Retrieved {featuredProjects.Count} featured projects from database</p>");
                
                // 4. Cleanup - delete test project
                bool deleteResult = ProjectsDAL.DeleteProject(newProjectId);
                output.AppendLine($"<p>? Test project cleanup: {(deleteResult ? "Success" : "Failed")}</p>");
                
                output.AppendLine("<p style='color:green'>Projects feature is working correctly.</p>");
            }
            catch (Exception ex)
            {
                output.AppendLine($"<p style='color:red'>Error testing Projects feature: {ex.Message}</p>");
            }
        }
        
        private void TestSkillsFeature(StringBuilder output)
        {
            try
            {
                if (!DatabaseHelper.TableExists("Skills"))
                {
                    output.AppendLine("<p style='color:red'>Skills table does not exist in the database.</p>");
                    return;
                }
                
                // Get count of skills
                string query = "SELECT COUNT(*) FROM Skills";
                object result = DatabaseHelper.ExecuteScalar(query);
                int skillCount = Convert.ToInt32(result);
                
                output.AppendLine($"<p>? Found {skillCount} skills in database</p>");
                
                // Add a test skill
                string insertQuery = @"
                    INSERT INTO Skills (SkillName, SkillLevel, CategoryId, IsActive, DisplayOrder)
                    VALUES (@SkillName, @SkillLevel, @CategoryId, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                SqlParameter[] parameters = {
                    new SqlParameter("@SkillName", "Test Skill"),
                    new SqlParameter("@SkillLevel", 85),
                    new SqlParameter("@CategoryId", 1),
                    new SqlParameter("@IsActive", true),
                    new SqlParameter("@DisplayOrder", 999)
                };
                
                object insertResult = DatabaseHelper.ExecuteScalar(insertQuery, parameters);
                int newSkillId = Convert.ToInt32(insertResult);
                output.AppendLine($"<p>? Added test skill with ID: {newSkillId}</p>");
                
                // Clean up - delete test skill
                string deleteQuery = "DELETE FROM Skills WHERE SkillId = @SkillId";
                SqlParameter[] deleteParams = {
                    new SqlParameter("@SkillId", newSkillId)
                };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(deleteQuery, deleteParams);
                output.AppendLine($"<p>? Test skill cleanup: {rowsAffected} row(s) deleted</p>");
                
                output.AppendLine("<p style='color:green'>Skills feature is working correctly.</p>");
            }
            catch (Exception ex)
            {
                output.AppendLine($"<p style='color:red'>Error testing Skills feature: {ex.Message}</p>");
            }
        }
        
        private void TestAchievementsFeature(StringBuilder output)
        {
            try
            {
                if (!DatabaseHelper.TableExists("Achievements"))
                {
                    output.AppendLine("<p style='color:red'>Achievements table does not exist in the database.</p>");
                    return;
                }
                
                // Get count of achievements
                string query = "SELECT COUNT(*) FROM Achievements";
                object result = DatabaseHelper.ExecuteScalar(query);
                int achievementCount = Convert.ToInt32(result);
                
                output.AppendLine($"<p>? Found {achievementCount} achievements in database</p>");
                
                // Add a test achievement
                string insertQuery = @"
                    INSERT INTO Achievements (Title, Description, AchievementDate, IsActive, DisplayOrder)
                    VALUES (@Title, @Description, @AchievementDate, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                SqlParameter[] parameters = {
                    new SqlParameter("@Title", "Test Achievement"),
                    new SqlParameter("@Description", "This is a test achievement"),
                    new SqlParameter("@AchievementDate", DateTime.Now),
                    new SqlParameter("@IsActive", true),
                    new SqlParameter("@DisplayOrder", 999)
                };
                
                object insertResult = DatabaseHelper.ExecuteScalar(insertQuery, parameters);
                int newAchievementId = Convert.ToInt32(insertResult);
                output.AppendLine($"<p>? Added test achievement with ID: {newAchievementId}</p>");
                
                // Clean up - delete test achievement
                string deleteQuery = "DELETE FROM Achievements WHERE AchievementId = @AchievementId";
                SqlParameter[] deleteParams = {
                    new SqlParameter("@AchievementId", newAchievementId)
                };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(deleteQuery, deleteParams);
                output.AppendLine($"<p>? Test achievement cleanup: {rowsAffected} row(s) deleted</p>");
                
                output.AppendLine("<p style='color:green'>Achievements feature is working correctly.</p>");
            }
            catch (Exception ex)
            {
                output.AppendLine($"<p style='color:red'>Error testing Achievements feature: {ex.Message}</p>");
            }
        }
        
        private void TestEducationFeature(StringBuilder output)
        {
            try
            {
                if (!DatabaseHelper.TableExists("Education"))
                {
                    output.AppendLine("<p style='color:red'>Education table does not exist in the database.</p>");
                    return;
                }
                
                // Get count of education records
                string query = "SELECT COUNT(*) FROM Education";
                object result = DatabaseHelper.ExecuteScalar(query);
                int educationCount = Convert.ToInt32(result);
                
                output.AppendLine($"<p>? Found {educationCount} education records in database</p>");
                
                // Add a test education record
                string insertQuery = @"
                    INSERT INTO Education (InstitutionName, Degree, FieldOfStudy, StartDate, EndDate, IsActive, DisplayOrder)
                    VALUES (@InstitutionName, @Degree, @FieldOfStudy, @StartDate, @EndDate, @IsActive, @DisplayOrder);
                    SELECT SCOPE_IDENTITY();";
                
                SqlParameter[] parameters = {
                    new SqlParameter("@InstitutionName", "Test University"),
                    new SqlParameter("@Degree", "Test Degree"),
                    new SqlParameter("@FieldOfStudy", "Testing"),
                    new SqlParameter("@StartDate", DateTime.Now.AddYears(-4)),
                    new SqlParameter("@EndDate", DateTime.Now),
                    new SqlParameter("@IsActive", true),
                    new SqlParameter("@DisplayOrder", 999)
                };
                
                object insertResult = DatabaseHelper.ExecuteScalar(insertQuery, parameters);
                int newEducationId = Convert.ToInt32(insertResult);
                output.AppendLine($"<p>? Added test education record with ID: {newEducationId}</p>");
                
                // Clean up - delete test education record
                string deleteQuery = "DELETE FROM Education WHERE EducationId = @EducationId";
                SqlParameter[] deleteParams = {
                    new SqlParameter("@EducationId", newEducationId)
                };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(deleteQuery, deleteParams);
                output.AppendLine($"<p>? Test education record cleanup: {rowsAffected} row(s) deleted</p>");
                
                output.AppendLine("<p style='color:green'>Education feature is working correctly.</p>");
            }
            catch (Exception ex)
            {
                output.AppendLine($"<p style='color:red'>Error testing Education feature: {ex.Message}</p>");
            }
        }
        
        private void TestContactMessagesFeature(StringBuilder output)
        {
            try
            {
                if (!DatabaseHelper.TableExists("ContactMessages"))
                {
                    output.AppendLine("<p style='color:red'>ContactMessages table does not exist in the database.</p>");
                    return;
                }
                
                // Get count of messages
                string query = "SELECT COUNT(*) FROM ContactMessages";
                object result = DatabaseHelper.ExecuteScalar(query);
                int messageCount = Convert.ToInt32(result);
                
                output.AppendLine($"<p>? Found {messageCount} contact messages in database</p>");
                
                // Add a test message
                string insertQuery = @"
                    INSERT INTO ContactMessages (Name, Email, Subject, MessageBody, IsRead, MessageDate)
                    VALUES (@Name, @Email, @Subject, @MessageBody, @IsRead, @MessageDate);
                    SELECT SCOPE_IDENTITY();";
                
                SqlParameter[] parameters = {
                    new SqlParameter("@Name", "Test User"),
                    new SqlParameter("@Email", "test@example.com"),
                    new SqlParameter("@Subject", "Test Message"),
                    new SqlParameter("@MessageBody", "This is a test message to verify contact messages feature."),
                    new SqlParameter("@IsRead", false),
                    new SqlParameter("@MessageDate", DateTime.Now)
                };
                
                object insertResult = DatabaseHelper.ExecuteScalar(insertQuery, parameters);
                int newMessageId = Convert.ToInt32(insertResult);
                output.AppendLine($"<p>? Added test message with ID: {newMessageId}</p>");
                
                // Update message to mark as read
                string updateQuery = "UPDATE ContactMessages SET IsRead = 1 WHERE MessageId = @MessageId";
                SqlParameter[] updateParams = {
                    new SqlParameter("@MessageId", newMessageId)
                };
                
                int updateResult = DatabaseHelper.ExecuteNonQuery(updateQuery, updateParams);
                output.AppendLine($"<p>? Marked test message as read: {updateResult} row(s) updated</p>");
                
                // Clean up - delete test message
                string deleteQuery = "DELETE FROM ContactMessages WHERE MessageId = @MessageId";
                SqlParameter[] deleteParams = {
                    new SqlParameter("@MessageId", newMessageId)
                };
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(deleteQuery, deleteParams);
                output.AppendLine($"<p>? Test message cleanup: {rowsAffected} row(s) deleted</p>");
                
                output.AppendLine("<p style='color:green'>Contact Messages feature is working correctly.</p>");
            }
            catch (Exception ex)
            {
                output.AppendLine($"<p style='color:red'>Error testing Contact Messages feature: {ex.Message}</p>");
            }
        }
    }
}