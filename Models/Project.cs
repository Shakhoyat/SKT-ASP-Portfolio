using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    /// <summary>
    /// Project data model representing a portfolio project
    /// </summary>
    public class Project
    {
        public int ProjectId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public string TechnologiesUsed { get; set; }
        public string ProjectUrl { get; set; }
        public string GitHubUrl { get; set; }
        public string ImageUrl { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsActive { get; set; }
        public int DisplayOrder { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }

        /// <summary>
        /// Gets the project duration as a formatted string
        /// </summary>
        public string Duration
        {
            get
            {
                if (EndDate.HasValue)
                {
                    var duration = EndDate.Value - StartDate;
                    if (duration.TotalDays < 30)
                        return $"{(int)duration.TotalDays} days";
                    else if (duration.TotalDays < 365)
                        return $"{(int)(duration.TotalDays / 30)} months";
                    else
                        return $"{(int)(duration.TotalDays / 365)} years";
                }
                return "Ongoing";
            }
        }

        /// <summary>
        /// Gets the technologies as a list for display
        /// </summary>
        public List<string> TechnologiesList
        {
            get
            {
                if (string.IsNullOrEmpty(TechnologiesUsed))
                    return new List<string>();
                return TechnologiesUsed.Split(',').Select(t => t.Trim()).ToList();
            }
        }

        /// <summary>
        /// Gets formatted start date
        /// </summary>
        public string FormattedStartDate => StartDate.ToString("MMM yyyy");

        /// <summary>
        /// Gets formatted end date
        /// </summary>
        public string FormattedEndDate => EndDate?.ToString("MMM yyyy") ?? "Present";

        /// <summary>
        /// Gets the default image if none specified
        /// </summary>
        public string DisplayImageUrl => !string.IsNullOrEmpty(ImageUrl) ? ImageUrl : "/Content/images/projects/default-project.jpg";
    }
}