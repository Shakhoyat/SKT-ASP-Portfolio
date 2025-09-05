<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="WebApplication1.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Projects Hero Section -->
    <div class="hero">
        <div class="container text-center">
            <h1 style="color: white; margin-bottom: 1rem;">My Projects</h1>
            <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto; color: white;">
                A showcase of my technical projects demonstrating various skills and technologies. 
                Each project represents a unique challenge and learning experience.
            </p>
        </div>
    </div>

    <!-- Projects Filter/Search Section -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3 style="color: var(--text-primary);">Filter Projects</h3>
                    <div class="project-filters">
                        <button class="filter-btn active" onclick="filterProjects('all')">All Projects</button>
                        <button class="filter-btn" onclick="filterProjects('web')">Web Applications</button>
                        <button class="filter-btn" onclick="filterProjects('database')">Database Projects</button>
                        <button class="filter-btn" onclick="filterProjects('api')">API Development</button>
                    </div>
                </div>
                <div class="col-md-6 text-right">
                    <div class="project-stats">
                        <div class="stat-item">
                            <span class="stat-number">
                                <asp:Literal ID="ltlTotalProjects" runat="server" />
                            </span>
                            <span class="stat-label">Total Projects</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Projects Grid -->
    <div class="section">
        <div class="container">
            <div class="row" id="projectsContainer">
                <asp:Repeater ID="rptProjects" runat="server" OnItemDataBound="rptProjects_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-6 mb-4 project-item" data-category="web">
                            <div class="project-card">
                                <div class="project-image">
                                    <div class="project-image-placeholder">
                                        <i class="fas fa-rocket"></i>
                                    </div>
                                    <div class="project-overlay">
                                        <div class="project-links">
                                            <asp:Literal ID="ltlProjectUrl" runat="server"></asp:Literal>
                                            <asp:Literal ID="ltlGitHubUrl" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="project-content">
                                    <div class="project-header">
                                        <h4 class="project-title"><%# Eval("Title") %></h4>
                                        <div class="project-duration"><%# Eval("Duration") %></div>
                                    </div>
                                    
                                    <p class="project-description"><%# Eval("ShortDescription") %></p>
                                    
                                    <div class="project-technologies">
                                        <asp:Repeater ID="rptTechnologies" runat="server">
                                            <ItemTemplate>
                                                <span class="tech-tag"><%# Container.DataItem %></span>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    
                                    <div class="project-meta">
                                        <div class="project-dates">
                                            <i class="fas fa-calendar-alt"></i>
                                            <%# Eval("FormattedStartDate") %> - <%# Eval("FormattedEndDate") %>
                                        </div>
                                    </div>
                                    
                                    <div class="project-actions">
                                        <button type="button" class="btn btn-outline-primary" onclick="showProjectDetails(<%# Eval("ProjectId") %>)">
                                            <i class="fas fa-info-circle"></i> View Details
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <!-- No Projects Message -->
            <div id="noProjectsMessage" style="display: none;" class="text-center py-5">
                <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
                <h3>No Projects Found</h3>
                <p class="text-muted">Try adjusting your filter criteria.</p>
            </div>
        </div>
    </div>

    <!-- Project Details Modal -->
    <div id="projectModal" class="modal" style="display: none;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Project Details</h3>
                <button type="button" class="modal-close" onclick="closeModal()">&times;</button>
            </div>
            <div class="modal-body">
                <div id="modalContent">
                    <!-- Project details will be loaded here via JavaScript/AJAX -->
                </div>
            </div>
        </div>
    </div>

    <!-- Technologies Section -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Technologies I Work With</h2>
            <div class="technologies-grid">
                <div class="tech-category">
                    <h4><i class="fas fa-code" style="color: var(--accent-color);"></i> Frontend</h4>
                    <div class="tech-items">
                        <span class="tech-item">HTML5</span>
                        <span class="tech-item">CSS3</span>
                        <span class="tech-item">JavaScript</span>
                        <span class="tech-item">jQuery</span>
                        <span class="tech-item">AJAX</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-server" style="color: var(--accent-color);"></i> Backend</h4>
                    <div class="tech-items">
                        <span class="tech-item">ASP.NET Web Forms</span>
                        <span class="tech-item">C#</span>
                        <span class="tech-item">.NET Framework</span>
                        <span class="tech-item">ADO.NET</span>
                        <span class="tech-item">Entity Framework</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-database" style="color: var(--accent-color);"></i> Database</h4>
                    <div class="tech-items">
                        <span class="tech-item">SQL Server</span>
                        <span class="tech-item">T-SQL</span>
                        <span class="tech-item">Stored Procedures</span>
                        <span class="tech-item">Database Design</span>
                    </div>
                </div>
                <div class="tech-category">
                    <h4><i class="fas fa-tools" style="color: var(--accent-color);"></i> Tools</h4>
                    <div class="tech-items">
                        <span class="tech-item">Visual Studio</span>
                        <span class="tech-item">Git</span>
                        <span class="tech-item">SQL Server Management Studio</span>
                        <span class="tech-item">IIS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Interested in My Work?</h2>
            <p style="font-size: 1.1rem; color: var(--text-secondary); margin-bottom: 2rem;">
                I'm always excited to take on new challenges and collaborate on interesting projects.
            </p>
            <a href="Contact.aspx" class="btn btn-primary" style="margin-right: 1rem;">Start a Project</a>
            <a href="Skills.aspx" class="btn btn-secondary">View My Skills</a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        // Project filtering functionality
        function filterProjects(category) {
            const projects = document.querySelectorAll('.project-item');
            const filterBtns = document.querySelectorAll('.filter-btn');
            const noProjectsMsg = document.getElementById('noProjectsMessage');
            
            // Update active filter button
            filterBtns.forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');
            
            let visibleCount = 0;
            
            projects.forEach(project => {
                if (category === 'all' || project.getAttribute('data-category') === category) {
                    project.style.display = 'block';
                    visibleCount++;
                } else {
                    project.style.display = 'none';
                }
            });
            
            // Show/hide no projects message
            noProjectsMsg.style.display = visibleCount === 0 ? 'block' : 'none';
        }

        // Project details modal
        function showProjectDetails(projectId) {
            // In a real application, this would make an AJAX call to get project details
            document.getElementById('projectModal').style.display = 'flex';
            document.getElementById('modalTitle').textContent = 'Project Details';
            document.getElementById('modalContent').innerHTML = '<p>Loading project details...</p>';
            
            // Simulate loading project details
            setTimeout(() => {
                document.getElementById('modalContent').innerHTML = `
                    <h4>Project #${projectId}</h4>
                    <p>Detailed project information would be loaded here via AJAX call to the server.</p>
                    <p>This could include full description, additional screenshots, technical details, challenges faced, and lessons learned.</p>
                `;
            }, 500);
        }

        function closeModal() {
            document.getElementById('projectModal').style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('projectModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</asp:Content>