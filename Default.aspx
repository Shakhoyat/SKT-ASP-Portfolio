<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <h1 class="fade-in-up">Hi, I'm Shakhoyat Rahman</h1>
            <p class="fade-in-up">Full-Stack Developer & Software Engineer</p>
            <p class="fade-in-up" style="font-size: 1.1rem; margin-bottom: 3rem; opacity: 0.9;">
                Passionate about creating innovative web solutions with modern technologies. 
                Specialized in ASP.NET, C#, and database-driven applications.
            </p>
            <div class="fade-in-up" style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                <a href="Projects.aspx" class="btn btn-primary">
                    <i class="fas fa-rocket" style="margin-right: 0.5rem;"></i>
                    View My Work
                </a>
                <a href="Contact.aspx" class="btn btn-secondary">
                    <i class="fas fa-paper-plane" style="margin-right: 0.5rem;"></i>
                    Get In Touch
                </a>
            </div>
        </div>
    </div>

    <!-- About Preview Section -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="width: 120px; height: 120px; border-radius: 50%; background: var(--gradient-primary); margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem;">
                                <i class="fas fa-user"></i>
                            </div>
                            <h3 class="card-title">About Me</h3>
                        </div>
                        <p class="card-text">
                            I'm a passionate software developer with expertise in creating robust, scalable web applications. 
                            With a strong foundation in .NET technologies and modern web development practices, 
                            I love turning complex problems into elegant solutions.
                        </p>
                        <p class="card-text">
                            Currently focused on ASP.NET Web Forms, SQL Server, and full-stack development. 
                            Always eager to learn new technologies and contribute to meaningful projects.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="About.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                Learn More
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <h3 class="card-title">
                            <i class="fas fa-chart-line" style="color: var(--primary-color); margin-right: 0.75rem;"></i>
                            Quick Stats
                        </h3>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin: 2rem 0;">
                            <div class="stat-item">
                                <div class="stat-number">4+</div>
                                <div class="stat-label">Projects</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">15+</div>
                                <div class="stat-label">Technologies</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">2+</div>
                                <div class="stat-label">Years Learning</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">100%</div>
                                <div class="stat-label">Dedicated</div>
                            </div>
                        </div>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-code" style="margin-right: 0.5rem;"></i>
                                View Skills
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- What I Do Section -->
    <div class="section" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); position: relative;">
        <div class="container">
            <h2 class="section-title">What I Do</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h3 class="card-title">Web Development</h3>
                        <p class="card-text">
                            Building responsive and dynamic web applications using ASP.NET Web Forms, 
                            HTML5, CSS3, and JavaScript. Focus on clean code and user experience.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Projects.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-external-link-alt" style="margin-right: 0.5rem;"></i>
                                View Projects
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-database"></i>
                        </div>
                        <h3 class="card-title">Database Design</h3>
                        <p class="card-text">
                            Designing efficient database structures and implementing robust data management 
                            solutions using SQL Server, stored procedures, and optimization techniques.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-tools" style="margin-right: 0.5rem;"></i>
                                View Skills
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <h3 class="card-title">Problem Solving</h3>
                        <p class="card-text">
                            Analytical approach to complex problems, debugging skills, and creating 
                            elegant solutions that are maintainable and scalable for future growth.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="About.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-user" style="margin-right: 0.5rem;"></i>
                                About Me
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Featured Projects Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Featured Projects</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: var(--gradient-primary); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="project-content">
                            <div class="project-header">
                                <h4 class="project-title">E-Commerce Platform</h4>
                                <div class="project-duration">4 months</div>
                            </div>
                            <p class="project-description">
                                A comprehensive e-commerce solution with user authentication, product catalog, 
                                shopping cart, and payment integration. Built with ASP.NET Web Forms and SQL Server.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">ASP.NET</span>
                                <span class="tech-tag">C#</span>
                                <span class="tech-tag">SQL Server</span>
                                <span class="tech-tag">JavaScript</span>
                            </div>
                            <div class="project-actions">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-eye" style="margin-right: 0.5rem;"></i>
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: var(--gradient-accent); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="project-content">
                            <div class="project-header">
                                <h4 class="project-title">Task Management System</h4>
                                <div class="project-duration">3 months</div>
                            </div>
                            <p class="project-description">
                                A collaborative task management application for teams with real-time updates, 
                                file attachments, and progress tracking. Features modern UI and responsive design.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">ASP.NET</span>
                                <span class="tech-tag">AJAX</span>
                                <span class="tech-tag">jQuery</span>
                                <span class="tech-tag">SignalR</span>
                            </div>
                            <div class="project-actions">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-eye" style="margin-right: 0.5rem;"></i>
                                    View Details
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Projects.aspx" class="btn btn-outline-primary" style="padding: 1rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View All Projects
                </a>
            </div>
        </div>
    </div>

    <!-- Technologies Section -->
    <div class="section" style="background: var(--dark-bg); color: white;">
        <div class="container">
            <h2 class="section-title" style="color: white;">Technologies I Work With</h2>
            <div class="technologies-grid">
                <div class="tech-category">
                    <h4><i class="fas fa-code" style="color: #667eea;"></i> Backend</h4>
                    <div class="tech-items">
                        <span class="tech-item">ASP.NET Web Forms</span>
                        <span class="tech-item">C#</span>
                        <span class="tech-item">.NET Framework</span>
                        <span class="tech-item">ADO.NET</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-database" style="color: #00b894;"></i> Database</h4>
                    <div class="tech-items">
                        <span class="tech-item">SQL Server</span>
                        <span class="tech-item">T-SQL</span>
                        <span class="tech-item">Stored Procedures</span>
                        <span class="tech-item">Database Design</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-paint-brush" style="color: #fdcb6e;"></i> Frontend</h4>
                    <div class="tech-items">
                        <span class="tech-item">HTML5</span>
                        <span class="tech-item">CSS3</span>
                        <span class="tech-item">JavaScript</span>
                        <span class="tech-item">jQuery</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-tools" style="color: #e84393;"></i> Tools</h4>
                    <div class="tech-items">
                        <span class="tech-item">Visual Studio</span>
                        <span class="tech-item">Git</span>
                        <span class="tech-item">SSMS</span>
                        <span class="tech-item">IIS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Ready to Start Your Project?</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                I'm always excited to take on new challenges and collaborate on interesting projects. 
                Let's discuss how we can bring your ideas to life.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Contact.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-rocket" style="margin-right: 0.75rem;"></i>
                    Start a Project
                </a>
                <a href="mailto:skt104.shujon@gmail.com" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-envelope" style="margin-right: 0.75rem;"></i>
                    Send Email
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        // Add animation on scroll
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card, .stat-item, .tech-category');
            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        }

        // Initialize animations
        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', function() {
            // Set initial state for animations
            const elements = document.querySelectorAll('.card, .stat-item, .tech-category');
            elements.forEach(element => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.6s ease-out';
            });
            
            // Trigger initial animation
            setTimeout(animateOnScroll, 100);
        });
    </script>
</asp:Content>