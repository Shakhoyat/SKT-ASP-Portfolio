using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public static class DatabaseHelper
    {
        public static string ConnectionString => ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;

        public static SqlConnection GetConnection() => new SqlConnection(ConnectionString);

        public static int ExecuteNonQuery(string query, params SqlParameter[] parameters)
        {
            using (var conn = GetConnection())
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null) cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public static DataTable ExecuteQuery(string query, params SqlParameter[] parameters)
        {
            using (var conn = GetConnection())
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null) cmd.Parameters.AddRange(parameters);
                    using (var adapter = new SqlDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            using (var conn = GetConnection())
            {
                using (var cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null) cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }

        public static bool TestConnection()
        {
            try
            {
                using (var conn = GetConnection())
                {
                    conn.Open();
                    return conn.State == ConnectionState.Open;
                }
            }
            catch { return false; }
        }

        public static bool TableExists(string tableName)
        {
            try
            {
                var result = ExecuteScalar("SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName", 
                    new SqlParameter("@TableName", tableName));
                return Convert.ToInt32(result) > 0;
            }
            catch { return false; }
        }

        public static bool IsDatabaseInitialized()
        {
            var tables = new[] { "Projects", "Skills", "Achievements", "Education", "ContactMessages" };
            foreach (var table in tables)
                if (!TableExists(table)) return false;
            return true;
        }
    }
}