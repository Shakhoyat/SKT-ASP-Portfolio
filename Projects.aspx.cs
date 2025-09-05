using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Text;

namespace SKT_ASP_Portfolio
{
    /// <summary>
    /// Projects page showcasing portfolio of web applications, databases, and development work
    /// </summary>
    public partial class Projects : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjectsData();
                GenerateProjectDetailsJson();
            }
        }

        /// <summary>
        /// Loads all projects data for display on the projects page
        /// This will be replaced with database data in future steps
        /// </summary>
        private void LoadProjectsData()
        {
            LoadFeaturedProjects();
            LoadAllProjects();
        }

        /// <summary>
        /// Loads featured projects for the main showcase section
        /// </summary>
        private void LoadFeaturedProjects()
        {
            var featuredProjects = new List<object>
            {
                new {
                    Id = "1",
                    Title = "E-Commerce Management System",
                    ShortDescription = "Full-featured e-commerce platform with inventory management, order processing, and customer portal.",
                    Category = "web",
                    CategoryName = "Web App",
                    CategoryColor = "primary",
                    ImageUrl = "Images/projects/ecommerce-system.jpg",
                    TechnologyTags = "<span class='tech-tag bg-primary'>ASP.NET</span><span class='tech-tag bg-info'>SQL Server</span><span class='tech-tag bg-success'>Bootstrap</span><span class='tech-tag bg-warning text-dark'>JavaScript</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Dec 2023",
                    Duration = "3 months",
                    Technologies = "ASP.NET Web Forms, SQL Server, Bootstrap, JavaScript"
                },
                new {
                    Id = "2",
                    Title = "Student Information System",
                    ShortDescription = "Comprehensive academic management system for schools with student records, grades, and reporting.",
                    Category = "web",
                    CategoryName = "Web App",
                    CategoryColor = "primary",
                    ImageUrl = "Images/projects/student-system.jpg",
                    TechnologyTags = "<span class='tech-tag bg-primary'>ASP.NET</span><span class='tech-tag bg-info'>Entity Framework</span><span class='tech-tag bg-secondary'>C#</span><span class='tech-tag bg-success'>CSS3</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Oct 2023",
                    Duration = "2.5 months",
                    Technologies = "ASP.NET MVC, Entity Framework, C#, CSS3"
                },
                new {
                    Id = "3",
                    Title = "Hospital Management Database",
                    ShortDescription = "Advanced database system for hospital operations including patient records, appointments, and billing.",
                    Category = "database",
                    CategoryName = "Database",
                    CategoryColor = "info",
                    ImageUrl = "Images/projects/hospital-db.jpg",
                    TechnologyTags = "<span class='tech-tag bg-info'>SQL Server</span><span class='tech-tag bg-warning text-dark'>T-SQL</span><span class='tech-tag bg-secondary'>SSRS</span><span class='tech-tag bg-success'>Stored Procedures</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Aug 2023",
                    Duration = "2 months",
                    Technologies = "SQL Server, T-SQL, SSRS, Stored Procedures"
                },
                new {
                    Id = "4",
                    Title = "Real Estate API",
                    ShortDescription = "RESTful API for real estate applications with property listings, search, and user management.",
                    Category = "api",
                    CategoryName = "API",
                    CategoryColor = "success",
                    ImageUrl = "Images/projects/realestate-api.jpg",
                    TechnologyTags = "<span class='tech-tag bg-success'>Web API</span><span class='tech-tag bg-primary'>ASP.NET</span><span class='tech-tag bg-info'>JSON</span><span class='tech-tag bg-warning text-dark'>Postman</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Sep 2023",
                    Duration = "1.5 months",
                    Technologies = "ASP.NET Web API, JSON, Postman, C#"
                }
            };

            FeaturedProjectsRepeater.DataSource = featuredProjects;
            FeaturedProjectsRepeater.DataBind();
        }

        /// <summary>
        /// Loads all projects for the complete portfolio section
        /// </summary>
        private void LoadAllProjects()
        {
            var allProjects = new List<object>
            {
                new {
                    Id = "5",
                    Title = "Task Management Portal",
                    ShortDescription = "Collaborative task tracking with team management and progress monitoring.",
                    Category = "web",
                    CategoryName = "Web App",
                    CategoryColor = "primary",
                    ImageUrl = "Images/projects/task-management.jpg",
                    TechnologyTags = "<span class='tech-tag bg-primary'>ASP.NET</span><span class='tech-tag bg-secondary'>C#</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Nov 2023",
                    Technologies = "ASP.NET Web Forms, C#, SQL Server"
                },
                new {
                    Id = "6",
                    Title = "Inventory Database Schema",
                    ShortDescription = "Normalized database design for inventory management with reporting capabilities.",
                    Category = "database",
                    CategoryName = "Database",
                    CategoryColor = "info",
                    ImageUrl = "Images/projects/inventory-db.jpg",
                    TechnologyTags = "<span class='tech-tag bg-info'>SQL Server</span><span class='tech-tag bg-warning text-dark'>T-SQL</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Jul 2023",
                    Technologies = "SQL Server, T-SQL, Database Design"
                },
                new {
                    Id = "7",
                    Title = "Weather Data API",
                    ShortDescription = "RESTful API providing weather information with location-based services.",
                    Category = "api",
                    CategoryName = "API",
                    CategoryColor = "success",
                    ImageUrl = "Images/projects/weather-api.jpg",
                    TechnologyTags = "<span class='tech-tag bg-success'>Web API</span><span class='tech-tag bg-info'>JSON</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Jun 2023",
                    Technologies = "ASP.NET Web API, JSON, XML"
                },
                new {
                    Id = "8",
                    Title = "Portfolio Website",
                    ShortDescription = "Responsive personal portfolio built with ASP.NET Web Forms and Bootstrap.",
                    Category = "frontend",
                    CategoryName = "Frontend",
                    CategoryColor = "warning",
                    ImageUrl = "Images/projects/portfolio-site.jpg",
                    TechnologyTags = "<span class='tech-tag bg-success'>Bootstrap</span><span class='tech-tag bg-warning text-dark'>JavaScript</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Jan 2024",
                    Technologies = "HTML5, CSS3, Bootstrap, JavaScript"
                },
                new {
                    Id = "9",
                    Title = "Library Management System",
                    ShortDescription = "Complete library management with book tracking, member management, and reports.",
                    Category = "web",
                    CategoryName = "Web App",
                    CategoryColor = "primary",
                    ImageUrl = "Images/projects/library-system.jpg",
                    TechnologyTags = "<span class='tech-tag bg-primary'>ASP.NET</span><span class='tech-tag bg-info'>SQL Server</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "May 2023",
                    Technologies = "ASP.NET Web Forms, SQL Server, C#"
                },
                new {
                    Id = "10",
                    Title = "Customer Analytics Dashboard",
                    ShortDescription = "Interactive dashboard for customer data analysis and business intelligence.",
                    Category = "frontend",
                    CategoryName = "Frontend",
                    CategoryColor = "warning",
                    ImageUrl = "Images/projects/analytics-dashboard.jpg",
                    TechnologyTags = "<span class='tech-tag bg-warning text-dark'>JavaScript</span><span class='tech-tag bg-success'>Chart.js</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Apr 2023",
                    Technologies = "JavaScript, Chart.js, HTML5, CSS3"
                },
                new {
                    Id = "11",
                    Title = "Employee Database System",
                    ShortDescription = "HR database with employee records, payroll integration, and reporting modules.",
                    Category = "database",
                    CategoryName = "Database",
                    CategoryColor = "info",
                    ImageUrl = "Images/projects/employee-db.jpg",
                    TechnologyTags = "<span class='tech-tag bg-info'>SQL Server</span><span class='tech-tag bg-secondary'>SSRS</span>",
                    DemoUrl = "#",
                    SourceUrl = "#",
                    CompletedDate = "Mar 2023",
                    Technologies = "SQL Server, T-SQL, SSRS, Stored Procedures"
                }
            };

            AllProjectsRepeater.DataSource = allProjects;
            AllProjectsRepeater.DataBind();
        }

        /// <summary>
        /// Generates JSON data for project details modal using simple string building
        /// </summary>
        private void GenerateProjectDetailsJson()
        {
            var json = new StringBuilder();
            json.Append("{");
            
            json.Append("\"1\": {");
            json.Append("\"title\": \"E-Commerce Management System\",");
            json.Append("\"description\": \"A comprehensive e-commerce platform designed to handle online retail operations. Features include product catalog management, shopping cart functionality, secure payment processing, order tracking, inventory management, and customer relationship management. The system supports multiple user roles including customers, administrators, and vendors.\",");
            json.Append("\"features\": [\"Product catalog with categories and search functionality\", \"Shopping cart and checkout process with payment integration\", \"Order management and tracking system\", \"Inventory management with automatic stock updates\", \"Customer registration and profile management\", \"Admin dashboard with sales analytics and reporting\", \"Responsive design for mobile and desktop users\", \"Email notifications for order confirmations and updates\"],");
            json.Append("\"technologies\": [\"ASP.NET Web Forms\", \"C#\", \"SQL Server\", \"Bootstrap 5\", \"JavaScript\", \"jQuery\", \"HTML5\", \"CSS3\"],");
            json.Append("\"challenges\": \"Implementing secure payment processing, managing complex inventory relationships, and ensuring optimal performance with large product catalogs.\",");
            json.Append("\"results\": \"Successfully deployed system handling 500+ products and 100+ daily orders with 99.9% uptime.\",");
            json.Append("\"imageUrl\": \"Images/projects/ecommerce-system.jpg\"");
            json.Append("},");
            
            json.Append("\"2\": {");
            json.Append("\"title\": \"Student Information System\",");
            json.Append("\"description\": \"An academic management platform for educational institutions. The system manages student enrollment, course registration, grade tracking, attendance monitoring, and generates comprehensive academic reports. It serves students, teachers, and administrators with role-based access control.\",");
            json.Append("\"features\": [\"Student enrollment and profile management\", \"Course catalog and registration system\", \"Grade book with assignment and exam tracking\", \"Attendance monitoring and reporting\", \"Academic calendar and scheduling\", \"Parent portal for progress monitoring\", \"Teacher dashboard for class management\", \"Administrative reports and analytics\"],");
            json.Append("\"technologies\": [\"ASP.NET MVC\", \"Entity Framework\", \"C#\", \"SQL Server\", \"Bootstrap\", \"jQuery\", \"LINQ\"],");
            json.Append("\"challenges\": \"Designing complex academic workflows, implementing robust grade calculation algorithms, and ensuring data security for sensitive student information.\",");
            json.Append("\"results\": \"Deployed in 3 schools serving 1000+ students with improved academic tracking efficiency by 40%.\",");
            json.Append("\"imageUrl\": \"Images/projects/student-system.jpg\"");
            json.Append("}");
            
            json.Append("}");

            // Convert to JSON and embed in page for JavaScript access
            ProjectDetailsJson.Text = $"<script>window.projectDetails = {json.ToString()};</script>";
        }
    }
}