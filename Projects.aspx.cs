using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using WebApplication1.Models;
using WebApplication1.DataAccess;

namespace WebApplication1
{
    public partial class Projects : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjectsData();
            }
        }

        private void LoadProjectsData()
        {
            try
            {
                var projects = new List<Project>();
                if (DatabaseHelper.TestConnection() && DatabaseHelper.TableExists("Projects"))
                {
                    projects = ProjectsDAL.GetAllProjects();
                }

                if (projects.Count > 0)
                {
                    ltlProjectCount.Text = projects.Count.ToString();
                    var viewModels = projects
                        .OrderBy(p => p.DisplayOrder)
                        .Select(p => new
                        {
                            p.ProjectId,
                            p.Title,
                            p.ShortDescription,
                            p.Description,
                            p.ProjectUrl,
                            p.GitHubUrl,
                            DateRange = (p.StartDate.ToString("MMM yyyy") + " - " + (p.EndDate.HasValue ? p.EndDate.Value.ToString("MMM yyyy") : "Present")),
                            Category = InferCategory(p),
                            StatusCss = p.EndDate.HasValue ? "completed" : "active",
                            StatusText = p.EndDate.HasValue ? "Completed" : "Active",
                            TechBadges = BuildTechBadgesHtml(p.TechnologiesUsed),
                            ImageStyleClass = GetImageStyleClass(p)
                        }).ToList();
                    rptProjects.DataSource = viewModels;
                    rptProjects.DataBind();
                    noProjectsMessage.Visible = false;
                }
                else
                {
                    ltlProjectCount.Text = "0";
                    rptProjects.DataSource = null;
                    rptProjects.DataBind();
                    noProjectsMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading projects: " + ex.Message);
                ltlProjectCount.Text = "0";
                noProjectsMessage.Visible = true;
            }
        }

        private string InferCategory(Project p)
        {
            var tech = (p.TechnologiesUsed ?? string.Empty).ToLower();
            if (tech.Contains("yolo") || tech.Contains("opencv") || tech.Contains("cnn")) return "ml";
            if (tech.Contains("bert") || tech.Contains("nlp") || tech.Contains("transformer")) return "research";
            if (tech.Contains("react") || tech.Contains("asp.net") || tech.Contains("web")) return "web";
            if (tech.Contains("iot")) return "iot";
            if (tech.Contains("pandas") || tech.Contains("numpy") || tech.Contains("eda")) return "datascience";
            return "ml"; // default
        }

        private string BuildTechBadgesHtml(string techList)
        {
            if (string.IsNullOrWhiteSpace(techList)) return string.Empty;
            var parts = techList.Split(new[] {',', ';'}, StringSplitOptions.RemoveEmptyEntries)
                                .Select(t => t.Trim())
                                .Where(t => t.Length > 0)
                                .Take(6); // limit badges
            var sb = new StringBuilder();
            foreach (var t in parts)
            {
                var cls = "tech-badge";
                if (t.IndexOf("python", StringComparison.OrdinalIgnoreCase) >= 0) cls += " python";
                if (t.IndexOf("react", StringComparison.OrdinalIgnoreCase) >= 0) cls += " react";
                sb.AppendFormat("<span class=\"{0}\">{1}</span>", cls, System.Web.HttpUtility.HtmlEncode(t));
            }
            return sb.ToString();
        }

        private string GetImageStyleClass(Project p)
        {
            var cat = InferCategory(p);
            switch (cat)
            {
                case "datascience": return "analytics";
                case "web": return "weather";
                case "iot": return "iot";
                case "research": return "nlp";
                default: return "vision";
            }
        }
    }
}