<%@ Page Title="Admin - Manage Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminSkills.aspx.cs" Inherits="WebApplication1.AdminSkills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Skills Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Manage Skills</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Update your technical skills and proficiency levels.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminDashboard.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Coming Soon Section -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto text-center">
                    <div class="card">
                        <div style="padding: 4rem 2rem;">
                            <div style="background: var(--gradient-primary); width: 120px; height: 120px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem;">
                                <i class="fas fa-tools"></i>
                            </div>
                            
                            <h2 style="color: var(--text-primary); margin-bottom: 1.5rem;">Skills Management</h2>
                            <h3 style="color: var(--accent-color); margin-bottom: 2rem;">Coming Soon!</h3>
                            
                            <p style="color: var(--text-secondary); font-size: 1.1rem; line-height: 1.6; margin-bottom: 2rem;">
                                The Skills Management system is being developed. This feature will allow you to:
                            </p>
                            
                            <div class="row" style="margin: 2rem 0;">
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-plus"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Add Skills</strong><br />
                                            <small style="color: var(--text-secondary);">Technical and soft skills</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Proficiency Levels</strong><br />
                                            <small style="color: var(--text-secondary);">Beginner to Expert</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-layer-group"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Categories</strong><br />
                                            <small style="color: var(--text-secondary);">Frontend, Backend, Database</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Featured Skills</strong><br />
                                            <small style="color: var(--text-secondary);">Highlight top skills</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div style="background: rgba(0, 212, 170, 0.05); border: 1px solid rgba(0, 212, 170, 0.2); border-radius: var(--border-radius); padding: 1.5rem; margin: 2rem 0;">
                                <h4 style="color: var(--text-primary); margin-bottom: 1rem;">
                                    <i class="fas fa-info-circle" style="color: var(--accent-color); margin-right: 0.5rem;"></i>
                                    Current Status
                                </h4>
                                <p style="color: var(--text-secondary); margin: 0; line-height: 1.6;">
                                    You can currently view your skills on the Skills.aspx page. 
                                    The dynamic admin management system will be available soon.
                                </p>
                            </div>
                            
                            <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; margin-top: 2rem;">
                                <a href="Skills.aspx" class="btn btn-primary">
                                    <i class="fas fa-eye"></i> View Current Skills Page
                                </a>
                                <a href="AdminDashboard.aspx" class="btn btn-outline-primary">
                                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Skills Preview -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="card">
                        <h3 style="color: var(--text-primary); margin-bottom: 2rem; text-align: center;">
                            <i class="fas fa-code" style="color: var(--accent-color); margin-right: 0.5rem;"></i>
                            Future Skills Management Features
                        </h3>
                        
                        <div class="features-grid">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-code"></i>
                                </div>
                                <h4>Programming Languages</h4>
                                <p>C#, JavaScript, Python, Java</p>
                                <div class="feature-progress">
                                    <div class="progress-bar" style="width: 90%"></div>
                                </div>
                            </div>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-laptop-code"></i>
                                </div>
                                <h4>Frameworks</h4>
                                <p>ASP.NET, React, Angular, Vue.js</p>
                                <div class="feature-progress">
                                    <div class="progress-bar" style="width: 85%"></div>
                                </div>
                            </div>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-database"></i>
                                </div>
                                <h4>Databases</h4>
                                <p>SQL Server, MySQL, MongoDB</p>
                                <div class="feature-progress">
                                    <div class="progress-bar" style="width: 80%"></div>
                                </div>
                            </div>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-tools"></i>
                                </div>
                                <h4>Tools & Technologies</h4>
                                <p>Visual Studio, Git, Azure, Docker</p>
                                <div class="feature-progress">
                                    <div class="progress-bar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="text-align: center; margin-top: 2rem; padding-top: 2rem; border-top: 1px solid var(--border-color);">
                            <p style="color: var(--text-secondary); font-style: italic;">
                                Preview of how your skills will be displayed and managed through the admin panel
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Features grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 2rem 0;
        }

        .feature-item {
            text-align: center;
            padding: 1.5rem;
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        .feature-item:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .feature-icon {
            background: var(--gradient-primary);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin: 0 auto 1rem;
        }

        .feature-item h4 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.1rem;
        }

        .feature-item p {
            color: var(--text-secondary);
            margin: 0 0 1rem 0;
            font-size: 0.9rem;
        }

        .feature-progress {
            height: 6px;
            background: var(--border-color);
            border-radius: 3px;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 3px;
            transition: width 1s ease-out;
        }

        /* Card animations */
        .card {
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.6s ease-out forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .features-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .feature-item {
                padding: 1rem;
            }
        }
    </style>

    <script>
        // Add entrance animations
        document.addEventListener('DOMContentLoaded', function() {
            const featureItems = document.querySelectorAll('.feature-item');
            featureItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateY(20px)';
                item.style.transition = 'all 0.6s ease-out';
                
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, index * 100 + 500);
            });

            // Animate progress bars
            setTimeout(() => {
                const progressBars = document.querySelectorAll('.progress-bar');
                progressBars.forEach(bar => {
                    const width = bar.style.width;
                    bar.style.width = '0%';
                    setTimeout(() => {
                        bar.style.width = width;
                    }, 100);
                });
            }, 1000);
        });
    </script>
</asp:Content>