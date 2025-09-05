using System;
using System.Collections.Generic;
using System.Web.UI;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Skills page showcasing comprehensive technical skills, certifications, and learning journey
    /// </summary>
    public partial class Skills : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllSkillsData();
            }
        }

        /// <summary>
        /// Loads all skills data for display on the skills page
        /// This will be replaced with database data in future steps
        /// </summary>
        private void LoadAllSkillsData()
        {
            LoadBackendSkills();
            LoadFrontendSkills();
            LoadDatabaseSkills();
            LoadToolsSkills();
            LoadCertifications();
            LoadLearningTimeline();
        }

        /// <summary>
        /// Loads detailed backend development skills
        /// </summary>
        private void LoadBackendSkills()
        {
            var backendSkills = new List<object>
            {
                new { 
                    Name = "C#", 
                    Level = 90, 
                    Experience = "3+ years",
                    Description = "Strong proficiency in C# programming with experience in OOP, LINQ, and async programming patterns."
                },
                new { 
                    Name = "ASP.NET Web Forms", 
                    Level = 85, 
                    Experience = "2+ years",
                    Description = "Extensive experience building web applications using Web Forms, master pages, and server controls."
                },
                new { 
                    Name = "ASP.NET MVC", 
                    Level = 75, 
                    Experience = "1+ years",
                    Description = "Experience with MVC pattern, routing, model binding, and creating RESTful web applications."
                },
                new { 
                    Name = ".NET Framework", 
                    Level = 88, 
                    Experience = "3+ years",
                    Description = "Deep understanding of .NET Framework architecture, BCL, and framework-specific features."
                },
                new { 
                    Name = "Web API", 
                    Level = 80, 
                    Experience = "2+ years",
                    Description = "Building RESTful APIs with proper HTTP status codes, authentication, and documentation."
                },
                new { 
                    Name = "Entity Framework", 
                    Level = 70, 
                    Experience = "1+ years",
                    Description = "Code-first approach, database migrations, and LINQ to Entities for data access layer."
                }
            };

            BackendSkillsRepeater.DataSource = backendSkills;
            BackendSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads detailed frontend development skills
        /// </summary>
        private void LoadFrontendSkills()
        {
            var frontendSkills = new List<object>
            {
                new { 
                    Name = "HTML5", 
                    Level = 95, 
                    Experience = "4+ years",
                    Description = "Semantic HTML, accessibility best practices, and modern HTML5 APIs and features."
                },
                new { 
                    Name = "CSS3", 
                    Level = 90, 
                    Experience = "4+ years",
                    Description = "Advanced CSS including Flexbox, Grid, animations, and CSS custom properties."
                },
                new { 
                    Name = "JavaScript", 
                    Level = 85, 
                    Experience = "3+ years",
                    Description = "ES6+ features, DOM manipulation, async/await, and modern JavaScript patterns."
                },
                new { 
                    Name = "Bootstrap", 
                    Level = 88, 
                    Experience = "3+ years",
                    Description = "Responsive design, component customization, and utility classes for rapid development."
                },
                new { 
                    Name = "jQuery", 
                    Level = 80, 
                    Experience = "2+ years",
                    Description = "DOM traversal, event handling, AJAX requests, and plugin development."
                },
                new { 
                    Name = "Responsive Design", 
                    Level = 92, 
                    Experience = "3+ years",
                    Description = "Mobile-first approach, media queries, and cross-browser compatibility."
                },
                new { 
                    Name = "SASS/SCSS", 
                    Level = 75, 
                    Experience = "1+ years",
                    Description = "CSS preprocessing, variables, mixins, and organizing stylesheets for maintainability."
                }
            };

            FrontendSkillsRepeater.DataSource = frontendSkills;
            FrontendSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads database and data management skills
        /// </summary>
        private void LoadDatabaseSkills()
        {
            var databaseSkills = new List<object>
            {
                new { 
                    Name = "SQL Server", 
                    Level = 85, 
                    Experience = "3+ years",
                    Description = "Database design, stored procedures, functions, and performance optimization."
                },
                new { 
                    Name = "T-SQL", 
                    Level = 82, 
                    Experience = "3+ years",
                    Description = "Complex queries, CTEs, window functions, and advanced T-SQL programming."
                },
                new { 
                    Name = "Database Design", 
                    Level = 78, 
                    Experience = "2+ years",
                    Description = "Normalization, indexing strategies, and designing scalable database schemas."
                },
                new { 
                    Name = "LINQ", 
                    Level = 80, 
                    Experience = "2+ years",
                    Description = "LINQ to Objects, LINQ to Entities, and method syntax vs query syntax."
                },
                new { 
                    Name = "Data Migration", 
                    Level = 70, 
                    Experience = "1+ years",
                    Description = "ETL processes, data transformation, and migration between different data sources."
                }
            };

            DatabaseSkillsRepeater.DataSource = databaseSkills;
            DatabaseSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads tools and DevOps skills
        /// </summary>
        private void LoadToolsSkills()
        {
            var toolsSkills = new List<object>
            {
                new { 
                    Name = "Visual Studio", 
                    Level = 90, 
                    Experience = "4+ years",
                    Description = "Advanced debugging, extensions, project templates, and productivity features."
                },
                new { 
                    Name = "Git & GitHub", 
                    Level = 80, 
                    Experience = "2+ years",
                    Description = "Version control, branching strategies, pull requests, and collaborative development."
                },
                new { 
                    Name = "Azure DevOps", 
                    Level = 70, 
                    Experience = "1+ years",
                    Description = "CI/CD pipelines, work item tracking, and team collaboration tools."
                },
                new { 
                    Name = "IIS", 
                    Level = 75, 
                    Experience = "2+ years",
                    Description = "Web server configuration, application pools, and deployment strategies."
                },
                new { 
                    Name = "Postman", 
                    Level = 85, 
                    Experience = "2+ years",
                    Description = "API testing, automation, documentation, and team workspace collaboration."
                },
                new { 
                    Name = "NuGet", 
                    Level = 78, 
                    Experience = "2+ years",
                    Description = "Package management, creating packages, and dependency resolution."
                },
                new { 
                    Name = "npm/Node.js", 
                    Level = 65, 
                    Experience = "1+ years",
                    Description = "Package management, build tools, and basic Node.js for frontend tooling."
                }
            };

            ToolsSkillsRepeater.DataSource = toolsSkills;
            ToolsSkillsRepeater.DataBind();
        }

        /// <summary>
        /// Loads certifications and professional learning achievements
        /// </summary>
        private void LoadCertifications()
        {
            var certifications = new List<object>
            {
                new { 
                    Title = "Microsoft Certified: Azure Fundamentals",
                    Provider = "Microsoft",
                    Date = "2024",
                    Status = "Completed",
                    IconClass = "fab fa-microsoft",
                    Description = "Foundational knowledge of cloud services and Azure platform capabilities."
                },
                new { 
                    Title = ".NET Development Certification",
                    Provider = "Microsoft Learn",
                    Date = "2023",
                    Status = "Completed",
                    IconClass = "fas fa-code",
                    Description = "Comprehensive understanding of .NET development practices and patterns."
                },
                new { 
                    Title = "SQL Server Database Administration",
                    Provider = "Microsoft",
                    Date = "2023",
                    Status = "Completed",
                    IconClass = "fas fa-database",
                    Description = "Database management, optimization, and administration best practices."
                },
                new { 
                    Title = "Web Development Bootcamp",
                    Provider = "Udemy",
                    Date = "2022",
                    Status = "Completed",
                    IconClass = "fas fa-graduation-cap",
                    Description = "Full-stack web development covering HTML, CSS, JavaScript, and backend technologies."
                },
                new { 
                    Title = "Agile Development Practices",
                    Provider = "Scrum Alliance",
                    Date = "2024",
                    Status = "In Progress",
                    IconClass = "fas fa-users",
                    Description = "Scrum methodology, sprint planning, and agile project management techniques."
                },
                new { 
                    Title = "Cloud Architecture Fundamentals",
                    Provider = "AWS",
                    Date = "2024",
                    Status = "Planned",
                    IconClass = "fas fa-cloud",
                    Description = "Cloud computing concepts, architecture patterns, and best practices."
                }
            };

            CertificationsRepeater.DataSource = certifications;
            CertificationsRepeater.DataBind();
        }

        /// <summary>
        /// Loads learning timeline showing skill development journey
        /// </summary>
        private void LoadLearningTimeline()
        {
            var timeline = new List<object>
            {
                new { 
                    Year = "2024",
                    Title = "Advanced .NET & Cloud Technologies",
                    Description = "Focusing on cloud integration, microservices architecture, and advanced .NET patterns. Exploring Azure services and modern deployment strategies.",
                    Skills = "<span class='skill-tag bg-primary'>Azure</span><span class='skill-tag bg-info'>Microservices</span><span class='skill-tag bg-warning'>Docker</span>"
                },
                new { 
                    Year = "2023",
                    Title = "Full-Stack Web Development Mastery",
                    Description = "Deepened knowledge in ASP.NET development, database design, and modern frontend frameworks. Built multiple full-stack applications.",
                    Skills = "<span class='skill-tag bg-success'>ASP.NET MVC</span><span class='skill-tag bg-info'>Entity Framework</span><span class='skill-tag bg-warning'>JavaScript ES6+</span>"
                },
                new { 
                    Year = "2022",
                    Title = "Web Forms & Database Specialization",
                    Description = "Specialized in ASP.NET Web Forms development and SQL Server database design. Built enterprise-level web applications.",
                    Skills = "<span class='skill-tag bg-primary'>Web Forms</span><span class='skill-tag bg-success'>SQL Server</span><span class='skill-tag bg-info'>T-SQL</span>"
                },
                new { 
                    Year = "2021",
                    Title = "Programming Fundamentals & .NET Introduction",
                    Description = "Started programming journey with C# and .NET Framework. Learned object-oriented programming principles and web development basics.",
                    Skills = "<span class='skill-tag bg-warning'>C#</span><span class='skill-tag bg-primary'>.NET Framework</span><span class='skill-tag bg-success'>HTML/CSS</span>"
                }
            };

            LearningTimelineRepeater.DataSource = timeline;
            LearningTimelineRepeater.DataBind();
        }
    }
}