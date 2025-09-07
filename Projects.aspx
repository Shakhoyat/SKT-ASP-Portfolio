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
                        <div class="overview-number">15+</div>
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
                <button class="filter-btn active" onclick="filterProjects('all')">
                    <i class="fas fa-th"></i>
                    <span>All Projects</span>
                </button>
                <button class="filter-btn" onclick="filterProjects('datascience')">
                    <i class="fas fa-chart-line"></i>
                    <span>Data Science</span>
                </button>
                <button class="filter-btn" onclick="filterProjects('ml')">
                    <i class="fas fa-brain"></i>
                    <span>Machine Learning</span>
                </button>
                <button class="filter-btn" onclick="filterProjects('web')">
                    <i class="fas fa-code"></i>
                    <span>Web Development</span>
                </button>
                <button class="filter-btn" onclick="filterProjects('iot')">
                    <i class="fas fa-microchip"></i>
                    <span>IoT Systems</span>
                </button>
                <button class="filter-btn" onclick="filterProjects('research')">
                    <i class="fas fa-microscope"></i>
                    <span>Research</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Featured Projects Grid -->
    <div class="section section-alt">
        <div class="container">
            <div class="projects-grid" id="projectsContainer">
                <!-- Project 1: Doctor Appointment System -->
                <div class="project-card project-item" data-category="ml">
                    <div class="project-image healthcare">
                        <i class="fas fa-user-md"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(1)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">Doctor Appointment System</h3>
                            <span class="project-status completed">Completed</span>
                        </div>
                        <p class="project-description">
                            Healthcare management system with ML-powered resource allocation and predictive analytics 
                            for optimizing appointment scheduling and patient flow.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge java">Java</span>
                            <span class="tech-badge">JavaFX</span>
                            <span class="tech-badge">MySQL</span>
                            <span class="tech-badge">ML</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-users"></i>
                                <span>500+ Patients</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-clock"></i>
                                <span>40% Time Saved</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 2: Automated EDA Platform -->
                <div class="project-card project-item" data-category="datascience">
                    <div class="project-image analytics">
                        <i class="fas fa-chart-line"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(2)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">Automated EDA Platform</h3>
                            <span class="project-status active">Active</span>
                        </div>
                        <p class="project-description">
                            Intelligent data exploration platform that reduces analysis time by 70% through automated 
                            insights generation, statistical analysis, and interactive visualizations.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge python">Python</span>
                            <span class="tech-badge">Streamlit</span>
                            <span class="tech-badge">Pandas</span>
                            <span class="tech-badge">Plotly</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-tachometer-alt"></i>
                                <span>70% Faster</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-chart-bar"></i>
                                <span>50+ Visualizations</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 3: Weather Analytics WebApp -->
                <div class="project-card project-item" data-category="web">
                    <div class="project-image weather">
                        <i class="fas fa-cloud-sun"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(3)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">Weather Analytics WebApp</h3>
                            <span class="project-status completed">Completed</span>
                        </div>
                        <p class="project-description">
                            Real-time weather forecasting application with geospatial analysis, interactive maps, 
                            and predictive modeling for weather pattern analysis.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge react">React</span>
                            <span class="tech-badge">TypeScript</span>
                            <span class="tech-badge">APIs</span>
                            <span class="tech-badge">Maps</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>100+ Cities</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-sync"></i>
                                <span>Real-time Data</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 4: IoT Data Analytics -->
                <div class="project-card project-item" data-category="iot">
                    <div class="project-image iot">
                        <i class="fas fa-wifi"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(4)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">IoT Data Analytics Platform</h3>
                            <span class="project-status active">In Progress</span>
                        </div>
                        <p class="project-description">
                            Comprehensive IoT platform for real-time sensor data processing with machine learning 
                            insights, edge computing capabilities, and predictive maintenance.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge python">Python</span>
                            <span class="tech-badge">IoT</span>
                            <span class="tech-badge">MongoDB</span>
                            <span class="tech-badge">ML</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-microchip"></i>
                                <span>20+ Sensors</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-database"></i>
                                <span>1M+ Data Points</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 5: Computer Vision Detection -->
                <div class="project-card project-item" data-category="ml">
                    <div class="project-image vision">
                        <i class="fas fa-eye"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(5)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">Computer Vision Detection</h3>
                            <span class="project-status completed">Research</span>
                        </div>
                        <p class="project-description">
                            Advanced object detection system using deep learning models with real-time processing 
                            capabilities for industrial automation and surveillance applications.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge python">Python</span>
                            <span class="tech-badge">OpenCV</span>
                            <span class="tech-badge">TensorFlow</span>
                            <span class="tech-badge">CNN</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-bullseye"></i>
                                <span>95% Accuracy</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-clock"></i>
                                <span>Real-time</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project 6: NLP Text Analysis -->
                <div class="project-card project-item" data-category="research">
                    <div class="project-image nlp">
                        <i class="fas fa-comments"></i>
                        <div class="project-overlay">
                            <div class="project-actions">
                                <a href="#" class="project-btn" onclick="showProjectDetails(6)">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="project-btn">
                                    <i class="fas fa-external-link-alt"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <div class="project-header">
                            <h3 class="project-title">NLP Text Analysis Engine</h3>
                            <span class="project-status active">Research</span>
                        </div>
                        <p class="project-description">
                            Natural language processing system for sentiment analysis, text classification, 
                            and automated content generation using transformer models and deep learning.
                        </p>
                        <div class="project-tech-stack">
                            <span class="tech-badge python">Python</span>
                            <span class="tech-badge">NLTK</span>
                            <span class="tech-badge">Transformers</span>
                            <span class="tech-badge">NLP</span>
                        </div>
                        <div class="project-metrics">
                            <div class="metric">
                                <i class="fas fa-language"></i>
                                <span>5 Languages</span>
                            </div>
                            <div class="metric">
                                <i class="fas fa-chart-line"></i>
                                <span>92% F1-Score</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- No Projects Message -->
            <div id="noProjectsMessage" class="no-projects-message" style="display: none;">
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
                <div id="modalContent">
                    <!-- Project details will be loaded here -->
                </div>
            </div>
        </div>
    </div>

    <!-- Technologies Section -->
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
        // Project filtering functionality
        function filterProjects(category) {
            const projects = document.querySelectorAll('.project-item');
            const filterBtns = document.querySelectorAll('.filter-btn');
            const noProjectsMsg = document.getElementById('noProjectsMessage');
            
            // Update active filter button
            filterBtns.forEach(btn => btn.classList.remove('active'));
            event.target.closest('.filter-btn').classList.add('active');
            
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
            const modal = document.getElementById('projectModal');
            const modalTitle = document.getElementById('modalTitle');
            const modalContent = document.getElementById('modalContent');
            
            modal.style.display = 'flex';
            modalTitle.textContent = 'Project Details';
            modalContent.innerHTML = '<div style="text-align: center; padding: 2rem;"><i class="fas fa-spinner fa-spin fa-2x" style="color: var(--accent-color);"></i><p style="margin-top: 1rem;">Loading project details...</p></div>';
            
            // Simulate loading project details with specific content based on projectId
            setTimeout(() => {
                let projectDetails = '';
                
                switch(projectId) {
                    case 1:
                        projectDetails = `
                            <h4 style="color: var(--accent-color); margin-bottom: 1rem;">Doctor Appointment System</h4>
                            <div style="background: var(--secondary-bg); padding: 1.5rem; border-radius: 8px; margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Project Overview</h5>
                                <p style="color: var(--text-secondary); line-height: 1.6;">
                                    A comprehensive healthcare management system designed to optimize patient flow and resource allocation 
                                    using machine learning algorithms. The system predicts optimal appointment scheduling based on 
                                    historical data, patient demographics, and doctor availability.
                                </p>
                            </div>
                            <div style="margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Key Features</h5>
                                <ul style="color: var(--text-secondary); line-height: 1.8;">
                                    <li>ML-powered appointment scheduling optimization</li>
                                    <li>Patient management with demographic analysis</li>
                                    <li>Doctor availability and workload balancing</li>
                                    <li>Predictive analytics for resource planning</li>
                                    <li>Real-time appointment tracking and notifications</li>
                                </ul>
                            </div>
                            <div style="margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Technical Implementation</h5>
                                <p style="color: var(--text-secondary); line-height: 1.6;">
                                    Built using Java with JavaFX for the user interface, MySQL for data persistence, 
                                    and Python machine learning models for predictive analytics. The system processes 
                                    over 500 patient records and has improved appointment efficiency by 40%.
                                </p>
                            </div>
                            <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                                <a href="https://github.com/Shakhoyat" target="_blank" style="background: var(--accent-color); color: white; padding: 0.8rem 1.5rem; border-radius: 6px; text-decoration: none; display: flex; align-items: center; gap: 0.5rem;">
                                    <i class="fab fa-github"></i> View Code
                                </a>
                                <a href="#" style="background: var(--border-color); color: var(--text-primary); padding: 0.8rem 1.5rem; border-radius: 6px; text-decoration: none; display: flex; align-items: center; gap: 0.5rem;">
                                    <i class="fas fa-external-link-alt"></i> Live Demo
                                </a>
                            </div>
                        `;
                        break;
                    case 2:
                        projectDetails = `
                            <h4 style="color: var(--accent-color); margin-bottom: 1rem;">Automated EDA Platform</h4>
                            <div style="background: var(--secondary-bg); padding: 1.5rem; border-radius: 8px; margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Project Overview</h5>
                                <p style="color: var(--text-secondary); line-height: 1.6;">
                                    An intelligent data exploration platform that automates the exploratory data analysis process, 
                                    reducing manual analysis time by 70%. The platform generates comprehensive insights, 
                                    visualizations, and statistical summaries automatically.
                                </p>
                            </div>
                            <div style="margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Key Features</h5>
                                <ul style="color: var(--text-secondary); line-height: 1.8;">
                                    <li>Automated statistical analysis and profiling</li>
                                    <li>Interactive visualization generation (50+ chart types)</li>
                                    <li>Missing data pattern detection and recommendations</li>
                                    <li>Correlation analysis and feature relationships</li>
                                    <li>Automated report generation with insights</li>
                                </ul>
                            </div>
                            <div style="margin-bottom: 1.5rem;">
                                <h5 style="color: var(--text-primary);">Impact & Results</h5>
                                <p style="color: var(--text-secondary); line-height: 1.6;">
                                    Successfully deployed in multiple data science projects, reducing initial data exploration 
                                    time from hours to minutes. The platform has processed over 100 datasets and generated 
                                    thousands of automated insights for data scientists and analysts.
                                </p>
                            </div>
                        `;
                        break;
                    default:
                        projectDetails = `
                            <h4 style="color: var(--accent-color); margin-bottom: 1rem;">Project #${projectId}</h4>
                            <p style="color: var(--text-secondary); line-height: 1.6;">
                                Detailed information about this project including technical implementation, 
                                challenges overcome, and impact achieved. This project showcases expertise 
                                in modern technologies and innovative problem-solving approaches.
                            </p>
                        `;
                }
                
                modalContent.innerHTML = projectDetails;
            }, 800);
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

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            // Animate cards on scroll
            const cards = document.querySelectorAll('.project-card, .tech-category');
            
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);

            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = `all 0.6s ease-out ${index * 0.1}s`;
                observer.observe(card);
            });

            // Animate counter numbers
            const numbers = document.querySelectorAll('.overview-number');
            numbers.forEach(num => {
                const finalValue = num.textContent;
                const numValue = parseInt(finalValue.replace('+', ''));
                if (!isNaN(numValue)) {
                    let current = 0;
                    const increment = numValue / 50;
                    
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= numValue) {
                            num.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            num.textContent = Math.floor(current) + (finalValue.includes('+') ? '+' : '');
                        }
                    }, 30);
                }
            });
        });
    </script>
</asp:Content>