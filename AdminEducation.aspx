<%@ Page Title="Admin - Manage Education" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminEducation.aspx.cs" Inherits="WebApplication1.AdminEducation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Education Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Manage Education</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add and manage your educational background and qualifications.
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
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                            
                            <h2 style="color: var(--text-primary); margin-bottom: 1.5rem;">Education Management</h2>
                            <h3 style="color: var(--accent-color); margin-bottom: 2rem;">Coming Soon!</h3>
                            
                            <p style="color: var(--text-secondary); font-size: 1.1rem; line-height: 1.6; margin-bottom: 2rem;">
                                The Education Management system is currently under development. This feature will allow you to:
                            </p>
                            
                            <div class="row" style="margin: 2rem 0;">
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-university"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Add Degrees</strong><br />
                                            <small style="color: var(--text-secondary);">Bachelor's, Master's, PhD</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-certificate"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Certifications</strong><br />
                                            <small style="color: var(--text-secondary);">Professional certificates</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-laptop-code"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Courses</strong><br />
                                            <small style="color: var(--text-secondary);">Online and offline courses</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div style="display: flex; align-items: center; gap: 1rem; text-align: left;">
                                        <div style="background: rgba(0, 212, 170, 0.1); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--accent-color); font-size: 1.2rem;">
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                        <div>
                                            <strong style="color: var(--text-primary);">Timeline</strong><br />
                                            <small style="color: var(--text-secondary);">Educational timeline</small>
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
                                    You can currently manage your education information through the static Education.aspx page. 
                                    The dynamic admin management system will be available in the next update.
                                </p>
                            </div>
                            
                            <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; margin-top: 2rem;">
                                <a href="Education.aspx" class="btn btn-primary">
                                    <i class="fas fa-eye"></i> View Current Education Page
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
    
    <!-- Development Progress -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="card">
                        <h3 style="color: var(--text-primary); margin-bottom: 2rem; text-align: center;">
                            <i class="fas fa-code-branch" style="color: var(--accent-color); margin-right: 0.5rem;"></i>
                            Development Roadmap
                        </h3>
                        
                        <div class="timeline">
                            <div class="timeline-item completed">
                                <div class="timeline-marker">
                                    <i class="fas fa-check"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Admin Authentication System</h4>
                                    <p>Secure login and session management</p>
                                    <span class="timeline-status completed">Completed</span>
                                </div>
                            </div>
                            
                            <div class="timeline-item completed">
                                <div class="timeline-marker">
                                    <i class="fas fa-check"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Projects Management</h4>
                                    <p>Full CRUD operations for portfolio projects</p>
                                    <span class="timeline-status completed">Completed</span>
                                </div>
                            </div>
                            
                            <div class="timeline-item completed">
                                <div class="timeline-marker">
                                    <i class="fas fa-check"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Contact Messages</h4>
                                    <p>Manage and respond to contact form submissions</p>
                                    <span class="timeline-status completed">Completed</span>
                                </div>
                            </div>
                            
                            <div class="timeline-item current">
                                <div class="timeline-marker">
                                    <i class="fas fa-cogs"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Education Management</h4>
                                    <p>Add and manage educational background</p>
                                    <span class="timeline-status current">In Development</span>
                                </div>
                            </div>
                            
                            <div class="timeline-item upcoming">
                                <div class="timeline-marker">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Skills Management</h4>
                                    <p>Dynamic skills and proficiency management</p>
                                    <span class="timeline-status upcoming">Upcoming</span>
                                </div>
                            </div>
                            
                            <div class="timeline-item upcoming">
                                <div class="timeline-marker">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="timeline-content">
                                    <h4>Achievements Management</h4>
                                    <p>Track and display professional achievements</p>
                                    <span class="timeline-status upcoming">Upcoming</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Timeline styles */
        .timeline {
            position: relative;
            padding: 2rem 0;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 30px;
            top: 0;
            bottom: 0;
            width: 2px;
            background: var(--border-color);
        }

        .timeline-item {
            position: relative;
            margin: 0 0 2rem 0;
            padding-left: 80px;
        }

        .timeline-marker {
            position: absolute;
            left: 18px;
            top: 0;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .timeline-item.completed .timeline-marker {
            background: var(--accent-color);
            color: white;
        }

        .timeline-item.current .timeline-marker {
            background: #ffc107;
            color: #333;
        }

        .timeline-item.upcoming .timeline-marker {
            background: var(--text-muted);
            color: white;
        }

        .timeline-content h4 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.1rem;
        }

        .timeline-content p {
            color: var(--text-secondary);
            margin: 0 0 0.5rem 0;
            font-size: 0.9rem;
        }

        .timeline-status {
            font-size: 0.8rem;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-weight: 600;
        }

        .timeline-status.completed {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
        }

        .timeline-status.current {
            background: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }

        .timeline-status.upcoming {
            background: rgba(108, 117, 125, 0.1);
            color: var(--text-muted);
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
            .timeline::before {
                left: 20px;
            }

            .timeline-marker {
                left: 8px;
            }

            .timeline-item {
                padding-left: 60px;
            }
        }
    </style>

    <script>
        // Add entrance animations
        document.addEventListener('DOMContentLoaded', function() {
            const timelineItems = document.querySelectorAll('.timeline-item');
            timelineItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateX(-20px)';
                item.style.transition = 'all 0.6s ease-out';
                item.style.animationDelay = `${index * 0.1}s`;
                
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateX(0)';
                }, index * 100 + 500);
            });
        });
    </script>
</asp:Content>