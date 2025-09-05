<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="SKT_ASP_Portfolio.Projects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Projects Hero Section -->
    <section class="hero-section bg-gradient-secondary">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4 text-white mb-4">My Portfolio</h1>
                    <p class="lead text-white mb-4">
                        Explore my collection of web applications, databases, and development projects. 
                        Each project showcases different aspects of my technical skills and problem-solving abilities.
                    </p>
                    
                    <!-- Search and Filter Controls -->
                    <div class="projects-controls mb-4">
                        <div class="row justify-content-center">
                            <div class="col-md-6 mb-3">
                                <div class="input-group">
                                    <input type="text" id="projectSearch" class="form-control form-control-lg" 
                                           placeholder="Search projects..." aria-label="Search projects">
                                    <button class="btn btn-light" type="button">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        
                        <div class="projects-filter-buttons">
                            <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn active" data-filter="all">
                                <i class="fas fa-th"></i> All Projects
                            </button>
                            <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="web">
                                <i class="fas fa-globe"></i> Web Apps
                            </button>
                            <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="database">
                                <i class="fas fa-database"></i> Database
                            </button>
                            <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="api">
                                <i class="fas fa-code"></i> APIs
                            </button>
                            <button type="button" class="btn btn-outline-light me-2 mb-2 filter-btn" data-filter="frontend">
                                <i class="fas fa-paint-brush"></i> Frontend
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Statistics -->
    <section class="section bg-white">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-primary mb-3">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <h3 class="stats-number" data-target="15">0</h3>
                        <p class="stats-label">Total Projects</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-success mb-3">
                            <i class="fas fa-globe"></i>
                        </div>
                        <h3 class="stats-number" data-target="8">0</h3>
                        <p class="stats-label">Web Applications</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-info mb-3">
                            <i class="fas fa-database"></i>
                        </div>
                        <h3 class="stats-number" data-target="5">0</h3>
                        <p class="stats-label">Database Projects</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card text-center">
                        <div class="stats-icon text-warning mb-3">
                            <i class="fas fa-code-branch"></i>
                        </div>
                        <h3 class="stats-number" data-target="12">0</h3>
                        <p class="stats-label">GitHub Repositories</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Projects Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Featured Projects</h2>
            <p class="section-subtitle">Highlighted projects showcasing my best work and technical expertise</p>
            
            <div class="row" id="featuredProjects">
                <asp:Repeater ID="FeaturedProjectsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6 mb-4">
                            <div class="project-card featured-project" data-category="<%# Eval("Category") %>">
                                <div class="card h-100">
                                    <div class="project-image-container">
                                        <img src="<%# Eval("ImageUrl") %>" class="card-img-top project-image" alt="<%# Eval("Title") %>">
                                        <div class="project-overlay">
                                            <div class="project-actions">
                                                <button class="btn btn-light btn-sm me-2" onclick="openProjectModal('<%# Eval("Id") %>')">
                                                    <i class="fas fa-eye"></i> View Details
                                                </button>
                                                <a href="<%# Eval("DemoUrl") %>" class="btn btn-primary btn-sm me-2" target="_blank">
                                                    <i class="fas fa-external-link-alt"></i> Live Demo
                                                </a>
                                                <a href="<%# Eval("SourceUrl") %>" class="btn btn-secondary btn-sm" target="_blank">
                                                    <i class="fab fa-github"></i> Source
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h5 class="card-title mb-0"><%# Eval("Title") %></h5>
                                            <span class="badge bg-<%# Eval("CategoryColor") %>"><%# Eval("CategoryName") %></span>
                                        </div>
                                        <p class="card-text text-muted mb-3"><%# Eval("ShortDescription") %></p>
                                        <div class="project-technologies mb-3">
                                            <%# Eval("TechnologyTags") %>
                                        </div>
                                        <div class="project-meta">
                                            <small class="text-muted">
                                                <i class="fas fa-calendar"></i> <%# Eval("CompletedDate") %>
                                                <span class="ms-3">
                                                    <i class="fas fa-clock"></i> <%# Eval("Duration") %>
                                                </span>
                                            </small>
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

    <!-- All Projects Section -->
    <section class="section bg-white">
        <div class="container">
            <h2 class="section-title">All Projects</h2>
            <p class="section-subtitle">Complete collection of my development work</p>
            
            <div class="row" id="allProjects">
                <asp:Repeater ID="AllProjectsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="project-card" data-category="<%# Eval("Category") %>" data-title="<%# Eval("Title") %>" data-tech="<%# Eval("Technologies") %>">
                                <div class="card h-100">
                                    <div class="project-image-container">
                                        <img src="<%# Eval("ImageUrl") %>" class="card-img-top project-image" alt="<%# Eval("Title") %>">
                                        <div class="project-overlay">
                                            <div class="project-actions">
                                                <button class="btn btn-light btn-sm mb-2 w-100" onclick="openProjectModal('<%# Eval("Id") %>')">
                                                    <i class="fas fa-eye"></i> View Details
                                                </button>
                                                <div class="d-flex gap-2">
                                                    <a href="<%# Eval("DemoUrl") %>" class="btn btn-primary btn-sm flex-fill" target="_blank">
                                                        <i class="fas fa-external-link-alt"></i> Demo
                                                    </a>
                                                    <a href="<%# Eval("SourceUrl") %>" class="btn btn-secondary btn-sm flex-fill" target="_blank">
                                                        <i class="fab fa-github"></i> Code
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h6 class="card-title mb-0"><%# Eval("Title") %></h6>
                                            <span class="badge bg-<%# Eval("CategoryColor") %> badge-sm"><%# Eval("CategoryName") %></span>
                                        </div>
                                        <p class="card-text text-muted small mb-3"><%# Eval("ShortDescription") %></p>
                                        <div class="project-technologies mb-2">
                                            <%# Eval("TechnologyTags") %>
                                        </div>
                                        <div class="project-meta">
                                            <small class="text-muted">
                                                <i class="fas fa-calendar"></i> <%# Eval("CompletedDate") %>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <!-- No Projects Found Message -->
            <div id="noProjectsFound" class="text-center py-5" style="display: none;">
                <i class="fas fa-search fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No projects found</h4>
                <p class="text-muted">Try adjusting your search or filter criteria</p>
            </div>
        </div>
    </section>

    <!-- Project Modal -->
    <div class="modal fade" id="projectModal" tabindex="-1" aria-labelledby="projectModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectModalLabel">Project Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="projectModalBody">
                    <!-- Project details will be loaded here via JavaScript -->
                </div>
                <div class="modal-footer">
                    <a href="#" id="modalDemoLink" class="btn btn-primary" target="_blank">
                        <i class="fas fa-external-link-alt"></i> View Live Demo
                    </a>
                    <a href="#" id="modalSourceLink" class="btn btn-secondary" target="_blank">
                        <i class="fab fa-github"></i> View Source Code
                    </a>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <section class="section bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2>Interested in Working Together?</h2>
                    <p class="lead mb-4">
                        I'm always looking for new challenges and opportunities to create amazing software. 
                        Let's discuss your project and see how I can help bring your ideas to life.
                    </p>
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="Contact.aspx" class="btn btn-light btn-lg">
                            <i class="fas fa-paper-plane"></i> Start a Project
                        </a>
                        <a href="About.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-user"></i> Learn More About Me
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg" target="_blank">
                            <i class="fas fa-download"></i> Download Resume
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Hidden Project Details for Modal -->
    <asp:Literal ID="ProjectDetailsJson" runat="server"></asp:Literal>

</asp:Content>