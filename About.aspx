<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- About Hero Section -->
    <div class="section" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1 class="section-title" style="color: white; text-align: left; margin-bottom: 1rem;">About Me</h1>
                    <p style="font-size: 1.2rem; line-height: 1.6; margin-bottom: 2rem;">
                        I'm a passionate software developer with expertise in creating robust web applications 
                        using ASP.NET technologies. I love turning complex problems into simple, beautiful, 
                        and intuitive solutions.
                    </p>
                    <a href="Contact.aspx" class="btn btn-primary">Get In Touch</a>
                </div>
                <div class="col-md-4 text-center">
                    <div style="width: 200px; height: 200px; border-radius: 50%; background-color: rgba(255,255,255,0.1); margin: 0 auto; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-user fa-5x" style="color: rgba(255,255,255,0.8);"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Summary -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-briefcase" style="color: #007bff; margin-right: 0.5rem;"></i>
                            Professional Summary
                        </h3>
                        <p class="card-text">
                            With over <strong>X years</strong> of experience in software development, I specialize in:
                        </p>
                        <ul style="color: #6c757d; line-height: 1.8;">
                            <li>Full-stack web development using ASP.NET Framework</li>
                            <li>Database design and optimization with SQL Server</li>
                            <li>Responsive web design with modern CSS</li>
                            <li>Version control with Git and collaborative development</li>
                            <li>Problem-solving and analytical thinking</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-lightbulb" style="color: #ffc107; margin-right: 0.5rem;"></i>
                            What Drives Me
                        </h3>
                        <p class="card-text">
                            I'm passionate about creating solutions that make a real difference. Whether it's 
                            building user-friendly interfaces or optimizing backend performance, I believe 
                            in writing clean, maintainable code that stands the test of time.
                        </p>
                        <p class="card-text">
                            I'm always eager to learn new technologies and stay updated with the latest 
                            industry trends. I enjoy collaborating with teams and mentoring junior developers.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Skills Overview -->
    <div class="section" style="background-color: #f8f9fa;">
        <div class="container">
            <h2 class="section-title">Technical Skills</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-code fa-3x mb-3" style="color: #007bff;"></i>
                        <h4 class="card-title">Backend Development</h4>
                        <div style="text-align: left; color: #6c757d;">
                            <p><strong>Languages:</strong> C#, VB.NET</p>
                            <p><strong>Frameworks:</strong> ASP.NET Web Forms, .NET Framework</p>
                            <p><strong>Tools:</strong> Visual Studio, IIS</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-database fa-3x mb-3" style="color: #28a745;"></i>
                        <h4 class="card-title">Database & Data</h4>
                        <div style="text-align: left; color: #6c757d;">
                            <p><strong>Databases:</strong> SQL Server, LocalDB</p>
                            <p><strong>ORM:</strong> ADO.NET, Entity Framework</p>
                            <p><strong>Tools:</strong> SQL Server Management Studio</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-paint-brush fa-3x mb-3" style="color: #dc3545;"></i>
                        <h4 class="card-title">Frontend & Design</h4>
                        <div style="text-align: left; color: #6c757d;">
                            <p><strong>Languages:</strong> HTML5, CSS3, JavaScript</p>
                            <p><strong>Styling:</strong> Responsive Design, Flexbox, Grid</p>
                            <p><strong>Tools:</strong> Browser DevTools, Font Awesome</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="Skills.aspx" class="btn btn-primary">View Detailed Skills</a>
            </div>
        </div>
    </div>

    <!-- Personal Values -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Core Values</h2>
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <i class="fas fa-star fa-3x mb-3" style="color: #ffc107;"></i>
                    <h4>Quality First</h4>
                    <p class="card-text">
                        I believe in delivering high-quality solutions that exceed expectations. 
                        Every line of code is written with purpose and precision.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <i class="fas fa-users fa-3x mb-3" style="color: #17a2b8;"></i>
                    <h4>Collaboration</h4>
                    <p class="card-text">
                        Great software is built by great teams. I value open communication, 
                        knowledge sharing, and collective problem-solving.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <i class="fas fa-rocket fa-3x mb-3" style="color: #007bff;"></i>
                    <h4>Continuous Learning</h4>
                    <p class="card-text">
                        Technology evolves rapidly, and so do I. I'm committed to staying current 
                        with new tools, frameworks, and best practices.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section" style="background-color: #212529; color: white;">
        <div class="container text-center">
            <h2 style="color: white; margin-bottom: 1rem;">Let's Build Something Amazing Together</h2>
            <p style="font-size: 1.1rem; color: #adb5bd; margin-bottom: 2rem;">
                I'm always open to discussing new opportunities and exciting projects.
            </p>
            <a href="Projects.aspx" class="btn btn-primary" style="margin-right: 1rem;">View My Work</a>
            <a href="Contact.aspx" class="btn btn-secondary">Contact Me</a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>