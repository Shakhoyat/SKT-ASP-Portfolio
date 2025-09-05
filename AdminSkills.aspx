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

    <!-- Skills Management -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Technical Skills</h2>
                            <div class="admin-actions">
                                <asp:Button ID="btnAddSkill" runat="server" Text="Add New Skill" 
                                          CssClass="btn btn-primary" OnClick="btnAddSkill_Click" 
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <asp:Button ID="btnRefreshSkills" runat="server" Text="Refresh" 
                                          CssClass="btn btn-outline-primary" OnClick="btnRefreshSkills_Click"
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <!-- Debug: Direct link for testing -->
                                <a href="AdminSkillForm.aspx" class="btn btn-outline-secondary" style="font-size: 0.8rem;">
                                    <i class="fas fa-external-link-alt"></i> Direct Link
                                </a>
                            </div>
                        </div>

                        <!-- Skills Grid -->
                        <div class="admin-content">
                            <asp:GridView ID="gvSkills" runat="server" 
                                        AutoGenerateColumns="false" 
                                        CssClass="admin-grid"
                                        OnRowCommand="gvSkills_RowCommand"
                                        OnRowDataBound="gvSkills_RowDataBound"
                                        DataKeyNames="SkillId">
                                <Columns>
                                    <asp:TemplateField HeaderText="Skill">
                                        <ItemTemplate>
                                            <div class="skill-info">
                                                <div class="skill-icon">
                                                    <i class="<%# GetSkillIcon(Eval("Category").ToString()) %>"></i>
                                                </div>
                                                <div class="skill-details">
                                                    <h4><%# Eval("SkillName") %></h4>
                                                    <span class="skill-category"><%# Eval("Category") %></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Proficiency">
                                        <ItemTemplate>
                                            <div class="proficiency-display">
                                                <div class="proficiency-bar">
                                                    <div class="proficiency-fill" style="width: <%# Eval("ProficiencyLevel") %>%"></div>
                                                </div>
                                                <span class="proficiency-text"><%# Eval("ProficiencyLevel") %>% - <%# GetProficiencyText((int)Eval("ProficiencyLevel")) %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <div class="skill-description">
                                                <%# Eval("Description") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnEditSkill" runat="server" 
                                                              CommandName="EditSkill" 
                                                              CommandArgument='<%# Eval("SkillId") %>'
                                                              CssClass="btn btn-sm btn-outline-primary"
                                                              ToolTip="Edit Skill">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnToggleSkillStatus" runat="server" 
                                                              CommandName="ToggleStatus" 
                                                              CommandArgument='<%# Eval("SkillId") %>'
                                                              CssClass='<%# "btn btn-sm " + ((bool)Eval("IsActive") ? "btn-warning" : "btn-success") %>'
                                                              ToolTip='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'>
                                                    <i class='<%# "fas " + ((bool)Eval("IsActive") ? "fa-pause" : "fa-play") %>'></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnDeleteSkill" runat="server" 
                                                              CommandName="DeleteSkill" 
                                                              CommandArgument='<%# Eval("SkillId") %>'
                                                              CssClass="btn btn-sm btn-danger"
                                                              ToolTip="Delete Skill"
                                                              OnClientClick="return confirm('Are you sure you want to delete this skill?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">
                                        <i class="fas fa-tools fa-3x"></i>
                                        <h3>No Skills Found</h3>
                                        <p>Start by adding your first skill to showcase your expertise.</p>
                                        <asp:Button ID="btnAddFirstSkill" runat="server" Text="Add Your First Skill" 
                                                  CssClass="btn btn-primary" OnClick="btnAddSkill_Click" 
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
        /* Admin Skills specific styles */
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

        /* Skill info */
        .skill-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .skill-icon {
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

        .skill-details h4 {
            color: var(--text-primary);
            margin: 0 0 0.25rem 0;
            font-size: 1.1rem;
        }

        .skill-category {
            color: var(--text-secondary);
            font-size: 0.85rem;
            background: rgba(0, 212, 170, 0.1);
            padding: 0.25rem 0.5rem;
            border-radius: 12px;
        }

        /* Proficiency display */
        .proficiency-display {
            min-width: 200px;
        }

        .proficiency-bar {
            width: 100%;
            height: 8px;
            background: var(--border-color);
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .proficiency-fill {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 4px;
            transition: width 1s ease-out;
        }

        .proficiency-text {
            color: var(--text-secondary);
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Skill description */
        .skill-description {
            color: var(--text-secondary);
            font-size: 0.9rem;
            line-height: 1.5;
            max-width: 300px;
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

            .skill-info {
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
        // Admin Skills enhancements
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

            // Animate proficiency bars
            setTimeout(() => {
                const proficiencyBars = document.querySelectorAll('.proficiency-fill');
                proficiencyBars.forEach(bar => {
                    const width = bar.style.width;
                    bar.style.width = '0%';
                    setTimeout(() => {
                        bar.style.width = width;
                    }, 100);
                });
            }, 500);
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

        // Add click handler for Add Skill button specifically
        window.addEventListener('load', function() {
            const addSkillBtn = document.getElementById('<%= btnAddSkill.ClientID %>');
            if (addSkillBtn) {
                console.log('Add Skill button found:', addSkillBtn);
                addSkillBtn.addEventListener('click', function(e) {
                    console.log('Add Skill button clicked!');
                    handleServerButtonClick(this, 'Loading');
                });
            }
            
            const refreshBtn = document.getElementById('<%= btnRefreshSkills.ClientID %>');
            if (refreshBtn) {
                refreshBtn.addEventListener('click', function() {
                    console.log('Refresh Skills button clicked!');
                    handleServerButtonClick(this, 'Refreshing');
                });
            }
        });
    </script>
</asp:Content>