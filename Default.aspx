<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section with Profile -->
    <div class="hero">
        <div class="container">
            <div class="profile-section">
                <!-- Profile Image -->
                <div class="profile-image">
                    <!-- Sample profile image - replace with your actual image -->
                    <div class="profile-image-placeholder business-card">
                        <!-- The initials "SR" will be displayed via CSS -->
                    </div>
                    <!-- Uncomment when you add your image:
                    <img src="/Content/images/profile.jpg" alt="Shakhoyat Rahman" />
                    -->
                </div>
                
                <!-- Name and Title -->
                <h1 class="fade-in-up">Shakhoyat Shujon</h1>
                <div class="subtitle fade-in-up">Aspiring Data Scientist | ML Enthusiast</div>
                <p class="fade-in-up">
                    Computer Science Engineering student at KUET specializing in data science, machine learning, and IoT systems. 
                    Active in competitive programming and Kaggle competitions with a focus on building intelligent solutions and transforming data into actionable insights.
                </p>
                
                <!-- Action Buttons -->
                <div class="fade-in-up" style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap; margin-top: 2rem;">
                    <a href="Projects.aspx" class="btn btn-primary">
                        <i class="fas fa-eye" style="margin-right: 0.5rem;"></i>
                        View My Work
                    </a>
                    <a href="Contact.aspx" class="btn btn-secondary">
                        <i class="fas fa-envelope" style="margin-right: 0.5rem;"></i>
                        Get In Touch
                    </a>
                    <a href="https://www.kaggle.com/shakhoyatshujon" class="btn btn-outline-primary" target="_blank">
                        <i class="fab fa-kaggle" style="margin-right: 0.5rem;"></i>
                        Kaggle Profile
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- About Preview Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">About Me</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Professional Background</h3>
                        </div>
                        <p class="card-text">
                            Computer Science Engineering student at KUET with expertise in data science, machine learning, and IoT systems. 
                            Passionate about solving complex problems through data analysis, statistical modeling, and intelligent algorithms.
                            Active Kaggle competitor with 700+ problem-solving experience.
                        </p>
                        <ul style="color: var(--text-secondary); line-height: 1.8; margin: 1.5rem 0;">
                            <li><strong>Data Science:</strong> Python, Pandas, NumPy, Scikit-Learn</li>
                            <li><strong>Machine Learning:</strong> TensorFlow, PyTorch, Deep Learning</li>
                            <li><strong>Visualization:</strong> Matplotlib, Plotly, Streamlit</li>
                            <li><strong>Programming:</strong> Python, Java, C++, JavaScript</li>
                            <li><strong>Databases:</strong> MySQL, PostgreSQL, MongoDB</li>
                        </ul>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="About.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                Learn More
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Quick Stats</h3>
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin: 2rem 0;">
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">700+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Problems Solved</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">15+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Technologies</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">3+</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Featured Projects</div>
                            </div>
                            <div class="text-center">
                                <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">100%</div>
                                <div style="color: var(--text-secondary); font-size: 0.9rem; font-weight: 500;">Dedicated</div>
                            </div>
                        </div>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-code" style="margin-right: 0.5rem;"></i>
                                View Skills
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">What I Do</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3 class="card-title">Data Science & Analytics</h3>
                        <p class="card-text">
                            Building comprehensive data analysis pipelines using Python, Pandas, and advanced statistical methods. 
                            Specializing in exploratory data analysis and automated EDA solutions that reduce exploration time by 70%.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Projects.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-external-link-alt" style="margin-right: 0.5rem;"></i>
                                View Projects
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-brain"></i>
                        </div>
                        <h3 class="card-title">Machine Learning</h3>
                        <p class="card-text">
                            Developing intelligent solutions using TensorFlow, PyTorch, and Scikit-Learn. 
                            Experienced in deep learning, predictive modeling, and deploying ML models for real-world applications.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-tools" style="margin-right: 0.5rem;"></i>
                                View Skills
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-microchip"></i>
                        </div>
                        <h3 class="card-title">IoT & Research</h3>
                        <p class="card-text">
                            Researching IoT systems integration with machine learning models. 
                            Focus on edge computing, real-time analytics, and sensor data processing for intelligent automation.
                        </p>
                        <div style="margin-top: auto; padding-top: 1rem;">
                            <a href="About.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-user" style="margin-right: 0.5rem;"></i>
                                About Me
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Featured Projects -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Featured Projects</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-user-md"></i>
                            <div class="project-overlay">
                                <div style="display: flex; gap: 1rem;">
                                    <a href="Projects.aspx" class="btn btn-primary">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                    <a href="https://github.com/Shakhoyat" target="_blank" class="btn btn-secondary">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="project-content">
                            <h4 class="project-title">Doctor Appointment Desktop App</h4>
                            <p class="project-description">
                                Comprehensive healthcare management system with appointment scheduling, predictive resource allocation, 
                                and optimization algorithms. Built with Java and JavaFX with MySQL database integration.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">Java</span>
                                <span class="tech-tag">JavaFX</span>
                                <span class="tech-tag">MySQL</span>
                                <span class="tech-tag">ML Algorithms</span>
                                <span class="tech-tag">Optimization</span>
                            </div>
                            <div style="margin-top: auto;">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                    View Project
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="project-card">
                        <div class="project-image" style="background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-chart-bar"></i>
                            <div class="project-overlay">
                                <div style="display: flex; gap: 1rem;">
                                    <a href="Projects.aspx" class="btn btn-primary">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                    <a href="https://github.com/Shakhoyat" target="_blank" class="btn btn-secondary">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="project-content">
                            <h4 class="project-title">Data Analysis Platform</h4>
                            <p class="project-description">
                                Advanced automated EDA pipeline that reduces data exploration time by 70%. 
                                Features interactive visualizations, statistical analysis, and machine learning insights with Streamlit interface.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">Python</span>
                                <span class="tech-tag">Streamlit</span>
                                <span class="tech-tag">Pandas</span>
                                <span class="tech-tag">Plotly</span>
                                <span class="tech-tag">Scikit-Learn</span>
                            </div>
                            <div style="margin-top: auto;">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                    View Project
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Third Project -->
            <div class="row mt-4">
                <div class="col-md-6 mx-auto">
                    <div class="project-card">
                        <div class="project-image" style="background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            <i class="fas fa-cloud-sun"></i>
                            <div class="project-overlay">
                                <div style="display: flex; gap: 1rem;">
                                    <a href="Projects.aspx" class="btn btn-primary">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                    <a href="https://github.com/Shakhoyat" target="_blank" class="btn btn-secondary">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="project-content">
                            <h4 class="project-title">Weather Observation WebApp</h4>
                            <p class="project-description">
                                Real-time weather analytics platform with geospatial forecasting capabilities. 
                                Built with React and TypeScript, featuring interactive maps and predictive weather modeling.
                            </p>
                            <div class="project-technologies">
                                <span class="tech-tag">React</span>
                                <span class="tech-tag">TypeScript</span>
                                <span class="tech-tag">APIs</span>
                                <span class="tech-tag">Geospatial</span>
                                <span class="tech-tag">Analytics</span>
                            </div>
                            <div style="margin-top: auto;">
                                <a href="Projects.aspx" class="btn btn-primary">
                                    <i class="fas fa-arrow-right" style="margin-right: 0.5rem;"></i>
                                    View Project
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-5">
                <a href="Projects.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View All Projects
                </a>
            </div>
        </div>
    </div>

    <!-- Skills Preview -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Core Technologies</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fab fa-python"></i>
                        </div>
                        <h4 class="card-title">Python</h4>
                        <p class="card-text">Data Science, ML, Deep Learning</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-brain"></i>
                        </div>
                        <h4 class="card-title">Machine Learning</h4>
                        <p class="card-text">TensorFlow, PyTorch, Scikit-Learn</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h4 class="card-title">Data Visualization</h4>
                        <p class="card-text">Matplotlib, Plotly, Streamlit</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fab fa-kaggle"></i>
                        </div>
                        <h4 class="card-title">Competitive Programming</h4>
                        <p class="card-text">Kaggle, Problem Solving, Algorithms</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Skills.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-chart-bar" style="margin-right: 0.75rem;"></i>
                    View All Skills
                </a>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Ready to Collaborate?</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                I'm open to research collaborations, data science projects, and machine learning opportunities. 
                Let's work together to transform data into meaningful insights and build intelligent solutions.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Contact.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-handshake" style="margin-right: 0.75rem;"></i>
                    Start Collaboration
                </a>
                <a href="mailto:skt104.shujon@gmail.com" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-envelope" style="margin-right: 0.75rem;"></i>
                    Send Email
                </a>
                <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fab fa-kaggle" style="margin-right: 0.75rem;"></i>
                    View Kaggle
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script>
        // Add smooth scroll animation effects
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card, .project-card');
            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        }

        // Initialize animations
        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', function() {
            // Set initial state for animations
            const elements = document.querySelectorAll('.card, .project-card');
            elements.forEach(element => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.6s ease-out';
            });
            
            // Trigger initial animation
            setTimeout(animateOnScroll, 200);
        });

        // Add typing effect to subtitle
        window.addEventListener('load', function() {
            const subtitle = document.querySelector('.subtitle');
            if (subtitle) {
                const text = 'Aspiring Data Scientist | ML Enthusiast';
                subtitle.textContent = '';
                let i = 0;
                
                function typeWriter() {
                    if (i < text.length) {
                        subtitle.textContent += text.charAt(i);
                        i++;
                        setTimeout(typeWriter, 100);
                    }
                }
                
                setTimeout(typeWriter, 1000);
            }
        });
    </script>
</asp:Content>