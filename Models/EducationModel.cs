using System;

namespace WebApplication1.Models
{
    /// <summary>
    /// Education model for admin management
    /// </summary>
    public class EducationModel
    {
        public int EducationId { get; set; }
        public string Degree { get; set; }
        public string FieldOfStudy { get; set; }
        public string Institution { get; set; }
        public string Location { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string GPA { get; set; }
        public string Type { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}