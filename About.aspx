<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- About Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row" style="align-items: center; text-align: left;">
                <div class="col-md-8">
                    <h1 style="color: white; text-align: left; margin-bottom: 1.5rem; font-size: 3.5rem;">About Me</h1>
                    <p style="font-size: 1.3rem; line-height: 1.6; margin-bottom: 2rem; color: white; opacity: 0.95;">
                        I'm a passionate software developer with expertise in creating robust web applications 
                        using ASP.NET technologies. I love turning complex problems into simple, beautiful, 
                        and intuitive solutions.
                    </p>
                    <a href="Contact.aspx" class="btn btn-secondary" style="padding: 1rem 2rem;">
                        <i class="fas fa-paper-plane" style="margin-right: 0.5rem;"></i>
                        Get In Touch
                    </a>
                </div>
                <div class="col-md-4 text-center">
                    <div style="width: 220px; height: 220px; border-radius: 50%; background: rgba(255,255,255,0.15); margin: 0 auto; display: flex; align-items: center; justify-content: center; backdrop-filter: blur(10px); border: 3px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-user fa-5x" style="color: rgba(255,255,255,0.9);"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Journey -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">My Journey</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="width: 80px; height: 80px; border-radius: 50%; background: var(--gradient-primary); margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                                <i class="fas fa-briefcase"></i>
                            </div>
                            <h3 class="card-title">Professional Background</h3>
                        </div>
                        <p class="card-text">
                            With a strong foundation in computer science and practical experience in software development, 
                            I specialize in full-stack web development using Microsoft technologies.
                        </p>
                        <ul style="color: var(--text-secondary); line-height: 1.8; margin: 1.5rem 0;">
                            <li><strong>Full-stack Development:</strong> ASP.NET Web Forms, C#, SQL Server</li>
                            <li><strong>Database Design:</strong> Relational database modeling and optimization</li>
                            <li><strong>Frontend Technologies:</strong> HTML5, CSS3, JavaScript, jQuery</li>
                            <li><strong>Version Control:</strong> Git and collaborative development workflows</li>
                            <li><strong>Problem Solving:</strong> Analytical thinking and debugging expertise</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="width: 80px; height: 80px; border-radius: 50%; background: var(--gradient-accent); margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                                <i class="fas fa-lightbulb"></i>
                            </div>
                            <h3 class="card-title">What Drives Me</h3>
                        </div>
                        <p class="card-text">
                            I'm passionate about creating solutions that make a real difference. Whether it's 
                            building user-friendly interfaces or optimizing backend performance, I believe 
                            in writing clean, maintainable code that stands the test of time.
                        </p>
                        <p class="card-text">
                            I'm always eager to learn new technologies and stay updated with the latest 
                            industry trends. I enjoy collaborating with teams and sharing knowledge to 
                            create better software solutions.
                        </p>
                        <div style="margin-top: 2rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-tools" style="margin-right: 0.5rem;"></i>
                                View My Skills
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Technical Expertise -->
    <div class="section" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
        <div class="container">
            <h2 class="section-title">Technical Expertise</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h4 class="card-title">Backend Development</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Languages:</strong> C#, VB.NET, T-SQL</p>
                            <p><strong>Frameworks:</strong> ASP.NET Web Forms, .NET Framework</p>
                            <p><strong>Tools:</strong> Visual Studio, SQL Server Management Studio</p>
                            <p><strong>Concepts:</strong> OOP, Design Patterns, SOLID Principles</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-database"></i>
                        </div>
                        <h4 class="card-title">Database & Data</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Databases:</strong> SQL Server, LocalDB</p>
                            <p><strong>Technologies:</strong> ADO.NET, Entity Framework</p>
                            <p><strong>Skills:</strong> Database Design, Query Optimization</p>
                            <p><strong>Tools:</strong> SSMS, Database Diagrams, Indexing</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-paint-brush"></i>
                        </div>
                        <h4 class="card-title">Frontend & Design</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Languages:</strong> HTML5, CSS3, JavaScript</p>
                            <p><strong>Libraries:</strong> jQuery, Font Awesome</p>
                            <p><strong>Concepts:</strong> Responsive Design, UX/UI</p>
                            <p><strong>Tools:</strong> Browser DevTools, CSS Grid/Flexbox</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Skills.aspx" class="btn btn-primary" style="padding: 1rem 2rem; font-size: 1.1rem;">
                    <i class="fas fa-chart-bar" style="margin-right: 0.75rem;"></i>
                    View Detailed Skills
                </a>
            </div>
        </div>
    </div>

    <!-- Core Values -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Core Values</h2>
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-star"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Quality First</h4>
                    <p class="card-text">
                        I believe in delivering high-quality solutions that exceed expectations. 
                        Every line of code is written with purpose, following best practices and 
                        industry standards.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Collaboration</h4>
                    <p class="card-text">
                        Great software is built by great teams. I value open communication, 
                        knowledge sharing, and collective problem-solving to achieve common goals.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Continuous Learning</h4>
                    <p class="card-text">
                        Technology evolves rapidly, and so do I. I'm committed to staying current 
                        with new tools, frameworks, and methodologies to deliver modern solutions.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Education & Learning -->
    <div class="section" style="background: var(--dark-bg); color: white;">
        <div class="container">
            <h2 class="section-title" style="color: white;">Education & Learning</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2); color: white;">
                        <h4 style="color: white; margin-bottom: 1.5rem;">
                            <i class="fas fa-graduation-cap" style="color: #667eea; margin-right: 0.75rem;"></i>
                            Formal Education
                        </h4>
                        <p style="color: rgba(255,255,255,0.9); margin-bottom: 1rem;">
                            Strong foundation in computer science principles, software engineering, 
                            and modern development practices.
                        </p>
                        <ul style="color: rgba(255,255,255,0.8); line-height: 1.8;">
                            <li>Computer Science Fundamentals</li>
                            <li>Object-Oriented Programming</li>
                            <li>Database Systems & Design</li>
                            <li>Software Engineering Principles</li>
                            <li>Web Development Technologies</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2); color: white;">
                        <h4 style="color: white; margin-bottom: 1.5rem;">
                            <i class="fas fa-book" style="color: #fdcb6e; margin-right: 0.75rem;"></i>
                            Continuous Learning
                        </h4>
                        <p style="color: rgba(255,255,255,0.9); margin-bottom: 1rem;">
                            Always expanding my knowledge through online courses, documentation, 
                            and hands-on practice with new technologies.
                        </p>
                        <ul style="color: rgba(255,255,255,0.8); line-height: 1.8;">
                            <li>Microsoft Documentation & Tutorials</li>
                            <li>Online Programming Courses</li>
                            <li>Technical Blogs & Articles</li>
                            <li>Open Source Contributions</li>
                            <li>Personal Projects & Experiments</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Let's Build Something Amazing Together</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                I'm always open to discussing new opportunities and exciting projects. 
                Whether you have a specific project in mind or just want to connect, I'd love to hear from you.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Projects.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View My Work
                </a>
                <a href="Contact.aspx" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-paper-plane" style="margin-right: 0.75rem;"></i>
                    Contact Me
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>