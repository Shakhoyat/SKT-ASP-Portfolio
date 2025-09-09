<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="WebApplication1.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Projects Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="MY PROJECTS">MY PROJECTS</h1>
                <p class="hero-description">
                    A showcase of my technical projects spanning data science, machine learning, IoT systems, 
                    and full-stack development. Each project represents a unique challenge, innovative solution, 
                    and opportunity for growth in cutting-edge technologies.
                </p>
                <div class="projects-overview">
                    <div class="overview-stat">
                        <div class="overview-number"><asp:Literal ID="ltlProjectCount" runat="server" /></div>
                        <div class="overview-label">Active Projects</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">8</div>
                        <div class="overview-label">Technologies</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">5</div>
                        <div class="overview-label">Research Papers</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Projects Filter Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="CATEGORIES">PROJECT CATEGORIES</h2>
            <div class="project-filters">
                <button class="filter-btn active" onclick="filterProjects(event,'all'); return false;">
                    <i class="fas fa-th"></i>
                    <span>All Projects</span>
                </button>
                <button class="filter-btn" onclick="filterProjects(event,'datascience'); return false;">
                    <i class="fas fa-chart-line"></i>
                    <span>Data Science</span>
                </button>
                <button class="filter-btn" onclick="filterProjects(event,'ml'); return false;">
                    <i class="fas fa-brain"></i>
                    <span>Machine Learning</span>
                </button>
                <button class="filter-btn" onclick="filterProjects(event,'web'); return false;">
                    <i class="fas fa-code"></i>
                    <span>Web Development</span>
                </button>
                <button class="filter-btn" onclick="filterProjects(event,'iot'); return false;">
                    <i class="fas fa-microchip"></i>
                    <span>IoT Systems</span>
                </button>
                <button class="filter-btn" onclick="filterProjects(event,'research'); return false;">
                    <i class="fas fa-microscope"></i>
                    <span>Research</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Dynamic Projects Grid -->
    <div class="section section-alt">
        <div class="container">
            <div class="projects-grid" id="projectsContainer">
                <asp:Repeater ID="rptProjects" runat="server">
                    <ItemTemplate>
                        <div class="project-card project-item" data-category="<%# Eval("Category") %>">
                            <div class="project-image <%# Eval("ImageStyleClass") %>">
                                <i class="fas fa-project-diagram"></i>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="#" class="project-btn" onclick='showDbProjectDetails("<%# Eval("ProjectId") %>"); return false;'>
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <%# string.IsNullOrEmpty(Eval("GitHubUrl") as string) ? "" : "<a href='" + Eval("GitHubUrl") + "' target='_blank' class='project-btn'><i class='fab fa-github'></i></a>" %>
                                        <%# string.IsNullOrEmpty(Eval("ProjectUrl") as string) ? "" : "<a href='" + Eval("ProjectUrl") + "' target='_blank' class='project-btn'><i class='fas fa-external-link-alt'></i></a>" %>
                                    </div>
                                </div>
                            </div>
                            <div class="project-content">
                                <div class="project-header">
                                    <h3 class="project-title"><%# Eval("Title") %></h3>
                                    <span class="project-status <%# Eval("StatusCss") %>"><%# Eval("StatusText") %></span>
                                </div>
                                <p class="project-description"><%# Eval("ShortDescription") %></p>
                                <div class="project-tech-stack">
                                    <%# Eval("TechBadges") %>
                                </div>
                                <div class="project-metrics">
                                    <div class="metric">
                                        <i class="fas fa-calendar"></i>
                                        <span><%# Eval("DateRange") %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="noProjectsMessage" class="no-projects-message" runat="server" visible="false">
                <div class="no-projects-icon">
                    <i class="fas fa-folder-open"></i>
                </div>
                <h3>No Projects Found</h3>
                <p>Try adjusting your filter criteria to see more projects.</p>
            </div>
        </div>
    </div>

    <!-- Project Details Modal -->
    <div id="projectModal" class="project-modal" style="display: none;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Project Details</h3>
                <button type="button" class="modal-close" onclick="closeModal()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div id="modalContent"></div>
            </div>
        </div>
    </div>

    <!-- Technologies Section (unchanged) -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="TECH STACK">TECHNOLOGIES I USE</h2>
            <div class="tech-categories-grid">
                <div class="tech-category">
                    <div class="tech-category-icon datascience">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h4>Data Science</h4>
                    <div class="tech-items">
                        <span class="tech-item">Python</span>
                        <span class="tech-item">Pandas</span>
                        <span class="tech-item">NumPy</span>
                        <span class="tech-item">Matplotlib</span>
                        <span class="tech-item">Plotly</span>
                        <span class="tech-item">Jupyter</span>
                    </div>
                </div>
                <div class="tech-category">
                    <div class="tech-category-icon ml">
                        <i class="fas fa-brain"></i>
                    </div>
                    <h4>Machine Learning</h4>
                    <div class="tech-items">
                        <span class="tech-item">TensorFlow</span>
                        <span class="tech-item">PyTorch</span>
                        <span class="tech-item">Scikit-Learn</span>
                        <span class="tech-item">OpenCV</span>
                        <span class="tech-item">NLTK</span>
                        <span class="tech-item">Transformers</span>
                    </div>
                </div>
                <div class="tech-category">
                    <div class="tech-category-icon web">
                        <i class="fas fa-code"></i>
                    </div>
                    <h4>Web Development</h4>
                    <div class="tech-items">
                        <span class="tech-item">React</span>
                        <span class="tech-item">Next.js</span>
                        <span class="tech-item">Node.js</span>
                        <span class="tech-item">TypeScript</span>
                        <span class="tech-item">HTML5/CSS3</span>
                        <span class="tech-item">ASP.NET</span>
                    </div>
                </div>
                <div class="tech-category">
                    <div class="tech-category-icon database">
                        <i class="fas fa-database"></i>
                    </div>
                    <h4>Database & Cloud</h4>
                    <div class="tech-items">
                        <span class="tech-item">MySQL</span>
                        <span class="tech-item">PostgreSQL</span>
                        <span class="tech-item">MongoDB</span>
                        <span class="tech-item">AWS</span>
                        <span class="tech-item">Docker</span>
                        <span class="tech-item">Git</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section section-alt">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="COLLABORATE">LET'S COLLABORATE</h2>
            <p class="cta-description">
                Excited about any of these projects? Want to collaborate on something similar? 
                I'm always open to discussing new opportunities, research collaborations, and innovative challenges.
            </p>
            <div class="cta-buttons">
                <a href="Contact.aspx" class="btn-modern btn-primary">
                    <span>Start a Project</span>
                    <i class="fas fa-rocket"></i>
                </a>
                <a href="Skills.aspx" class="btn-modern btn-secondary">
                    <span>View My Skills</span>
                    <i class="fas fa-tools"></i>
                </a>
                <a href="https://github.com/Shakhoyat" target="_blank" class="btn-modern btn-outline">
                    <span>GitHub Profile</span>
                    <i class="fab fa-github"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Projects Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .projects-overview {
            display: flex;
            gap: 3rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .overview-stat {
            text-align: center;
        }

        .overview-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }

        .overview-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        /* Project Filters */
        .project-filters {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .filter-btn {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            color: var(--text-secondary);
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
        }

        .filter-btn:hover {
            border-color: var(--accent-color);
            color: var(--accent-color);
            transform: translateY(-2px);
        }

        .filter-btn.active {
            background: var(--accent-color);
            border-color: var(--accent-color);
            color: white;
        }

        .filter-btn i {
            font-size: 1rem;
        }

        /* Projects Grid */
        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .project-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            overflow: hidden;
            transition: var(--transition);
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .project-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-dark);
            border-color: var(--accent-color);
        }

        .project-image {
            position: relative;
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: white;
            overflow: hidden;
        }

        .project-image.healthcare { 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
        }
        .project-image.analytics { 
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%); 
        }
        .project-image.weather { 
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%); 
        }
        .project-image.iot { 
            background: linear-gradient(135deg, #FF9A56 0%, #FF6B95 100%); 
        }
        .project-image.vision { 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
        }
        .project-image.nlp { 
            background: linear-gradient(135deg, #4ECDC4 0%, #44A08D 100%); 
        }

        .project-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: var(--transition);
        }

        .project-card:hover .project-overlay {
            opacity: 1;
        }

        .project-actions {
            display: flex;
            gap: 1rem;
        }

        .project-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--accent-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: var(--transition);
        }

        .project-btn:hover {
            background: white;
            color: var(--accent-color);
            transform: scale(1.1);
            text-decoration: none;
        }

        .project-content {
            padding: 2rem;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .project-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }

        .project-title {
            color: var(--text-primary);
            margin: 0;
            font-size: 1.3rem;
            font-weight: 700;
        }

        .project-status {
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .project-status.completed {
            background: rgba(0, 184, 148, 0.2);
            color: #00b894;
        }

        .project-status.active {
            background: rgba(0, 212, 170, 0.2);
            color: var(--accent-color);
        }

        .project-description {
            color: var(--text-secondary);
            line-height: 1.6;
            margin-bottom: 1.5rem;
            flex: 1;
        }

        .project-tech-stack {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .tech-badge {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        .tech-badge.java { background: #f89820; color: #000; }
        .tech-badge.python { background: #3776ab; color: #fff; }
        .tech-badge.react { background: #61dafb; color: #000; }

        .project-metrics {
            display: flex;
            gap: 1rem;
            margin-top: auto;
        }

        .metric {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .metric i {
            color: var(--accent-color);
        }

        /* No Projects Message */
        .no-projects-message {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-muted);
        }

        .no-projects-icon {
            font-size: 4rem;
            margin-bottom: 2rem;
            opacity: 0.5;
        }

        /* Project Modal */
        .project-modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            backdrop-filter: blur(5px);
        }

        .modal-content {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            max-width: 800px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
        }

        .modal-header {
            padding: 2rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            margin: 0;
            color: var(--text-primary);
        }

        .modal-close {
            background: none;
            border: none;
            color: var(--text-muted);
            font-size: 1.5rem;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 50%;
            transition: var(--transition);
        }

        .modal-close:hover {
            background: var(--border-color);
            color: var(--text-primary);
        }

        .modal-body {
            padding: 2rem;
        }

        /* Tech Categories Grid */
        .tech-categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .tech-category {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .tech-category:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .tech-category-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 1.8rem;
            color: white;
        }

        .tech-category-icon.datascience {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .tech-category-icon.ml {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
        }

        .tech-category-icon.web {
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);
        }

        .tech-category-icon.database {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .tech-category h4 {
            margin-bottom: 1.5rem;
            color: var(--text-primary);
        }

        .tech-items {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            justify-content: center;
        }

        .tech-item {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.4rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        /* CTA Section */
        .cta-description {
            font-size: 1.2rem;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .projects-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .project-filters {
                gap: 0.5rem;
            }

            .filter-btn {
                padding: 0.8rem 1rem;
                font-size: 0.9rem;
            }

            .projects-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .tech-categories-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn-modern {
                width: 100%;
                max-width: 300px;
            }

            .modal-content {
                width: 95%;
                margin: 1rem;
            }

            .modal-header,
            .modal-body {
                padding: 1.5rem;
            }
        }
    </style>

    <script>
        function filterProjects(e, category) {
            const projects = document.querySelectorAll('.project-item');
            const filterBtns = document.querySelectorAll('.filter-btn');
            const noProjectsMsg = document.getElementById('<%= noProjectsMessage.ClientID %>');
            filterBtns.forEach(btn => btn.classList.remove('active'));
            e.currentTarget.classList.add('active');
            let visible = 0;
            projects.forEach(p => {
                if (category === 'all' || p.getAttribute('data-category') === category) {
                    p.style.display = 'block'; visible++; }
                else { p.style.display = 'none'; }
            });
            if (noProjectsMsg) noProjectsMsg.style.display = visible === 0 ? 'block' : 'none';
        }
        function showDbProjectDetails(id) {
            // Basic modal with placeholder - could be extended to AJAX load full description
            const modal = document.getElementById('projectModal');
            const title = document.getElementById('modalTitle');
            const content = document.getElementById('modalContent');
            const card = document.querySelector('.project-item a[onclick*="' + id + '"]');
            title.textContent = 'Project #' + id;
            content.innerHTML = '<p style="color: var(--text-secondary);">Full project description coming soon. (Enhance by loading from server.)</p>';
            modal.style.display = 'flex';
        }
        function closeModal(){ document.getElementById('projectModal').style.display='none'; }
        window.onclick = function(ev){ const m=document.getElementById('projectModal'); if(ev.target===m) closeModal(); }
    </script>
</asp:Content>