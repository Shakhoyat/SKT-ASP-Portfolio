<%@ Page Title="Achievements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="WebApplication1.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Achievements Hero Section -->
    <div class="hero">
        <div class="container text-center">
            <h1 style="color: white; margin-bottom: 1rem;">My Achievements</h1>
            <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto; color: white;">
                A collection of my professional accomplishments, certifications, and milestones 
                that showcase my growth and expertise in software development.
            </p>
        </div>
    </div>

    <!-- Achievement Stats -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                        <asp:Literal ID="ltlTotalAchievements" runat="server" Text="8+" />
                    </div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Total Achievements</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                        <asp:Literal ID="ltlCertifications" runat="server" Text="5+" />
                    </div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Certifications</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-award"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                        <asp:Literal ID="ltlAwards" runat="server" Text="3+" />
                    </div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Awards</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                        <asp:Literal ID="ltlEducation" runat="server" Text="1+" />
                    </div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Degrees</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Achievement Categories -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Achievement Categories</h2>
            <div class="row">
                <!-- Technical Certifications -->
                <div class="col-md-6 mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-certificate"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Technical Certifications</h3>
                        </div>
                        
                        <div class="achievement-list">
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fab fa-microsoft"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Microsoft ASP.NET Development</h5>
                                    <p>Comprehensive certification in ASP.NET Web Forms and C# programming</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-database"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>SQL Server Database Administration</h5>
                                    <p>Advanced skills in SQL Server management and optimization</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fab fa-js-square"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>JavaScript & Web Development</h5>
                                    <p>Modern JavaScript frameworks and responsive web design</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Project Achievements -->
                <div class="col-md-6 mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Project Achievements</h3>
                        </div>
                        
                        <div class="achievement-list">
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>E-Commerce Platform Success</h5>
                                    <p>Built comprehensive e-commerce solution with payment integration</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-tasks"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Task Management System</h5>
                                    <p>Developed collaborative project management application</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Finance Tracker Application</h5>
                                    <p>Created personal finance management tool with data visualization</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Professional Achievements -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Professional Milestones</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h4 class="card-title">Clean Code Advocate</h4>
                        <p class="card-text">
                            Consistently writes maintainable, well-documented code following 
                            industry best practices and design patterns.
                        </p>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4 class="card-title">Team Collaboration</h4>
                        <p class="card-text">
                            Excellent track record of working effectively in team environments 
                            and mentoring junior developers.
                        </p>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-rocket"></i>
                        </div>
                        <h4 class="card-title">Innovation Focus</h4>
                        <p class="card-text">
                            Continuously learning new technologies and implementing 
                            innovative solutions to complex problems.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Academic Achievements -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Academic Excellence</h2>
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Education & Learning</h3>
                        </div>
                        
                        <div class="achievement-list">
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-university"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Computer Science Degree</h5>
                                    <p>Strong foundation in computer science principles, algorithms, and software engineering</p>
                                    <span class="achievement-date">2022</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-book-open"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Continuous Learning</h5>
                                    <p>Completed multiple online courses and certifications in modern web development</p>
                                    <span class="achievement-date">Ongoing</span>
                                </div>
                            </div>
                            
                            <div class="achievement-item">
                                <div class="achievement-icon">
                                    <i class="fas fa-lightbulb"></i>
                                </div>
                                <div class="achievement-content">
                                    <h5>Problem Solving Skills</h5>
                                    <p>Excellent analytical and problem-solving abilities with attention to detail</p>
                                    <span class="achievement-date">2023</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section section-alt">
        <div class="container text-center">
            <h2 class="section-title">Ready to Achieve More Together?</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                These achievements represent my commitment to excellence and continuous growth. 
                Let's work together to achieve great things for your next project.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Contact.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-handshake" style="margin-right: 0.75rem;"></i>
                    Start a Project
                </a>
                <a href="Projects.aspx" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-folder-open" style="margin-right: 0.75rem;"></i>
                    View My Work
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Achievement-specific styles */
        .achievement-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .achievement-item {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            padding: 1rem;
            border-radius: 8px;
            background: rgba(0, 212, 170, 0.05);
            border: 1px solid rgba(0, 212, 170, 0.1);
            transition: var(--transition);
        }

        .achievement-item:hover {
            background: rgba(0, 212, 170, 0.1);
            border-color: rgba(0, 212, 170, 0.2);
            transform: translateX(5px);
        }

        .achievement-icon {
            background: var(--gradient-primary);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .achievement-content {
            flex: 1;
        }

        .achievement-content h5 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-weight: 600;
            font-size: 1.1rem;
        }

        .achievement-content p {
            color: var(--text-secondary);
            margin: 0 0 0.5rem 0;
            line-height: 1.5;
            font-size: 0.95rem;
        }

        .achievement-date {
            background: var(--gradient-primary);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        /* Animation effects */
        .achievement-item {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards;
        }

        .achievement-item:nth-child(1) { animation-delay: 0.1s; }
        .achievement-item:nth-child(2) { animation-delay: 0.2s; }
        .achievement-item:nth-child(3) { animation-delay: 0.3s; }
        .achievement-item:nth-child(4) { animation-delay: 0.4s; }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .achievement-item {
                flex-direction: column;
                text-align: center;
            }

            .achievement-icon {
                margin: 0 auto;
            }
        }
    </style>

    <script>
        // Add scroll animations
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card, .achievement-item');
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
            // Set initial state for cards
            const cards = document.querySelectorAll('.card:not(.achievement-item)');
            cards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease-out';
            });
            
            // Trigger initial animation
            setTimeout(animateOnScroll, 200);
        });
    </script>
</asp:Content>