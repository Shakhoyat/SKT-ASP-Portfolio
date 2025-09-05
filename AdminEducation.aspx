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

    <!-- Education Management -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Educational Background</h2>
                            <div class="admin-actions">
                                <asp:Button ID="btnAddEducation" runat="server" Text="Add New Education" 
                                          CssClass="btn btn-primary" OnClick="btnAddEducation_Click" 
                                          CausesValidation="false" UseSubmitBehavior="true" />
                                <asp:Button ID="btnRefreshEducation" runat="server" Text="Refresh" 
                                          CssClass="btn btn-outline-primary" OnClick="btnRefreshEducation_Click"
                                          CausesValidation="false" UseSubmitBehavior="true" />
                            </div>
                        </div>

                        <!-- Education Grid -->
                        <div class="admin-content">
                            <asp:GridView ID="gvEducation" runat="server" 
                                        AutoGenerateColumns="false" 
                                        CssClass="admin-grid"
                                        OnRowCommand="gvEducation_RowCommand"
                                        OnRowDataBound="gvEducation_RowDataBound"
                                        DataKeyNames="EducationId">
                                <Columns>
                                    <asp:TemplateField HeaderText="Education">
                                        <ItemTemplate>
                                            <div class="education-info">
                                                <div class="education-icon <%# GetEducationClass(Eval("Type").ToString()) %>">
                                                    <i class="<%# GetEducationIcon(Eval("Type").ToString()) %>"></i>
                                                </div>
                                                <div class="education-details">
                                                    <h4><%# Eval("Degree") %></h4>
                                                    <span class="education-field"><%# Eval("FieldOfStudy") %></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Institution">
                                        <ItemTemplate>
                                            <div class="institution-info">
                                                <h5><%# Eval("Institution") %></h5>
                                                <div class="institution-meta">
                                                    <div class="meta-item">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                        <%# Eval("Location") %>
                                                    </div>
                                                    <div class="meta-item">
                                                        <i class="fas fa-star"></i>
                                                        GPA: <%# Eval("GPA") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Duration">
                                        <ItemTemplate>
                                            <div class="duration-info">
                                                <div class="meta-item">
                                                    <i class="fas fa-calendar-alt"></i>
                                                    <%# Eval("StartDate", "{0:MMM yyyy}") %> - <%# Eval("EndDate", "{0:MMM yyyy}") %>
                                                </div>
                                                <div class="meta-item">
                                                    <i class="fas fa-clock"></i>
                                                    <%# GetDuration((DateTime)Eval("StartDate"), (DateTime?)Eval("EndDate")) %>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnEditEducation" runat="server" 
                                                              CommandName="EditEducation" 
                                                              CommandArgument='<%# Eval("EducationId") %>'
                                                              CssClass="btn btn-sm btn-outline-primary"
                                                              ToolTip="Edit Education">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnToggleEducationStatus" runat="server" 
                                                              CommandName="ToggleStatus" 
                                                              CommandArgument='<%# Eval("EducationId") %>'
                                                              CssClass='<%# "btn btn-sm " + ((bool)Eval("IsActive") ? "btn-warning" : "btn-success") %>'
                                                              ToolTip='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>'>
                                                    <i class='<%# "fas " + ((bool)Eval("IsActive") ? "fa-pause" : "fa-play") %>'></i>
                                                </asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnDeleteEducation" runat="server" 
                                                              CommandName="DeleteEducation" 
                                                              CommandArgument='<%# Eval("EducationId") %>'
                                                              CssClass="btn btn-sm btn-danger"
                                                              ToolTip="Delete Education"
                                                              OnClientClick="return confirm('Are you sure you want to delete this education record?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">
                                        <i class="fas fa-graduation-cap fa-3x"></i>
                                        <h3>No Education Records Found</h3>
                                        <p>Start by adding your first education record to showcase your academic background.</p>
                                        <asp:Button ID="btnAddFirstEducation" runat="server" Text="Add Your First Education" 
                                                  CssClass="btn btn-primary" OnClick="btnAddEducation_Click" 
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
    <script>
        // GridView client-side actions
        function onGridViewRowCommand(sender, args) {
            var commandName = args.get_commandName();
            var educationId = args.get_gridDataItem().getKey();
            
            if (commandName === "EditEducation") {
                // Redirect to edit page
                window.location = "AdminEducationForm.aspx?editId=" + educationId;
            } else if (commandName === "ToggleStatus") {
                // Toggle education status
                var btn = args.get_item().findControl("btnToggleEducationStatus");
                var newStatus = btn.classList.contains("btn-warning") ? "Active" : "Inactive";
                
                if (confirm("Are you sure you want to " + newStatus.toLowerCase() + " this education record?")) {
                    __doPostBack(btn.getPostBackEventReference(), "");
                }
            } else if (commandName === "DeleteEducation") {
                // Delete education record
                if (confirm("Are you sure you want to delete this education record?")) {
                    __doPostBack(args.get_item().getPostBackEventReference(), "");
                }
            }
        }

        // Show success/error message
        function showMessage(panelId, message) {
            var panel = $find(panelId);
            panel.set_visible(true);
            panel.get_element().innerHTML = message;
            
            // Auto-hide message after 3 seconds
            setTimeout(function() {
                panel.set_visible(false);
            }, 3000);
        }
    </script>

    <style>
        /* Admin Education specific styles */
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

        /* Education info */
        .education-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .education-icon {
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

        .education-icon.degree {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .education-icon.certification {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            box-shadow: 0 4px 15px rgba(240, 147, 251, 0.3);
        }

        .education-icon.course {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
        }

        .education-icon.training {
            background: var(--gradient-primary);
            box-shadow: 0 4px 15px rgba(0, 212, 170, 0.3);
        }

        .education-details h4 {
            color: var(--text-primary);
            margin: 0 0 0.25rem 0;
            font-size: 1.1rem;
        }

        .education-field {
            color: var(--text-secondary);
            font-size: 0.85rem;
            background: rgba(0, 212, 170, 0.1);
            padding: 0.25rem 0.5rem;
            border-radius: 12px;
        }

        /* Institution info */
        .institution-info h5 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.05rem;
        }

        .institution-meta {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        /* Duration info */
        .duration-info {
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

            .education-info {
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
        // Admin Education enhancements
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
            const originalText = button.innerHTML;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> ' + buttonText + '...';
            button.style.opacity = '0.8';
            
            setTimeout(() => {
                button.innerHTML = originalText;
                button.style.opacity = '1';
            }, 1000);
        }

        // Add click handler for Add Education button specifically
        window.addEventListener('load', function() {
            const addEducationBtn = document.getElementById('<%= btnAddEducation.ClientID %>');
            if (addEducationBtn) {
                console.log('Add Education button found:', addEducationBtn);
                addEducationBtn.addEventListener('click', function(e) {
                    console.log('Add Education button clicked!');
                    handleServerButtonClick(this, 'Loading');
                });
            }
            
            const refreshBtn = document.getElementById('<%= btnRefreshEducation.ClientID %>');
            if (refreshBtn) {
                refreshBtn.addEventListener('click', function() {
                    console.log('Refresh Education button clicked!');
                    handleServerButtonClick(this, 'Refreshing');
                });
            }
        });
    </script>
</asp:Content>