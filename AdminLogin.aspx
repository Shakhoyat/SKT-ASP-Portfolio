<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApplication1.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Login Hero Section -->
    <div class="hero">
        <div class="container text-center">
            <h1 style="color: white; margin-bottom: 1rem;">Admin Panel</h1>
            <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto; color: white;">
                Secure access to portfolio management system. 
                Please enter your credentials to continue.
            </p>
        </div>
    </div>

    <!-- Login Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                                <i class="fas fa-lock"></i>
                            </div>
                            <h2 class="card-title">Admin Login</h2>
                            <p class="card-text">
                                Access the portfolio management dashboard
                            </p>
                        </div>
                        
                        <!-- Login Form -->
                        <div class="admin-login-form">
                            <div class="form-group">
                                <label for="txtUsername" class="form-label">Username</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                                          ControlToValidate="txtUsername" 
                                                          ErrorMessage="Username is required" 
                                                          CssClass="error-message" 
                                                          Display="Dynamic" 
                                                          ValidationGroup="AdminLogin"
                                                          EnableClientScript="false"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="form-group">
                                <label for="txtPassword" class="form-label">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                                          ControlToValidate="txtPassword" 
                                                          ErrorMessage="Password is required" 
                                                          CssClass="error-message" 
                                                          Display="Dynamic" 
                                                          ValidationGroup="AdminLogin"
                                                          EnableClientScript="false"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="form-group">
                                <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" CssClass="remember-checkbox" />
                            </div>
                            
                            <div class="form-group text-center">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                          CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" 
                                          ValidationGroup="AdminLogin" style="width: 100%; padding: 1rem; font-size: 1.1rem;" />
                            </div>
                            
                            <!-- Error/Success Messages -->
                            <div class="form-messages">
                                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                                    <i class="fas fa-exclamation-circle"></i>
                                    <span id="lblErrorMessage" runat="server">Invalid username or password.</span>
                                </asp:Panel>
                                
                                <asp:Panel ID="pnlInfo" runat="server" CssClass="alert alert-info" Visible="false">
                                    <i class="fas fa-info-circle"></i>
                                    <strong>Default Credentials:</strong><br />
                                    Username: admin<br />
                                    Password: portfolio123
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Security Notice -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto text-center">
                    <h2 class="section-title">Security Notice</h2>
                    <div class="security-features">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <h5 style="color: var(--text-primary);">Secure Authentication</h5>
                                <p style="color: var(--text-secondary); font-size: 0.9rem;">Password hashing and session management</p>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <h5 style="color: var(--text-primary);">Session Timeout</h5>
                                <p style="color: var(--text-secondary); font-size: 0.9rem;">Automatic logout after inactivity</p>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                    <i class="fas fa-history"></i>
                                </div>
                                <h5 style="color: var(--text-primary);">Activity Logging</h5>
                                <p style="color: var(--text-secondary); font-size: 0.9rem;">Track all admin activities</p>
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
        /* Admin Login specific styles */
        .admin-login-form {
            margin-top: 1rem;
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

        .remember-checkbox {
            color: var(--text-secondary);
            font-size: 0.95rem;
        }

        .btn-block {
            width: 100%;
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
            margin-top: 1rem;
            font-weight: 500;
        }

        .alert i {
            margin-right: 0.5rem;
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        .alert-info {
            background: rgba(108, 92, 231, 0.1);
            color: var(--accent-secondary);
            border: 1px solid rgba(108, 92, 231, 0.3);
        }

        /* Security features styling */
        .security-features {
            margin-top: 2rem;
        }

        /* Form animations */
        .form-group {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-control {
                padding: 0.875rem 1rem;
                font-size: 0.95rem;
            }
        }
    </style>

    <script>
        // Form enhancements
        document.addEventListener('DOMContentLoaded', function() {
            // Focus on username field
            const usernameField = document.getElementById('<%= txtUsername.ClientID %>');
            if (usernameField) {
                setTimeout(() => usernameField.focus(), 500);
            }

            // Enter key support
            const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            if (passwordField) {
                passwordField.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        document.getElementById('<%= btnLogin.ClientID %>').click();
                    }
                });
            }

            // Auto-hide error messages
            const errorPanel = document.getElementById('<%= pnlError.ClientID %>');
            if (errorPanel && errorPanel.style.display !== 'none') {
                setTimeout(() => {
                    errorPanel.style.opacity = '0';
                    errorPanel.style.transform = 'translateY(-10px)';
                    setTimeout(() => {
                        errorPanel.style.display = 'none';
                    }, 300);
                }, 5000);
            }
        });

        // Add loading state to login button
        function showLoading() {
            const btn = document.getElementById('<%= btnLogin.ClientID %>');
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Logging in...';
            btn.disabled = true;
        }

        // Add click event to login button
        document.addEventListener('DOMContentLoaded', function() {
            const loginBtn = document.getElementById('<%= btnLogin.ClientID %>');
            loginBtn.addEventListener('click', function() {
                if (Page_ClientValidate('AdminLogin')) {
                    showLoading();
                }
            });
        });
    </script>
</asp:Content>