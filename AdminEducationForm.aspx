<%@ Page Title="Admin - Education Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminEducationForm.aspx.cs" Inherits="WebApplication1.AdminEducationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Education Form Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">
                        <asp:Literal ID="ltlFormTitle" runat="server" Text="Add New Education" />
                    </h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        Add your educational background, degrees, certifications, and training programs.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminEducation.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Education
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Education Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <h3><i class="fas fa-graduation-cap"></i> Education Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- Education Type -->
                            <div class="form-group">
                                <label for="ddlType">Education Type *</label>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Education Type" Value="" />
                                    <asp:ListItem Text="Degree" Value="Degree" />
                                    <asp:ListItem Text="Certification" Value="Certification" />
                                    <asp:ListItem Text="Course" Value="Course" />
                                    <asp:ListItem Text="Training" Value="Training" />
                                    <asp:ListItem Text="Workshop" Value="Workshop" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvType" runat="server" 
                                                          ControlToValidate="ddlType" 
                                                          ErrorMessage="Please select an education type" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Degree/Title -->
                            <div class="form-group">
                                <label for="txtDegree">Degree/Title *</label>
                                <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control" 
                                           placeholder="e.g., Bachelor of Science, Microsoft Azure Certification, Full Stack Course" 
                                           MaxLength="200" />
                                <asp:RequiredFieldValidator ID="rfvDegree" runat="server" 
                                                          ControlToValidate="txtDegree" 
                                                          ErrorMessage="Degree/Title is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Field of Study -->
                            <div class="form-group">
                                <label for="txtFieldOfStudy">Field of Study *</label>
                                <asp:TextBox ID="txtFieldOfStudy" runat="server" CssClass="form-control" 
                                           placeholder="e.g., Computer Science, Web Development, Cloud Computing" 
                                           MaxLength="200" />
                                <asp:RequiredFieldValidator ID="rfvFieldOfStudy" runat="server" 
                                                          ControlToValidate="txtFieldOfStudy" 
                                                          ErrorMessage="Field of study is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Institution -->
                            <div class="form-group">
                                <label for="txtInstitution">Institution/Organization *</label>
                                <asp:TextBox ID="txtInstitution" runat="server" CssClass="form-control" 
                                           placeholder="e.g., University of Technology, Microsoft, Coursera" 
                                           MaxLength="200" />
                                <asp:RequiredFieldValidator ID="rfvInstitution" runat="server" 
                                                          ControlToValidate="txtInstitution" 
                                                          ErrorMessage="Institution is required" 
                                                          CssClass="text-danger" Display="Dynamic" />
                            </div>

                            <!-- Location -->
                            <div class="form-group">
                                <label for="txtLocation">Location</label>
                                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" 
                                           placeholder="e.g., Dhaka, Bangladesh, Online" 
                                           MaxLength="200" />
                            </div>

                            <!-- Date Range -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtStartDate">Start Date *</label>
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" 
                                                   TextMode="Date" />
                                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                                                                  ControlToValidate="txtStartDate" 
                                                                  ErrorMessage="Start date is required" 
                                                                  CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtEndDate">End Date</label>
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" 
                                                   TextMode="Date" />
                                        <small class="form-text text-muted">Leave empty if currently enrolled</small>
                                    </div>
                                </div>
                            </div>

                            <!-- GPA/Grade -->
                            <div class="form-group">
                                <label for="txtGPA">GPA/Grade</label>
                                <asp:TextBox ID="txtGPA" runat="server" CssClass="form-control" 
                                           placeholder="e.g., 3.75, A+, Pass, 85%" 
                                           MaxLength="20" />
                            </div>

                            <!-- Status -->
                            <div class="form-group">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" Checked="true" />
                                    <label class="form-check-label" for="<%= chkIsActive.ClientID %>">
                                        Display this education record on the public portfolio
                                    </label>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save Education" 
                                          CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                <asp:Button ID="btnSaveAndAdd" runat="server" Text="Save & Add Another" 
                                          CssClass="btn btn-success" OnClick="btnSaveAndAdd_Click" />
                                <a href="AdminEducation.aspx" class="btn btn-secondary">Cancel</a>
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

        .form-text {
            color: var(--text-muted);
            font-size: 0.875rem;
            margin-top: 0.25rem;
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

            // End date validation
            const startDateInput = document.getElementById('<%= txtStartDate.ClientID %>');
            const endDateInput = document.getElementById('<%= txtEndDate.ClientID %>');
            
            if (startDateInput && endDateInput) {
                startDateInput.addEventListener('change', function() {
                    endDateInput.min = this.value;
                });
                
                endDateInput.addEventListener('change', function() {
                    if (this.value && startDateInput.value && this.value < startDateInput.value) {
                        alert('End date cannot be earlier than start date');
                        this.value = '';
                    }
                });
            }
        });
    </script>
</asp:Content>