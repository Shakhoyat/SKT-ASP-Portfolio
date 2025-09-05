<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SKT_ASP_Portfolio.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- About Hero Section -->
    <section class="hero-section bg-primary">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 text-white mb-4">About Me</h1>
                    <p class="lead text-white mb-4">
                        I'm a passionate full-stack developer with a strong foundation in .NET technologies 
                        and a commitment to creating innovative, user-friendly solutions.
                    </p>
                    <div class="d-flex gap-3">
                        <a href="#skills" class="btn btn-light btn-lg">
                            <i class="fas fa-code"></i> My Skills
                        </a>
                        <a href="Contact.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-envelope"></i> Contact Me
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <img src="Images/profile-about.jpg" alt="SKT Profile" 
                         class="img-fluid rounded-circle shadow-lg" 
                         style="width: 350px; height: 350px; object-fit: cover; background-color: rgba(255,255,255,0.1);">
                </div>
            </div>
        </div>
    </section>

    <!-- Personal Story Section -->
    <section class="section bg-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h2 class="section-title">My Story</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <p class="lead">
                                My journey in software development began with a curiosity about how technology 
                                can solve real-world problems and improve people's lives.
                            </p>
                            <p>
                                Over the years, I've developed expertise in .NET Framework, ASP.NET Web Forms, 
                                and database design. I believe in writing clean, maintainable code and creating 
                                solutions that are both functional and user-friendly.
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p>
                                When I'm not coding, I enjoy exploring new technologies, contributing to open-source 
                                projects, and sharing knowledge with the developer community. I'm always eager to 
                                take on new challenges and learn from every project I work on.
                            </p>
                            <p class="text-primary-custom fw-bold">
                                "Great software is built by passionate developers who care about the details."
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Facts Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Quick Facts</h2>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card text-center h-100">
                        <div class="card-body">
                            <div class="skill-icon text-primary mb-3">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <h4 class="card-title">Experience</h4>
                            <p class="card-text text-muted">3+ Years in Development</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card text-center h-100">
                        <div class="card-body">
                            <div class="skill-icon text-success mb-3">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            <h4 class="card-title">Projects</h4>
                            <p class="card-text text-muted">15+ Completed Projects</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card text-center h-100">
                        <div class="card-body">
                            <div class="skill-icon text-info mb-3">
                                <i class="fas fa-code"></i>
                            </div>
                            <h4 class="card-title">Technologies</h4>
                            <p class="card-text text-muted">10+ Tech Stacks</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card text-center h-100">
                        <div class="card-body">
                            <div class="skill-icon text-warning mb-3">
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                            <h4 class="card-title">Learning</h4>
                            <p class="card-text text-muted">Continuous Improvement</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Skills Preview Section -->
    <section id="skills" class="section bg-white">
        <div class="container">
            <h2 class="section-title">Core Skills</h2>
            <p class="section-subtitle">Technologies and tools I work with to bring ideas to life</p>
            
            <div class="row">
                <!-- Backend Skills -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-server me-2"></i>Backend Development</h5>
                        </div>
                        <div class="card-body">
                            <asp:Repeater ID="BackendSkillsRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="mb-3">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <span class="fw-semibold"><%# Eval("Name") %></span>
                                            <span class="text-muted"><%# Eval("Level") %>%</span>
                                        </div>
                                        <div class="progress">
                                            <div class="progress-bar bg-primary" role="progressbar" 
                                                 style="width: <%# Eval("Level") %>%" 
                                                 aria-valuenow="<%# Eval("Level") %>" 
                                                 aria-valuemin="0" aria-valuemax="100">
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- Frontend Skills -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="fas fa-palette me-2"></i>Frontend Development</h5>
                        </div>
                        <div class="card-body">
                            <asp:Repeater ID="FrontendSkillsRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="mb-3">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <span class="fw-semibold"><%# Eval("Name") %></span>
                                            <span class="text-muted"><%# Eval("Level") %>%</span>
                                        </div>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" 
                                                 style="width: <%# Eval("Level") %>%" 
                                                 aria-valuenow="<%# Eval("Level") %>" 
                                                 aria-valuemin="0" aria-valuemax="100">
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- Tools & Database Skills -->
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0"><i class="fas fa-tools me-2"></i>Tools & Database</h5>
                        </div>
                        <div class="card-body">
                            <asp:Repeater ID="ToolsSkillsRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="mb-3">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <span class="fw-semibold"><%# Eval("Name") %></span>
                                            <span class="text-muted"><%# Eval("Level") %>%</span>
                                        </div>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" 
                                                 style="width: <%# Eval("Level") %>%" 
                                                 aria-valuenow="<%# Eval("Level") %>" 
                                                 aria-valuemin="0" aria-valuemax="100">
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <a href="Skills.aspx" class="btn btn-primary btn-lg">
                    <i class="fas fa-eye"></i> View All Skills & Certifications
                </a>
            </div>
        </div>
    </section>

    <!-- Values & Approach Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">My Approach</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="text-center">
                        <div class="skill-icon text-primary mb-3">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h4>Innovation</h4>
                        <p class="text-muted">
                            I believe in staying current with technology trends and finding creative 
                            solutions to complex problems.
                        </p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="text-center">
                        <div class="skill-icon text-success mb-3">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Collaboration</h4>
                        <p class="text-muted">
                            Great software is built by great teams. I value communication, 
                            feedback, and shared learning.
                        </p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="text-center">
                        <div class="skill-icon text-info mb-3">
                            <i class="fas fa-cogs"></i>
                        </div>
                        <h4>Quality</h4>
                        <p class="text-muted">
                            I'm committed to writing clean, maintainable code with proper testing 
                            and documentation.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="section bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2>Let's Build Something Amazing Together</h2>
                    <p class="lead mb-4">
                        I'm always interested in new opportunities and exciting projects. 
                        Whether you have a specific project in mind or just want to connect, I'd love to hear from you.
                    </p>
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="Projects.aspx" class="btn btn-light btn-lg">
                            <i class="fas fa-folder-open"></i> View My Portfolio
                        </a>
                        <a href="Contact.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-paper-plane"></i> Get In Touch
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg" target="_blank">
                            <i class="fas fa-download"></i> Download Resume
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>