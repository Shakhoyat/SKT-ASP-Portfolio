<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Dark Hero Section with Photo and Name Overlay -->
    <div class="dark-hero">
        <div class="container">
            <div class="hero-content">
                <!-- Background Photo with Text Overlay -->
                <div class="hero-photo-container">
                    <!-- Your actual photo as background -->
                    <div class="hero-background-image">
                        <img src="/Content/images/profile.png" alt="Shakhoyat Shujon" />
                        <!-- Fallback placeholder if image not loaded -->
                        <div class="profile-fallback">
                            <span class="initials">SS</span>
                        </div>
                    </div>
                    
                    <!-- Overlay with hollow text name -->
                    <div class="hero-text-overlay">
                        <div class="name-overlay">
                            <h1 class="hero-hollow-name" data-text="SHAKHOYAT">SHAKHOYAT</h1>
                        </div>
                        <p class="hero-subtitle">
                            <span class="subtitle-text" data-text1="Deep Learning Engineer" data-text2="Kaggle Expert | Deep Learning" data-text3="IoT + ML Researcher">Kaggle Expert</span>
                        </p>
                    </div>
                </div>

                <!-- Tagline below the photo -->
                <div class="tagline">
                    <p>MY WORK ISN'T JUST ABOUT ANALYZING DATA - IT'S ABOUT MAKING A DIFFERENCE.</p>
                </div>
            </div>
        </div>

        <!-- Animated Stats Section -->
        <div class="stats-section">
            <div class="container">
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number" data-target="700">0</div>
                        <div class="stat-label">PROBLEMS SOLVED</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number" data-target="15">0</div>
                        <div class="stat-label">TECHNOLOGIES MASTERED</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number" data-target="5">0</div>
                        <div class="stat-label">SUCCESSFUL PROJECTS</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- About Me Section -->
        <div class="about-section">
            <div class="container">
                <div class="about-content">
                    <div class="about-text">
                        <h2 class="section-title-hollow">ABOUT ME</h2>
                        <div class="about-description">
                            <p>
                                Hi, I'm Shakhoyat, a CSE student at KUET specializing in data science, ML, and IoT. With 700+ programming 
                                problem-solving experiences on platforms like Codeforces, I transitioned into data science and am now a Kaggle Expert. 
                                My team and I actively compete in datathons across the country, tackling challenges in Deep Learning, NLP, and Computer Vision.
                            </p>
                            <p>
                                From automated EDA pipelines to predictive healthcare models, I focus on building intelligent systems with real-world impact—driven 
                                by the vision of becoming a future tech lead in deep learning.
                            </p>
                        </div>
                        
                        <!-- Social Links -->
                        <div class="social-links">
                            <a href="https://x.com/skt_rahman" target="_blank" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="https://www.linkedin.com/in/shakhoyat-shujon-313ba5336/" target="_blank" class="social-icon">
                                <i class="fab fa-linkedin"></i>
                            </a>
                            <a href="mailto:skt104.shujon@gmail.com" class="social-icon">
                                <i class="fas fa-envelope"></i>
                            </a>
                            <a href="https://github.com/Shakhoyat" target="_blank" class="social-icon">
                                <i class="fab fa-github"></i>
                            </a>
                            <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="social-icon">
                                <i class="fab fa-kaggle"></i>
                            </a>
                        </div>

                        <div class="section-cta">
                            <a href="About.aspx" class="cta-button">
                                <span>Learn More About Me</span>
                                <i class="fas fa-user"></i>
                            </a>
                        </div>
                    </div>
                    
                    <!-- Right side image -->
                    <div class="about-image">
                        <div class="about-photo">
                            <img src="/Content/images/about.jpg" alt="Shakhoyat Shujon" />
                            <!-- Fallback placeholder if image not loaded -->
                            <div class="about-placeholder">
                                <i class="fas fa-user fa-5x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Featured Projects Section - Now with Infinite Horizontal Auto-Scroll -->
        <div class="projects-section">
            <div class="container">
                <h2 class="section-title-hollow">FEATURED PROJECTS</h2>
                <div class="infinite-scroll-container">
                    <div class="projects-scroll-track">
                        <!-- Project 1: Doctor Appointment System -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image healthcare">
                                    <i class="fas fa-user-md"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Doctor Appointment System</h3>
                                <p class="project-desc">Healthcare management with ML-powered resource allocation</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge java">Java</span>
                                    <span class="tech-badge">JavaFX</span>
                                    <span class="tech-badge">MySQL</span>
                                    <span class="tech-badge">ML</span>
                                </div>
                            </div>
                        </div>

                        <!-- Project 2: Data Analysis Platform -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image analytics">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Automated EDA Platform</h3>
                                <p class="project-desc">Reduces data exploration time by 70% with automated insights</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge python">Python</span>
                                    <span class="tech-badge">Streamlit</span>
                                    <span class="tech-badge">Pandas</span>
                                    <span class="tech-badge">Plotly</span>
                                </div>
                            </div>
                        </div>

                        <!-- Project 3: Weather Analytics -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image weather">
                                    <i class="fas fa-cloud-sun"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Weather Analytics WebApp</h3>
                                <p class="project-desc">Real-time weather forecasting with geospatial analysis</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge react">React</span>
                                    <span class="tech-badge">TypeScript</span>
                                    <span class="tech-badge">APIs</span>
                                    <span class="tech-badge">Maps</span>
                                </div>
                            </div>
                        </div>

                        <!-- Project 4: IoT Data Analytics -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image" style="background: linear-gradient(135deg, #FF9A56 0%, #FF6B95 100%);">
                                    <i class="fas fa-wifi"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">IoT Data Analytics Platform</h3>
                                <p class="project-desc">Real-time sensor data processing with machine learning insights</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge python">Python</span>
                                    <span class="tech-badge">IoT</span>
                                    <span class="tech-badge">MongoDB</span>
                                    <span class="tech-badge">ML</span>
                                </div>
                            </div>
                        </div>

                        <!-- Project 5: Computer Vision App -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                    <i class="fas fa-eye"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Computer Vision Detection</h3>
                                <p class="project-desc">Advanced object detection using deep learning models</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge python">Python</span>
                                    <span class="tech-badge">OpenCV</span>
                                    <span class="tech-badge">TensorFlow</span>
                                    <span class="tech-badge">CNN</span>
                                </div>
                            </div>
                        </div>

                        <!-- Duplicate projects for infinite scroll effect -->
                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image healthcare">
                                    <i class="fas fa-user-md"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Doctor Appointment System</h3>
                                <p class="project-desc">Healthcare management with ML-powered resource allocation</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge java">Java</span>
                                    <span class="tech-badge">JavaFX</span>
                                    <span class="tech-badge">MySQL</span>
                                    <span class="tech-badge">ML</span>
                                </div>
                            </div>
                        </div>

                        <div class="project-showcase">
                            <div class="project-image-container">
                                <div class="project-image analytics">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <div class="project-overlay">
                                    <div class="project-actions">
                                        <a href="Projects.aspx" class="project-btn">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="https://github.com/Shakhoyat" target="_blank" class="project-btn">
                                            <i class="fab fa-github"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="project-info">
                                <h3 class="project-title">Automated EDA Platform</h3>
                                <p class="project-desc">Reduces data exploration time by 70% with automated insights</p>
                                <div class="project-tech-stack">
                                    <span class="tech-badge python">Python</span>
                                    <span class="tech-badge">Streamlit</span>
                                    <span class="tech-badge">Pandas</span>
                                    <span class="tech-badge">Plotly</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section-cta">
                    <a href="Projects.aspx" class="cta-button">
                        <span>View All Projects</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Tech Stack Section -->
        <div class="tech-stack-section">
            <div class="container">
                <h2 class="section-title-hollow">TECH STACK</h2>
                <div class="tech-categories">
                    <!-- Programming Languages -->
                    <div class="tech-category">
                        <h3 class="category-title">Programming Languages</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo python">
                                    <i class="fab fa-python"></i>
                                </div>
                                <span>Python</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo java">
                                    <i class="fab fa-java"></i>
                                </div>
                                <span>Java</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo js">
                                    <i class="fab fa-js-square"></i>
                                </div>
                                <span>JavaScript</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo cpp">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" alt="C++" />
                                </div>
                                <span>C++</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo c">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" alt="C" />
                                </div>
                                <span>C</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" alt="TypeScript" />
                                </div>
                                <span>TypeScript</span>
                            </div>
                        </div>
                    </div>

                    <!-- Data Science & ML -->
                    <div class="tech-category">
                        <h3 class="category-title">Data Science & ML</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pandas/pandas-original.svg" alt="Pandas" />
                                </div>
                                <span>Pandas</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/numpy/numpy-original.svg" alt="NumPy" />
                                </div>
                                <span>NumPy</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tensorflow/tensorflow-original.svg" alt="TensorFlow" />
                                </div>
                                <span>TensorFlow</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pytorch/pytorch-original.svg" alt="PyTorch" />
                                </div>
                                <span>PyTorch</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo sklearn">
                                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Scikit_learn_logo_small.svg" alt="Scikit-learn" />
                                </div>
                                <span>Scikit-learn</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/opencv/opencv-original.svg" alt="OpenCV" />
                                </div>
                                <span>OpenCV</span>
                            </div>
                        </div>
                    </div>

                    <!-- Web Development -->
                    <div class="tech-category">
                        <h3 class="category-title">Web Development</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo react">
                                    <i class="fab fa-react"></i>
                                </div>
                                <span>React</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo node">
                                    <i class="fab fa-node-js"></i>
                                </div>
                                <span>Node.js</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nextjs/nextjs-original.svg" alt="Next.js" />
                                </div>
                                <span>Next.js</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg" alt="Express.js" />
                                </div>
                                <span>Express.js</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo html">
                                    <i class="fab fa-html5"></i>
                                </div>
                                <span>HTML5</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo css">
                                    <i class="fab fa-css3-alt"></i>
                                </div>
                                <span>CSS3</span>
                            </div>
                        </div>
                    </div>

                    <!-- Backend & Frameworks -->
                    <div class="tech-category">
                        <h3 class="category-title">Backend & Frameworks</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dotnetcore/dotnetcore-original.svg" alt=".NET" />
                                </div>
                                <span>.NET</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/spring/spring-original.svg" alt="Spring Boot" />
                                </div>
                                <span>Spring Boot</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg" alt="Django" />
                                </div>
                                <span>Django</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flask/flask-original.svg" alt="Flask" />
                                </div>
                                <span>Flask</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://streamlit.io/images/brand/streamlit-mark-color.png" alt="Streamlit" />
                                </div>
                                <span>Streamlit</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://fastapi.tiangolo.com/img/logo-margin/logo-teal.png" alt="FastAPI" />
                                </div>
                                <span>FastAPI</span>
                            </div>
                        </div>
                    </div>

                    <!-- Databases & Storage -->
                    <div class="tech-category">
                        <h3 class="category-title">Databases & Storage</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" alt="MySQL" />
                                </div>
                                <span>MySQL</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" alt="PostgreSQL" />
                                </div>
                                <span>PostgreSQL</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg" alt="MongoDB" />
                                </div>
                                <span>MongoDB</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/redis/redis-original.svg" alt="Redis" />
                                </div>
                                <span>Redis</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg" alt="SQLite" />
                                </div>
                                <span>SQLite</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg" alt="Firebase" />
                                </div>
                                <span>Firebase</span>
                            </div>
                        </div>
                    </div>

                    <!-- DevOps & Tools -->
                    <div class="tech-category">
                        <h3 class="category-title">DevOps & Tools</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo git">
                                    <i class="fab fa-git-alt"></i>
                                </div>
                                <span>Git</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo github">
                                    <i class="fab fa-github"></i>
                                </div>
                                <span>GitHub</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo docker">
                                    <i class="fab fa-docker"></i>
                                </div>
                                <span>Docker</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="Linux" />
                                </div>
                                <span>Linux</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original.svg" alt="AWS" />
                                </div>
                                <span>AWS</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo vs">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="VS Code" />
                                </div>
                                <span>VS Code</span>
                            </div>
                        </div>
                    </div>

                    <!-- Data Analysis & Visualization -->
                    <div class="tech-category">
                        <h3 class="category-title">Data Analysis & Visualization</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jupyter/jupyter-original.svg" alt="Jupyter" />
                                </div>
                                <span>Jupyter</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo plotly">
                                    <img src="https://images.plot.ly/logo/new-branding/plotly-logomark.png" alt="Plotly" />
                                </div>
                                <span>Plotly</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo seaborn">
                                    <img src="https://seaborn.pydata.org/_images/logo-mark-lightbg.svg" alt="Seaborn" />
                                </div>
                                <span>Seaborn</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo matplotlib">
                                    <img src="https://matplotlib.org/stable/_images/sphx_glr_logos2_003.png" alt="Matplotlib" />
                                </div>
                                <span>Matplotlib</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo kaggle">
                                    <i class="fab fa-kaggle"></i>
                                </div>
                                <span>Kaggle</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo tableau">
                                    <img src="https://logos-world.net/wp-content/uploads/2021/10/Tableau-Logo.png" alt="Tableau" />
                                </div>
                                <span>Tableau</span>
                            </div>
                        </div>
                    </div>

                    <!-- IoT & Hardware -->
                    <div class="tech-category">
                        <h3 class="category-title">IoT & Embedded Systems</h3>
                        <div class="tech-logos">
                            <div class="tech-item">
                                <div class="tech-logo arduino">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/arduino/arduino-original.svg" alt="Arduino" />
                                </div>
                                <span>Arduino</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo raspberry">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/raspberrypi/raspberrypi-original.svg" alt="Raspberry Pi" />
                                </div>
                                <span>Raspberry Pi</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo esp">
                                    <img src="https://docs.espressif.com/projects/esp-idf/en/latest/esp32/_images/logo.svg" alt="MQTT" />
                                </div>
                                <span>ESP32</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo mqtt">
                                    <img src="https://mqtt.org/assets/img/mqtt-logo-transp.svg" alt="MQTT" />
                                </div>
                                <span>MQTT</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo sensors">
                                    <i class="fas fa-microchip"></i>
                                </div>
                                <span>Sensors</span>
                            </div>
                            <div class="tech-item">
                                <div class="tech-logo embedded">
                                    <i class="fas fa-memory"></i>
                                </div>
                                <span>Embedded C</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Achievements Section - Now with Carousel Infinite Scroll -->
        <div class="achievements-section">
            <div class="container">
                <h2 class="section-title-hollow">ACHIEVEMENTS</h2>
                <div class="achievements-carousel-container">
                    <div class="achievements-carousel-track">
                        <!-- Achievement 1: Kaggle -->
                        <div class="achievement-card">
                            <div class="achievement-icon kaggle-achievement">
                                <i class="fab fa-kaggle"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Kaggle Competitor</h3>
                                <p class="achievement-desc">Active participant in data science competitions</p>
                                <div class="achievement-stats">
                                    <span class="stat">700+ Problems Solved</span>
                                    <span class="stat">Multiple Competitions</span>
                                </div>
                            </div>
                        </div>

                        <!-- Achievement 2: Project Excellence -->
                        <div class="achievement-card">
                            <div class="achievement-icon excellence-achievement">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Project Excellence</h3>
                                <p class="achievement-desc">Outstanding performance in ML project delivery</p>
                                <div class="achievement-stats">
                                    <span class="stat">Innovation Award</span>
                                    <span class="stat">Tech Solutions</span>
                                </div>
                            </div>
                        </div>

                        <!-- Achievement 3: Open Source -->
                        <div class="achievement-card">
                            <div class="achievement-icon github-achievement">
                                <i class="fab fa-github"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Open Source Contributor</h3>
                                <p class="achievement-desc">Significant contributions to ML community projects</p>
                                <div class="achievement-stats">
                                    <span class="stat">100+ Commits</span>
                                    <span class="stat">Community Impact</span>
                                </div>
                            </div>
                        </div>

                        <!-- Achievement 4: Education -->
                        <div class="achievement-card">
                            <div class="achievement-icon education-achievement">
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">KUET CS Student</h3>
                                <p class="achievement-desc">Computer Science Engineering specialization</p>
                                <div class="achievement-stats">
                                    <span class="stat">Data Science Focus</span>
                                    <span class="stat">Academic Excellence</span>
                                </div>
                            </div>
                        </div>

                        <!-- Achievement 5: Research -->
                        <div class="achievement-card">
                            <div class="achievement-icon" style="background: linear-gradient(135deg, #FF6B95 0%, #FF9A56 100%);">
                                <i class="fas fa-microscope"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Research Publications</h3>
                                <p class="achievement-desc">Published research in machine learning and IoT domains</p>
                                <div class="achievement-stats">
                                    <span class="stat">Research Papers</span>
                                    <span class="stat">Conference Presentations</span>
                                </div>
                            </div>
                        </div>

                        <!-- Achievement 6: Hackathons -->
                        <div class="achievement-card">
                            <div class="achievement-icon" style="background: linear-gradient(135deg, #4ECDC4 0%, #44A08D 100%);">
                                <i class="fas fa-code"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Hackathon Winner</h3>
                                <p class="achievement-desc">Multiple wins in national and international hackathons</p>
                                <div class="achievement-stats">
                                    <span class="stat">First Place</span>
                                    <span class="stat">Team Leadership</span>
                                </div>
                            </div>
                        </div>

                        <!-- Duplicate achievements for infinite scroll -->
                        <div class="achievement-card">
                            <div class="achievement-icon kaggle-achievement">
                                <i class="fab fa-kaggle"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Kaggle Competitor</h3>
                                <p class="achievement-desc">Active participant in data science competitions</p>
                                <div class="achievement-stats">
                                    <span class="stat">700+ Problems Solved</span>
                                    <span class="stat">Multiple Competitions</span>
                                </div>
                            </div>
                        </div>

                        <div class="achievement-card">
                            <div class="achievement-icon excellence-achievement">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Project Excellence</h3>
                                <p class="achievement-desc">Outstanding performance in ML project delivery</p>
                                <div class="achievement-stats">
                                    <span class="stat">Innovation Award</span>
                                    <span class="stat">Tech Solutions</span>
                                </div>
                            </div>
                        </div>

                        <div class="achievement-card">
                            <div class="achievement-icon github-achievement">
                                <i class="fab fa-github"></i>
                            </div>
                            <div class="achievement-content">
                                <h3 class="achievement-title">Open Source Contributor</h3>
                                <p class="achievement-desc">Significant contributions to ML community projects</p>
                                <div class="achievement-stats">
                                    <span class="stat">100+ Commits</span>
                                    <span class="stat">Community Impact</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section-cta">
                    <a href="Achievements.aspx" class="cta-button">
                        <span>View All Achievements</span>
                        <i class="fas fa-award"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Action Buttons Section -->
        <div class="action-section">
            <div class="container text-center">
                <h2 class="section-title-hollow">LET'S COLLABORATE</h2>
                <p class="action-subtitle">Ready to transform data into meaningful insights?</p>
                <div class="action-buttons">
                    <a href="Projects.aspx" class="btn-modern btn-primary">
                        <span>View My Work</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                    <a href="Contact.aspx" class="btn-modern btn-secondary">
                        <span>Get In Touch</span>
                        <i class="fas fa-envelope"></i>
                    </a>
                    <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="btn-modern btn-outline">
                        <span>Kaggle Profile</span>
                        <i class="fab fa-kaggle"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Dark Theme Styles */
        body {
            background: #0a0a0a;
            color: #ffffff;
            font-family: 'Inter', sans-serif;
        }

        /* Dark Hero Section with Photo Background */
        .dark-hero {
            min-height: 100vh;
            background: #0a0a0a;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            padding: 80px 0;
        }

        .hero-content {
            text-align: center;
            z-index: 2;
            width: 100%;
        }

        /* Hero Photo Container */
        .hero-photo-container {
            position: relative;
            width: 100%;
            max-width: 600px;
            height: 700px;
            margin: 0 auto 3rem;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            animation: floatingImage 6s ease-in-out infinite;
        }

        /* Floating animation for the image */
        @keyframes floatingImage {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-15px);
            }
        }

        /* Hero Background Image */
        .hero-background-image {
            position: relative;
            width: 100%;
            height: 100%;
            background: #1a1a1a;
        }

        .hero-background-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(30%) contrast(1.1);
        }

        .profile-fallback {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .hero-background-image img:not([src]),
        .hero-background-image img[src=""] {
            opacity: 0;
        }

        .hero-background-image img:not([src]) + .profile-fallback,
        .hero-background-image img[src=""] + .profile-fallback {
            opacity: 1;
        }

        .initials {
            font-size: 6rem;
            font-weight: 800;
            color: white;
        }

        /* Hero Text Overlay */
        .hero-text-overlay {
            position: absolute;
            top: 60%;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(0, 0, 0, 0.4);
            z-index: 2;
        }

        .name-overlay {
            margin-bottom: 1rem;
        }

        .hero-hollow-name {
            font-size: 5rem;
            font-weight: 900;
            line-height: 0.85;
            margin: 0;
            letter-spacing: 0.1em;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
            position: relative;
            /* SHAKHOYAT - Mix of solid and hollow letters */
            background: linear-gradient(
                90deg,
                #ffffff 0%, #ffffff 11%,           /* S - solid */
                transparent 11%, transparent 22%,   /* H - hollow */
                #ffffff 22%, #ffffff 33%,           /* A - solid */
                transparent 33%, transparent 44%,   /* K - hollow */
                #ffffff 44%, #ffffff 55%,           /* H - solid */
                transparent 55%, transparent 66%,   /* O - hollow */
                #ffffff 66%, #ffffff 77%,           /* Y - solid */
                transparent 77%, transparent 88%,   /* A - hollow */
                #ffffff 88%, #ffffff 100%           /* T - solid */
            );
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            -webkit-text-stroke: 3px #ffffff;
            text-stroke: 3px #ffffff;
            /* Name slides in from left */
            animation: slideInFromLeft 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
        }

        /* Name animation from left */
        @keyframes slideInFromLeft {
            0% {
                transform: translateX(-100px);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .hero-hollow-name::before {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            -webkit-text-stroke: 6px rgba(0, 0, 0, 0.3);
            text-stroke: 6px rgba(0, 0, 0, 0.3);
            z-index: -1;
        }

        .hero-subtitle {
            font-size: 1rem;
            letter-spacing: 0.2em;
            color: rgba(255, 255, 255, 0.9);
            margin: 0;
            font-weight: 600;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8);
            position: relative;
            overflow: hidden;
            height: 1.4em;
            white-space: nowrap;
            text-align: center;
            /* Subtitle slides in from right */
            animation: slideInFromRight 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.4s both;
        }

        .subtitle-text {
            display: block;
            transition: all 0.5s ease-in-out;
        }

        /* Tagline */
        .tagline {
            margin: 2rem 0 3rem 0;
            animation: fadeInUp 1.5s ease-out 0.8s both;
        }

        .tagline p {
            font-size: 0.9rem;
            letter-spacing: 0.15em;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
            font-weight: 400;
        }

        /* Scroll Indicator - Now positioned within hero-text-overlay */
        .scroll-indicator {
            position: relative;
            margin-top: 2rem;
            z-index: 10;
            animation: fadeInUp 1.8s ease-out 1.2s both;
        }

        .scroll-arrow {
            width: 50px;
            height: 50px;
            border: 1px solid #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            cursor: pointer;
            transition: all 0.3s ease;
            animation: bounce 2s infinite;
            margin: 0 auto;
        }

        .scroll-arrow:hover {
            border-color: #667eea;
            color: #667eea;
        }

        /* Stats Section */
        .stats-section {
            background: #0a0a0a;
            padding: 80px 0;
            border-top: 1px solid #1a1a1a;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 4rem;
            max-width: 900px;
            margin: 0 auto;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 4rem;
            font-weight: 900;
            color: #ffffff;
            margin-bottom: 0.5rem;
            line-height: 1;
        }

        .stat-label {
            font-size: 0.9rem;
            letter-spacing: 0.1em;
            color: #666;
            font-weight: 500;
        }

        /* Tech Stack Section */
        .tech-stack-section {
            background: #0a0a0a;
            padding: 100px 0;
            border-top: 1px solid #1a1a1a;
        }

        .section-title-hollow {
            font-size: 3rem;
            font-weight: 900;
            -webkit-text-stroke: 1px #333;
            -webkit-text-fill-color: transparent;
            text-stroke: 1px #333;
            text-fill-color: transparent;
            margin-bottom: 3rem;
            letter-spacing: 0.05em;
            text-align: center;
        }

        .tech-categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 3rem;
            margin-top: 3rem;
        }

        .tech-category {
            background: #111;
            border-radius: 12px;
            padding: 2rem;
            border: 1px solid #222;
        }

        .category-title {
            color: #667eea;
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .tech-logos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(80px, 1fr));
            gap: 1.5rem;
        }

        .tech-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
            transition: transform 0.3s ease;
        }

        .tech-item:hover {
            transform: translateY(-5px);
        }

        .tech-logo {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #1a1a1a;
            border: 1px solid #333;
            transition: all 0.3s ease;
        }

        .tech-logo:hover {
            border-color: #667eea;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }

        .tech-logo img {
            width: 30px;
            height: 30px;
            object-fit: contain;
        }

        .tech-logo i {
            font-size: 1.8rem;
        }

        .tech-logo.python i { color: #3776ab; }
        .tech-logo.java i { color: #f89820; }
        .tech-logo.react i { color: #61dafb; }
        .tech-logo.js i { color: #f7df1e; }
        .tech-logo.node i { color: #339933; }
        .tech-logo.git i { color: #f05032; }
        .tech-logo.github i { color: #333; }
        .tech-logo.docker i { color: #2496ed; }
        .tech-logo.kaggle i { color: #20beff; }
        .tech-logo.html i { color: #e34f26; }
        .tech-logo.css i { color: #1572b6; }

        /* Additional tech logo colors */
        .tech-logo.cpp img,
        .tech-logo.c img { filter: brightness(0) saturate(100%) invert(27%) sepia(51%) saturate(2878%) hue-rotate(346deg) brightness(104%) contrast(97%); }
        
        .tech-logo.sklearn img { filter: brightness(0) saturate(100%) invert(40%) sepia(84%) saturate(1945%) hue-rotate(162deg) brightness(96%) contrast(101%); }
        
        .tech-logo.plotly img,
        .tech-logo.seaborn img,
        .tech-logo.matplotlib img,
        .tech-logo.tableau img { max-width: 28px; max-height: 28px; }
        
        .tech-logo.arduino img { filter: brightness(0) saturate(100%) invert(40%) sepia(84%) saturate(1945%) hue-rotate(162deg) brightness(96%) contrast(101%); }
        
        .tech-logo.raspberry img { filter: brightness(0) saturate(100%) invert(26%) sepia(85%) saturate(2851%) hue-rotate(338deg) brightness(98%) contrast(92%); }
        
        .tech-logo.esp img,
        .tech-logo.mqtt img { max-width: 28px; max-height: 28px; object-fit: contain; }
        
        .tech-logo.vs img { filter: brightness(0) saturate(100%) invert(40%) sepia(84%) saturate(1945%) hue-rotate(162deg) brightness(96%) contrast(101%); }
        
        .tech-logo.sensors i,
        .tech-logo.embedded i { color: #00d4aa; font-size: 1.6rem; }

        /* Ensure consistent sizing for all tech logos */
        .tech-logo img {
            width: 30px;
            height: 30px;
            object-fit: contain;
        }

        /* Special sizing for certain logos */
        .tech-logo.plotly img,
        .tech-logo.seaborn img,
        .tech-logo.matplotlib img,
        .tech-logo.tableau img,
        .tech-logo.esp img,
        .tech-logo.mqtt img {
            width: 28px;
            height: 28px;
        }
        /* Projects Section */
        .projects-section {
            background: #0a0a0a;
            padding: 100px 0;
            border-top: 1px solid #1a1a1a;
            overflow: hidden;
        }

        .infinite-scroll-container {
            width: 100%;
            overflow: hidden;
            mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
            -webkit-mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
        }

        .projects-scroll-track {
            display: flex;
            gap: 2rem;
            animation: infiniteScrollProjects 30s linear infinite;
            width: calc(350px * 14 + 2rem * 13); /* Accommodate all project cards */
        }

        .projects-scroll-track:hover {
            animation-play-state: paused;
        }

        @keyframes infiniteScrollProjects {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(calc(-350px * 7 - 2rem * 6)); /* Move by half the track width */
            }
        }

        .project-showcase {
            background: #111;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #222;
            transition: all 0.3s ease;
            min-width: 350px;
            flex-shrink: 0;
        }

        .project-showcase:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .project-image-container {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .project-image {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: white;
            transition: all 0.3s ease;
        }

        .project-image.healthcare { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .project-image.analytics { background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%); }
        .project-image.weather { background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%); }

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
            transition: all 0.3s ease;
        }

        .project-showcase:hover .project-overlay {
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
            background: #667eea;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .project-btn:hover {
            background: #764ba2;
            transform: scale(1.1);
        }

        .project-info {
            padding: 1.5rem;
        }

        .project-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
        }

        .project-desc {
            color: #ccc;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .project-tech-stack {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .tech-badge {
            background: #1a1a1a;
            color: #ccc;
            padding: 0.3rem 0.7rem;
            border-radius: 15px;
            font-size: 0.75rem;
            border: 1px solid #333;
        }

        .tech-badge.java { background: #f89820; color: #000; }
        .tech-badge.python { background: #3776ab; color: #fff; }
        .tech-badge.react { background: #61dafb; color: #000; }

        /* Achievements Section - Carousel Infinite Scroll */
        .achievements-section {
            background: #0a0a0a;
            padding: 100px 0;
            border-top: 1px solid #1a1a1a;
            overflow: hidden;
        }

        .achievements-carousel-container {
            width: 100%;
            overflow: hidden;
            mask: linear-gradient(to right, transparent, white 5%, white 95%, transparent);
            -webkit-mask: linear-gradient(to right, transparent, white 5%, white 95%, transparent);
        }

        .achievements-carousel-track {
            display: flex;
            gap: 2rem;
            animation: infiniteScrollAchievements 25s linear infinite;
            width: calc(300px * 18 + 2rem * 17); /* Accommodate all achievement cards */
        }

        .achievements-carousel-track:hover {
            animation-play-state: paused;
        }

        @keyframes infiniteScrollAchievements {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(calc(-300px * 9 - 2rem * 8)); /* Move by half the track width */
            }
        }

        .achievement-card {
            background: #111;
            border-radius: 12px;
            padding: 2rem;
            border: 1px solid #222;
            transition: all 0.3s ease;
            text-align: center;
            min-width: 300px;
            flex-shrink: 0;
        }

        .achievement-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        .achievement-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
        }

        .achievement-icon.kaggle-achievement { background: linear-gradient(135deg, #20beff 0%, #1a9ce8 100%); }
        .achievement-icon.excellence-achievement { background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%); }
        .achievement-icon.github-achievement { background: linear-gradient(135deg, #333 0%, #555 100%); }
        .achievement-icon.education-achievement { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }

        .achievement-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #fff;
            margin-bottom: 0.5rem;
        }

        .achievement-desc {
            color: #ccc;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .achievement-stats {
            display: flex;
            justify-content: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .achievement-stats .stat {
            background: #1a1a1a;
            color: #667eea;
            padding: 0.3rem 0.7rem;
            border-radius: 10px;
            font-size: 0.75rem;
            border: 1px solid #333;
        }

        /* About Section */
        .about-section {
            background: #0a0a0a;
            padding: 100px 0;
            border-top: 1px solid #1a1a1a;
        }

        .about-content {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 4rem;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .about-description p {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #ccc;
            margin-bottom: 1.5rem;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin: 2rem 0;
        }

        .social-icon {
            width: 45px;
            height: 45px;
            border: 1px solid #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-icon:hover {
            border-color: #667eea;
            color: #667eea;
            transform: translateY(-2px);
        }

        /* About Image */
        .about-photo {
            width: 300px;
            height: 400px;
            background: #1a1a1a;
            border-radius: 8px;
            overflow: hidden;
            margin-left: auto;
            position: relative;
        }

        .about-placeholder {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
            background: #111;
            opacity: 1;
            transition: opacity 0.3s ease;
        }

        .about-photo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: relative;
            z-index: 2;
        }

        .about-photo img:not([src]),
        .about-photo img[src=""] {
            opacity: 0;
        }

        .about-photo img[src]:not([src=""]) + .about-placeholder {
            opacity: 0;
        }

        /* Action Section */
        .action-section {
            background: #0a0a0a;
            padding: 100px 0;
            border-top: 1px solid #1a1a1a;
        }

        .action-subtitle {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 3rem;
        }

        .action-buttons {
            display: flex;
            gap: 2rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-modern {
            padding: 1rem 2rem;
            border: 1px solid #333;
            background: transparent;
            color: #fff;
            text-decoration: none;
            border-radius: 0;
            font-weight: 500;
            letter-spacing: 0.05em;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        .btn-modern:hover {
            background: #667eea;
            border-color: #667eea;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .btn-primary {
            background: #667eea;
            border-color: #667eea;
        }

        .btn-secondary {
            border-color: #666;
        }

        .btn-outline {
            border-color: #333;
        }

        /* Section CTA */
        .section-cta {
            text-align: center;
            margin-top: 3rem;
        }

        .cta-button {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem 2rem;
            background: transparent;
            border: 1px solid #667eea;
            color: #667eea;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.05em;
        }

        .cta-button:hover {
            background: #667eea;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        /* Projects Section - Infinite Scroll Styles */
        .infinite-scroll-container {
            position: relative;
            overflow: hidden;
            height: 250px;
            margin-top: 3rem;
        }

        .projects-scroll-track {
            display: flex;
            animation: scroll 20s linear infinite;
        }

        /* Keyframes for the infinite scrolling effect */
        @keyframes scroll {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-50%);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-hollow-name {
                font-size: 3.5rem;
                -webkit-text-stroke: 2px #ffffff;
                text-stroke: 2px #ffffff;
                animation: slideInFromLeft 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
            }

            .hero-subtitle {
                font-size: 0.9rem;
                letter-spacing: 0.15em;
                animation: slideInFromRight 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.4s both;
            }

            .hero-text-overlay {
                top: 55%;
            }

            .hero-photo-container {
                max-width: 400px;
                height: 500px;
                margin-bottom: 2rem;
                animation: floatingImage 6s ease-in-out infinite;
            }

            .scroll-indicator {
                margin-top: 1.5rem;
                animation: fadeInUp 1.8s ease-out 1.2s both;
            }

            .tagline {
                animation: fadeInUp 1.5s ease-out 0.8s both;
            }

            .initials {
                font-size: 4rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .about-content {
                grid-template-columns: 1fr;
                gap: 2rem;
                text-align: center;
            }

            .action-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn-modern {
                width: 100%;
                max-width: 250px;
                justify-content: center;
            }

            .tech-categories {
                grid-template-columns: 1fr;
            }

            /* Mobile adjustments for infinite scroll */
            .project-showcase,
            .achievement-card {
                min-width: 280px;
            }

            .projects-scroll-track {
                animation-duration: 25s; /* Slower on mobile */
            }

            .achievements-carousel-track {
                animation-duration: 20s; /* Slower on mobile */
            }
        }

        @media (max-width: 480px) {
            .hero-hollow-name {
                font-size: 2.8rem;
                -webkit-text-stroke: 1.5px #ffffff;
                text-stroke: 1.5px #ffffff;
                animation: slideInFromLeft 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
            }

            .hero-text-overlay {
                top: 50%;
            }

            .hero-photo-container {
                max-width: 300px;
                height: 400px;
                animation: floatingImage 6s ease-in-out infinite;
            }

            .scroll-indicator {
                margin-top: 1rem;
                animation: fadeInUp 1.8s ease-out 1.2s both;
            }

            .hero-subtitle {
                font-size: 0.8rem;
                letter-spacing: 0.1em;
                animation: slideInFromRight 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.4s both;
            }

            .tagline {
                animation: fadeInUp 1.5s ease-out 0.8s both;
            }

            /* Extra small mobile adjustments */
            .project-showcase,
            .achievement-card {
                min-width: 250px;
            }

            .project-info,
            .achievement-content {
                padding: 1rem;
            }

            .projects-scroll-track {
                animation-duration: 20s; /* Even slower on small mobile */
            }

            .achievements-carousel-track {
                animation-duration: 15s; /* Even slower on small mobile */
            }
        }

        /* Override main content margin for homepage since navbar is hidden initially */
        .main-content {
            margin-top: 0 !important;
        }
    </style>

    <script>
        // Animated Counter Function
        function animateCounters() {
            const counters = document.querySelectorAll('.stat-number');
            
            const observerOptions = {
                threshold: 0.5,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const counter = entry.target;
                        const target = parseInt(counter.getAttribute('data-target'));
                        const duration = 2000; // 2 seconds
                        const increment = target / (duration / 16); // 60 FPS
                        let current = 0;

                        const updateCounter = () => {
                            if (current < target) {
                                current += increment;
                                counter.textContent = Math.ceil(current) + '+';
                                requestAnimationFrame(updateCounter);
                            } else {
                                counter.textContent = target + '+';
                            }
                        };

                        updateCounter();
                        observer.unobserve(counter);
                    }
                });
            }, observerOptions);

            counters.forEach(counter => {
                observer.observe(counter);
            });
        }

        // Scroll animations
        function animateOnScroll() {
            const elements = document.querySelectorAll('.tech-item, .project-showcase, .achievement-card');
            
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

            elements.forEach(element => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.6s ease-out';
                observer.observe(element);
            });
        }

        // Smooth scroll for arrow
        document.addEventListener('DOMContentLoaded', function() {
            const scrollArrow = document.querySelector('.scroll-arrow');
            if (scrollArrow) {
                scrollArrow.addEventListener('click', function() {
                    // Calculate position to show complete About Me section
                    const aboutSection = document.querySelector('.about-section');
                    const aboutTitle = document.querySelector('.section-title-hollow');
                    
                    if (aboutSection && aboutTitle) {
                        // Get the offset of the about section minus some padding for better visibility
                        const targetPosition = aboutSection.offsetTop - 100; // 100px padding from top
                        
                        // Smooth scroll to the calculated position
                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                    }
                });
            }

            // Initialize animations
            animateCounters();
            animateOnScroll();

            // Animated subtitle text transition
            const subtitleElement = document.querySelector('.subtitle-text');
            if (subtitleElement) {
                const text1 = subtitleElement.getAttribute('data-text1'); // Deep Learning Engineer
                const text2 = subtitleElement.getAttribute('data-text2'); // Kaggle Expert | Deep Learning
                const text3 = subtitleElement.getAttribute('data-text3'); // IoT + ML Researcher
                const texts = [text3, text1, text2]; // Start with Kaggle Expert, then rotate through all
                let currentIndex = 0;

                setInterval(() => {
                    subtitleElement.style.opacity = '0';
                    setTimeout(() => {
                        currentIndex = (currentIndex + 1) % texts.length; // Cycle through all 3 texts
                        subtitleElement.textContent = texts[currentIndex];
                        subtitleElement.style.opacity = '1';
                    }, 250);
                }, 3000);
            }

            // Hero entrance animations are now handled by CSS
            // No need for JavaScript hero animations
        });

        // Remove parallax effect that interferes with normal scrolling
        // Normal scrolling will now work properly without interference
    </script>
</asp:Content></asp:Content></asp:Content></asp:Content>