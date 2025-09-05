using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.DataAccess
{
    /// <summary>
    /// Data access layer for Projects
    /// </summary>
    public static class ProjectsDAL
    {
        /// <summary>
        /// Get all active projects ordered by display order
        /// </summary>
        /// <returns>List of active projects</returns>
        public static List<Project> GetAllProjects()
        {
            List<Project> projects = new List<Project>();
            
            string query = @"
                SELECT ProjectId, Title, Description, ShortDescription, TechnologiesUsed, 
                       ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, 
                       DisplayOrder, CreatedDate, UpdatedDate
                FROM Projects 
                WHERE IsActive = 1 
                ORDER BY DisplayOrder, CreatedDate DESC";

            try
            {
                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    projects.Add(MapDataRowToProject(row));
                }
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging)
                System.Diagnostics.Debug.WriteLine("Error getting projects: " + ex.Message);
                throw;
            }

            return projects;
        }

        /// <summary>
        /// Get a single project by ID
        /// </summary>
        /// <param name="projectId">Project ID</param>
        /// <returns>Project object or null if not found</returns>
        public static Project GetProjectById(int projectId)
        {
            string query = @"
                SELECT ProjectId, Title, Description, ShortDescription, TechnologiesUsed, 
                       ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, 
                       DisplayOrder, CreatedDate, UpdatedDate
                FROM Projects 
                WHERE ProjectId = @ProjectId AND IsActive = 1";

            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@ProjectId", projectId)
                };

                DataTable dt = DatabaseHelper.ExecuteQuery(query, parameters);
                
                if (dt.Rows.Count > 0)
                {
                    return MapDataRowToProject(dt.Rows[0]);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting project by ID: " + ex.Message);
                throw;
            }

            return null;
        }

        /// <summary>
        /// Get featured projects (top 3 by display order)
        /// </summary>
        /// <returns>List of featured projects</returns>
        public static List<Project> GetFeaturedProjects()
        {
            List<Project> projects = new List<Project>();
            
            string query = @"
                SELECT TOP 3 ProjectId, Title, Description, ShortDescription, TechnologiesUsed, 
                       ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, 
                       DisplayOrder, CreatedDate, UpdatedDate
                FROM Projects 
                WHERE IsActive = 1 
                ORDER BY DisplayOrder, CreatedDate DESC";

            try
            {
                DataTable dt = DatabaseHelper.ExecuteQuery(query);
                
                foreach (DataRow row in dt.Rows)
                {
                    projects.Add(MapDataRowToProject(row));
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting featured projects: " + ex.Message);
                throw;
            }

            return projects;
        }

        /// <summary>
        /// Insert a new project
        /// </summary>
        /// <param name="project">Project to insert</param>
        /// <returns>New project ID</returns>
        public static int InsertProject(Project project)
        {
            string query = @"
                INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                                    ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, 
                                    IsActive, DisplayOrder, UpdatedDate)
                VALUES (@Title, @Description, @ShortDescription, @TechnologiesUsed, 
                        @ProjectUrl, @GitHubUrl, @ImageUrl, @StartDate, @EndDate, 
                        @IsActive, @DisplayOrder, GETDATE());
                SELECT SCOPE_IDENTITY();";

            try
            {
                SqlParameter[] parameters = CreateProjectParameters(project);
                
                object result = DatabaseHelper.ExecuteScalar(query, parameters);
                return Convert.ToInt32(result);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error inserting project: " + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Update an existing project
        /// </summary>
        /// <param name="project">Project to update</param>
        /// <returns>True if successful</returns>
        public static bool UpdateProject(Project project)
        {
            string query = @"
                UPDATE Projects 
                SET Title = @Title, Description = @Description, ShortDescription = @ShortDescription,
                    TechnologiesUsed = @TechnologiesUsed, ProjectUrl = @ProjectUrl, 
                    GitHubUrl = @GitHubUrl, ImageUrl = @ImageUrl, StartDate = @StartDate, 
                    EndDate = @EndDate, IsActive = @IsActive, DisplayOrder = @DisplayOrder,
                    UpdatedDate = GETDATE()
                WHERE ProjectId = @ProjectId";

            try
            {
                SqlParameter[] parameters = CreateProjectParameters(project);
                
                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error updating project: " + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Delete a project (soft delete by setting IsActive = false)
        /// </summary>
        /// <param name="projectId">Project ID to delete</param>
        /// <returns>True if successful</returns>
        public static bool DeleteProject(int projectId)
        {
            string query = "UPDATE Projects SET IsActive = 0, UpdatedDate = GETDATE() WHERE ProjectId = @ProjectId";

            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@ProjectId", projectId)
                };

                int rowsAffected = DatabaseHelper.ExecuteNonQuery(query, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error deleting project: " + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Map DataRow to Project object
        /// </summary>
        /// <param name="row">DataRow from database</param>
        /// <returns>Project object</returns>
        private static Project MapDataRowToProject(DataRow row)
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

        /// <summary>
        /// Create SQL parameters for Project operations
        /// </summary>
        /// <param name="project">Project object</param>
        /// <returns>Array of SQL parameters</returns>
        private static SqlParameter[] CreateProjectParameters(Project project)
        {
            return new SqlParameter[]
            {
                new SqlParameter("@ProjectId", project.ProjectId),
                new SqlParameter("@Title", project.Title ?? string.Empty),
                new SqlParameter("@Description", project.Description ?? string.Empty),
                new SqlParameter("@ShortDescription", project.ShortDescription ?? string.Empty),
                new SqlParameter("@TechnologiesUsed", project.TechnologiesUsed ?? string.Empty),
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