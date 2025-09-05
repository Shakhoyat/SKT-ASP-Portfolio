<%@ Page Title="Admin - Achievement Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAchievementForm.aspx.cs" Inherits="WebApplication1.AdminAchievementForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Achievement Form Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">
                        <asp:Literal ID="ltlFormTitle" runat="server" Text="Add New Achievement" />
                    </h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add your professional achievements, awards, and certifications to showcase your accomplishments.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminAchievements.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Achievements
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Achievement Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <h3><i class="fas fa-trophy"></i> Achievement Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- Achievement Title -->
                            <div class="form-group">
                                <label for="txtTitle">Achievement Title *</label>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" 
                                           placeholder="e.g., Project Excellence Award, Microsoft Certification" 
                                           MaxLength="200" />
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                                                          ControlToValidate="txtTitle" 
                                                          ErrorMessage="Achievement title is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Achievement Type -->
                            <div class="form-group">
                                <label for="ddlType">Achievement Type *</label>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Achievement Type" Value="" />
                                    <asp:ListItem Text="Award" Value="Award" />
                                    <asp:ListItem Text="Certification" Value="Certification" />
                                    <asp:ListItem Text="Recognition" Value="Recognition" />
                                    <asp:ListItem Text="Milestone" Value="Milestone" />
                                    <asp:ListItem Text="Competition" Value="Competition" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvType" runat="server" 
                                                          ControlToValidate="ddlType" 
                                                          ErrorMessage="Please select an achievement type" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Organization -->
                            <div class="form-group">
                                <label for="txtOrganization">Organization/Institution *</label>
                                <asp:TextBox ID="txtOrganization" runat="server" CssClass="form-control" 
                                           placeholder="e.g., Microsoft, Tech Solutions Inc., GitHub" 
                                           MaxLength="200" />
                                <asp:RequiredFieldValidator ID="rfvOrganization" runat="server" 
                                                          ControlToValidate="txtOrganization" 
                                                          ErrorMessage="Organization is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Achievement Date -->
                            <div class="form-group">
                                <label for="txtAchievementDate">Achievement Date *</label>
                                <asp:TextBox ID="txtAchievementDate" runat="server" CssClass="form-control" 
                                           TextMode="Date" />
                                <asp:RequiredFieldValidator ID="rfvAchievementDate" runat="server" 
                                                          ControlToValidate="txtAchievementDate" 
                                                          ErrorMessage="Achievement date is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="txtDescription">Description *</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                                           TextMode="MultiLine" Rows="4" 
                                           placeholder="Describe your achievement, its significance, and any relevant details..." />
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                                          ControlToValidate="txtDescription" 
                                                          ErrorMessage="Description is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Status -->
                            <div class="form-group">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" Checked="true" />
                                    <label class="form-check-label" for="<%= chkIsActive.ClientID %>">
                                        Display this achievement on the public portfolio
                                    </label>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save Achievement" 
                                          CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                <asp:Button ID="btnSaveAndAdd" runat="server" Text="Save & Add Another" 
                                          CssClass="btn btn-success" OnClick="btnSaveAndAdd_Click" />
                                <a href="AdminAchievements.aspx" class="btn btn-secondary">Cancel</a>
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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        .card-header {
            background: var(--gradient-primary);
            color: white;
            padding: 1.5rem;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
        }

        .card-header h3 {
            margin: 0;
            font-size: 1.3rem;
            font-weight: 600;
        }

        .card-header i {
            margin-right: 0.5rem;
        }

        .card-body {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid var(--border-color);
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--card-bg);
            color: var(--text-primary);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(0, 212, 170, 0.1);
        }

        .form-check {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem;
            background: rgba(0, 212, 170, 0.05);
            border-radius: var(--border-radius);
        }

        .form-check-label {
            color: var(--text-primary);
            font-weight: 500;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .text-danger {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

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

        @media (max-width: 768px) {
            .form-actions {
                flex-direction: column;
            }

            .form-actions .btn {
                width: 100%;
            }
        }
    </style>

    <script>
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

            // Set default date to today if it's a new achievement
            const dateInput = document.getElementById('<%= txtAchievementDate.ClientID %>');
            if (dateInput && !dateInput.value) {
                dateInput.value = new Date().toISOString().split('T')[0];
            }

            // Form enhancement
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.classList.remove('focused');
                });
            });
        });
    </script>
</asp:Content>