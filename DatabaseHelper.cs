using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    /// <summary>
    /// Database helper class for portfolio application
    /// Provides common database operations and connection management
    /// </summary>
    public static class DatabaseHelper
    {
        /// <summary>
        /// Gets the connection string from Web.config
        /// </summary>
        public static string ConnectionString
        {
            get
            {
                try
                {
                    var connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"];
                    if (connectionString == null)
                    {
                        throw new ConfigurationErrorsException("PortfolioConnectionString not found in Web.config");
                    }
                    return connectionString.ConnectionString;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error getting connection string: " + ex.Message);
                    throw;
                }
            }
        }

        /// <summary>
        /// Creates and returns a new SQL connection
        /// </summary>
        /// <returns>SqlConnection object</returns>
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        /// <summary>
        /// Tests database connection
        /// </summary>
        /// <returns>True if connection successful, false otherwise</returns>
        public static bool TestConnection()
        {
            try
            {
                using (SqlConnection connection = GetConnection())
                {
                    connection.Open();
                    var isConnected = connection.State == ConnectionState.Open;
                    System.Diagnostics.Debug.WriteLine($"Database connection test: {(isConnected ? "SUCCESS" : "FAILED")}");
                    return isConnected;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Database connection failed: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Check if a table exists in the database
        /// </summary>
        /// <param name="tableName">Name of the table to check</param>
        /// <returns>True if table exists, false otherwise</returns>
        public static bool TableExists(string tableName)
        {
            try
            {
                string query = @"
                    SELECT COUNT(*) 
                    FROM INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_NAME = @TableName";

                SqlParameter[] parameters = {
                    new SqlParameter("@TableName", tableName)
                };

                object result = ExecuteScalar(query, parameters);
                return Convert.ToInt32(result) > 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error checking if table '{tableName}' exists: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Get database schema version or check if database is initialized
        /// </summary>
        /// <returns>True if database has required tables</returns>
        public static bool IsDatabaseInitialized()
        {
            try
            {
                // Check if key tables exist
                string[] requiredTables = { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
                
                foreach (string table in requiredTables)
                {
                    if (!TableExists(table))
                    {
                        System.Diagnostics.Debug.WriteLine($"Required table '{table}' not found");
                        return false;
                    }
                }
                
                System.Diagnostics.Debug.WriteLine("Database is properly initialized with all required tables");
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error checking database initialization: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Executes a non-query SQL command (INSERT, UPDATE, DELETE)
        /// </summary>
        /// <param name="query">SQL query to execute</param>
        /// <param name="parameters">SQL parameters</param>
        /// <returns>Number of rows affected</returns>
        public static int ExecuteNonQuery(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection connection = GetConnection())
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        
                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        System.Diagnostics.Debug.WriteLine($"ExecuteNonQuery completed. Rows affected: {result}");
                        return result;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"ExecuteNonQuery Error: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Query: {query}");
                throw; // Re-throw for handling at higher level
            }
        }

        /// <summary>
        /// Executes a query and returns a DataTable
        /// </summary>
        /// <param name="query">SQL query to execute</param>
        /// <param name="parameters">SQL parameters</param>
        /// <returns>DataTable with results</returns>
        public static DataTable ExecuteQuery(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection connection = GetConnection())
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            System.Diagnostics.Debug.WriteLine($"ExecuteQuery completed. Rows returned: {dataTable.Rows.Count}");
                            return dataTable;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"ExecuteQuery Error: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Query: {query}");
                throw; // Re-throw for handling at higher level
            }
        }

        /// <summary>
        /// Executes a query and returns a single scalar value
        /// </summary>
        /// <param name="query">SQL query to execute</param>
        /// <param name="parameters">SQL parameters</param>
        /// <returns>Single value result</returns>
        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection connection = GetConnection())
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        
                        connection.Open();
                        object result = command.ExecuteScalar();
                        System.Diagnostics.Debug.WriteLine($"ExecuteScalar completed. Result: {result}");
                        return result;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"ExecuteScalar Error: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Query: {query}");
                throw; // Re-throw for handling at higher level
            }
        }

        /// <summary>
        /// Initialize database with sample data if tables are empty
        /// </summary>
        /// <returns>True if initialization successful</returns>
        public static bool InitializeSampleData()
        {
            try
            {
                // Check if Projects table has data
                string checkQuery = "SELECT COUNT(*) FROM Projects WHERE IsActive = 1";
                object result = ExecuteScalar(checkQuery);
                int projectCount = Convert.ToInt32(result);

                if (projectCount == 0)
                {
                    System.Diagnostics.Debug.WriteLine("Projects table is empty. Inserting sample data...");
                    
                    // Insert sample projects
                    string insertQuery = @"
                        INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, 
                                            ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, 
                                            IsActive, DisplayOrder, UpdatedDate)
                        VALUES 
                        (@Title1, @Description1, @ShortDescription1, @TechnologiesUsed1, 
                         @ProjectUrl1, @GitHubUrl1, @ImageUrl1, @StartDate1, @EndDate1, 
                         @IsActive1, @DisplayOrder1, GETDATE()),
                        (@Title2, @Description2, @ShortDescription2, @TechnologiesUsed2, 
                         @ProjectUrl2, @GitHubUrl2, @ImageUrl2, @StartDate2, @EndDate2, 
                         @IsActive2, @DisplayOrder2, GETDATE()),
                        (@Title3, @Description3, @ShortDescription3, @TechnologiesUsed3, 
                         @ProjectUrl3, @GitHubUrl3, @ImageUrl3, @StartDate3, @EndDate3, 
                         @IsActive3, @DisplayOrder3, GETDATE()),
                        (@Title4, @Description4, @ShortDescription4, @TechnologiesUsed4, 
                         @ProjectUrl4, @GitHubUrl4, @ImageUrl4, @StartDate4, @EndDate4, 
                         @IsActive4, @DisplayOrder4, GETDATE())";

                    SqlParameter[] parameters = {
                        // Project 1
                        new SqlParameter("@Title1", "E-Commerce Platform"),
                        new SqlParameter("@Description1", "A comprehensive e-commerce solution built with ASP.NET Web Forms featuring user authentication, product catalog, shopping cart functionality, and payment integration. The application includes an admin panel for managing products, orders, and customer data."),
                        new SqlParameter("@ShortDescription1", "Full-featured e-commerce solution with shopping cart, payment integration, and admin panel"),
                        new SqlParameter("@TechnologiesUsed1", "ASP.NET Web Forms, C#, SQL Server, HTML5, CSS3, JavaScript, PayPal API"),
                        new SqlParameter("@ProjectUrl1", "https://demo-ecommerce.example.com"),
                        new SqlParameter("@GitHubUrl1", "https://github.com/username/ecommerce-platform"),
                        new SqlParameter("@ImageUrl1", "/Content/images/projects/ecommerce.jpg"),
                        new SqlParameter("@StartDate1", new DateTime(2023, 1, 15)),
                        new SqlParameter("@EndDate1", new DateTime(2023, 4, 30)),
                        new SqlParameter("@IsActive1", true),
                        new SqlParameter("@DisplayOrder1", 1),

                        // Project 2
                        new SqlParameter("@Title2", "Task Management System"),
                        new SqlParameter("@Description2", "A collaborative task management application designed for teams to organize, track, and manage projects efficiently. Features include task assignment, progress tracking, deadline management, file attachments, and real-time notifications."),
                        new SqlParameter("@ShortDescription2", "Team collaboration tool for project and task management with real-time updates"),
                        new SqlParameter("@TechnologiesUsed2", "ASP.NET Web Forms, C#, SQL Server, AJAX, jQuery, SignalR"),
                        new SqlParameter("@ProjectUrl2", "https://taskmanager.example.com"),
                        new SqlParameter("@GitHubUrl2", "https://github.com/username/task-manager"),
                        new SqlParameter("@ImageUrl2", "/Content/images/projects/taskmanager.jpg"),
                        new SqlParameter("@StartDate2", new DateTime(2023, 5, 1)),
                        new SqlParameter("@EndDate2", new DateTime(2023, 8, 15)),
                        new SqlParameter("@IsActive2", true),
                        new SqlParameter("@DisplayOrder2", 2),

                        // Project 3
                        new SqlParameter("@Title3", "Personal Finance Tracker"),
                        new SqlParameter("@Description3", "A personal finance management application that helps users track income, expenses, budgets, and financial goals. Includes data visualization with charts and graphs, category-based expense tracking, and financial reporting."),
                        new SqlParameter("@ShortDescription3", "Personal finance management tool with budgeting and expense tracking"),
                        new SqlParameter("@TechnologiesUsed3", "ASP.NET Web Forms, C#, SQL Server, Chart.js, Bootstrap"),
                        new SqlParameter("@ProjectUrl3", DBNull.Value),
                        new SqlParameter("@GitHubUrl3", "https://github.com/username/finance-tracker"),
                        new SqlParameter("@ImageUrl3", "/Content/images/projects/finance.jpg"),
                        new SqlParameter("@StartDate3", new DateTime(2023, 9, 1)),
                        new SqlParameter("@EndDate3", DBNull.Value),
                        new SqlParameter("@IsActive3", true),
                        new SqlParameter("@DisplayOrder3", 3),

                        // Project 4
                        new SqlParameter("@Title4", "Customer Support Portal"),
                        new SqlParameter("@Description4", "A customer support ticketing system that streamlines customer service operations. Features include ticket creation, assignment, status tracking, knowledge base integration, and automated email notifications."),
                        new SqlParameter("@ShortDescription4", "Customer support ticketing system with knowledge base and automation"),
                        new SqlParameter("@TechnologiesUsed4", "ASP.NET Web Forms, C#, SQL Server, SMTP Integration, HTML/CSS"),
                        new SqlParameter("@ProjectUrl4", "https://support.example.com"),
                        new SqlParameter("@GitHubUrl4", "https://github.com/username/support-portal"),
                        new SqlParameter("@ImageUrl4", "/Content/images/projects/support.jpg"),
                        new SqlParameter("@StartDate4", new DateTime(2022, 10, 1)),
                        new SqlParameter("@EndDate4", new DateTime(2022, 12, 31)),
                        new SqlParameter("@IsActive4", true),
                        new SqlParameter("@DisplayOrder4", 4)
                    };

                    int rowsAffected = ExecuteNonQuery(insertQuery, parameters);
                    System.Diagnostics.Debug.WriteLine($"Sample data insertion completed. {rowsAffected} rows inserted.");
                    return rowsAffected > 0;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine($"Projects table already has {projectCount} records. Skipping sample data insertion.");
                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error initializing sample data: {ex.Message}");
                return false;
            }
        }
    }
}