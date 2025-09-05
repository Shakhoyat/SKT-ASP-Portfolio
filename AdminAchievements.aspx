<%@ Page Title="Admin - Manage Achievements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAchievements.aspx.cs" Inherits="WebApplication1.AdminAchievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Achievements Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Manage Achievements</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add and update your professional achievements and milestones.
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

    <!-- Achievements Management -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Professional Achievements</h2>
                            <div class="admin-actions">
                                <asp:Button ID="btnAddAchievement" runat="server" Text="Add New Achievement" 
                                          CssClass="btn btn-primary" OnClick="btnAddAchievement_Click" 
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <asp:Button ID="btnRefreshAchievements" runat="server" Text="Refresh" 
                                          CssClass="btn btn-outline-primary" OnClick="btnRefreshAchievements_Click"
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <!-- Debug: Direct link for testing -->
                                <a href="AdminAchievementForm.aspx" class="btn btn-outline-secondary" style="font-size: 0.8rem;">
                                    <i class="fas fa-external-link-alt"></i> Direct Link
                                </a>
                            </div>
                        </div>

                        <!-- Achievements Grid -->
                        <div class="admin-content">
                            <asp:GridView ID="gvAchievements" runat="server" 
                                        AutoGenerateColumns="false" 
                                        CssClass="admin-grid"
                                        OnRowCommand="gvAchievements_RowCommand"
                                        OnRowDataBound="gvAchievements_RowDataBound"
                                        DataKeyNames="AchievementId">
                                <Columns>
                                    <asp:TemplateField HeaderText="Achievement">
                                        <ItemTemplate>
                                            <div class="achievement-info">
                                                <div class="achievement-icon <%# GetAchievementClass(Eval("Type").ToString()) %>">
                                                    <i class="<%# GetAchievementIcon(Eval("Type").ToString()) %>"></i>
                                                </div>
                                                <div class="achievement-details">
                                                    <h4><%# Eval("Title") %></h4>
                                                    <span class="achievement-type"><%# Eval("Type") %></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <div class="achievement-description">
                                                <%# Eval("Description") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Date & Organization">
                                        <ItemTemplate>
                                            <div class="achievement-meta">
                                                <div class="meta-item">
                                                    <i class="fas fa-calendar"></i>
                                                    <%# Eval("AchievementDate", "{0:MMM yyyy}") %>
                                                </div>
                                                <div class="meta-item">
                                                    <i class="fas fa-building"></i>
                                                    <%# Eval("Organization") %>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnEditAchievement" runat="server" 
                                                              CommandName="EditAchievement" 
                                                              CommandArgument='<%# Eval("AchievementId") %>'
                                                              CssClass="btn btn-sm btn-outline-primary"
                                                              ToolTip="Edit Achievement">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnToggleAchievementStatus" runat="server" 
                                                              CommandName="ToggleStatus" 
                                                              CommandArgument='<%# Eval("AchievementId") %>'
                                                              CssClass='<%# "btn btn-sm " + ((bool)Eval("IsActive") ? "btn-warning" : "btn-success") %>'
                                                              ToolTip='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'>
                                                    <i class='<%# "fas " + ((bool)Eval("IsActive") ? "fa-pause" : "fa-play") %>'></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnDeleteAchievement" runat="server" 
                                                              CommandName="DeleteAchievement" 
                                                              CommandArgument='<%# Eval("AchievementId") %>'
                                                              CssClass="btn btn-sm btn-danger"
                                                              ToolTip="Delete Achievement"
                                                              OnClientClick="return confirm('Are you sure you want to delete this achievement?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">
                                        <i class="fas fa-trophy fa-3x"></i>
                                        <h3>No Achievements Found</h3>
                                        <p>Start by adding your first achievement to showcase your accomplishments.</p>
                                        <asp:Button ID="btnAddFirstAchievement" runat="server" Text="Add Your First Achievement" 
                                                  CssClass="btn btn-primary" OnClick="btnAddAchievement_Click" 
                                                  CausesValidation="false" UseSubmitBehavior="true" />
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Success/Error Messages -->
    <asp:Panel ID="pnlMessages" runat="server" Visible="false">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                        <i class="fas fa-check-circle"></i>
                        <asp:Literal ID="ltlSuccessMessage" runat="server"></asp:Literal>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                        <i class="fas fa-exclamation-circle"></i>
                        <asp:Literal ID="ltlErrorMessage" runat="server"></asp:Literal>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Admin Achievements specific styles */
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-color);
        }

        .admin-header h2 {
            color: var(--text-primary);
            margin: 0;
            font-size: 1.8rem;
        }

        .admin-actions {
            display: flex;
            gap: 1rem;
        }

        .admin-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .admin-grid th {
            background: var(--secondary-bg);
            color: var(--text-primary);
            padding: 1rem;
            text-align: left;
            border-bottom: 2px solid var(--border-color);
            font-weight: 600;
        }

        .admin-grid td {
            padding: 1.5rem 1rem;
            border-bottom: 1px solid var(--border-color);
            vertical-align: top;
        }

        .admin-grid tr:hover {
            background: rgba(0, 212, 170, 0.05);
        }

        /* Achievement info */
        .achievement-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .achievement-icon {
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

        .achievement-icon.gold {
            background: linear-gradient(135deg, #ffd700 0%, #ffed4e 100%);
            box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
        }

        .achievement-icon.silver {
            background: linear-gradient(135deg, #c0c0c0 0%, #e8e8e8 100%);
            box-shadow: 0 4px 15px rgba(192, 192, 192, 0.3);
        }

        .achievement-icon.bronze {
            background: linear-gradient(135deg, #cd7f32 0%, #d4af37 100%);
            box-shadow: 0 4px 15px rgba(205, 127, 50, 0.3);
        }

        .achievement-icon.special {
            background: var(--gradient-primary);
            box-shadow: 0 4px 15px rgba(0, 212, 170, 0.3);
        }

        .achievement-details h4 {
            color: var(--text-primary);
            margin: 0 0 0.25rem 0;
            font-size: 1.1rem;
        }

        .achievement-type {
            color: var(--text-secondary);
            font-size: 0.85rem;
            background: rgba(0, 212, 170, 0.1);
            padding: 0.25rem 0.5rem;
            border-radius: 12px;
        }

        /* Achievement description */
        .achievement-description {
            color: var(--text-secondary);
            font-size: 0.9rem;
            line-height: 1.5;
            max-width: 300px;
        }

        /* Achievement meta */
        .achievement-meta {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .meta-item {
            color: var(--text-muted);
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .meta-item i {
            color: var(--accent-color);
        }

        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .btn-sm {
            padding: 0.5rem 0.75rem;
            font-size: 0.8rem;
            border-radius: 6px;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-secondary);
        }

        .empty-state i {
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .empty-state h3 {
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        /* Alert styles */
        .alert {
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            margin-bottom: 2rem;
            font-weight: 500;
        }

        .alert i {
            margin-right: 0.5rem;
        }

        .alert-success {
            background: rgba(0, 184, 148, 0.1);
            color: var(--accent-color);
            border: 1px solid rgba(0, 184, 148, 0.3);
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .admin-header {
                flex-direction: column;
                gap: 1rem;
                align-items: stretch;
            }

            .admin-actions {
                justify-content: center;
            }

            .admin-grid {
                font-size: 0.9rem;
            }

            .admin-grid th,
            .admin-grid td {
                padding: 0.75rem 0.5rem;
            }

            .achievement-info {
                flex-direction: column;
                text-align: center;
                gap: 0.5rem;
            }

            .action-buttons {
                justify-content: center;
            }
        }
    </style>

    <script>
        // Admin Achievements enhancements
        document.addEventListener('DOMContentLoaded', function() {
            // Auto-hide success/error messages
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                if (alert.style.display !== 'none') {
                    setTimeout(() => {
                        alert.style.opacity = '0';
                        alert.style.transform = 'translateY(-10px)';
                        setTimeout(() => {
                            alert.style.display = 'none';
                        }, 300);
                    }, 5000);
                }
            });

            // Add loading state to buttons (but exclude server-side buttons)
            const clientButtons = document.querySelectorAll('.btn:not([id*="btn"])');
            clientButtons.forEach(button => {
                button.addEventListener('click', function() {
                    if (!this.disabled && !this.classList.contains('btn-danger')) {
                        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Loading...';
                        this.disabled = true;
                    }
                });
            });

            // Add sparkle effect to gold achievements
            const goldIcons = document.querySelectorAll('.achievement-icon.gold');
            goldIcons.forEach(icon => {
                setInterval(() => {
                    icon.style.transform = 'scale(1.05)';
                    setTimeout(() => {
                        icon.style.transform = 'scale(1)';
                    }, 200);
                }, 3000);
            });
        });

        // Handle server-side button clicks properly
        function handleServerButtonClick(button, buttonText) {
            const originalText = button.innerHTML;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> ' + buttonText + '...';
            button.style.opacity = '0.8';
            
            setTimeout(() => {
                button.innerHTML = originalText;
                button.style.opacity = '1';
            }, 1000);
        }

        // Add click handler for Add Achievement button specifically
        window.addEventListener('load', function() {
            const addAchievementBtn = document.getElementById('<%= btnAddAchievement.ClientID %>');
            if (addAchievementBtn) {
                console.log('Add Achievement button found:', addAchievementBtn);
                addAchievementBtn.addEventListener('click', function(e) {
                    console.log('Add Achievement button clicked!');
                    handleServerButtonClick(this, 'Loading');
                });
            }
            
            const refreshBtn = document.getElementById('<%= btnRefreshAchievements.ClientID %>');
            if (refreshBtn) {
                refreshBtn.addEventListener('click', function() {
                    console.log('Refresh Achievements button clicked!');
                    handleServerButtonClick(this, 'Refreshing');
                });
            }
        });
    </script>
</asp:Content>