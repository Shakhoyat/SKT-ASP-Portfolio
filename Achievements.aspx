<%@ Page Title="Achievements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="WebApplication1.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Achievements Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="ACHIEVEMENTS">MY ACHIEVEMENTS</h1>
                <p class="hero-description">
                    A showcase of my professional accomplishments, certifications, research contributions, and milestones 
                    that demonstrate my expertise in data science, machine learning, and innovative technology solutions. 
                    Each achievement represents dedication, growth, and impact in the tech community.
                </p>
                <div class="achievements-overview">
                    <div class="overview-stat">
                        <div class="overview-number">60+</div>
                        <div class="overview-label">Kaggle Medals</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">12+</div>
                        <div class="overview-label">Hackathon Wins</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">5+</div>
                        <div class="overview-label">Research Papers</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Competitive Programming & Data Science -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="COMPETITIVE">COMPETITIVE EXCELLENCE</h2>
            <div class="achievements-grid">
                <div class="achievement-card competitive">
                    <div class="achievement-icon kaggle">
                        <i class="fab fa-kaggle"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>Kaggle Expert</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Data Science</span>
                            <span class="achievement-date">2023-Present</span>
                        </div>
                        <p class="achievement-description">
                            Achieved expert status on Kaggle through consistent participation in data science competitions. 
                            Earned 60+ medals across various machine learning challenges including tabular data, 
                            computer vision, and NLP competitions.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">60+</span>
                                <span class="stat-label">Total Medals</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">Top 5%</span>
                                <span class="stat-label">Ranking</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Machine Learning</span>
                            <span class="skill-tag">Deep Learning</span>
                            <span class="skill-tag">Feature Engineering</span>
                            <span class="skill-tag">Ensemble Methods</span>
                        </div>
                    </div>
                </div>

                <div class="achievement-card programming">
                    <div class="achievement-icon codeforces">
                        <i class="fas fa-code"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>700+ Problems Solved</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Algorithms</span>
                            <span class="achievement-date">2020-Present</span>
                        </div>
                        <p class="achievement-description">
                            Solved over 700 programming problems across platforms like Codeforces, developing strong 
                            algorithmic thinking and optimization skills. This foundation became crucial for transitioning 
                            into data science and machine learning.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">700+</span>
                                <span class="stat-label">Problems</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">4+</span>
                                <span class="stat-label">Platforms</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Algorithms</span>
                            <span class="skill-tag">Data Structures</span>
                            <span class="skill-tag">Optimization</span>
                            <span class="skill-tag">Problem Solving</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Research & Innovation -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="RESEARCH">RESEARCH & INNOVATION</h2>
            <div class="achievements-grid">
                <div class="achievement-card research">
                    <div class="achievement-icon research-icon">
                        <i class="fas fa-microscope"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>Research Publications</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Academic</span>
                            <span class="achievement-date">2023-Present</span>
                        </div>
                        <p class="achievement-description">
                            Published research papers in machine learning and IoT domains, contributing to the academic 
                            community with innovative solutions and novel approaches to complex problems in data science 
                            and edge computing.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">5+</span>
                                <span class="stat-label">Papers</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">3</span>
                                <span class="stat-label">Conferences</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Research</span>
                            <span class="skill-tag">IoT Systems</span>
                            <span class="skill-tag">Machine Learning</span>
                            <span class="skill-tag">Data Analysis</span>
                        </div>
                    </div>
                </div>

                <div class="achievement-card innovation">
                    <div class="achievement-icon innovation-icon">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>Automated EDA Platform</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Innovation</span>
                            <span class="achievement-date">2023</span>
                        </div>
                        <p class="achievement-description">
                            Developed an automated exploratory data analysis platform that reduces data exploration time 
                            by 70%. This innovation has been adopted by multiple data science teams and significantly 
                            improved productivity in data analysis workflows.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">70%</span>
                                <span class="stat-label">Time Saved</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">50+</span>
                                <span class="stat-label">Visualizations</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Python</span>
                            <span class="skill-tag">Streamlit</span>
                            <span class="skill-tag">Data Visualization</span>
                            <span class="skill-tag">Automation</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hackathons & Competitions -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="COMPETITIONS">HACKATHONS & COMPETITIONS</h2>
            <div class="achievements-grid">
                <div class="achievement-card hackathon">
                    <div class="achievement-icon hackathon-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>National Hackathon Winner</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Competition</span>
                            <span class="achievement-date">2023</span>
                        </div>
                        <p class="achievement-description">
                            Won multiple national and international hackathons with innovative solutions in healthcare AI, 
                            IoT systems, and data analytics. Led cross-functional teams to develop prototype solutions 
                            within 48-hour timeframes.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">12+</span>
                                <span class="stat-label">Wins</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">1st</span>
                                <span class="stat-label">Place</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Team Leadership</span>
                            <span class="skill-tag">Rapid Prototyping</span>
                            <span class="skill-tag">Healthcare AI</span>
                            <span class="skill-tag">IoT Solutions</span>
                        </div>
                    </div>
                </div>

                <div class="achievement-card datathon">
                    <div class="achievement-icon datathon-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="achievement-content">
                        <h3>Datathon Excellence</h3>
                        <div class="achievement-meta">
                            <span class="achievement-category">Data Science</span>
                            <span class="achievement-date">2022-Present</span>
                        </div>
                        <p class="achievement-description">
                            Active participant in datathons across the country, tackling complex challenges in deep learning, 
                            NLP, and computer vision. Consistently ranked in top percentiles with innovative approaches to 
                            data science problems.
                        </p>
                        <div class="achievement-stats">
                            <div class="stat">
                                <span class="stat-number">15+</span>
                                <span class="stat-label">Events</span>
                            </div>
                            <div class="stat">
                                <span class="stat-number">Top 10%</span>
                                <span class="stat-label">Ranking</span>
                            </div>
                        </div>
                        <div class="achievement-skills">
                            <span class="skill-tag">Deep Learning</span>
                            <span class="skill-tag">Computer Vision</span>
                            <span class="skill-tag">NLP</span>
                            <span class="skill-tag">Time Pressure</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Recognition -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="RECOGNITION">PROFESSIONAL RECOGNITION</h2>
            <div class="recognition-grid">
                <div class="recognition-item">
                    <div class="recognition-icon excellence">
                        <i class="fas fa-award"></i>
                    </div>
                    <h3>Academic Excellence</h3>
                    <p>
                        Recognized for outstanding academic performance in Computer Science Engineering at KUET 
                        with focus on emerging technologies and research contributions.
                    </p>
                </div>

                <div class="recognition-item">
                    <div class="recognition-icon leadership">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Team Leadership</h3>
                    <p>
                        Successfully led multiple project teams in hackathons and research initiatives, 
                        demonstrating strong collaborative and mentorship skills.
                    </p>
                </div>

                <div class="recognition-item">
                    <div class="recognition-icon innovation">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h3>Innovation Award</h3>
                    <p>
                        Received recognition for innovative approaches to data science problems and 
                        development of tools that significantly improve workflow efficiency.
                    </p>
                </div>

                <div class="recognition-item">
                    <div class="recognition-icon community">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h3>Community Impact</h3>
                    <p>
                        Active contributor to open-source projects and data science community with 
                        significant impact through shared knowledge and collaborative solutions.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="ACHIEVE MORE">LET'S ACHIEVE MORE</h2>
            <p class="cta-description">
                These achievements represent my journey of continuous learning and innovation. Ready to collaborate 
                on groundbreaking projects? Let's combine our expertise to create solutions that make a real impact.
            </p>
            <div class="cta-buttons">
                <a href="Projects.aspx" class="btn-modern btn-primary">
                    <span>View My Projects</span>
                    <i class="fas fa-folder-open"></i>
                </a>
                <a href="Contact.aspx" class="btn-modern btn-secondary">
                    <span>Start Collaboration</span>
                    <i class="fas fa-handshake"></i>
                </a>
                <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="btn-modern btn-outline">
                    <span>Kaggle Profile</span>
                    <i class="fab fa-kaggle"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Achievements Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .achievements-overview {
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

        /* Achievements Grid */
        .achievements-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .achievement-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .achievement-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
            opacity: 0;
            transition: var(--transition);
        }

        .achievement-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-dark);
            border-color: var(--accent-color);
        }

        .achievement-card:hover::before {
            opacity: 1;
        }

        .achievement-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 2rem;
            font-size: 2.2rem;
            color: white;
        }

        .achievement-icon.kaggle {
            background: linear-gradient(135deg, #20beff 0%, #1a9ce8 100%);
        }

        .achievement-icon.codeforces {
            background: linear-gradient(135deg, #1976d2 0%, #1565c0 100%);
        }

        .achievement-icon.research-icon {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .achievement-icon.innovation-icon {
            background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%);
        }

        .achievement-icon.hackathon-icon {
            background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
        }

        .achievement-icon.datathon-icon {
            background: linear-gradient(135deg, #FF6B6B 0%, #4ECDC4 100%);
        }

        .achievement-content h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
            font-size: 1.4rem;
        }

        .achievement-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .achievement-category {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .achievement-date {
            background: var(--border-color);
            color: var(--text-muted);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .achievement-description {
            color: var(--text-secondary);
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .achievement-stats {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .stat {
            text-align: center;
        }

        .stat-number {
            display: block;
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.8rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        .achievement-skills {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
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

        /* Recognition Grid */
        .recognition-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .recognition-item {
            text-align: center;
            padding: 2rem;
        }

        .recognition-icon {
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

        .recognition-icon.excellence {
            background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
        }

        .recognition-icon.leadership {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .recognition-icon.innovation {
            background: linear-gradient(135deg, #e17055 0%, #d63031 100%);
        }

        .recognition-icon.community {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .recognition-item h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .recognition-item p {
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
            .achievements-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .achievements-grid,
            .recognition-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .achievement-stats {
                justify-content: center;
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
            const cards = document.querySelectorAll('.achievement-card, .recognition-item');
            
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
            const numbers = document.querySelectorAll('.overview-number, .stat-number');
            numbers.forEach(num => {
                const finalValue = num.textContent;
                const numValue = parseInt(finalValue.replace(/[^\d]/g, ''));
                
                if (!isNaN(numValue) && numValue > 0) {
                    let current = 0;
                    const increment = numValue / 50;
                    
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= numValue) {
                            num.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            const currentNum = Math.floor(current);
                            if (finalValue.includes('+')) {
                                num.textContent = currentNum + '+';
                            } else if (finalValue.includes('%')) {
                                num.textContent = currentNum + '%';
                            } else {
                                num.textContent = currentNum;
                            }
                        }
                    }, 30);
                }
            });

            // Add hover effects for achievement cards
            const achievementCards = document.querySelectorAll('.achievement-card');
            achievementCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-12px) scale(1.02)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-8px) scale(1)';
                });
            });
        });
    </script>
</asp:Content>