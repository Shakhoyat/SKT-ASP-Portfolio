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
                return ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
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
                        return command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging framework)
                System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);
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
                            return dataTable;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging framework)
                System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);
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
                        return command.ExecuteScalar();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging framework)
                System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);
                throw; // Re-throw for handling at higher level
            }
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
                    return connection.State == ConnectionState.Open;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}