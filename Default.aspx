<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section with Profile -->
    <div class="hero">
        <div class="container">
            <div class="profile-section">
                <!-- Profile Image -->
                <div class="profile-image">
                    <!-- Sample profile image - replace with your actual image -->
                    <div class="profile-image-placeholder">
                        <i class="fas fa-user"></i>
                    </div>
                    <!-- Uncomment when you add your image:
                    <img src="/Content/images/profile.jpg" alt="Shakhoyat Rahman" />
                    -->
                </div>
                
                <!-- Name and Title -->
                <h1 class="fade-in-up">Shakhoyat Rahman</h1>
                <div class="subtitle fade-in-up">Full-Stack Developer</div>
                <p class="fade-in-up">
                    Passionate software developer specializing in ASP.NET web applications and database-driven solutions. 
                    I create robust, scalable applications with modern technologies and clean, maintainable code.
                </p>
                
                <!-- Action Buttons -->
                <div class="fade-in-up" style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap; margin-top: 2rem;">
                    <a href="Projects.aspx" class="btn btn-primary">
                        <i class="fas fa-eye" style="margin-right: 0.5rem;"></i>
                        View My Work
                    </a>
                    <a href="Contact.aspx" class="btn btn-secondary">
                        <i class="fas fa-envelope" style="margin-right: 0.5rem;"></i>
                        Hire Me
                    </a>
                    <a href="/Content/docs/resume.pdf" class="btn btn-outline-primary" target="_blank">
                        <i class="fas fa-download" style="margin-right: 0.5rem;"></i>
                        Download CV
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- About Preview Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">About Me</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Professional Background</h3>
                        </div>
                        <p class="card-text">
                            Dedicated software developer with expertise in creating robust, scalable web applications 
                            using Microsoft technologies. Strong foundation in computer science principles and 
                            practical experience in full-stack development.
                        </p>
                        <ul style="color: var(--text-secondary); line-height: 1.8; margin: 1.5rem 0;">
                            <li><strong>Backend:</strong> ASP.NET Web Forms, C#, .NET Framework</li>
                            <li><strong>Database:</strong> SQL Server, T-SQL, Database Design</li>
                            <li><strong>Frontend:</strong> HTML5, CSS3, JavaScript, jQuery</li>
                            <li><strong>Tools:</strong> Visual Studio, Git, SSMS</li>
                        </ul>
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
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Quick Stats</h3>
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin: 2rem 0;">
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">4+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Projects</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">15+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Technologies</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">2+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Years Learning</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">100%</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Dedicated</div>
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

    <!-- Services Section -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">What I Do</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h3 class="card-title">Web Development</h3>
                        <p class="card-text">
                            Building responsive and dynamic web applications using ASP.NET Web Forms, 
                            C#, and modern web technologies. Focus on clean architecture and user experience.
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
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-database"></i>
                        </div>
                        <h3 class="card-title">Database Solutions</h3>
                        <p class="card-text">
                            Designing efficient database architectures and implementing robust data management 
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
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-cogs"></i>
                        </div>
                        <h3 class="card-title">System Integration</h3>
                        <p class="card-text">
                            Creating seamless integrations between different systems, APIs, and third-party services. 
                            Focus on scalable solutions and maintainable code architecture.
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

    <!-- Featured Projects -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Featured Projects</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: var(--gradient-primary); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-shopping-cart"></i>
                            <div class="project-overlay">
                                <div style="display: flex; gap: 1rem;">
                                    <a href="Projects.aspx" class="btn btn-primary">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                    <a href="https://github.com/Shakhoyat/ecommerce-platform" target="_blank" class="btn btn-secondary">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="project-content">
                            <h4 class="project-title">E-Commerce Platform</h4>
                            <p class="project-description">
                                A comprehensive e-commerce solution with user authentication, product catalog, 
                                shopping cart, and payment integration. Built with ASP.NET Web Forms and SQL Server.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">ASP.NET</span>
                                <span class="tech-tag">C#</span>
                                <span class="tech-tag">SQL Server</span>
                                <span class="tech-tag">JavaScript</span>
                                <span class="tech-tag">PayPal API</span>
                            </div>
                            <div style="margin-top: auto;">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                    View Project
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-tasks"></i>
                            <div class="project-overlay">
                                <div style="display: flex; gap: 1rem;">
                                    <a href="Projects.aspx" class="btn btn-primary">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                    <a href="https://github.com/Shakhoyat/task-manager" target="_blank" class="btn btn-secondary">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="project-content">
                            <h4 class="project-title">Task Management System</h4>
                            <p class="project-description">
                                A collaborative task management application for teams with real-time updates, 
                                file attachments, and progress tracking. Features modern UI and responsive design.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">ASP.NET</span>
                                <span class="tech-tag">AJAX</span>
                                <span class="tech-tag">jQuery</span>
                                <span class="tech-tag">SignalR</span>
                                <span class="tech-tag">SQL Server</span>
                            </div>
                            <div style="margin-top: auto;">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                    View Project
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Projects.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View All Projects
                </a>
            </div>
        </div>
    </div>

    <!-- Skills Preview -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Core Technologies</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fab fa-microsoft"></i>
                        </div>
                        <h4 class="card-title">ASP.NET</h4>
                        <p class="card-text">Web Forms, C#, .NET Framework</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-database"></i>
                        </div>
                        <h4 class="card-title">SQL Server</h4>
                        <p class="card-text">Database Design, T-SQL, Optimization</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fab fa-js-square"></i>
                        </div>
                        <h4 class="card-title">JavaScript</h4>
                        <p class="card-text">ES6+, jQuery, AJAX, DOM</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fab fa-git-alt"></i>
                        </div>
                        <h4 class="card-title">Version Control</h4>
                        <p class="card-text">Git, GitHub, Collaboration</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Skills.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-chart-bar" style="margin-right: 0.75rem;"></i>
                    View All Skills
                </a>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Ready to Work Together?</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                I'm available for freelance projects and full-time opportunities. 
                Let's discuss how we can bring your ideas to life with clean, efficient code.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Contact.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-handshake" style="margin-right: 0.75rem;"></i>
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
        // Add smooth scroll animation effects
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card, .project-card');
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
            const elements = document.querySelectorAll('.card, .project-card');
            elements.forEach(element => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.6s ease-out';
            });
            
            // Trigger initial animation
            setTimeout(animateOnScroll, 200);
        });

        // Add typing effect to subtitle
        window.addEventListener('load', function() {
            const subtitle = document.querySelector('.subtitle');
            if (subtitle) {
                const text = tooltip.textContent;
                subtitle.textContent = '';
                let i = 0;
                
                function typeWriter() {
                    if (i < text.length) {
                        subtitle.textContent += text.charAt(i);
                        i++;
                        setTimeout(typeWriter, 100);
                    }
                }
                
                setTimeout(typeWriter, 1000);
            }
        });
    </script>
</asp:Content>