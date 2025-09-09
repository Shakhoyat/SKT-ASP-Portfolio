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

    <!-- Featured Projects Section - Now with Dynamic Data from Database -->
    <div class="projects-section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="FEATURED PROJECTS">FEATURED PROJECTS</h2>
            <div class="infinite-scroll-container">
                <div class="projects-scroll-track">
                    <!-- Dynamic Projects from Database -->
                    <asp:Repeater ID="rptProjects" runat="server">
                        <ItemTemplate>
                            <div class="project-showcase">
                                <div class="project-image-container">
                                    <div class="project-image" style="<%# Eval("ProjectGradient") %>">
                                        <i class="<%# Eval("ProjectIcon") %>"></i>
                                    </div>
                                    <div class="project-overlay">
                                        <div class="project-actions">
                                            <a href="Projects.aspx" class="project-btn">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <%# !string.IsNullOrEmpty(Eval("GitHubUrl") as string) ? 
                                                "<a href='" + Eval("GitHubUrl") + "' target='_blank' class='project-btn'><i class='fab fa-github'></i></a>" : 
                                                "<a href='https://github.com/Shakhoyat' target='_blank' class='project-btn'><i class='fab fa-github'></i></a>" %>
                                        </div>
                                    </div>
                                </div>
                                <div class="project-info">
                                    <h3 class="project-title"><%# Eval("Title") %></h3>
                                    <p class="project-desc"><%# Eval("Description") %></p>
                                    <div class="project-tech-stack">
                                        <%# Eval("TechBadges") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- Duplicate projects for infinite scroll effect -->
                    <asp:Repeater ID="rptProjectsDuplicate" runat="server">
                        <ItemTemplate>
                            <div class="project-showcase">
                                <div class="project-image-container">
                                    <div class="project-image" style="<%# Eval("ProjectGradient") %>">
                                        <i class="<%# Eval("ProjectIcon") %>"></i>
                                    </div>
                                    <div class="project-overlay">
                                        <div class="project-actions">
                                            <a href="Projects.aspx" class="project-btn">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <%# !string.IsNullOrEmpty(Eval("GitHubUrl") as string) ? 
                                                "<a href='" + Eval("GitHubUrl") + "' target='_blank' class='project-btn'><i class='fab fa-github'></i></a>" : 
                                                "<a href='https://github.com/Shakhoyat' target='_blank' class='project-btn'><i class='fab fa-github'></i></a>" %>
                                        </div>
                                    </div>
                                </div>
                                <div class="project-info">
                                    <h3 class="project-title"><%# Eval("Title") %></h3>
                                    <p class="project-desc"><%# Eval("Description") %></p>
                                    <div class="project-tech-stack">
                                        <%# Eval("TechBadges") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
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
                                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg" alt="Express" />
                            </div>
                            <span>Express</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo mongo">
                                <i class="fab fa-mongodb"></i>
                            </div>
                            <span>MongoDB</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo firebase">
                                <i class="fab fa-fire"></i>
                            </div>
                            <span>Firebase</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo sql">
                                <i class="fas fa-database"></i>
                            </div>
                            <span>SQL</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo heroku">
                                <i class="fab fa-heroku"></i>
                            </div>
                            <span>Heroku</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo aws">
                                <i class="fab fa-aws"></i>
                            </div>
                            <span>AWS</span>
                        </div>
                        <div class="tech-item">
                            <div class="tech-logo docker">
                                <i class="fab fa-docker"></i>
                            </div>
                            <span>Docker</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Achievements Section - Dynamic Data from Database -->
    <div class="achievements-section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="ACHIEVEMENTS">ACHIEVEMENTS</h2>
            <div class="achievements-carousel-container">
                <div class="achievements-scroll-track">
                    <!-- Dynamic Achievements from Database -->
                    <asp:Repeater ID="rptAchievements" runat="server">
                        <ItemTemplate>
                            <div class="achievement-card">
                                <div class="achievement-icon-container">
                                    <div class="achievement-icon <%# Eval("IconClass") %>">
                                        <%# GetAchievementIconHtml(Eval("IconClass") as string) %>
                                    </div>
                                    <div class="achievement-glow"></div>
                                </div>
                                <div class="achievement-content">
                                    <h3 class="achievement-title"><%# Eval("Title") %></h3>
                                    <p class="achievement-org"><%# Eval("Organization") %></p>
                                    <p class="achievement-desc"><%# Eval("Description") %></p>
                                    <div class="achievement-date"><%# Eval("Year") %></div>
                                    <div class="achievement-type <%# Eval("TypeClass") %>"><%# Eval("Type") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- Duplicate achievements for infinite scroll effect -->
                    <asp:Repeater ID="rptAchievementsDuplicate" runat="server">
                        <ItemTemplate>
                            <div class="achievement-card">
                                <div class="achievement-icon-container">
                                    <div class="achievement-icon <%# Eval("IconClass") %>">
                                        <%# GetAchievementIconHtml(Eval("IconClass") as string) %>
                                    </div>
                                    <div class="achievement-glow"></div>
                                </div>
                                <div class="achievement-content">
                                    <h3 class="achievement-title"><%# Eval("Title") %></h3>
                                    <p class="achievement-org"><%# Eval("Organization") %></p>
                                    <p class="achievement-desc"><%# Eval("Description") %></p>
                                    <div class="achievement-date"><%# Eval("Year") %></div>
                                    <div class="achievement-type <%# Eval("TypeClass") %>"><%# Eval("Type") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="section-cta">
                <a href="Achievements.aspx" class="cta-button">
                    <span>View All Achievements</span>
                    <i class="fas fa-trophy"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Dark Theme Styles */
        body {
            background: #000000 !important; /* Pure black background */
            color: #ffffff;
            font-family: 'Inter', sans-serif;
        }

        /* Dark Hero Section with Photo Background */
        .dark-hero {
            min-height: 100vh;
            background: #000000; /* Pure black background */
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

        /* Hero Photo Container - Slower animation from left */
        .hero-photo-container {
            position: relative;
            width: 100%;
            max-width: 600px;
            height: 700px;
            margin: 0 auto 3rem;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            /* Photo slides in from left depth with floating - SLOWER */
            animation: slideInFromLeft 2.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) both, 
                       floatingImage 6s ease-in-out infinite 2.2s;
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
            /* Text content slides in from right depth - SLOWER */
            animation: slideInFromRight 2.2s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.5s both;
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
            /* Name appears with the text overlay animation */
            opacity: 1;
        }

        /* Name animation from left depth of screen - Slowed down */
        @keyframes slideInFromLeft {
            0% {
                transform: translateX(-100vw); /* Start from left edge of viewport */
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* New animation for content from right depth of screen - Slowed down */
        @keyframes slideInFromRight {
            0% {
                transform: translateX(100vw); /* Start from right edge of viewport */
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
            /* Subtitle appears with the text overlay animation */
            opacity: 1;
        }

        .subtitle-text {
            display: block;
            transition: all 0.5s ease-in-out;
        }

        /* Tagline - Slower animation from right with arrow */
        .tagline {
            margin: 2rem 0 1rem 0;
            /* Tagline slides in from right depth after other content - SLOWER */
            animation: slideInFromRight 1.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) 1.2s both;
            position: relative;
        }

        .tagline p {
            font-size: 0.9rem;
            letter-spacing: 0.15em;
            color: #666;
            max-width: 600px;
            margin: 0 auto 2rem auto;
            font-weight: 400;
        }

        /* New Tagline Arrow - Positioned after tagline text */
        .tagline-arrow {
            display: flex;
            justify-content: center;
            margin-top: 1.5rem;
            animation: fadeInUp 2s ease-out 2s both;
        }

        .tagline-scroll-arrow {
            width: 45px;
            height: 45px;
            border: 1px solid #555;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #888;
            cursor: pointer;
            transition: all 0.3s ease;
            animation: gentleBounce 3s infinite 2.5s;
            background: rgba(255, 255, 255, 0.03);
        }

        .tagline-scroll-arrow:hover {
            border-color: #667eea;
            color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: scale(1.1);
        }

        /* Gentle bounce animation for tagline arrow */
        @keyframes gentleBounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-8px);
            }
            60% {
                transform: translateY(-4px);
            }
        }

        /* Stats Section - Enhanced with 6 impressive stats */
        .stats-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2.5rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .stat-item {
            text-align: center;
            padding: 1.5rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.15);
            border-color: rgba(102, 126, 234, 0.3);
        }

        .stat-number {
            font-size: 3.5rem;
            font-weight: 900;
            color: #667eea;
            margin-bottom: 0.5rem;
            line-height: 1;
            text-shadow: 0 0 20px rgba(102, 126, 234, 0.3);
        }

        .stat-label {
            font-size: 0.85rem;
            letter-spacing: 0.08em;
            color: #ccc;
            font-weight: 600;
            line-height: 1.3;
        }

        /* Simple Ghost Text/Outline Typography for Section Titles */
        .section-title-ghost {
            font-size: 3rem;
            font-weight: 900;
            margin-bottom: 3rem;
            letter-spacing: 0.05em;
            text-align: center;
            position: relative;
            color: #ffffff;
            text-transform: uppercase;
            
            /* Simple text outline/stroke */
            -webkit-text-stroke: 1px #333;
            text-stroke: 1px #333;
        }

        .section-title-ghost::before {
            content: attr(data-text);
            position: absolute;
            left: 0;
            top: 0;
            z-index: -1;
            color: transparent;
            -webkit-text-stroke: 2px rgba(102, 126, 234, 0.2);
            text-stroke: 2px rgba(102, 126, 234, 0.2);
            transform: translate(2px, 2px);
        }

        /* Simple hover effect */
        .section-title-ghost:hover {
            color: #667eea;
            transform: translateY(-1px);
            transition: all 0.3s ease;
        }

        /* Projects Section */
        .projects-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
            overflow: hidden;
        }

        .infinite-scroll-container {
            width: 100%;
            overflow: hidden;
            mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
            -webkit-mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
            position: relative;
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
            transition: all 0.5s ease;
            min-width: 350px;
            flex-shrink: 0;
            position: relative;
        }

        /* Center detection and floating animation for projects */
        .project-showcase.center-item {
            transform: translateY(-20px) scale(1.05);
            box-shadow: 0 30px 60px rgba(102, 126, 234, 0.3);
            border-color: #667eea;
            z-index: 10;
        }

        .project-showcase:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .project-showcase.center-item:hover {
            transform: translateY(-25px) scale(1.08);
            box-shadow: 0 35px 70px rgba(102, 126, 234, 0.4);
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

        /* About Section */
        .about-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
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

        /* About Image with Social Media Overlay */
        .about-image {
            position: relative;
            display: inline-block;
        }

        /* Social Media Icons Overlay positioned above the about image */
        .about-social-media-overlay {
            position: absolute;
            top: -25px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 0.8rem;
            z-index: 10;
            opacity: 0;
            animation: socialFadeInAbout 1.5s ease-out 1s forwards;
        }

        .about-social-icon {
            width: 40px;
            height: 40px;
            background: rgba(17, 17, 17, 0.95);
            border: 2px solid #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .about-social-icon::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient-primary);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }

        .about-social-icon:hover::before {
            opacity: 1;
        }

        .about-social-icon i {
            font-size: 1rem;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .about-social-icon.github i { color: #333; }
        .about-social-icon.kaggle i { color: #20beff; }
        .about-social-icon.linkedin i { color: #0077b5; }
        .about-social-icon.email i { color: #ea4335; }
        .about-social-icon.twitter i { color: #1da1f2; }

        .about-social-icon:hover {
            transform: translateY(-3px) scale(1.1);
            border-color: #667eea;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .about-social-icon:hover i {
            color: white;
        }

        /* About Photo */
        .about-photo {
            width: 300px;
            height: 400px;
            background: #1a1a1a;
            border-radius: 8px;
            overflow: hidden;
            margin-left: auto;
            position: relative;
            border: 3px solid #222;
            transition: all 0.3s ease;
        }

        .about-photo:hover {
            border-color: #667eea;
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.3);
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
            transition: all 0.3s ease;
        }

        .about-photo:hover img {
            transform: scale(1.02);
        }

        .about-photo img:not([src]),
        .about-photo img[src=""] {
            opacity: 0;
        }

        .about-photo img[src]:not([src=""]) + .about-placeholder {
            opacity: 0;
        }

        /* Social fade in animation for about section */
        @keyframes socialFadeInAbout {
            0% {
                opacity: 0;
                transform: translateX(-50%) translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }
        }

        /* Action Section */
        .action-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
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

        /* Tech Stack Section - Restored comprehensive version */
        .tech-stack-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
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
            transition: all 0.3s ease;
        }

        .tech-category:hover {
            border-color: #667eea;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
        }

        .category-title {
            color: #667eea;
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 0.05em;
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
            cursor: pointer;
        }

        .tech-item:hover {
            transform: translateY(-5px);
        }

        .tech-item span {
            color: #ccc;
            font-size: 0.8rem;
            text-align: center;
            font-weight: 500;
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
            transform: scale(1.1);
        }

        .tech-logo img {
            width: 30px;
            height: 30px;
            object-fit: contain;
        }

        .tech-logo i {
            font-size: 1.8rem;
        }

        /* Enhanced tech logo colors with modern color schemes */
        .tech-logo.python i { color: #3776ab; }
        .tech-logo.java i { color: #f89820; }
        .tech-logo.react i { color: #61dafb; }
        .tech-logo.js i { color: #f7df1e; }
        .tech-logo.node i { color: #339933; }
        .tech-logo.git i { color: #f05032; }
        .tech-logo.github i { color: #171515; }
        .tech-logo.docker i { color: #2496ed; }
        .tech-logo.kaggle i { color: #20beff; }
        .tech-logo.html i { color: #e34f26; }
        .tech-logo.css i { color: #1572b6; }
        .tech-logo.csharp i { color: #239120; }
        .tech-logo.angular i { color: #dd0031; }
        .tech-logo.vue i { color: #4fc08d; }
        .tech-logo.php i { color: #777bb4; }
        .tech-logo.laravel i { color: #ff2d20; }
        .tech-logo.bootstrap i { color: #7952b3; }
        .tech-logo.tailwind i { color: #06b6d4; }
        .tech-logo.mongo i { color: #47a248; }
        .tech-logo.firebase i { color: #ffca28; }
        .tech-logo.sql i { color: #336791; }
        .tech-logo.heroku i { color: #430098; }
        .tech-logo.aws i { color: #ff9900; }

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

        /* Responsive Design - Enhanced for slower depth-based animations */
        @media (max-width: 768px) {
            .hero-hollow-name {
                font-size: 3.5rem;
                -webkit-text-stroke: 2px #ffffff;
                text-stroke: 2px #ffffff;
            }

            .hero-subtitle {
                font-size: 0.9rem;
                letter-spacing: 0.15em;
            }

            .hero-text-overlay {
                top: 55%;
                /* Maintain slower right-depth animation on tablets */
                animation: slideInFromRight 2.0s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.4s both;
            }

            .hero-photo-container {
                max-width: 400px;
                height: 500px;
                margin-bottom: 2rem;
                /* Maintain slower left-depth animation on tablets */
                animation: slideInFromLeft 2.0s cubic-bezier(0.25, 0.46, 0.45, 0.94) both, 
                           floatingImage 6s ease-in-out infinite 2.0s;
            }

            .tagline {
                /* Maintain slower right-depth animation on tablets */
                animation: slideInFromRight 1.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) 1.0s both;
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

            .about-photo {
                width: 250px;
                height: 320px;
                margin: 0 auto;
            }

            .about-social-media-overlay {
                gap: 0.6rem;
                top: -20px;
            }

            .about-social-icon {
                width: 35px;
                height: 35px;
            }

            .about-social-icon i {
                font-size: 0.9rem;
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

            /* Mobile adjustments for infinite scroll with enhanced center detection */
            .project-showcase {
                min-width: 280px;
            }

            .project-showcase.center-item {
                transform: translateY(-15px) scale(1.03);
            }

            .projects-scroll-track {
                animation-duration: 25s; /* Slower on mobile */
            }
        }

        @media (max-width: 480px) {
            .hero-hollow-name {
                font-size: 2.8rem;
                -webkit-text-stroke: 1.5px #ffffff;
                text-stroke: 1.5px #ffffff;
            }

            .hero-text-overlay {
                top: 50%;
                /* Maintain slower right-depth animation on small mobile */
                animation: slideInFromRight 1.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.4s both;
            }

            .hero-photo-container {
                max-width: 300px;
                height: 400px;
                /* Maintain slower left-depth animation on small mobile */
                animation: slideInFromLeft 1.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) both, 
                           floatingImage 6s ease-in-out infinite 1.8s;
            }

            .hero-subtitle {
                font-size: 0.8rem;
                letter-spacing: 0.1em;
            }

            .tagline {
                /* Maintain slower right-depth animation on small mobile */
                animation: slideInFromRight 1.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.9s both;
            }

            .about-photo {
                width: 200px;
                height: 260px;
            }

            .about-social-media-overlay {
                position: static;
                transform: none;
                margin-bottom: 1rem;
                justify-content: center;
                gap: 0.5rem;
            }

            .about-social-icon {
                width: 32px;
                height: 32px;
            }

            .about-social-icon i {
                font-size: 0.8rem;
            }

            /* Extra small mobile adjustments */
            .project-showcase {
                min-width: 250px;
            }

            .project-showcase.center-item {
                transform: translateY(-10px) scale(1.02); /* Further reduced for small mobile */
            }

            .project-info {
                padding: 1rem;
            }

            .projects-scroll-track {
                animation-duration: 20s; /* Even slower on small mobile */
            }
        }

        /* Override main content margin for homepage since navbar is hidden initially */
        .main-content {
            margin-top: 0 !important;
        }

        /* Remove the old section-title-hollow class since we're not using it anymore */
        .section-title-hollow {
            display: none;
        }

        /* Progressive reveal animation for tech items */
        .tech-item {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInTech 0.6s ease-out forwards;
        }

        .tech-item:nth-child(1) { animation-delay: 0.1s; }
        .tech-item:nth-child(2) { animation-delay: 0.2s; }
        .tech-item:nth-child(3) { animation-delay: 0.3s; }
        .tech-item:nth-child(4) { animation-delay: 0.4s; }
        .tech-item:nth-child(5) { animation-delay: 0.5s; }
        .tech-item:nth-child(6) { animation-delay: 0.6s; }

        @keyframes fadeInTech {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Achievements Section - Infinite Carousel Slider */
        .achievements-section {
            background: #000000; /* Pure black background */
            padding: 100px 0;
            border-top: 1px solid #111111; /* Darker border */
            overflow: hidden;
        }

        .achievements-carousel-container {
            width: 100%;
            overflow: hidden;
            mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
            -webkit-mask: linear-gradient(to right, transparent, white 10%, white 90%, transparent);
            position: relative;
            margin: 3rem 0;
        }

        .achievements-scroll-track {
            display: flex;
            gap: 2rem;
            animation: infiniteScrollAchievements 35s linear infinite;
            width: calc(380px * 18 + 2rem * 17); /* Accommodate all achievement cards */
        }

        .achievements-scroll-track:hover {
            animation-play-state: paused;
        }

        @keyframes infiniteScrollAchievements {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(calc(-380px * 9 - 2rem * 8)); /* Move by half the track width */
            }
        }

        .achievement-card {
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid #333;
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            min-width: 380px;
            flex-shrink: 0;
            position: relative;
            padding: 2rem;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        /* Center detection and enhanced hover effect for achievements */
        .achievement-card.center-item {
            transform: translateY(-20px) scale(1.05);
            box-shadow: 0 30px 60px rgba(102, 126, 234, 0.4);
            border-color: #667eea;
            z-index: 10;
            background: linear-gradient(135deg, #2a2a2a 0%, #3d3d3d 100%);
        }

        .achievement-card:hover {
            transform: translateY(-15px) scale(1.03);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
            border-color: #667eea;
            background: linear-gradient(135deg, #2a2a2a 0%, #3d3d3d 100%);
        }

        .achievement-card.center-item:hover {
            transform: translateY(-25px) scale(1.08);
            box-shadow: 0 35px 70px rgba(102, 126, 234, 0.5);
        }

        /* Achievement Icon Container */
        .achievement-icon-container {
            position: relative;
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .achievement-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
            border: 3px solid rgba(255, 255, 255, 0.1);
        }

        /* Achievement glow effect */
        .achievement-glow {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100px;
            height: 100px;
            border-radius: 50%;
            opacity: 0;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .achievement-card:hover .achievement-glow {
            opacity: 0.3;
            animation: pulse-glow 2s infinite;
        }

        @keyframes pulse-glow {
            0%, 100% {
                transform: translate(-50%, -50%) scale(1);
                opacity: 0.3;
            }
            50% {
                transform: translate(-50%, -50%) scale(1.2);
                opacity: 0.1;
            }
        }

        /* Specific achievement icon styles */
        .achievement-icon.kaggle-expert {
            background: linear-gradient(135deg, #20beff 0%, #1da1f2 100%);
        }
        .achievement-icon.kaggle-expert + .achievement-glow {
            background: radial-gradient(circle, #20beff 0%, transparent 70%);
        }

        .achievement-icon.azure-cert {
            background: linear-gradient(135deg, #0078d4 0%, #005a9e 100%);
        }
        .achievement-icon.azure-cert + .achievement-glow {
            background: radial-gradient(circle, #0078d4 0%, transparent 70%);
        }

        .achievement-icon.hackathon-winner {
            background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
            color: #333;
        }
        .achievement-icon.hackathon-winner + .achievement-glow {
            background: radial-gradient(circle, #ffd700 0%, transparent 70%);
        }

        .achievement-icon.research {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .achievement-icon.research + .achievement-glow {
            background: radial-gradient(circle, #667eea 0%, transparent 70%);
        }

        .achievement-icon.opensource {
            background: linear-gradient(135deg, #333 0%, #171515 100%);
        }
        .achievement-icon.opensource + .achievement-glow {
            background: radial-gradient(circle, #333 0%, transparent 70%);
        }

        .achievement-icon.coding-master {
            background: linear-gradient(135deg, #00d4aa 0%, #00b894 100%);
        }
        .achievement-icon.coding-master + .achievement-glow {
            background: radial-gradient(circle, #00d4aa 0%, transparent 70%);
        }

        /* Achievement Content */
        .achievement-content {
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .achievement-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
            line-height: 1.3;
        }

        .achievement-org {
            font-size: 0.9rem;
            color: #667eea;
            font-weight: 600;
            margin-bottom: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .achievement-desc {
            color: #ccc;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
            min-height: 3.2rem; /* Ensure consistent height */
        }

        .achievement-date {
            position: absolute;
            top: -1rem;
            right: 1rem;
            background: rgba(102, 126, 234, 0.9);
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .achievement-type {
            display: inline-block;
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 1rem;
        }

        /* Achievement type colors */
        .achievement-type.expert {
            background: linear-gradient(135deg, #20beff 0%, #1da1f2 100%);
            color: white;
        }

        .achievement-type.certification {
            background: linear-gradient(135deg, #0078d4 0%, #005a9e 100%);
            color: white;
        }

        .achievement-type.award {
            background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
            color: #333;
        }

        .achievement-type.research {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .achievement-type.milestone {
            background: linear-gradient(135deg, #333 0%, #555 100%);
            color: white;
        }

        .achievement-type.achievement {
            background: linear-gradient(135deg, #00d4aa 0%, #00b894 100%);
            color: white;
        }

        /* Enhanced hover effects for achievements */
        .achievement-card:hover .achievement-icon {
            transform: scale(1.1) rotate(5deg);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .achievement-card:hover .achievement-title {
            color: #667eea;
        }

        .achievement-card:hover .achievement-desc {
            color: #fff;
        }

        /* Responsive design for achievements */
        @media (max-width: 768px) {
            .achievement-card {
                min-width: 320px;
                padding: 1.5rem;
            }

            .achievement-card.center-item {
                transform: translateY(-15px) scale(1.03);
            }

            .achievements-scroll-track {
                animation-duration: 30s; /* Slower on tablets */
            }

            .achievement-icon-container {
                width: 70px;
                height: 70px;
                margin-bottom: 1rem;
            }

            .achievement-icon {
                width: 70px;
                height: 70px;
                font-size: 1.8rem;
            }

            .achievement-title {
                font-size: 1.2rem;
            }

            .achievement-desc {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .achievement-card {
                min-width: 280px;
                padding: 1.2rem;
            }

            .achievement-card.center-item {
                transform: translateY(-10px) scale(1.02);
            }

            .achievements-scroll-track {
                animation-duration: 25s; /* Even slower on mobile */
            }

            .achievement-icon-container {
                width: 60px;
                height: 60px;
            }

            .achievement-icon {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
            }

            .achievement-title {
                font-size: 1.1rem;
            }

            .achievement-desc {
                font-size: 0.85rem;
                min-height: auto;
            }

            .achievement-date {
                top: -0.5rem;
                right: 0.5rem;
                font-size: 0.75rem;
                padding: 0.2rem 0.6rem;
            }
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

        // Center detection and floating animation for projects
        function initializeCenterDetection() {
            // Function to check if element is in center of viewport
            function isInCenter(element) {
                const rect = element.getBoundingClientRect();
                const viewportWidth = window.innerWidth;
                const elementCenter = rect.left + rect.width / 2;
                const viewportCenter = viewportWidth / 2;
                
                // Check if element center is within 150px of viewport center
                return Math.abs(elementCenter - viewportCenter) < 150;
            }

            // Function to update center items
            function updateCenterItems() {
                // Update project items
                const projectItems = document.querySelectorAll('.project-showcase');
                projectItems.forEach(item => {
                    if (isInCenter(item)) {
                        item.classList.add('center-item');
                    } else {
                        item.classList.remove('center-item');
                    }
                });

                // Update achievement items
                const achievementItems = document.querySelectorAll('.achievement-card');
                achievementItems.forEach(item => {
                    if (isInCenter(item)) {
                        item.classList.add('center-item');
                    } else {
                        item.classList.remove('center-item');
                    }
                });
            }

            // Run center detection every 100ms for smooth animation
            setInterval(updateCenterItems, 100);

            // Also run on scroll and resize
            window.addEventListener('scroll', updateCenterItems);
            window.addEventListener('resize', updateCenterItems);
        }

        // Enhanced scroll for arrows with smooth animation
        document.addEventListener('DOMContentLoaded', function() {
            // Original scroll arrow functionality
            const scrollArrow = document.querySelector('.scroll-arrow');
            if (scrollArrow) {
                scrollArrow.addEventListener('click', function() {
                    // Calculate position to show complete Stats section (first section after hero)
                    const statsSection = document.querySelector('.stats-section');
                    
                    if (statsSection) {
                        // Get the offset of the stats section
                        const targetPosition = statsSection.offsetTop - 80; // 80px padding from top
                        
                        // Smooth scroll to the calculated position
                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                    }
                });
            }

            // New tagline arrow functionality - Navigate to About Me
            const taglineArrow = document.querySelector('.tagline-scroll-arrow');
            if (taglineArrow) {
                taglineArrow.addEventListener('click', function() {
                    // Calculate position to show complete About Me section
                    const aboutSection = document.querySelector('.about-section');
                    
                    if (aboutSection) {
                        // Position to show the About Me title and complete content
                        const targetPosition = aboutSection.offsetTop - 60; // 60px padding from top for perfect positioning
                        
                        // Smooth scroll to the calculated position
                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                    }
                });
            }

            // Initialize all animations and effects
            animateCounters();
            animateOnScroll();
            initializeCenterDetection(); // Initialize center detection for floating effect

            // Fixed animated subtitle text transition - Now starts after slower animations complete
            setTimeout(() => {
                const subtitleElement = document.querySelector('.subtitle-text');
                if (subtitleElement) {
                    const text1 = subtitleElement.getAttribute('data-text1'); // Deep Learning Engineer
                    const text2 = subtitleElement.getAttribute('data-text2'); // Kaggle Expert | Deep Learning
                    const text3 = subtitleElement.getAttribute('data-text3'); // IoT + ML Researcher
                    
                    // Start with the current text (Kaggle Expert)
                    const texts = [text1, text2, text3]; // Rotate through all texts
                    let currentIndex = 0;

                    // Start the rotation after slower initial animations
                    setInterval(() => {
                        subtitleElement.style.opacity = '0';
                        setTimeout(() => {
                            currentIndex = (currentIndex + 1) % texts.length; // Cycle through all 3 texts
                            subtitleElement.textContent = texts[currentIndex];
                            subtitleElement.style.opacity = '1';
                        }, 350); // Slightly longer fade time for slower feel
                    }, 4000); // Longer interval for better readability with slower animations
                }
            }, 3000); // Wait 3 seconds for slower animations to complete before starting rotation
        });

        // Remove parallax effect that interferes with normal scrolling
        // Normal scrolling will now work properly without interference
    </script>
</asp:Content>