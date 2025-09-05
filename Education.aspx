<%@ Page Title="Education" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Education.aspx.cs" Inherits="WebApplication1.Education" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Education Hero Section -->
    <div class="hero">
        <div class="container text-center">
            <h1 style="color: white; margin-bottom: 1rem;">My Education</h1>
            <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto; color: white;">
                My academic journey and continuous learning path in computer science and software development. 
                Knowledge is the foundation of innovation.
            </p>
        </div>
    </div>

    <!-- Education Overview -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">1+</div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Degrees</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-book"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">15+</div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Courses</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">5+</div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Certifications</div>
                </div>
                <div class="col-md-3 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div style="font-size: 2.5rem; font-weight: 800; background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">1000+</div>
                    <div style="color: var(--text-secondary); font-weight: 500;">Learning Hours</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Formal Education -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Formal Education</h2>
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="education-timeline">
                        <div class="education-item">
                            <div class="education-year">2022</div>
                            <div class="education-content">
                                <div class="education-institution">
                                    <h4>Bachelor of Science in Computer Science</h4>
                                    <h5>University Name</h5>
                                    <span class="education-status">Graduated</span>
                                </div>
                                <div class="education-description">
                                    <p>
                                        Comprehensive study of computer science fundamentals including data structures, 
                                        algorithms, software engineering, database systems, and web development. 
                                        Strong foundation in programming languages and system design.
                                    </p>
                                    <div class="education-highlights">
                                        <span class="highlight-tag">Data Structures & Algorithms</span>
                                        <span class="highlight-tag">Software Engineering</span>
                                        <span class="highlight-tag">Database Systems</span>
                                        <span class="highlight-tag">Web Development</span>
                                        <span class="highlight-tag">Object-Oriented Programming</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Technical Skills & Learning -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Technical Learning Path</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-code"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Programming Languages</h3>
                        </div>
                        
                        <div class="learning-list">
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>C# Programming</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 90%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>JavaScript</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 85%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>SQL</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 88%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>HTML/CSS</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 92%;"></div>
                                    </div>
                                    <span class="skill-level">Expert</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-tools"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Frameworks & Technologies</h3>
                        </div>
                        
                        <div class="learning-list">
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>ASP.NET Web Forms</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 88%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>SQL Server</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 85%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>jQuery</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 80%;"></div>
                                    </div>
                                    <span class="skill-level">Intermediate</span>
                                </div>
                            </div>
                            
                            <div class="learning-item">
                                <div class="learning-skill">
                                    <h5>Git Version Control</h5>
                                    <div class="skill-bar">
                                        <div class="skill-progress" style="width: 82%;"></div>
                                    </div>
                                    <span class="skill-level">Advanced</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Continuous Learning -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Continuous Learning</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <h4 class="card-title">Online Courses</h4>
                        <p class="card-text">
                            Regularly completing courses on platforms like Udemy, Coursera, and Microsoft Learn 
                            to stay updated with the latest technologies and best practices.
                        </p>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-book-reader"></i>
                        </div>
                        <h4 class="card-title">Technical Reading</h4>
                        <p class="card-text">
                            Keeping up with industry trends through technical blogs, documentation, 
                            and programming books to expand knowledge and skills.
                        </p>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="card text-center" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <h4 class="card-title">Hands-on Projects</h4>
                        <p class="card-text">
                            Learning through building real-world projects and experimenting 
                            with new technologies to gain practical experience.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section section-alt">
        <div class="container text-center">
            <h2 class="section-title">Ready to Learn and Grow Together?</h2>
            <p style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 3rem; max-width: 600px; margin-left: auto; margin-right: auto;">
                Education never stops. I'm always eager to learn new technologies and take on challenges 
                that push my skills to the next level.
            </p>
            <div style="display: flex; gap: 1.5rem; justify-content: center; flex-wrap: wrap;">
                <a href="Skills.aspx" class="btn btn-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-chart-bar" style="margin-right: 0.75rem;"></i>
                    View My Skills
                </a>
                <a href="Contact.aspx" class="btn btn-outline-primary" style="padding: 1.25rem 2.5rem; font-size: 1.1rem;">
                    <i class="fas fa-envelope" style="margin-right: 0.75rem;"></i>
                    Get In Touch
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Education-specific styles */
        .education-timeline {
            position: relative;
            padding: 2rem 0;
        }

        .education-item {
            display: flex;
            gap: 2rem;
            margin-bottom: 3rem;
            position: relative;
        }

        .education-year {
            background: var(--gradient-primary);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            font-weight: 700;
            font-size: 1.1rem;
            min-width: 100px;
            text-align: center;
            height: fit-content;
            box-shadow: var(--shadow-medium);
        }

        .education-content {
            flex: 1;
            background: var(--card-bg);
            padding: 2rem;
            border-radius: var(--border-radius);
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-light);
            transition: var(--transition);
        }

        .education-content:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
        }

        .education-institution h4 {
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            font-size: 1.4rem;
        }

        .education-institution h5 {
            color: var(--accent-color);
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .education-status {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .education-description {
            margin-top: 1.5rem;
        }

        .education-highlights {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .highlight-tag {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        /* Learning skills styles */
        .learning-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .learning-item {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
        }

        .learning-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .learning-skill h5 {
            color: var(--text-primary);
            margin-bottom: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
        }

        .skill-bar {
            width: 100%;
            height: 8px;
            background-color: var(--border-color);
            border-radius: 20px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .skill-progress {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 20px;
            transition: width 1.5s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .skill-level {
            background: var(--gradient-primary);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .education-item {
                flex-direction: column;
                gap: 1rem;
            }

            .education-year {
                align-self: flex-start;
                min-width: auto;
            }

            .highlight-tag {
                font-size: 0.75rem;
                padding: 0.25rem 0.6rem;
            }
        }
    </style>

    <script>
        // Add animations for skill bars
        function animateSkillBars() {
            const skillBars = document.querySelectorAll('.skill-progress');
            skillBars.forEach(bar => {
                const targetWidth = bar.style.width;
                bar.style.width = '0%';
                
                setTimeout(() => {
                    bar.style.width = targetWidth;
                }, 500);
            });
        }

        // Initialize animations
        window.addEventListener('load', function() {
            setTimeout(animateSkillBars, 1000);
        });

        // Add scroll animations
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card, .education-item');
            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        }

        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', function() {
            const elements = document.querySelectorAll('.card, .education-item');
            elements.forEach(element => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.6s ease-out';
            });
            
            setTimeout(animateOnScroll, 200);
        });
    </script>
</asp:Content>