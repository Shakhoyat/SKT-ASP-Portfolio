<%@ Page Title="Admin - Add/Edit Project" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProjectForm.aspx.cs" Inherits="WebApplication1.AdminProjectForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Project Form Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">
                        <asp:Literal ID="ltlPageTitle" runat="server" Text="Add New Project" />
                    </h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        <asp:Literal ID="ltlPageDescription" runat="server" Text="Create a new project to showcase in your portfolio." />
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminProjects.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Projects
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Project Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Project Details</h2>
                        </div>

                        <div class="admin-content">
                            <!-- Basic Information -->
                            <div class="form-section">
                                <h4>Basic Information</h4>
                                
                                <div class="form-group">
                                    <label for="txtTitle" class="form-label">Project Title *</label>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter project title"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                                                              ControlToValidate="txtTitle" 
                                                              ErrorMessage="Project title is required" 
                                                              CssClass="error-message" 
                                                              Display="Dynamic" 
                                                              ValidationGroup="ProjectForm"
                                                              EnableClientScript="false"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtShortDescription" class="form-label">Short Description *</label>
                                    <asp:TextBox ID="txtShortDescription" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                               Rows="2" placeholder="Brief description for project cards"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvShortDescription" runat="server" 
                                                              ControlToValidate="txtShortDescription" 
                                                              ErrorMessage="Short description is required" 
                                                              CssClass="error-message" 
                                                              Display="Dynamic" 
                                                              ValidationGroup="ProjectForm"
                                                              EnableClientScript="false"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtDescription" class="form-label">Full Description *</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                               Rows="4" placeholder="Detailed project description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                                              ControlToValidate="txtDescription" 
                                                              ErrorMessage="Full description is required" 
                                                              CssClass="error-message" 
                                                              Display="Dynamic" 
                                                              ValidationGroup="ProjectForm"
                                                              EnableClientScript="false"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtTechnologies" class="form-label">Technologies Used *</label>
                                    <asp:TextBox ID="txtTechnologies" runat="server" CssClass="form-control" 
                                               placeholder="e.g., ASP.NET, C#, SQL Server, JavaScript"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTechnologies" runat="server" 
                                                              ControlToValidate="txtTechnologies" 
                                                              ErrorMessage="Technologies are required" 
                                                              CssClass="error-message" 
                                                              Display="Dynamic" 
                                                              ValidationGroup="ProjectForm"
                                                              EnableClientScript="false"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <!-- Links and Media -->
                            <div class="form-section">
                                <h4>Links and Media</h4>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtProjectUrl" class="form-label">Live Demo URL</label>
                                            <asp:TextBox ID="txtProjectUrl" runat="server" CssClass="form-control" 
                                                       placeholder="https://your-project.com"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtGitHubUrl" class="form-label">GitHub URL</label>
                                            <asp:TextBox ID="txtGitHubUrl" runat="server" CssClass="form-control" 
                                                       placeholder="https://github.com/username/repo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtImageUrl" class="form-label">Project Image URL</label>
                                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" 
                                               placeholder="/Content/images/projects/your-project.jpg"></asp:TextBox>
                                    <small class="form-help">Add your project image to /Content/images/projects/ folder and reference it here</small>
                                </div>
                            </div>

                            <!-- Project Timeline -->
                            <div class="form-section">
                                <h4>Project Timeline</h4>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtStartDate" class="form-label">Start Date *</label>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                                                                      ControlToValidate="txtStartDate" 
                                                                      ErrorMessage="Start date is required" 
                                                                      CssClass="error-message" 
                                                                      Display="Dynamic" 
                                                                      ValidationGroup="ProjectForm"
                                                                      EnableClientScript="false"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEndDate" class="form-label">End Date</label>
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            <small class="form-help">Leave empty for ongoing projects</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Project Settings -->
                            <div class="form-section">
                                <h4>Project Settings</h4>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtDisplayOrder" class="form-label">Display Order</label>
                                            <asp:TextBox ID="txtDisplayOrder" runat="server" CssClass="form-control" TextMode="Number" 
                                                       placeholder="1" Text="1"></asp:TextBox>
                                            <small class="form-help">Lower numbers appear first</small>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" style="padding-top: 2rem;">
                                            <asp:CheckBox ID="chkIsActive" runat="server" Text="Project is Active" Checked="true" CssClass="form-checkbox" />
                                            <small class="form-help" style="display: block; margin-top: 0.5rem;">Only active projects are shown in portfolio</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Form Actions -->
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save Project" 
                                          CssClass="btn btn-primary" OnClick="btnSave_Click" 
                                          ValidationGroup="ProjectForm" />
                                
                                <asp:Button ID="btnSaveAndAdd" runat="server" Text="Save & Add Another" 
                                          CssClass="btn btn-outline-primary" OnClick="btnSaveAndAdd_Click" 
                                          ValidationGroup="ProjectForm" />
                                
                                <a href="AdminProjects.aspx" class="btn btn-secondary">Cancel</a>
                            </div>
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
                <div class="col-md-8 mx-auto">
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

    <!-- Hidden field for project ID -->
    <asp:HiddenField ID="hdnProjectId" runat="server" Value="0" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Project Form specific styles */
        .form-section {
            margin-bottom: 3rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid var(--border-color);
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        .form-section h4 {
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .form-section h4::before {
            content: '';
            width: 4px;
            height: 20px;
            background: var(--gradient-primary);
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.75rem;
            font-weight: 600;
            color: var(--text-primary);
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.25rem;
            border: 2px solid var(--border-color);
            border-radius: var(--border-radius);
            font-size: 1rem;
            background: var(--card-bg);
            color: var(--text-primary);
            transition: var(--transition);
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 4px rgba(0, 212, 170, 0.1);
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .form-help {
            color: var(--text-muted);
            font-size: 0.85rem;
            margin-top: 0.5rem;
            display: block;
        }

        .form-checkbox {
            color: var(--text-primary);
            font-size: 1rem;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            padding-top: 2rem;
            border-top: 1px solid var(--border-color);
            margin-top: 2rem;
        }

        /* Error messages */
        .error-message {
            color: #ef4444;
            font-size: 0.85rem;
            margin-top: 0.5rem;
            display: block;
            font-weight: 500;
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
            .form-actions {
                flex-direction: column;
            }

            .form-control {
                padding: 0.875rem 1rem;
                font-size: 0.95rem;
            }
        }
    </style>

    <script>
        // Form enhancements
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

            // Add loading state to save buttons
            const saveButtons = document.querySelectorAll('#<%= btnSave.ClientID %>, #<%= btnSaveAndAdd.ClientID %>');
            saveButtons.forEach(button => {
                button.addEventListener('click', function() {
                    if (Page_ClientValidate('ProjectForm')) {
                        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
                        this.disabled = true;
                    }
                });
            });

            // Character counters for text areas
            const textAreas = document.querySelectorAll('textarea.form-control');
            textAreas.forEach(textArea => {
                textArea.addEventListener('input', function() {
                    const length = this.value.length;
                    const maxLength = this.getAttribute('maxlength');
                    if (maxLength) {
                        let counter = this.parentElement.querySelector('.char-counter');
                        if (!counter) {
                            counter = document.createElement('small');
                            counter.className = 'char-counter form-help';
                            this.parentElement.appendChild(counter);
                        }
                        counter.textContent = `${length}/${maxLength} characters`;
                    }
                });
            });
        });
    </script>
</asp:Content>