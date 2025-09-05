using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDynamicContent();
            }
        }

        /// <summary>
        /// Load dynamic content from database to keep homepage current
        /// </summary>
        private void LoadDynamicContent()
        {
            try
            {
                // Load latest project count for stats
                UpdateProjectStats();
                
                // Add data source indicator
                AddDataSourceIndicator();
                
                System.Diagnostics.Debug.WriteLine("Default page dynamic content loaded successfully.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading dynamic content for Default page: {ex.Message}");
                // Page will continue to work with static content if dynamic loading fails
            }
        }

        /// <summary>
        /// Update project statistics in the Quick Stats section
        /// </summary>
        private void UpdateProjectStats()
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    // Get actual project count from database
                    string query = "SELECT COUNT(*) FROM Projects WHERE IsActive = 1";
                    object result = DatabaseHelper.ExecuteScalar(query);
                    int projectCount = Convert.ToInt32(result);
                    
                    // Update the projects stat dynamically via JavaScript
                    string script = $@"
                        document.addEventListener('DOMContentLoaded', function() {{
                            // Update project count in Quick Stats section
                            const projectStatElements = document.querySelectorAll('.text-center div[style*=""font-size: 2.5rem""]');
                            if (projectStatElements.length >= 1) {{
                                const projectElement = projectStatElements[0]; // First stat is projects
                                if (projectElement && projectElement.textContent.includes('+')) {{
                                    projectElement.textContent = '{projectCount}+';
                                    console.log('Updated project count to: {projectCount}+');
                                }}
                            }}
                        }});
                    ";
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "UpdateStats", script, true);
                    
                    System.Diagnostics.Debug.WriteLine($"Updated homepage with {projectCount} active projects from database.");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Database not available - using static stats on homepage.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error updating project stats: {ex.Message}");
            }
        }

        /// <summary>
        /// Get featured projects for homepage (could be used for dynamic featured section)
        /// </summary>
        private List<Project> GetFeaturedProjects()
        {
            try
            {
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    return ProjectsDAL.GetFeaturedProjects();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting featured projects: {ex.Message}");
            }
            
            return new List<Project>();
        }

        /// <summary>
        /// Add indicator to show if data is from database or demo
        /// </summary>
        private void AddDataSourceIndicator()
        {
            try
            {
                bool isUsingDatabase = DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects");
                
                string indicatorStyle = isUsingDatabase ? 
                    "position: fixed; top: 10px; right: 10px; background: rgba(0, 212, 170, 0.9); color: white; padding: 0.5rem 1rem; border-radius: 25px; font-size: 0.8rem; z-index: 1000; font-weight: 600;" :
                    "position: fixed; top: 10px; right: 10px; background: rgba(255, 193, 7, 0.9); color: #333; padding: 0.5rem 1rem; border-radius: 25px; font-size: 0.8rem; z-index: 1000; font-weight: 600;";
                
                string indicatorText = isUsingDatabase ? 
                    "<i class='fas fa-database'></i> Live Data" : 
                    "<i class='fas fa-flask'></i> Demo Data";
                
                string script = $@"
                    document.addEventListener('DOMContentLoaded', function() {{
                        var indicator = document.createElement('div');
                        indicator.innerHTML = '{indicatorText}';
                        indicator.style.cssText = '{indicatorStyle}';
                        indicator.title = '{(isUsingDatabase ? "Data is loading from your database. Admin changes will appear immediately." : "This is demonstration data. Connect your database and use the Admin Panel to manage your real content.")}';
                        document.body.appendChild(indicator);
                        
                        // Auto-hide after 5 seconds
                        setTimeout(function() {{
                            indicator.style.opacity = '0';
                            indicator.style.transform = 'translateY(-20px)';
                            setTimeout(function() {{
                                if (indicator.parentNode) {{
                                    indicator.parentNode.removeChild(indicator);
                                }}
                            }}, 300);
                        }}, 5000);
                    }});
                ";
                
                ClientScript.RegisterStartupScript(this.GetType(), "DataSourceIndicator", script, true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error adding data source indicator: {ex.Message}");
            }
        }
    }
}