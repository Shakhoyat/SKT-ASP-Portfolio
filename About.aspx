<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- About Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row" style="align-items: center; text-align: left;">
                <div class="col-md-8">
                    <h1 style="color: white; text-align: left; margin-bottom: 1.5rem; font-size: 3.5rem;">About Me</h1>
                    <p style="font-size: 1.3rem; line-height: 1.6; margin-bottom: 2rem; color: white; opacity: 0.95;">
                        I'm Shakhoyat Shujon, a Computer Science Engineering student at KUET specializing in data science, 
                        machine learning, and IoT systems. Passionate about transforming data into actionable insights 
                        and building intelligent solutions that make a real impact.
                    </p>
                    <a href="Contact.aspx" class="btn btn-secondary" style="padding: 1rem 2rem;">
                        <i class="fas fa-paper-plane" style="margin-right: 0.5rem;"></i>
                        Get In Touch
                    </a>
                </div>
                <div class="col-md-4 text-center">
                    <div style="width: 220px; height: 220px; border-radius: 50%; background: rgba(255,255,255,0.15); margin: 0 auto; display: flex; align-items: center; justify-content: center; backdrop-filter: blur(10px); border: 3px solid rgba(255,255,255,0.2);">
                        <i class="fas fa-user-graduate fa-5x" style="color: rgba(255,255,255,0.9);"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Journey -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">My Journey</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="width: 80px; height: 80px; border-radius: 50%; background: var(--gradient-primary); margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                                <i class="fas fa-briefcase"></i>
                            </div>
                            <h3 class="card-title">Professional Background</h3>
                        </div>
                        <p class="card-text">
                            As a Computer Science Engineering student at KUET, I specialize in data science, machine learning, 
                            and IoT systems. I'm passionate about solving complex problems through data analysis, statistical modeling, 
                            and intelligent algorithms. Active Kaggle competitor with 700+ problem-solving experience.
                        </p>
                        <ul style="color: var(--text-secondary); line-height: 1.8; margin: 1.5rem 0;">
                            <li><strong>Data Science:</strong> Python, Pandas, NumPy, Statistical Analysis</li>
                            <li><strong>Machine Learning:</strong> TensorFlow, PyTorch, Scikit-Learn, Deep Learning</li>
                            <li><strong>Programming:</strong> Python, Java, C++, JavaScript, SQL</li>
                            <li><strong>Web Development:</strong> React, Next.js, Node.js, TypeScript</li>
                            <li><strong>Research:</strong> IoT Systems, Edge Computing, Real-time Analytics</li>
                        </p>
                        <p class="card-text">
                            I'm passionate about leveraging data to solve real-world problems and create intelligent systems. 
                            Whether it's building automated EDA pipelines that reduce exploration time by 70% or developing 
                            predictive models for healthcare optimization, I believe in using technology to make a meaningful impact.
                        </p>
                        <p class="card-text">
                            As an active Kaggle competitor and open-source contributor, I'm always eager to learn new techniques 
                            and collaborate with the data science community. I enjoy working on challenging problems that combine 
                            multiple disciplines like IoT, machine learning, and software engineering.
                        </p>
                        <div style="margin-top: 2rem;">
                            <a href="Skills.aspx" class="btn btn-outline-primary">
                                <i class="fas fa-tools" style="margin-right: 0.5rem;"></i>
                                View My Skills
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Technical Expertise -->
    <div class="section" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
        <div class="container">
            <h2 class="section-title">Technical Expertise</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h4 class="card-title">Backend Development</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Languages:</strong> Python, Java, C++, JavaScript</p>
                            <p><strong>Data Science:</strong> Pandas, NumPy, Scikit-Learn</p>
                            <p><strong>Machine Learning:</strong> TensorFlow, PyTorch, Deep Learning</p>
                            <p><strong>Tools:</strong> Jupyter, Git, Docker, Streamlit</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-database"></i>
                        </div>
                        <h4 class="card-title">Data & Analytics</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Databases:</strong> MySQL, PostgreSQL, MongoDB</p>
                            <p><strong>Analytics:</strong> Statistical Analysis, EDA, Data Mining</p>
                            <p><strong>Visualization:</strong> Matplotlib, Plotly, Seaborn</p>
                            <p><strong>Big Data:</strong> Data Pipelines, ETL, Real-time Processing</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="height: 100%; border: none; background: white;">
                        <div style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-paint-brush"></i>
                        </div>
                        <h4 class="card-title">Web & IoT Development</h4>
                        <div style="text-align: left; color: var(--text-secondary); margin: 1.5rem 0;">
                            <p><strong>Frontend:</strong> React, Next.js, TypeScript, HTML5/CSS3</p>
                            <p><strong>Backend:</strong> Node.js, Express.js, REST APIs</p>
                            <p><strong>IoT:</strong> Sensor Integration, Edge Computing</p>
                            <p><strong>Deployment:</strong> Streamlit, Cloud Platforms, DevOps</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="Skills.aspx" class="btn btn-primary" style="padding: 1rem 2rem; font-size: 1.1rem;">
                    <i class="fas fa-chart-bar" style="margin-right: 0.75rem;"></i>
                    View Detailed Skills
                </a>
            </div>
        </div>
    </div>

    <!-- Core Values -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Core Values</h2>
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-star"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Quality First</h4>
                    <p class="card-text">
                        I believe in delivering high-quality solutions that are both innovative and practical. 
                        Every analysis, model, and application I build is designed with accuracy, interpretability, 
                        and real-world impact in mind.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Collaboration</h4>
                    <p class="card-text">
                        Great insights come from great collaboration. I value working with diverse teams, 
                        sharing knowledge across disciplines, and learning from both technical experts 
                        and domain specialists to solve complex problems.
                    </p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 100px; height: 100px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2.5rem;">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h4 style="margin-bottom: 1rem; color: var(--text-primary);">Continuous Learning</h4>
                    <p class="card-text">
                        The data science field evolves rapidly, and so do I. I'm committed to staying current 
                        with new algorithms, tools, and methodologies through continuous learning, research, 
                        and active participation in the data science community.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Education & Learning -->
    <div class="section" style="background: var(--dark-bg); color: white;">
        <div class="container">
            <h2 class="section-title" style="color: white;">Education & Learning</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2); color: white;">
                        <h4 style="color: white; margin-bottom: 1.5rem;">
                            <i class="fas fa-graduation-cap" style="color: #667eea; margin-right: 0.75rem;"></i>
                            Formal Education
                        </h4>
                        <p style="color: rgba(255,255,255,0.9); margin-bottom: 1rem;">
                            Currently pursuing Computer Science Engineering at KUET with focus on data science, 
                            machine learning, and intelligent systems. Strong foundation in mathematics, 
                            statistics, and programming.
                        </p>
                        <ul style="color: rgba(255,255,255,0.8); line-height: 1.8;">
                            <li>Computer Science & Engineering at KUET</li>
                            <li>Data Science & Machine Learning Specialization</li>
                            <li>Statistical Analysis & Mathematical Modeling</li>
                            <li>Algorithm Design & Optimization</li>
                            <li>Research in IoT + ML Integration</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2); color: white;">
                        <h4 style="color: white; margin-bottom: 1.5rem;">
                            <i class="fas fa-book" style="color: #fdcb6e; margin-right: 0.75rem;"></i>
                            Continuous Learning
                        </h4>
                        <p style="color: rgba(255,255,255,0.9); margin-bottom: 1rem;">
                            Always expanding knowledge through Kaggle competitions, research papers, 
                            online courses, and hands-on projects. Active contributor to open-source 
                            data science projects and ML communities.
                        </p>
                        <ul style="color: rgba(255,255,255,0.8); line-height: 1.8;">
                            <li>Kaggle Competitions & Datasets</li>
                            <li>Machine Learning Research Papers</li>
                            <li>Online Courses (Coursera, edX, Udacity)</li>
                            <li>Open Source Contributions</li>
                            <li>Data Science Community Engagement</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title">Let's Build Something Amazing Together</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                I'm always open to discussing research collaborations, data science projects, and machine learning opportunities. 
                Whether you have a challenging dataset to analyze or want to build intelligent systems, I'd love to collaborate.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Projects.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View My Work
                </a>
                <a href="Contact.aspx" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-paper-plane" style="margin-right: 0.75rem;"></i>
                    Contact Me
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>