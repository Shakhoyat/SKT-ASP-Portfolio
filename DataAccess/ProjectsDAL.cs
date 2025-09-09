using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.Models;

namespace WebApplication1.DataAccess
{
    public static class ProjectsDAL
    {
        public static List<Project> GetAllProjects()
        {
            var projects = new List<Project>();
            var query = "SELECT * FROM Projects WHERE IsActive = 1 ORDER BY DisplayOrder, CreatedDate DESC";
            var dt = DatabaseHelper.ExecuteQuery(query);
            
            foreach (DataRow row in dt.Rows)
                projects.Add(MapProject(row));
            
            return projects;
        }

        public static Project GetProjectById(int projectId)
        {
            var query = "SELECT * FROM Projects WHERE ProjectId = @ProjectId AND IsActive = 1";
            var dt = DatabaseHelper.ExecuteQuery(query, new SqlParameter("@ProjectId", projectId));
            return dt.Rows.Count > 0 ? MapProject(dt.Rows[0]) : null;
        }

        public static List<Project> GetFeaturedProjects()
        {
            var projects = new List<Project>();
            var query = "SELECT TOP 3 * FROM Projects WHERE IsActive = 1 ORDER BY DisplayOrder, CreatedDate DESC";
            var dt = DatabaseHelper.ExecuteQuery(query);
            
            foreach (DataRow row in dt.Rows)
                projects.Add(MapProject(row));
            
            return projects;
        }

        public static int InsertProject(Project project)
        {
            var query = @"INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                         ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, DisplayOrder, UpdatedDate)
                         VALUES (@Title, @Description, @ShortDescription, @TechnologiesUsed, 
                         @ProjectUrl, @GitHubUrl, @ImageUrl, @StartDate, @EndDate, @IsActive, @DisplayOrder, GETDATE());
                         SELECT SCOPE_IDENTITY();";
            
            var result = DatabaseHelper.ExecuteScalar(query, CreateParams(project));
            return Convert.ToInt32(result);
        }

        public static bool UpdateProject(Project project)
        {
            var query = @"UPDATE Projects SET Title = @Title, Description = @Description, ShortDescription = @ShortDescription,
                         TechnologiesUsed = @TechnologiesUsed, ProjectUrl = @ProjectUrl, GitHubUrl = @GitHubUrl, 
                         ImageUrl = @ImageUrl, StartDate = @StartDate, EndDate = @EndDate, IsActive = @IsActive, 
                         DisplayOrder = @DisplayOrder, UpdatedDate = GETDATE() WHERE ProjectId = @ProjectId";
            
            return DatabaseHelper.ExecuteNonQuery(query, CreateParams(project)) > 0;
        }

        public static bool DeleteProject(int projectId)
        {
            var query = "UPDATE Projects SET IsActive = 0, UpdatedDate = GETDATE() WHERE ProjectId = @ProjectId";
            return DatabaseHelper.ExecuteNonQuery(query, new SqlParameter("@ProjectId", projectId)) > 0;
        }

        private static Project MapProject(DataRow row)
        {
            return new Project
            {
                ProjectId = Convert.ToInt32(row["ProjectId"]),
                Title = row["Title"].ToString(),
                Description = row["Description"].ToString(),
                ShortDescription = row["ShortDescription"].ToString(),
                TechnologiesUsed = row["TechnologiesUsed"].ToString(),
                ProjectUrl = row["ProjectUrl"] == DBNull.Value ? null : row["ProjectUrl"].ToString(),
                GitHubUrl = row["GitHubUrl"] == DBNull.Value ? null : row["GitHubUrl"].ToString(),
                ImageUrl = row["ImageUrl"] == DBNull.Value ? null : row["ImageUrl"].ToString(),
                StartDate = Convert.ToDateTime(row["StartDate"]),
                EndDate = row["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["EndDate"]),
                IsActive = Convert.ToBoolean(row["IsActive"]),
                DisplayOrder = Convert.ToInt32(row["DisplayOrder"]),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                UpdatedDate = Convert.ToDateTime(row["UpdatedDate"])
            };
        }

        private static SqlParameter[] CreateParams(Project project)
        {
            return new[]
            {
                new SqlParameter("@ProjectId", project.ProjectId),
                new SqlParameter("@Title", project.Title ?? ""),
                new SqlParameter("@Description", project.Description ?? ""),
                new SqlParameter("@ShortDescription", project.ShortDescription ?? ""),
                new SqlParameter("@TechnologiesUsed", project.TechnologiesUsed ?? ""),
                new SqlParameter("@ProjectUrl", (object)project.ProjectUrl ?? DBNull.Value),
                new SqlParameter("@GitHubUrl", (object)project.GitHubUrl ?? DBNull.Value),
                new SqlParameter("@ImageUrl", (object)project.ImageUrl ?? DBNull.Value),
                new SqlParameter("@StartDate", project.StartDate),
                new SqlParameter("@EndDate", (object)project.EndDate ?? DBNull.Value),
                new SqlParameter("@IsActive", project.IsActive),
                new SqlParameter("@DisplayOrder", project.DisplayOrder)
            };
        }
    }
}