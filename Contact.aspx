<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Contact Hero Section -->
    <div class="hero">
        <div class="container text-center">
            <h1 style="color: white; margin-bottom: 1rem;">Get In Touch</h1>
            <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto; color: white;">
                Ready to start your next project? I'd love to hear from you. 
                Let's discuss how we can bring your ideas to life.
            </p>
        </div>
    </div>

    <!-- Contact Information -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h4 style="color: var(--text-primary); margin-bottom: 1rem;">Email</h4>
                    <p style="color: var(--text-secondary); margin-bottom: 1rem;">Send me an email anytime</p>
                    <a href="mailto:skt104.shujon@gmail.com" style="color: var(--accent-color); font-weight: 600; text-decoration: none;">
                        skt104.shujon@gmail.com
                    </a>
                </div>
                
                <div class="col-md-4 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fab fa-linkedin"></i>
                    </div>
                    <h4 style="color: var(--text-primary); margin-bottom: 1rem;">LinkedIn</h4>
                    <p style="color: var(--text-secondary); margin-bottom: 1rem;">Connect with me professionally</p>
                    <a href="https://linkedin.com/in/shakhoyat" target="_blank" style="color: var(--accent-color); font-weight: 600; text-decoration: none;">
                        linkedin.com/in/shakhoyat
                    </a>
                </div>
                
                <div class="col-md-4 text-center mb-4">
                    <div style="background: var(--gradient-primary); width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 2rem;">
                        <i class="fab fa-github"></i>
                    </div>
                    <h4 style="color: var(--text-primary); margin-bottom: 1rem;">GitHub</h4>
                    <p style="color: var(--text-secondary); margin-bottom: 1rem;">Check out my code</p>
                    <a href="https://github.com/Shakhoyat" target="_blank" style="color: var(--accent-color); font-weight: 600; text-decoration: none;">
                        github.com/Shakhoyat
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Form -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div style="text-align: center; margin-bottom: 2rem;">
                            <h2 class="card-title">Send Me a Message</h2>
                            <p class="card-text">
                                Fill out the form below and I'll get back to you as soon as possible.
                            </p>
                        </div>
                        
                        <!-- Contact Form -->
                        <div class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtName" class="form-label">Full Name *</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your full name" required="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                                                  ErrorMessage="Name is required" 
                                                                  CssClass="error-message" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtEmail" class="form-label">Email Address *</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="your.email@example.com" required="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                                                  ErrorMessage="Email is required" 
                                                                  CssClass="error-message" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                                                      ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$" 
                                                                      ErrorMessage="Please enter a valid email address" 
                                                                      CssClass="error-message" Display="Dynamic" ValidationGroup="ContactForm"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtPhone" class="form-label">Phone Number</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="(555) 123-4567"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ddlSubject" class="form-label">Subject *</label>
                                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">Select a subject</asp:ListItem>
                                            <asp:ListItem Value="project">New Project Inquiry</asp:ListItem>
                                            <asp:ListItem Value="freelance">Freelance Opportunity</asp:ListItem>
                                            <asp:ListItem Value="consultation">Consultation Request</asp:ListItem>
                                            <asp:ListItem Value="collaboration">Collaboration</asp:ListItem>
                                            <asp:ListItem Value="other">Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject" 
                                                                  ErrorMessage="Please select a subject" 
                                                                  CssClass="error-message" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="txtMessage" class="form-label">Message *</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                           Rows="6" placeholder="Tell me about your project or inquiry..."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                                                          ErrorMessage="Message is required" 
                                                          CssClass="error-message" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="form-group text-center">
                                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" 
                                          CssClass="btn btn-primary" OnClick="btnSendMessage_Click" 
                                          ValidationGroup="ContactForm" style="padding: 1rem 2.5rem; font-size: 1.1rem;" />
                            </div>
                            
                            <!-- Success/Error Messages -->
                            <div class="form-messages">
                                <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                                    <i class="fas fa-check-circle"></i>
                                    <strong>Success!</strong> Your message has been sent successfully. I'll get back to you soon.
                                </asp:Panel>
                                
                                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                                    <i class="fas fa-exclamation-circle"></i>
                                    <strong>Error!</strong> There was a problem sending your message. Please try again or contact me directly.
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Contact Options -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title">Other Ways to Connect</h2>
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-download"></i>
                        </div>
                        <h4 class="card-title">Download My Resume</h4>
                        <p class="card-text">
                            Get a detailed overview of my experience, skills, and education.
                        </p>
                        <a href="/Content/docs/resume.pdf" target="_blank" class="btn btn-outline-primary">
                            <i class="fas fa-file-pdf" style="margin-right: 0.5rem;"></i>
                            Download CV
                        </a>
                    </div>
                </div>
                
                <div class="col-md-4 text-center mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h4 class="card-title">Schedule a Call</h4>
                        <p class="card-text">
                            Let's discuss your project requirements in detail over a call.
                        </p>
                        <a href="mailto:skt104.shujon@gmail.com?subject=Schedule a Call" class="btn btn-outline-primary">
                            <i class="fas fa-phone" style="margin-right: 0.5rem;"></i>
                            Schedule Call
                        </a>
                    </div>
                </div>
                
                <div class="col-md-4 text-center mb-4">
                    <div class="card" style="height: 100%;">
                        <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 1.5rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                            <i class="fas fa-code"></i>
                        </div>
                        <h4 class="card-title">View My Work</h4>
                        <p class="card-text">
                            Browse through my portfolio to see examples of my recent projects.
                        </p>
                        <a href="Projects.aspx" class="btn btn-outline-primary">
                            <i class="fas fa-folder-open" style="margin-right: 0.5rem;"></i>
                            View Portfolio
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Contact-specific styles */
        .contact-form {
            margin-top: 2rem;
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

        /* Error messages */
        .error-message {
            color: #ef4444;
            font-size: 0.85rem;
            margin-top: 0.5rem;
            display: block;
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

        /* Button hover effects */
        .btn:hover {
            transform: translateY(-2px);
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
        .form-group:nth-child(5) { animation-delay: 0.5s; }

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
        // Form validation and enhancement
        document.addEventListener('DOMContentLoaded', function() {
            // Add floating label effect
            const formControls = document.querySelectorAll('.form-control');
            formControls.forEach(control => {
                control.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                control.addEventListener('blur', function() {
                    if (!this.value) {
                        this.parentElement.classList.remove('focused');
                    }
                });
                
                // Check initial values
                if (control.value) {
                    control.parentElement.classList.add('focused');
                }
            });

            // Auto-hide alerts after 5 seconds
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    alert.style.transform = 'translateY(-10px)';
                    setTimeout(() => {
                        alert.style.display = 'none';
                    }, 300);
                }, 5000);
            });
        });

        // Add scroll animations
        function animateOnScroll() {
            const elements = document.querySelectorAll('.card');
            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        }

        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', function() {
            const cards = document.querySelectorAll('.card:not(.form-group .card)');
            cards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease-out';
            });
            
            setTimeout(animateOnScroll, 200);
        });
    </script>
</asp:Content>