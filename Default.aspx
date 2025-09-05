<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <h1>Welcome to My Portfolio</h1>
            <p>I'm a passionate developer creating innovative solutions with modern technologies</p>
            <a href="About.aspx" class="btn btn-primary">Learn More About Me</a>
        </div>
    </div>

    <!-- Featured Sections -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">What I Do</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-code fa-3x mb-3" style="color: #007bff;"></i>
                        <h3 class="card-title">Web Development</h3>
                        <p class="card-text">Creating responsive and dynamic web applications using modern technologies and best practices.</p>
                        <a href="Projects.aspx" class="btn btn-secondary">View Projects</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-database fa-3x mb-3" style="color: #28a745;"></i>
                        <h3 class="card-title">Database Design</h3>
                        <p class="card-text">Designing efficient database structures and implementing robust data management solutions.</p>
                        <a href="Skills.aspx" class="btn btn-secondary">View Skills</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <i class="fas fa-mobile-alt fa-3x mb-3" style="color: #ffc107;"></i>
                        <h3 class="card-title">Mobile-First Design</h3>
                        <p class="card-text">Building applications with mobile-first approach ensuring great user experience across all devices.</p>
                        <a href="About.aspx" class="btn btn-secondary">About Me</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Projects Preview -->
    <div class="section" style="background-color: #fff;">
        <div class="container">
            <h2 class="section-title">Recent Projects</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <h4 class="card-title">E-Commerce Platform</h4>
                        <p class="card-text">A full-featured e-commerce solution built with ASP.NET and SQL Server, featuring user authentication, product catalog, and payment integration.</p>
                        <a href="Projects.aspx" class="btn btn-primary">View Details</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h4 class="card-title">Task Management System</h4>
                        <p class="card-text">A collaborative task management application with real-time updates, team collaboration features, and comprehensive reporting.</p>
                        <a href="Projects.aspx" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="Projects.aspx" class="btn btn-secondary">View All Projects</a>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Let's Work Together</h2>
            <p style="font-size: 1.1rem; color: #6c757d; margin-bottom: 2rem;">
                I'm always interested in new opportunities and exciting projects. 
                Let's discuss how we can bring your ideas to life.
            </p>
            <a href="Contact.aspx" class="btn btn-primary" style="margin-right: 1rem;">Get In Touch</a>
            <a href="~/Content/Resume.pdf" class="btn btn-secondary" target="_blank">Download Resume</a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>