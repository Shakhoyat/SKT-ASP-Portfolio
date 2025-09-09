using System;

namespace WebApplication1.Models
{
    /// <summary>
    /// Achievement model for admin management
    /// </summary>
    public class AchievementModel
    {
        public int AchievementId { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string Organization { get; set; }
        public DateTime AchievementDate { get; set; }
        public string CertificateUrl { get; set; }
        public string ImageUrl { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}