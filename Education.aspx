<%@ Page Title="Education" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Education.aspx.cs" Inherits="WebApplication1.Education" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Education Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="EDUCATION">MY EDUCATION</h1>
                <p class="hero-description">
                    My academic journey and continuous learning path in computer science, data science, and emerging technologies. 
                    From formal education to self-driven exploration, knowledge is the foundation of innovation and growth.
                </p>
                <div class="education-overview">
                    <div class="overview-stat">
                        <div class="overview-number">KUET</div>
                        <div class="overview-label">University</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">25+</div>
                        <div class="overview-label">Courses</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">5+</div>
                        <div class="overview-label">Certifications</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Academic Timeline -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="ACADEMIC">ACADEMIC JOURNEY</h2>
            <div class="education-timeline">
                <div class="timeline-item">
                    <div class="timeline-year">
                        <div class="year-badge current">2020-2024</div>
                        <div class="year-status">Current</div>
                    </div>
                    <div class="timeline-content">
                        <div class="education-card">
                            <div class="education-header">
                                <div class="education-icon cs">
                                    <i class="fas fa-graduation-cap"></i>
                                </div>
                                <div class="education-info">
                                    <h3>Computer Science & Engineering</h3>
                                    <h4>Khulna University of Engineering & Technology (KUET)</h4>
                                    <div class="education-meta">
                                        <span class="location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            Khulna, Bangladesh
                                        </span>
                                        <span class="degree-type">
                                            <i class="fas fa-award"></i>
                                            Bachelor of Science
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="education-description">
                                <p>
                                    Pursuing comprehensive computer science education with specialization in data science, machine learning, 
                                    and IoT systems. Strong foundation in algorithms, data structures, software engineering, and emerging 
                                    technologies with hands-on experience in research and development.
                                </p>
                                <div class="course-highlights">
                                    <h5>Core Subjects</h5>
                                    <div class="subjects-grid">
                                        <span class="subject-tag">Data Structures & Algorithms</span>
                                        <span class="subject-tag">Machine Learning</span>
                                        <span class="subject-tag">Database Systems</span>
                                        <span class="subject-tag">Software Engineering</span>
                                        <span class="subject-tag">Computer Networks</span>
                                        <span class="subject-tag">IoT Systems</span>
                                        <span class="subject-tag">Statistical Analysis</span>
                                        <span class="subject-tag">Web Technologies</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-year">
                        <div class="year-badge completed">2018-2020</div>
                        <div class="year-status">Completed</div>
                    </div>
                    <div class="timeline-content">
                        <div class="education-card">
                            <div class="education-header">
                                <div class="education-icon hsc">
                                    <i class="fas fa-school"></i>
                                </div>
                                <div class="education-info">
                                    <h3>Higher Secondary Certificate (HSC)</h3>
                                    <h4>Science Group - Mathematics & Physics</h4>
                                    <div class="education-meta">
                                        <span class="location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            Dhaka, Bangladesh
                                        </span>
                                        <span class="degree-type">
                                            <i class="fas fa-certificate"></i>
                                            Science Background
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="education-description">
                                <p>
                                    Strong foundation in mathematics, physics, and chemistry with focus on analytical thinking 
                                    and problem-solving skills. Developed early interest in programming and computational thinking.
                                </p>
                                <div class="course-highlights">
                                    <h5>Focus Areas</h5>
                                    <div class="subjects-grid">
                                        <span class="subject-tag">Advanced Mathematics</span>
                                        <span class="subject-tag">Physics</span>
                                        <span class="subject-tag">Chemistry</span>
                                        <span class="subject-tag">Programming Fundamentals</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Technical Learning -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="LEARNING">TECHNICAL LEARNING</h2>
            <div class="learning-categories">
                <div class="learning-category">
                    <div class="category-header">
                        <div class="category-icon datascience">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3>Data Science & Analytics</h3>
                    </div>
                    <div class="skills-list">
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Python for Data Science</span>
                                <span class="skill-level expert">Expert</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="95%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Statistical Analysis</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="90%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Data Visualization</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="88%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="learning-category">
                    <div class="category-header">
                        <div class="category-icon machinelearning">
                            <i class="fas fa-brain"></i>
                        </div>
                        <h3>Machine Learning & AI</h3>
                    </div>
                    <div class="skills-list">
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Deep Learning</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="85%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Computer Vision</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="82%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Natural Language Processing</span>
                                <span class="skill-level intermediate">Intermediate</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="78%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="learning-category">
                    <div class="category-header">
                        <div class="category-icon programming">
                            <i class="fas fa-code"></i>
                        </div>
                        <h3>Programming & Development</h3>
                    </div>
                    <div class="skills-list">
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Python Programming</span>
                                <span class="skill-level expert">Expert</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="95%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">JavaScript & Web Dev</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="88%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Database Management</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="90%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="learning-category">
                    <div class="category-header">
                        <div class="category-icon iot">
                            <i class="fas fa-microchip"></i>
                        </div>
                        <h3>IoT & Edge Computing</h3>
                    </div>
                    <div class="skills-list">
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Sensor Integration</span>
                                <span class="skill-level advanced">Advanced</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="85%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Edge Computing</span>
                                <span class="skill-level intermediate">Intermediate</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="75%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-info">
                                <span class="skill-name">Hardware-Software Integration</span>
                                <span class="skill-level intermediate">Intermediate</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" data-width="80%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Certifications & Courses -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="CERTIFICATIONS">CERTIFICATIONS & COURSES</h2>
            <div class="certifications-grid">
                <div class="certification-card">
                    <div class="cert-icon kaggle">
                        <i class="fab fa-kaggle"></i>
                    </div>
                    <h3>Kaggle Expert</h3>
                    <p class="cert-issuer">Kaggle Community</p>
                    <p class="cert-description">
                        Achieved expert status through consistent participation in data science competitions 
                        and contributions to the Kaggle community.
                    </p>
                    <div class="cert-skills">
                        <span class="cert-skill">Data Science</span>
                        <span class="cert-skill">Machine Learning</span>
                        <span class="cert-skill">Competition</span>
                    </div>
                </div>

                <div class="certification-card">
                    <div class="cert-icon coursera">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <h3>Machine Learning Specialization</h3>
                    <p class="cert-issuer">Coursera - Stanford University</p>
                    <p class="cert-description">
                        Comprehensive study of machine learning algorithms, neural networks, 
                        and practical implementation techniques.
                    </p>
                    <div class="cert-skills">
                        <span class="cert-skill">Neural Networks</span>
                        <span class="cert-skill">Deep Learning</span>
                        <span class="cert-skill">Python</span>
                    </div>
                </div>

                <div class="certification-card">
                    <div class="cert-icon python">
                        <i class="fab fa-python"></i>
                    </div>
                    <h3>Python for Data Science</h3>
                    <p class="cert-issuer">Python Institute</p>
                    <p class="cert-description">
                        Advanced certification in Python programming with focus on data analysis, 
                        scientific computing, and machine learning libraries.
                    </p>
                    <div class="cert-skills">
                        <span class="cert-skill">Pandas</span>
                        <span class="cert-skill">NumPy</span>
                        <span class="cert-skill">Scikit-learn</span>
                    </div>
                </div>

                <div class="certification-card">
                    <div class="cert-icon cloud">
                        <i class="fas fa-cloud"></i>
                    </div>
                    <h3>Cloud Computing Fundamentals</h3>
                    <p class="cert-issuer">AWS / Google Cloud</p>
                    <p class="cert-description">
                        Understanding of cloud services, deployment strategies, and scalable 
                        infrastructure for data science applications.
                    </p>
                    <div class="cert-skills">
                        <span class="cert-skill">AWS</span>
                        <span class="cert-skill">Docker</span>
                        <span class="cert-skill">DevOps</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Learning Philosophy -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="PHILOSOPHY">LEARNING PHILOSOPHY</h2>
            <div class="philosophy-grid">
                <div class="philosophy-item">
                    <div class="philosophy-icon curiosity">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3>Curiosity-Driven</h3>
                    <p>
                        Learning is fueled by genuine curiosity about how things work and how they can be improved. 
                        Every project becomes an opportunity to explore new concepts and push boundaries.
                    </p>
                </div>

                <div class="philosophy-item">
                    <div class="philosophy-icon practice">
                        <i class="fas fa-tools"></i>
                    </div>
                    <h3>Hands-On Practice</h3>
                    <p>
                        Theory without practice is incomplete. I believe in learning by doing - building real projects, 
                        participating in competitions, and solving actual problems.
                    </p>
                </div>

                <div class="philosophy-item">
                    <div class="philosophy-icon community">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Community Learning</h3>
                    <p>
                        Active participation in data science communities, open-source projects, and collaborative 
                        research amplifies learning through shared knowledge and diverse perspectives.
                    </p>
                </div>

                <div class="philosophy-item">
                    <div class="philosophy-icon future">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h3>Future-Focused</h3>
                    <p>
                        Staying ahead of technological trends and continuously adapting to emerging fields 
                        ensures relevance in the rapidly evolving tech landscape.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="GROW TOGETHER">LET'S GROW TOGETHER</h2>
            <p class="cta-description">
                Education is a lifelong journey. Whether you want to collaborate on research, discuss emerging technologies, 
                or explore learning opportunities together, I'm always excited to connect with fellow learners and innovators.
            </p>
            <div class="cta-buttons">
                <a href="Skills.aspx" class="btn-modern btn-primary">
                    <span>View Technical Skills</span>
                    <i class="fas fa-chart-bar"></i>
                </a>
                <a href="Projects.aspx" class="btn-modern btn-secondary">
                    <span>See Applied Learning</span>
                    <i class="fas fa-project-diagram"></i>
                </a>
                <a href="Contact.aspx" class="btn-modern btn-outline">
                    <span>Connect & Collaborate</span>
                    <i class="fas fa-handshake"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Education Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .education-overview {
            display: flex;
            gap: 3rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .overview-stat {
            text-align: center;
        }

        .overview-number {
            font-size: 2.2rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }

        .overview-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        /* Timeline Styles */
        .education-timeline {
            position: relative;
            max-width: 1000px;
            margin: 3rem auto 0;
        }

        .timeline-item {
            display: flex;
            gap: 3rem;
            margin-bottom: 4rem;
            align-items: flex-start;
        }

        .timeline-year {
            text-align: center;
            min-width: 150px;
        }

        .year-badge {
            background: var(--gradient-primary);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            box-shadow: var(--shadow-medium);
        }

        .year-badge.current {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .year-status {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .timeline-content {
            flex: 1;
        }

        .education-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            transition: var(--transition);
        }

        .education-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-dark);
            border-color: var(--accent-color);
        }

        .education-header {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .education-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            color: white;
            flex-shrink: 0;
        }

        .education-icon.cs {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .education-icon.hsc {
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);
        }

        .education-info h3 {
            margin-bottom: 0.5rem;
            color: var(--text-primary);
            font-size: 1.4rem;
        }

        .education-info h4 {
            margin-bottom: 1rem;
            color: var(--accent-color);
            font-size: 1.1rem;
            font-weight: 600;
        }

        .education-meta {
            display: flex;
            gap: 2rem;
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .education-meta span {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .course-highlights h5 {
            margin: 1.5rem 0 1rem 0;
            color: var(--text-primary);
        }

        .subjects-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .subject-tag {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.4rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        /* Learning Categories */
        .learning-categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .learning-category {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            transition: var(--transition);
        }

        .learning-category:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .category-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .category-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            color: white;
        }

        .category-icon.datascience {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .category-icon.machinelearning {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
        }

        .category-icon.programming {
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);
        }

        .category-icon.iot {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .skills-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .skill-item {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
        }

        .skill-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .skill-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .skill-name {
            color: var(--text-primary);
            font-weight: 600;
        }

        .skill-level {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .skill-level.expert {
            background: rgba(0, 184, 148, 0.2);
            color: #00b894;
        }

        .skill-level.advanced {
            background: rgba(0, 212, 170, 0.2);
            color: var(--accent-color);
        }

        .skill-level.intermediate {
            background: rgba(253, 203, 110, 0.2);
            color: #fdcb6e;
        }

        .skill-bar {
            width: 100%;
            height: 6px;
            background: var(--border-color);
            border-radius: 3px;
            overflow: hidden;
        }

        .skill-progress {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 3px;
            transition: width 1.5s ease-out;
            width: 0%;
        }

        /* Certifications Grid */
        .certifications-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .certification-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .certification-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .cert-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: white;
        }

        .cert-icon.kaggle {
            background: linear-gradient(135deg, #20beff 0%, #1a9ce8 100%);
        }

        .cert-icon.coursera {
            background: linear-gradient(135deg, #0056d3 0%, #004bb8 100%);
        }

        .cert-icon.python {
            background: linear-gradient(135deg, #3776ab 0%, #2d5f8f 100%);
        }

        .cert-icon.cloud {
            background: linear-gradient(135deg, #ff9900 0%, #cc7700 100%);
        }

        .certification-card h3 {
            margin-bottom: 0.5rem;
            color: var(--text-primary);
        }

        .cert-issuer {
            color: var(--accent-color);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .cert-description {
            color: var(--text-secondary);
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .cert-skills {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            justify-content: center;
        }

        .cert-skill {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        /* Philosophy Grid */
        .philosophy-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .philosophy-item {
            text-align: center;
            padding: 2rem;
        }

        .philosophy-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: white;
        }

        .philosophy-icon.curiosity {
            background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%);
        }

        .philosophy-icon.practice {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .philosophy-icon.community {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .philosophy-icon.future {
            background: linear-gradient(135deg, #e17055 0%, #d63031 100%);
        }

        .philosophy-item h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .philosophy-item p {
            color: var(--text-secondary);
            line-height: 1.6;
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
            .education-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .timeline-item {
                flex-direction: column;
                gap: 1.5rem;
            }

            .timeline-year {
                min-width: auto;
                text-align: left;
            }

            .education-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .education-meta {
                flex-direction: column;
                gap: 0.5rem;
            }

            .learning-categories,
            .certifications-grid,
            .philosophy-grid {
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
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Animate skill bars
            function animateSkillBars() {
                const skillBars = document.querySelectorAll('.skill-progress');
                
                const observerOptions = {
                    threshold: 0.5,
                    rootMargin: '0px 0px -100px 0px'
                };

                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const progress = entry.target;
                            const targetWidth = progress.getAttribute('data-width');
                            progress.style.width = targetWidth;
                            observer.unobserve(progress);
                        }
                    });
                }, observerOptions);

                skillBars.forEach(bar => {
                    observer.observe(bar);
                });
            }

            // Animate cards on scroll
            const cards = document.querySelectorAll('.education-card, .learning-category, .certification-card, .philosophy-item');
            
            const cardObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            });

            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = `all 0.6s ease-out ${index * 0.1}s`;
                cardObserver.observe(card);
            });

            // Initialize skill bar animations
            animateSkillBars();

            // Animate counter numbers
            const numbers = document.querySelectorAll('.overview-number');
            numbers.forEach(num => {
                const finalValue = num.textContent;
                if (finalValue === 'KUET') return; // Skip text values
                
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