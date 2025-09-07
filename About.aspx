<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- About Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="section-title-ghost" data-text="ABOUT ME">ABOUT ME</h1>
                    <p class="hero-description">
                        I'm Shakhoyat Shujon, a Computer Science Engineering student at KUET specializing in data science, 
                        machine learning, and IoT systems. Passionate about transforming data into actionable insights 
                        and building intelligent solutions that make a real impact.
                    </p>
                    <div class="hero-stats">
                        <div class="stat-item">
                            <div class="stat-number">700+</div>
                            <div class="stat-label">Problems Solved</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">25+</div>
                            <div class="stat-label">Technologies</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">15+</div>
                            <div class="stat-label">Projects</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="profile-image">
                        <img src="/Content/images/about.jpg" alt="Shakhoyat Shujon" />
                        <div class="profile-image-placeholder">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Journey -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="MY JOURNEY">MY JOURNEY</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card professional-card">
                        <div class="card-icon">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <h3 class="card-title">Academic Excellence</h3>
                        <p class="card-text">
                            As a Computer Science Engineering student at KUET, I specialize in data science, machine learning, 
                            and IoT systems. Strong foundation in mathematics, statistics, and programming with focus on 
                            real-world problem solving through intelligent algorithms.
                        </p>
                        <div class="skill-highlights">
                            <span class="skill-tag">Data Science</span>
                            <span class="skill-tag">Machine Learning</span>
                            <span class="skill-tag">IoT Systems</span>
                            <span class="skill-tag">Statistical Analysis</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card professional-card">
                        <div class="card-icon">
                            <i class="fab fa-kaggle"></i>
                        </div>
                        <h3 class="card-title">Competitive Programming</h3>
                        <p class="card-text">
                            Active Kaggle competitor with 700+ problem-solving experience across platforms like Codeforces. 
                            Transitioned from competitive programming to data science, bringing algorithmic thinking and 
                            optimization skills to machine learning challenges.
                        </p>
                        <div class="skill-highlights">
                            <span class="skill-tag">Algorithms</span>
                            <span class="skill-tag">Problem Solving</span>
                            <span class="skill-tag">Optimization</span>
                            <span class="skill-tag">Mathematical Modeling</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card professional-card">
                        <div class="card-icon">
                            <i class="fas fa-brain"></i>
                        </div>
                        <h3 class="card-title">Research & Innovation</h3>
                        <p class="card-text">
                            Focused on cutting-edge research in Deep Learning, NLP, and Computer Vision. Published research 
                            papers and actively participate in datathons across the country, tackling complex challenges 
                            with innovative machine learning solutions.
                        </p>
                        <div class="skill-highlights">
                            <span class="skill-tag">Deep Learning</span>
                            <span class="skill-tag">Computer Vision</span>
                            <span class="skill-tag">NLP</span>
                            <span class="skill-tag">Research</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card professional-card">
                        <div class="card-icon">
                            <i class="fas fa-rocket"></i>
                        </div>
                        <h3 class="card-title">Future Vision</h3>
                        <p class="card-text">
                            Driven by the vision of becoming a future tech lead in deep learning. From automated EDA pipelines 
                            to predictive healthcare models, I focus on building intelligent systems with real-world impact 
                            that can transform industries and improve lives.
                        </p>
                        <div class="skill-highlights">
                            <span class="skill-tag">Leadership</span>
                            <span class="skill-tag">Innovation</span>
                            <span class="skill-tag">Healthcare AI</span>
                            <span class="skill-tag">Impact</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Technology Highlights -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="TECH STACK">TECHNOLOGY HIGHLIGHTS</h2>
            <p class="section-subtitle">
                Core technologies and areas of expertise. For detailed technical skills and proficiency levels, 
                <a href="Skills.aspx" class="highlight-link">visit my Skills page</a>.
            </p>
            <div class="tech-highlights-grid">
                <div class="tech-highlight">
                    <div class="tech-highlight-icon data-science">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Data Science & Analytics</h3>
                    <p>Python, Pandas, NumPy, Statistical Analysis, Automated EDA</p>
                </div>
                <div class="tech-highlight">
                    <div class="tech-highlight-icon machine-learning">
                        <i class="fas fa-brain"></i>
                    </div>
                    <h3>Machine Learning & AI</h3>
                    <p>TensorFlow, PyTorch, Deep Learning, Computer Vision, NLP</p>
                </div>
                <div class="tech-highlight">
                    <div class="tech-highlight-icon web-development">
                        <i class="fas fa-code"></i>
                    </div>
                    <h3>Software Development</h3>
                    <p>Python, Java, C++, React, Node.js, ASP.NET, RESTful APIs</p>
                </div>
                <div class="tech-highlight">
                    <div class="tech-highlight-icon iot-systems">
                        <i class="fas fa-microchip"></i>
                    </div>
                    <h3>IoT & Edge Computing</h3>
                    <p>Arduino, Raspberry Pi, Sensor Integration, MQTT, Real-time Analytics</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Core Values -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="CORE VALUES">CORE VALUES</h2>
            <div class="values-grid">
                <div class="value-item">
                    <div class="value-icon innovation">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                    <h3>Innovation First</h3>
                    <p>
                        Constantly exploring new technologies and methodologies to solve complex problems. 
                        I believe in pushing boundaries and creating solutions that didn't exist before, 
                        from automated EDA pipelines to predictive healthcare models.
                    </p>
                </div>
                <div class="value-item">
                    <div class="value-icon collaboration">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Collaborative Impact</h3>
                    <p>
                        Great breakthroughs happen through collaboration. I value working with diverse teams, 
                        participating in datathons, and contributing to open-source projects to amplify 
                        the impact of data science solutions.
                    </p>
                </div>
                <div class="value-item">
                    <div class="value-icon learning">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3>Continuous Growth</h3>
                    <p>
                        The field of AI and data science evolves rapidly. I'm committed to continuous learning 
                        through Kaggle competitions, research papers, and hands-on experimentation to stay 
                        at the forefront of technology.
                    </p>
                </div>
                <div class="value-item">
                    <div class="value-icon impact">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Real-World Impact</h3>
                    <p>
                        Technology should make a difference. Whether it's optimizing healthcare resource allocation 
                        or reducing data exploration time by 70%, I focus on creating solutions that solve 
                        real problems and improve lives.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section section-alt">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="LET'S COLLABORATE">LET'S COLLABORATE</h2>
            <p class="cta-description">
                Ready to tackle challenging data science problems together? Whether you have a complex dataset to analyze, 
                need predictive models built, or want to explore IoT + ML integration, I'd love to collaborate.
            </p>
            <div class="cta-buttons">
                <a href="Projects.aspx" class="btn-modern btn-primary">
                    <span>View My Projects</span>
                    <i class="fas fa-arrow-right"></i>
                </a>
                <a href="Contact.aspx" class="btn-modern btn-secondary">
                    <span>Start a Conversation</span>
                    <i class="fas fa-paper-plane"></i>
                </a>
                <a href="Skills.aspx" class="btn-modern btn-outline">
                    <span>Technical Skills</span>
                    <i class="fas fa-tools"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* About Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 2.5rem;
            max-width: 600px;
        }

        .hero-stats {
            display: flex;
            gap: 2rem;
            margin-top: 2rem;
        }

        .hero-stats .stat-item {
            text-align: center;
        }

        .hero-stats .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }

        .hero-stats .stat-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        .professional-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            padding: 2rem;
            height: 100%;
            transition: var(--transition);
        }

        .professional-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-dark);
            border-color: var(--accent-color);
        }

        .card-icon {
            width: 70px;
            height: 70px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            color: white;
        }

        .skill-highlights {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }

        .skill-tag {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        /* Technology Highlights */
        .section-subtitle {
            text-align: center;
            font-size: 1.1rem;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .highlight-link {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
            border-bottom: 1px solid rgba(0, 212, 170, 0.3);
            transition: var(--transition);
        }

        .highlight-link:hover {
            border-bottom-color: var(--accent-color);
            text-decoration: none;
        }

        .tech-highlights-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .tech-highlight {
            text-align: center;
            padding: 2rem;
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        .tech-highlight:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .tech-highlight-icon {
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

        .tech-highlight-icon.data-science {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .tech-highlight-icon.machine-learning {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
        }

        .tech-highlight-icon.web-development {
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);
        }

        .tech-highlight-icon.iot-systems {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .tech-highlight h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
            font-size: 1.2rem;
        }

        .tech-highlight p {
            color: var(--text-secondary);
            line-height: 1.6;
            margin: 0;
        }

        /* Values Grid */
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .value-item {
            text-align: center;
            padding: 2rem;
        }

        .value-icon {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2.2rem;
            color: white;
        }

        .value-icon.innovation {
            background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%);
        }

        .value-icon.collaboration {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .value-icon.learning {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .value-icon.impact {
            background: linear-gradient(135deg, #e17055 0%, #d63031 100%);
        }

        .value-item h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .value-item p {
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
            .hero-stats {
                flex-direction: column;
                gap: 1rem;
            }

            .tech-highlights-grid,
            .values-grid {
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
            // Animate cards on scroll
            const cards = document.querySelectorAll('.professional-card, .tech-highlight, .value-item');
            
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

            // Animate stats counter
            const statNumbers = document.querySelectorAll('.hero-stats .stat-number');
            statNumbers.forEach(stat => {
                const finalValue = stat.textContent;
                const numValue = parseInt(finalValue.replace('+', ''));
                let current = 0;
                const increment = numValue / 50;
                
                const timer = setInterval(() => {
                    current += increment;
                    if (current >= numValue) {
                        stat.textContent = finalValue;
                        clearInterval(timer);
                    } else {
                        stat.textContent = Math.floor(current) + '+';
                    }
                }, 30);
            });
        });
    </script>
</asp:Content>