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
                    
                    <!-- New Arrow to navigate to About Me section -->
                    <div class="tagline-arrow">
                        <div class="tagline-scroll-arrow">
                            <i class="fas fa-chevron-down"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll Down Arrow -->
        <div class="scroll-indicator">
            <div class="scroll-arrow">
                <i class="fas fa-chevron-down"></i>
            </div>
        </div>
    </div>

    <!-- Animated Stats Section - Now with 6 impressive stats -->
    <div class="stats-section">
        <div class="container">
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number" data-target="60">0</div>
                    <div class="stat-label">KAGGLE MEDALS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="15">0</div>
                    <div class="stat-label">WORKING PROJECTS ON LATEST TECH</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="700">0</div>
                    <div class="stat-label">CODING PROBLEMS SOLVED</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="25">0</div>
                    <div class="stat-label">TECHNOLOGIES MASTERED</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="5">0</div>
                    <div class="stat-label">RESEARCH PUBLICATIONS</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="12">0</div>
                    <div class="stat-label">HACKATHON WINS</div>
                </div>
            </div>
        </div>
    </div>

    <!-- About Me Section -->
    <div class="about-section">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2 class="section-title-ghost" data-text="ABOUT ME">ABOUT ME</h2>
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
                
                <!-- Right side image with social media icons overlay -->
                <div class="about-image">
                    <!-- Social Media Icons positioned above the image -->
                    <div class="about-social-media-overlay">
                        <a href="https://github.com/Shakhoyat" class="about-social-icon github" title="GitHub" target="_blank">
                            <i class="fab fa-github"></i>
                        </a>
                        <a href="https://www.kaggle.com/shakhoyatshujon" class="about-social-icon kaggle" title="Kaggle" target="_blank">
                            <i class="fab fa-kaggle"></i>
                        </a>
                        <a href="https://www.linkedin.com/in/shakhoyat-shujon-313ba5336/" class="about-social-icon linkedin" title="LinkedIn" target="_blank">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="mailto:skt104.shujon@gmail.com" class="about-social-icon email" title="Email">
                            <i class="fas fa-envelope"></i>
                        </a>
                        <a href="https://x.com/skt_rahman" class="about-social-icon twitter" title="Twitter" target="_blank">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                    
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
            <h2 class="section-title-ghost" data-text="FEATURED PROJECTS">FEATURED PROJECTS</h2>
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
            <h2 class="section-title-ghost" data-text="TECH STACK">TECH STACK</h2>
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
                            <div class="tech-logo csharp">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg" alt="C#" />
                            </div>
                            <span>C#</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo js">
                                <i class="fab fa-js-square"></i>
                            </div>
                            <span>JavaScript</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" alt="TypeScript" />
                            </div>
                            <span>TypeScript</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo php">
                                <i class="fab fa-php"></i>
                            </div>
                            <span>PHP</span>
                        </div>
                    </div>
                </div>

                <!-- Data Science & ML -->
                <div class="tech-category">
                    <h3 class="category-title">Data Science & AI/ML</h3>
                    <div class="tech-logos">
                        <div class="tech-item">
                            <div class="tech-logo tensorflow">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tensorflow/tensorflow-original.svg" alt="TensorFlow" />
                            </div>
                            <span>TensorFlow</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo pytorch">
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
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/opencv/opencv-original.svg" alt="OpenCV" />
                            </div>
                            <span>OpenCV</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo kaggle">
                                <i class="fab fa-kaggle"></i>
                            </div>
                            <span>Kaggle</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jupyter/jupyter-original.svg" alt="Jupyter" />
                            </div>
                            <span>Jupyter</span>
                        </div>
                    </div>
                </div>

                <!-- Web Development Frontend -->
                <div class="tech-category">
                    <h3 class="category-title">Frontend Development</h3>
                    <div class="tech-logos">
                        <div class="tech-item">
                            <div class="tech-logo react">
                                <i class="fab fa-react"></i>
                            </div>
                            <span>React</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo angular">
                                <i class="fab fa-angular"></i>
                            </div>
                            <span>Angular</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo vue">
                                <i class="fab fa-vuejs"></i>
                            </div>
                            <span>Vue.js</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nextjs/nextjs-original.svg" alt="Next.js" />
                            </div>
                            <span>Next.js</span>
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
                        <div class="tech-item">
                            <div class="tech-logo bootstrap">
                                <i class="fab fa-bootstrap"></i>
                            </div>
                            <span>Bootstrap</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo">
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sass/sass-original.svg" alt="Sass" />
                            </div>
                            <span>Sass</span>
                        </div>
                    </div>
                </div>

                <!-- Backend Development -->
                <div class="tech-category">
                    <h3 class="category-title">Backend Development</h3>
                    <div class="tech-logos">
                        <div class="tech-item">
                            <div class="tech-logo node">
                                <i class="fab fa-node-js"></i>
                            </div>
                            <span>Node.js</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo">
                                <img src="https://cdn.jsdelivr.net/gh/devicon