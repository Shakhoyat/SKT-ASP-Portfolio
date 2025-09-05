<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApplication1.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Dashboard Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Admin Dashboard</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Welcome back, <strong><asp:Literal ID="ltlAdminName" runat="server"></asp:Literal></strong>! 
                        Manage your portfolio content from this central dashboard.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" 
                              CssClass="btn btn-outline-light" OnClick="btnLogout_Click" 
                              style="padding: 0.75rem 1.5rem;" />
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Statistics -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Portfolio Overview</h2>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="dashboard-card">
                        <div class="dashboard-icon">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <div class="dashboard-content">
                            <h3><asp:Literal ID="ltlProjectCount" runat="server" Text="0" /></h3>
                            <p>Projects</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="dashboard-card">
                        <div class="dashboard-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <div class="dashboard-content">
                            <h3><asp:Literal ID="ltlSkillCount" runat="server" Text="0" /></h3>
                            <p>Skills</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="dashboard-card">
                        <div class="dashboard-icon">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <div class="dashboard-content">
                            <h3><asp:Literal ID="ltlAchievementCount" runat="server" Text="0" /></h3>
                            <p>Achievements</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="dashboard-card">
                        <div class="dashboard-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="dashboard-content">
                            <h3><asp:Literal ID="ltlMessageCount" runat="server" Text="0" /></h3>
                            <p>Messages</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Management Sections -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Content Management</h2>
            <div class="row">
                <!-- Projects Management -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            <div class="management-title">
                                <h3>Manage Projects</h3>
                                <p>Add, edit, and organize your portfolio projects</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="AdminProjects.aspx" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Manage Projects
                            </a>
                            <a href="AdminProjects.aspx?action=add" class="btn btn-outline-primary">
                                <i class="fas fa-plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Skills Management -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-tools"></i>
                            </div>
                            <div class="management-title">
                                <h3>Manage Skills</h3>
                                <p>Update your technical skills and proficiency levels</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="AdminSkills.aspx" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Manage Skills
                            </a>
                            <a href="AdminSkills.aspx?action=add" class="btn btn-outline-primary">
                                <i class="fas fa-plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Achievements Management -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="management-title">
                                <h3>Manage Achievements</h3>
                                <p>Add and update your professional achievements</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="AdminAchievements.aspx" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Manage Achievements
                            </a>
                            <a href="AdminAchievements.aspx?action=add" class="btn btn-outline-primary">
                                <i class="fas fa-plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Education Management -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                            <div class="management-title">
                                <h3>Manage Education</h3>
                                <p>Update your educational background and qualifications</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="AdminEducation.aspx" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Manage Education
                            </a>
                            <a href="AdminEducation.aspx?action=add" class="btn btn-outline-primary">
                                <i class="fas fa-plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Messages and System -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Messages & System</h2>
            <div class="row">
                <!-- Contact Messages -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="management-title">
                                <h3>Contact Messages</h3>
                                <p>View and respond to contact form submissions</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="AdminMessages.aspx" class="btn btn-primary">
                                <i class="fas fa-inbox"></i> View Messages
                            </a>
                            <span class="badge-count">
                                <asp:Literal ID="ltlUnreadMessages" runat="server" Text="0" />
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Database Setup -->
                <div class="col-md-6 mb-4">
                    <div class="card management-card">
                        <div class="management-header">
                            <div class="management-icon">
                                <i class="fas fa-database"></i>
                            </div>
                            <div class="management-title">
                                <h3>Database Setup</h3>
                                <p>Initialize database tables and sample data</p>
                            </div>
                        </div>
                        <div class="management-actions">
                            <a href="DatabaseSetup.aspx" class="btn btn-primary">
                                <i class="fas fa-cogs"></i> Database Setup
                            </a>
                            <span class="status-indicator">
                                <asp:Literal ID="ltlDbStatus" runat="server" Text="Ready" />
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="section">
        <div class="container">
            <h2 class="section-title">Recent Activity</h2>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="activity-log">
                            <asp:Repeater ID="rptRecentActivity" runat="server">
                                <HeaderTemplate>
                                    <div class="activity-header">
                                        <h4>Last 10 Activities</h4>
                                    </div>
                                    <div class="activity-list">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="activity-item">
                                        <div class="activity-icon">
                                            <i class="fas fa-circle"></i>
                                        </div>
                                        <div class="activity-content">
                                            <p><%# Eval("Description") %></p>
                                            <span class="activity-time"><%# Eval("Timestamp") %></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            
                            <!-- Default message when no activities -->
                            <asp:Panel ID="pnlNoActivity" runat="server" Visible="false">
                                <div class="no-activity">
                                    <i class="fas fa-info-circle"></i>
                                    <p>No recent activity found.</p>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Dashboard specific styles */
        .dashboard-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 2rem;
            border: 1px solid var(--border-color);
            transition: var(--transition);
            height: 100%;
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
        }

        .dashboard-icon {
            background: var(--gradient-primary);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            flex-shrink: 0;
        }

        .dashboard-content h3 {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0;
        }

        .dashboard-content p {
            color: var(--text-secondary);
            margin: 0;
            font-size: 0.9rem;
            font-weight: 500;
        }

        /* Management cards */
        .management-card {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 2rem;
        }

        .management-header {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .management-icon {
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

        .management-title h3 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.3rem;
        }

        .management-title p {
            color: var(--text-secondary);
            margin: 0;
            font-size: 0.9rem;
        }

        .management-actions {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: center;
        }

        .badge-count {
            background: #ef4444;
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-indicator {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        /* Activity log */
        .activity-log {
            padding: 1rem 0;
        }

        .activity-header h4 {
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
        }

        .activity-list {
            max-height: 400px;
            overflow-y: auto;
        }

        .activity-item {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-color);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            color: var(--accent-color);
            font-size: 0.5rem;
            margin-top: 0.5rem;
        }

        .activity-content p {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 0.95rem;
        }

        .activity-time {
            color: var(--text-secondary);
            font-size: 0.8rem;
        }

        .no-activity {
            text-align: center;
            padding: 3rem;
            color: var(--text-secondary);
        }

        .no-activity i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--text-muted);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .dashboard-card {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .management-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .management-actions {
                justify-content: center;
            }
        }
    </style>

    <script>
        // Dashboard enhancements
        document.addEventListener('DOMContentLoaded', function() {
            // Add loading animations
            const cards = document.querySelectorAll('.dashboard-card, .management-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease-out';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });

            // Auto-refresh dashboard every 5 minutes
            setInterval(function() {
                // In a real application, you might want to refresh certain data
                console.log('Dashboard auto-refresh triggered');
            }, 300000); // 5 minutes
        });

        // Confirm logout
        function confirmLogout() {
            return confirm('Are you sure you want to logout?');
        }

        // Add logout confirmation
        document.addEventListener('DOMContentLoaded', function() {
            const logoutBtn = document.getElementById('<%= btnLogout.ClientID %>');
            if (logoutBtn) {
                logoutBtn.addEventListener('click', function(e) {
                    if (!confirmLogout()) {
                        e.preventDefault();
                        return false;
                    }
                });
            }
        });
    </script>
</asp:Content>