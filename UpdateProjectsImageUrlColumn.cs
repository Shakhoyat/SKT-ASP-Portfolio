using System;
using System.Data.SqlClient;

class UpdateProjectsImageUrlColumn
{
    static string cs = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=personal-portfolio-ASP; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServerCertificate=True";
    static void Main()
    {
        Console.WriteLine("Checking Projects.ImageUrl column size...");
        try
        {
            using (var cn = new SqlConnection(cs))
            using (var cmd = new SqlCommand(@"SELECT c.max_length FROM sys.columns c 
JOIN sys.objects o ON c.object_id = o.object_id 
WHERE o.name='Projects' AND c.name='ImageUrl'", cn))
            {
                cn.Open();
                var lenObj = cmd.ExecuteScalar();
                int maxLen = Convert.ToInt32(lenObj); // bytes (nvarchar bytes /2 = characters) or -1 for MAX
                Console.WriteLine($"Current max_length bytes: {maxLen} ( -1 means MAX )");
                if (maxLen != -1)
                {
                    Console.WriteLine("Altering column to NVARCHAR(MAX)...");
                    using (var alter = new SqlCommand("ALTER TABLE Projects ALTER COLUMN ImageUrl NVARCHAR(MAX) NULL", cn))
                    {
                        alter.ExecuteNonQuery();
                        Console.WriteLine("Successfully altered ImageUrl to NVARCHAR(MAX).");
                    }
                }
                else
                {
                    Console.WriteLine("Column already NVARCHAR(MAX), no change needed.");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
    }
}