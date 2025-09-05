<%@ Page Title="Admin - Skill Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminSkillForm.aspx.cs" Inherits="WebApplication1.AdminSkillForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Skill Form Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">
                        <asp:Literal ID="ltlFormTitle" runat="server" Text="Add New Skill" />
                    </h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add your technical skills and expertise to showcase your capabilities.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminSkills.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Skills
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Skill Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <h3><i class="fas fa-tools"></i> Skill Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- Skill Name -->
                            <div class="form-group">
                                <label for="txtSkillName">Skill Name *</label>
                                <asp:TextBox ID="txtSkillName" runat="server" CssClass="form-control" 
                                           placeholder="e.g., C#, JavaScript, SQL Server, React" 
                                           MaxLength="100" />
                                <asp:RequiredFieldValidator ID="rfvSkillName" runat="server" 
                                                          ControlToValidate="txtSkillName" 
                                                          ErrorMessage="Skill name is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Category -->
                            <div class="form-group">
                                <label for="ddlCategory">Category *</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Category" Value="" />
                                    <asp:ListItem Text="Programming" Value="Programming" />
                                    <asp:ListItem Text="Framework" Value="Framework" />
                                    <asp:ListItem Text="Database" Value="Database" />
                                    <asp:ListItem Text="Frontend" Value="Frontend" />
                                    <asp:ListItem Text="Backend" Value="Backend" />
                                    <asp:ListItem Text="Tools" Value="Tools" />
                                    <asp:ListItem Text="Cloud" Value="Cloud" />
                                    <asp:ListItem Text="DevOps" Value="DevOps" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" 
                                                          ControlToValidate="ddlCategory" 
                                                          ErrorMessage="Please select a category" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Proficiency Level -->
                            <div class="form-group">
                                <label for="rblProficiencyLevel">Proficiency Level *</label>
                                <div class="proficiency-selector">
                                    <asp:RadioButtonList ID="rblProficiencyLevel" runat="server" 
                                                       RepeatDirection="Horizontal" 
                                                       CssClass="proficiency-options">
                                        <asp:ListItem Text="Beginner (25%)" Value="25" />
                                        <asp:ListItem Text="Basic (50%)" Value="50" />
                                        <asp:ListItem Text="Intermediate (70%)" Value="70" />
                                        <asp:ListItem Text="Advanced (85%)" Value="85" />
                                        <asp:ListItem Text="Expert (95%)" Value="95" />
                                    </asp:RadioButtonList>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvProficiencyLevel" runat="server" 
                                                          ControlToValidate="rblProficiencyLevel" 
                                                          ErrorMessage="Please select a proficiency level" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="txtDescription">Description</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                                           TextMode="MultiLine" Rows="3" 
                                           placeholder="Describe your experience with this skill, projects where you used it, etc." />
                            </div>

                            <!-- Status -->
                            <div class="form-group">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" Checked="true" />
                                    <label class="form-check-label" for="<%= chkIsActive.ClientID %>">
                                        Display this skill on the public portfolio
                                    </label>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save Skill" 
                                          CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                <asp:Button ID="btnSaveAndAdd" runat="server" Text="Save & Add Another" 
                                          CssClass="btn btn-success" OnClick="btnSaveAndAdd_Click" />
                                <a href="AdminSkills.aspx" class="btn btn-secondary">Cancel</a>
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

        .proficiency-selector {
            background: rgba(0, 212, 170, 0.05);
            padding: 1rem;
            border-radius: var(--border-radius);
            border: 1px solid rgba(0, 212, 170, 0.2);
        }

        .proficiency-options {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .proficiency-options td {
            border: none !important;
            padding: 0.5rem !important;
            background: transparent !important;
        }

        .proficiency-options input[type="radio"] {
            margin-right: 0.5rem;
            accent-color: var(--accent-color);
        }

        .proficiency-options label {
            color: var(--text-primary);
            font-weight: 500;
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        .proficiency-options label:hover {
            background: rgba(0, 212, 170, 0.1);
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
            .proficiency-options {
                flex-direction: column;
                gap: 0.5rem;
            }

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

            // Proficiency level visual feedback
            const radioButtons = document.querySelectorAll('input[type="radio"]');
            radioButtons.forEach(radio => {
                radio.addEventListener('change', function() {
                    // Remove active class from all labels
                    const labels = document.querySelectorAll('.proficiency-options label');
                    labels.forEach(label => label.classList.remove('active'));
                    
                    // Add active class to selected label
                    if (this.checked) {
                        const label = this.parentElement.querySelector('label');
                        if (label) {
                            label.classList.add('active');
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>