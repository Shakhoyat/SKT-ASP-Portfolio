<%@ Page Title="Admin - Manage Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProjects.aspx.cs" Inherits="WebApplication1.AdminProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Projects Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Manage Projects</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add, edit, and organize your portfolio projects. 
                        Keep your work showcase up to date.
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

    <!-- Projects Management -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Portfolio Projects</h2>
                            <div class="admin-actions">
                                <asp:Button ID="btnAddProject" runat="server" Text="Add New Project" 
                                          CssClass="btn btn-primary" OnClick="btnAddProject_Click" 
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" 
                                          CssClass="btn btn-outline-primary" OnClick="btnRefresh_Click"
                                          CausesValidation="false" UseSubmitBehavior="true" />
                            </div>
                        </div>

                        <!-- Projects Grid -->
                        <div class="admin-content">
                            <asp:GridView ID="gvProjects" runat="server" 
                                        AutoGenerateColumns="false" 
                                        CssClass="admin-grid"
                                        OnRowCommand="gvProjects_RowCommand"
                                        OnRowDataBound="gvProjects_RowDataBound"
                                        DataKeyNames="ProjectId">
                                <Columns>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <div class="project-thumbnail">
                                                <asp:Image ID="imgProject" runat="server" 
                                                         ImageUrl='<%# GetProjectImageUrl(Eval("ImageUrl")) %>' 
                                                         AlternateText='<%# Eval("Title") %>' />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Project Details">
                                        <ItemTemplate>
                                            <div class="project-details">
                                                <h4><%# Eval("Title") %></h4>
                                                <p><%# Eval("ShortDescription") %></p>
                                                <div class="project-meta">
                                                    <span class="meta-item">
                                                        <i class="fas fa-calendar"></i>
                                                        <%# Eval("FormattedStartDate") %> - <%# Eval("FormattedEndDate") %>
                                                    </span>
                                                    <span class="meta-item">
                                                        <i class="fas fa-eye"></i>
                                                        <%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>
                                                    </span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Technologies">
                                        <ItemTemplate>
                                            <div class="technologies-list">
                                                <%# Eval("TechnologiesUsed") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnEdit" runat="server" 
                                                              CommandName="EditProject" 
                                                              CommandArgument='<%# Eval("ProjectId") %>'
                                                              CssClass="btn btn-sm btn-outline-primary"
                                                              ToolTip="Edit Project">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnToggleStatus" runat="server" 
                                                              CommandName="ToggleStatus" 
                                                              CommandArgument='<%# Eval("ProjectId") %>'
                                                              CssClass='<%# "btn btn-sm " + ((bool)Eval("IsActive") ? "btn-warning" : "btn-success") %>'
                                                              ToolTip='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'>
                                                    <i class='<%# "fas " + ((bool)Eval("IsActive") ? "fa-pause" : "fa-play") %>'></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnDelete" runat="server" 
                                                              CommandName="DeleteProject" 
                                                              CommandArgument='<%# Eval("ProjectId") %>'
                                                              CssClass="btn btn-sm btn-danger"
                                                              ToolTip="Delete Project"
                                                              OnClientClick="return confirm('Are you sure you want to delete this project?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">
                                        <i class="fas fa-folder-open fa-3x"></i>
                                        <h3>No Projects Found</h3>
                                        <p>Start by adding your first project to showcase your work.</p>
                                        <asp:Button ID="btnAddFirstProject" runat="server" Text="Add Your First Project" 
                                                  CssClass="btn btn-primary" OnClick="btnAddProject_Click" 
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
        /* Admin Projects specific styles */
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

        /* Project thumbnail */
        .project-thumbnail {
            width: 80px;
            height: 80px;
            border-radius: var(--border-radius);
            overflow: hidden;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .project-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Project details */
        .project-details h4 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.2rem;
        }

        .project-details p {
            color: var(--text-secondary);
            margin: 0 0 1rem 0;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        .project-meta {
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

        /* Technologies list */
        .technologies-list {
            color: var(--text-secondary);
            font-size: 0.9rem;
            line-height: 1.6;
            max-width: 200px;
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

            .project-details h4 {
                font-size: 1rem;
            }

            .action-buttons {
                justify-content: center;
            }
        }
    </style>

    <script>
        // Admin Projects enhancements
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
        });

        // Handle server-side button clicks properly
        function handleServerButtonClick(button, buttonText) {
            // Don't interfere with server-side button functionality
            // Just add visual feedback without disabling the button
            const originalText = button.innerHTML;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> ' + buttonText + '...';
            button.style.opacity = '0.8';
            
            // Reset after a short delay (the page will redirect anyway)
            setTimeout(() => {
                button.innerHTML = originalText;
                button.style.opacity = '1';
            }, 1000);
        }

        // Add click handler for Add Project button specifically
        window.addEventListener('load', function() {
            const addProjectBtn = document.getElementById('<%= btnAddProject.ClientID %>');
            if (addProjectBtn) {
                console.log('Add Project button found:', addProjectBtn);
                addProjectBtn.addEventListener('click', function(e) {
                    console.log('Add Project button clicked!');
                    handleServerButtonClick(this, 'Loading');
                    // Don't prevent default - let the server handle it
                });
            } else {
                console.error('Add Project button not found!');
            }
            
            const refreshBtn = document.getElementById('<%= btnRefresh.ClientID %>');
            if (refreshBtn) {
                refreshBtn.addEventListener('click', function() {
                    console.log('Refresh button clicked!');
                    handleServerButtonClick(this, 'Refreshing');
                });
            }
        });
    </script>
</asp:Content>