<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="WebApplication1.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Skills Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="TECHNICAL SKILLS">TECHNICAL SKILLS</h1>
                <p class="hero-description">
                    A comprehensive overview of my technical expertise and proficiency levels 
                    across various programming languages, frameworks, and tools. From data science 
                    to full-stack development, here's my technology arsenal.
                </p>
                <div class="skills-overview">
                    <div class="overview-stat">
                        <div class="overview-number">25+</div>
                        <div class="overview-label">Technologies</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">8</div>
                        <div class="overview-label">Categories</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">700+</div>
                        <div class="overview-label">Problems Solved</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Programming Languages -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="PROGRAMMING">PROGRAMMING LANGUAGES</h2>
            <div class="skills-grid">
                <asp:Repeater ID="rptProgrammingLanguages" runat="server">
                    <ItemTemplate>
                        <div class="skill-card">
                            <div class="skill-header">
                                <div class="skill-icon">
                                    <i class="<%# Eval("IconClass") %>" style="color: <%# Eval("IconColor") %>;"></i>
                                </div>
                                <div class="skill-info">
                                    <h4 class="skill-name"><%# Eval("SkillName") %></h4>
                                    <span class="skill-percentage"><%# Eval("ProficiencyLevel") %>%</span>
                                </div>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: <%# Eval("ProficiencyLevel") %>%;"></div>
                            </div>
                            <p class="skill-description"><%# Eval("Description") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Frameworks & Technologies -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="FRAMEWORKS">FRAMEWORKS & TECHNOLOGIES</h2>
            <div class="framework-grid">
                <asp:Repeater ID="rptFrameworks" runat="server">
                    <ItemTemplate>
                        <div class="framework-card">
                            <div class="framework-icon">
                                <i class="<%# Eval("IconClass") %>" style="color: <%# Eval("IconColor") %>;"></i>
                            </div>
                            <h4 class="framework-name"><%# Eval("SkillName") %></h4>
                            <div class="proficiency-badge level-<%# GetProficiencyLevel(Eval("ProficiencyLevel")) %>">
                                <%# GetProficiencyText(Eval("ProficiencyLevel")) %>
                            </div>
                            <p class="framework-description"><%# Eval("Description") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Tools & Software -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="TOOLS">TOOLS & SOFTWARE</h2>
            <div class="tools-grid">
                <asp:Repeater ID="rptTools" runat="server">
                    <ItemTemplate>
                        <div class="tool-card">
                            <div class="tool-icon">
                                <i class="<%# Eval("IconClass") %>" style="color: <%# Eval("IconColor") %>;"></i>
                            </div>
                            <h5 class="tool-name"><%# Eval("SkillName") %></h5>
                            <p class="tool-description"><%# Eval("Description") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Professional Skills -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="PROFESSIONAL">PROFESSIONAL SKILLS</h2>
            <div class="professional-skills">
                <div class="professional-skill">
                    <div class="professional-icon problem-solving">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                    <h4>Problem Solving</h4>
                    <p>Analytical thinking and creative solution development through algorithmic approaches and data-driven insights.</p>
                </div>
                <div class="professional-skill">
                    <div class="professional-icon collaboration">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4>Team Collaboration</h4>
                    <p>Effective communication and teamwork in cross-functional environments, from datathons to research projects.</p>
                </div>
                <div class="professional-skill">
                    <div class="professional-icon research">
                        <i class="fas fa-search"></i>
                    </div>
                    <h4>Research & Analysis</h4>
                    <p>Deep research capabilities in machine learning, data analysis, and emerging technologies in AI and IoT.</p>
                </div>
                <div class="professional-skill">
                    <div class="professional-icon learning">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h4>Continuous Learning</h4>
                    <p>Staying updated with latest technologies through Kaggle competitions, research papers, and hands-on experimentation.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Skills Summary -->
    <div class="section">
        <div class="container">
            <div class="skills-summary">
                <div class="summary-content">
                    <h2 class="section-title-ghost" data-text="EXPERTISE">EXPERTISE SUMMARY</h2>
                    <p class="summary-description">
                        My technical expertise spans across multiple domains of software development and data science. 
                        I'm particularly strong in data science with Python, machine learning with TensorFlow/PyTorch, 
                        and full-stack development with modern web technologies.
                    </p>
                    <p class="summary-description">
                        I believe in writing clean, maintainable code and following industry best practices. 
                        My experience includes working on everything from automated EDA pipelines to complex 
                        IoT systems integrated with machine learning models.
                    </p>
                    <div class="summary-highlights">
                        <div class="highlight-item">
                            <i class="fas fa-chart-line"></i>
                            <span>Data Science & Analytics</span>
                        </div>
                        <div class="highlight-item">
                            <i class="fas fa-brain"></i>
                            <span>Machine Learning & AI</span>
                        </div>
                        <div class="highlight-item">
                            <i class="fas fa-code"></i>
                            <span>Full-Stack Development</span>
                        </div>
                        <div class="highlight-item">
                            <i class="fas fa-microchip"></i>
                            <span>IoT & Edge Computing</span>
                        </div>
                    </div>
                </div>
                <div class="summary-stats">
                    <div class="stat-card">
                        <div class="stat-number">
                            <asp:Literal ID="ltlExperienceYears" runat="server" Text="3+" />
                        </div>
                        <div class="stat-label">Years Experience</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Active Projects</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">60+</div>
                        <div class="stat-label">Kaggle Medals</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section section-alt">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="LET'S BUILD">LET'S BUILD TOGETHER</h2>
            <p class="cta-description">
                Interested in working together? Whether you need data analysis, machine learning models, 
                or full-stack development, I'm always open to discussing new opportunities and challenging projects.
            </p>
            <div class="cta-buttons">
                <a href="Projects.aspx" class="btn-modern btn-primary">
                    <span>View My Projects</span>
                    <i class="fas fa-arrow-right"></i>
                </a>
                <a href="Contact.aspx" class="btn-modern btn-secondary">
                    <span>Get In Touch</span>
                    <i class="fas fa-paper-plane"></i>
                </a>
                <a href="About.aspx" class="btn-modern btn-outline">
                    <span>About Me</span>
                    <i class="fas fa-user"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Skills Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .skills-overview {
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

        /* Skills Grid */
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .skill-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            transition: var(--transition);
        }

        .skill-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .skill-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .skill-icon {
            width: 50px;
            height: 50px;
            background: rgba(0, 212, 170, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
        }

        .skill-info {
            flex: 1;
        }

        .skill-name {
            margin: 0 0 0.5rem 0;
            color: var(--text-primary);
            font-size: 1.2rem;
        }

        .skill-percentage {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .skill-bar {
            width: 100%;
            height: 8px;
            background: var(--border-color);
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 1rem;
        }

        .skill-progress {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 4px;
            transition: width 1.5s ease-out;
        }

        .skill-description {
            color: var(--text-secondary);
            line-height: 1.6;
            margin: 0;
        }

        /* Framework Grid */
        .framework-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .framework-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .framework-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .framework-icon {
            width: 70px;
            height: 70px;
            background: rgba(0, 212, 170, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
        }

        .framework-name {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .proficiency-badge {
            display: inline-block;
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .proficiency-badge.level-expert {
            background: rgba(0, 184, 148, 0.2);
            color: #00b894;
            border: 1px solid rgba(0, 184, 148, 0.3);
        }

        .proficiency-badge.level-advanced {
            background: rgba(0, 212, 170, 0.2);
            color: var(--accent-color);
            border: 1px solid rgba(0, 212, 170, 0.3);
        }

        .proficiency-badge.level-intermediate {
            background: rgba(253, 203, 110, 0.2);
            color: #fdcb6e;
            border: 1px solid rgba(253, 203, 110, 0.3);
        }

        .framework-description {
            color: var(--text-secondary);
            line-height: 1.6;
            margin: 0;
        }

        /* Tools Grid */
        .tools-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 3rem;
        }

        .tool-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            text-align: center;
            transition: var(--transition);
        }

        .tool-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-light);
            border-color: var(--accent-color);
        }

        .tool-icon {
            width: 50px;
            height: 50px;
            background: rgba(0, 212, 170, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.2rem;
        }

        .tool-name {
            margin-bottom: 0.75rem;
            color: var(--text-primary);
        }

        .tool-description {
            color: var(--text-secondary);
            font-size: 0.9rem;
            line-height: 1.5;
            margin: 0;
        }

        /* Professional Skills */
        .professional-skills {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .professional-skill {
            text-align: center;
            padding: 2rem;
        }

        .professional-icon {
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

        .professional-icon.problem-solving {
            background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%);
        }

        .professional-icon.collaboration {
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
        }

        .professional-icon.research {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .professional-icon.learning {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .professional-skill h4 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .professional-skill p {
            color: var(--text-secondary);
            line-height: 1.6;
            margin: 0;
        }

        /* Skills Summary */
        .skills-summary {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 4rem;
            align-items: center;
            margin-top: 3rem;
        }

        .summary-description {
            color: var(--text-secondary);
            line-height: 1.7;
            margin-bottom: 1.5rem;
        }

        .summary-highlights {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 2rem;
        }

        .highlight-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: var(--text-secondary);
        }

        .highlight-item i {
            color: var(--accent-color);
            font-size: 1.2rem;
        }

        .summary-stats {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
        }

        .stat-card .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }

        .stat-card .stat-label {
            color: var(--text-secondary);
            font-weight: 500;
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
            .skills-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .skills-grid,
            .framework-grid,
            .tools-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .skills-summary {
                grid-template-columns: 1fr;
                gap: 2rem;
                text-align: center;
            }

            .summary-highlights {
                grid-template-columns: 1fr;
            }

            .summary-stats {
                flex-direction: row;
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
            // Animate skill bars
            const skillBars = document.querySelectorAll('.skill-progress');
            const observerOptions = {
                threshold: 0.5,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.width = entry.target.style.width;
                        observer.unobserve(entry.target);
                    }
                });
            }, observerOptions);

            skillBars.forEach(bar => {
                const originalWidth = bar.style.width;
                bar.style.width = '0%';
                observer.observe(bar);
                
                // Set the width after a delay for animation
                setTimeout(() => {
                    bar.style.width = originalWidth;
                }, 100);
            });

            // Animate cards on scroll
            const cards = document.querySelectorAll('.skill-card, .framework-card, .tool-card, .professional-skill, .stat-card');
            
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

            // Animate counter numbers
            const statNumbers = document.querySelectorAll('.overview-number, .stat-card .stat-number');
            statNumbers.forEach(stat => {
                const finalValue = stat.textContent;
                const numValue = parseInt(finalValue.replace('+', ''));
                if (!isNaN(numValue)) {
                    let current = 0;
                    const increment = numValue / 50;
                    
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= numValue) {
                            stat.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            stat.textContent = Math.floor(current) + (finalValue.includes('+') ? '+' : '');
                        }
                    }, 30);
                }
            });
        });
    </script>
</asp:Content>