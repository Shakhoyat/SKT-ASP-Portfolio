using System;

namespace WebApplication1.Models
{
    /// <summary>
    /// Skill model for admin management
    /// </summary>
    public class SkillModel
    {
        public int SkillId { get; set; }
        public string SkillName { get; set; }
        public string Category { get; set; }
        public int ProficiencyLevel { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}