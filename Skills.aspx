<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="SKT_ASP_Portfolio.Skills" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Skills Hero Section -->
    <section class="hero-section bg-gradient-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4 text-white mb-4">Technical Skills & Expertise</h1>
                    <p class="lead text-white mb-4">
                        A comprehensive overview of my technical skills, certifications, and continuous learning journey
                    </p>
                    <div class="skills-filter-buttons">
                        <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn active" data-filter="all">
                            <i class="fas fa-th"></i> All Skills
                        </button>
                        <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="backend">
                            <i class="fas fa-server"></i> Backend
                        </button>
                        <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="frontend">
                            <i class="fas fa-palette"></i> Frontend
                        </button>
                        <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="database">
                            <i class="fas fa-database"></i> Database
                        </button>
                        <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="tools">
                            <i class="fas fa-tools"></i> Tools
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Overview Stats -->
    <section class="section bg-white">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-primary mb-3">
                            <i class="fas fa-code"></i>
                        </div>
                        <h3 class="stats-number" data-target="25">0</h3>
                        <p class="stats-label">Technologies</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-success mb-3">
                            <i class="fas fa-certificate"></i>
                        </div>
                        <h3 class="stats-number" data-target="8">0</h3>
                        <p class="stats-label">Certifications</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-info mb-3">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3 class="stats-number" data-target="3">0</h3>
                        <p class="stats-label">Years Experience</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-warning mb-3">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <h3 class="stats-number" data-target="15">0</h3>
                        <p class="stats-label">Projects Completed</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Detailed Skills Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Technical Proficiency</h2>
            <p class="section-subtitle">Detailed breakdown of my skills across different technology stacks</p>
            
            <div class="row">
                <!-- Backend Development -->
                <div class="col-lg-6 mb-4">
                    <div class="skills-category-card" data-category="backend">
                        <div class="card h-100">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-server me-2"></i>Backend Development
                                    <span class="badge bg-light text-primary ms-2">6 Skills</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <asp:Repeater ID="BackendSkillsRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="skill-item mb-4">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="skill-info">
                                                    <span class="skill-name fw-bold"><%# Eval("Name") %></span>
                                                    <span class="skill-experience text-muted ms-2"><%# Eval("Experience") %></span>
                                                </div>
                                                <div class="skill-level">
                                                    <span class="badge bg-primary"><%# Eval("Level") %>%</span>
                                                </div>
                                            </div>
                                            <div class="progress skill-progress">
                                                <div class="progress-bar bg-primary" role="progressbar" 
                                                     style="width: <%# Eval("Level") %>%" 
                                                     aria-valuenow="<%# Eval("Level") %>" 
                                                     aria-valuemin="0" aria-valuemax="100">
                                                </div>
                                            </div>
                                            <p class="skill-description text-muted mt-2"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Frontend Development -->
                <div class="col-lg-6 mb-4">
                    <div class="skills-category-card" data-category="frontend">
                        <div class="card h-100">
                            <div class="card-header bg-success text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-palette me-2"></i>Frontend Development
                                    <span class="badge bg-light text-success ms-2">7 Skills</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <asp:Repeater ID="FrontendSkillsRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="skill-item mb-4">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="skill-info">
                                                    <span class="skill-name fw-bold"><%# Eval("Name") %></span>
                                                    <span class="skill-experience text-muted ms-2"><%# Eval("Experience") %></span>
                                                </div>
                                                <div class="skill-level">
                                                    <span class="badge bg-success"><%# Eval("Level") %>%</span>
                                                </div>
                                            </div>
                                            <div class="progress skill-progress">
                                                <div class="progress-bar bg-success" role="progressbar" 
                                                     style="width: <%# Eval("Level") %>%" 
                                                     aria-valuenow="<%# Eval("Level") %>" 
                                                     aria-valuemin="0" aria-valuemax="100">
                                                </div>
                                            </div>
                                            <p class="skill-description text-muted mt-2"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Database & Data -->
                <div class="col-lg-6 mb-4">
                    <div class="skills-category-card" data-category="database">
                        <div class="card h-100">
                            <div class="card-header bg-info text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-database me-2"></i>Database & Data
                                    <span class="badge bg-light text-info ms-2">5 Skills</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <asp:Repeater ID="DatabaseSkillsRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="skill-item mb-4">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="skill-info">
                                                    <span class="skill-name fw-bold"><%# Eval("Name") %></span>
                                                    <span class="skill-experience text-muted ms-2"><%# Eval("Experience") %></span>
                                                </div>
                                                <div class="skill-level">
                                                    <span class="badge bg-info"><%# Eval("Level") %>%</span>
                                                </div>
                                            </div>
                                            <div class="progress skill-progress">
                                                <div class="progress-bar bg-info" role="progressbar" 
                                                     style="width: <%# Eval("Level") %>%" 
                                                     aria-valuenow="<%# Eval("Level") %>" 
                                                     aria-valuemin="0" aria-valuemax="100">
                                                </div>
                                            </div>
                                            <p class="skill-description text-muted mt-2"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tools & DevOps -->
                <div class="col-lg-6 mb-4">
                    <div class="skills-category-card" data-category="tools">
                        <div class="card h-100">
                            <div class="card-header bg-warning text-dark">
                                <h5 class="mb-0">
                                    <i class="fas fa-tools me-2"></i>Tools & DevOps
                                    <span class="badge bg-dark text-warning ms-2">7 Skills</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <asp:Repeater ID="ToolsSkillsRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="skill-item mb-4">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="skill-info">
                                                    <span class="skill-name fw-bold"><%# Eval("Name") %></span>
                                                    <span class="skill-experience text-muted ms-2"><%# Eval("Experience") %></span>
                                                </div>
                                                <div class="skill-level">
                                                    <span class="badge bg-warning text-dark"><%# Eval("Level") %>%</span>
                                                </div>
                                            </div>
                                            <div class="progress skill-progress">
                                                <div class="progress-bar bg-warning" role="progressbar" 
                                                     style="width: <%# Eval("Level") %>%" 
                                                     aria-valuenow="<%# Eval("Level") %>" 
                                                     aria-valuemin="0" aria-valuemax="100">
                                                </div>
                                            </div>
                                            <p class="skill-description text-muted mt-2"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Certifications Section -->
    <section class="section bg-white">
        <div class="container">
            <h2 class="section-title">Certifications & Learning</h2>
            <p class="section-subtitle">Professional certifications and continuous learning achievements</p>
            
            <div class="row">
                <asp:Repeater ID="CertificationsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="certification-card">
                                <div class="card h-100">
                                    <div class="card-body text-center">
                                        <div class="cert-icon mb-3">
                                            <i class="<%# Eval("IconClass") %> text-primary"></i>
                                        </div>
                                        <h5 class="card-title"><%# Eval("Title") %></h5>
                                        <p class="text-muted mb-2"><%# Eval("Provider") %></p>
                                        <p class="cert-date text-info"><%# Eval("Date") %></p>
                                        <p class="card-text"><%# Eval("Description") %></p>
                                        <div class="cert-status">
                                            <span class="badge bg-success"><%# Eval("Status") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Learning Timeline -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Learning Journey</h2>
            <p class="section-subtitle">My continuous learning and skill development timeline</p>
            
            <div class="timeline">
                <asp:Repeater ID="LearningTimelineRepeater" runat="server">
                    <ItemTemplate>
                        <div class="timeline-item <%# Container.ItemIndex % 2 == 0 ? "timeline-left" : "timeline-right" %>">
                            <div class="timeline-content">
                                <div class="timeline-date"><%# Eval("Year") %></div>
                                <h5 class="timeline-title"><%# Eval("Title") %></h5>
                                <p class="timeline-description"><%# Eval("Description") %></p>
                                <div class="timeline-skills">
                                    <%# Eval("Skills") %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="section bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2>Ready to Collaborate?</h2>
                    <p class="lead mb-4">
                        I'm always excited to work on challenging projects and learn new technologies. 
                        Let's discuss how my skills can contribute to your next project.
                    </p>
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="Projects.aspx" class="btn btn-light btn-lg">
                            <i class="fas fa-eye"></i> View My Projects
                        </a>
                        <a href="Contact.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-envelope"></i> Contact Me
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>