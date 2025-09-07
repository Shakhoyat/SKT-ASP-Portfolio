<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Contact Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="GET IN TOUCH">GET IN TOUCH</h1>
                <p class="hero-description">
                    Ready to start your next data science project? Need help with machine learning models or IoT systems? 
                    I'd love to discuss how we can transform your ideas into intelligent solutions that make a real impact.
                </p>
                <div class="contact-overview">
                    <div class="overview-stat">
                        <div class="overview-number">24h</div>
                        <div class="overview-label">Response Time</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">100+</div>
                        <div class="overview-label">Happy Clients</div>
                    </div>
                    <div class="overview-stat">
                        <div class="overview-number">5?</div>
                        <div class="overview-label">Average Rating</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Methods -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="CONNECT">WAYS TO CONNECT</h2>
            <div class="contact-methods">
                <div class="contact-method email">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email Me</h3>
                    <p>Best for project inquiries and detailed discussions</p>
                    <a href="mailto:skt104.shujon@gmail.com" class="contact-link">
                        skt104.shujon@gmail.com
                    </a>
                    <div class="contact-availability">Available 24/7</div>
                </div>
                
                <div class="contact-method linkedin">
                    <div class="contact-icon">
                        <i class="fab fa-linkedin"></i>
                    </div>
                    <h3>LinkedIn</h3>
                    <p>Connect for professional networking and opportunities</p>
                    <a href="https://www.linkedin.com/in/shakhoyat-shujon-313ba5336/" target="_blank" class="contact-link">
                        Professional Profile
                    </a>
                    <div class="contact-availability">Professional Network</div>
                </div>
                
                <div class="contact-method github">
                    <div class="contact-icon">
                        <i class="fab fa-github"></i>
                    </div>
                    <h3>GitHub</h3>
                    <p>Explore my code, contribute to projects, or discuss technical details</p>
                    <a href="https://github.com/Shakhoyat" target="_blank" class="contact-link">
                        View My Repositories
                    </a>
                    <div class="contact-availability">Open Source</div>
                </div>

                <div class="contact-method kaggle">
                    <div class="contact-icon">
                        <i class="fab fa-kaggle"></i>
                    </div>
                    <h3>Kaggle</h3>
                    <p>Connect on data science competitions and datasets</p>
                    <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="contact-link">
                        Kaggle Expert Profile
                    </a>
                    <div class="contact-availability">Data Science Community</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Form -->
    <div class="section section-alt">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="contact-form-container">
                        <div class="form-header">
                            <h2 class="section-title-ghost" data-text="MESSAGE">SEND A MESSAGE</h2>
                            <p class="form-subtitle">
                                Fill out the form below and I'll get back to you within 24 hours. 
                                For urgent matters, feel free to email me directly.
                            </p>
                        </div>
                        
                        <!-- Contact Form -->
                        <div class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtName" class="form-label">Full Name *</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                                                  ControlToValidate="txtName" 
                                                                  ErrorMessage="Name is required" 
                                                                  CssClass="error-message" 
                                                                  Display="Dynamic" 
                                                                  ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtEmail" class="form-label">Email Address *</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="your.email@example.com"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                                                  ControlToValidate="txtEmail" 
                                                                  ErrorMessage="Email is required" 
                                                                  CssClass="error-message" 
                                                                  Display="Dynamic" 
                                                                  ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                                                      ControlToValidate="txtEmail" 
                                                                      ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$" 
                                                                      ErrorMessage="Please enter a valid email address" 
                                                                      CssClass="error-message" 
                                                                      Display="Dynamic" 
                                                                      ValidationGroup="ContactForm"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtPhone" class="form-label">Phone Number</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+1 (555) 123-4567"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ddlSubject" class="form-label">Project Type *</label>
                                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">Select project type</asp:ListItem>
                                            <asp:ListItem Value="datascience">Data Science & Analytics</asp:ListItem>
                                            <asp:ListItem Value="machinelearning">Machine Learning & AI</asp:ListItem>
                                            <asp:ListItem Value="iot">IoT & Edge Computing</asp:ListItem>
                                            <asp:ListItem Value="web">Web Development</asp:ListItem>
                                            <asp:ListItem Value="research">Research Collaboration</asp:ListItem>
                                            <asp:ListItem Value="consultation">Technical Consultation</asp:ListItem>
                                            <asp:ListItem Value="other">Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                                                                  ControlToValidate="ddlSubject" 
                                                                  ErrorMessage="Please select a project type" 
                                                                  CssClass="error-message" 
                                                                  Display="Dynamic" 
                                                                  ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="txtMessage" class="form-label">Project Details *</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                           Rows="6" placeholder="Tell me about your project requirements, goals, and timeline. Be as detailed as possible to help me understand your needs better."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                                                          ControlToValidate="txtMessage" 
                                                          ErrorMessage="Project details are required" 
                                                          CssClass="error-message" 
                                                          Display="Dynamic" 
                                                          ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="form-group text-center">
                                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" 
                                          CssClass="btn-modern btn-primary send-btn" OnClick="btnSendMessage_Click" 
                                          ValidationGroup="ContactForm" />
                            </div>
                            
                            <!-- Success/Error Messages -->
                            <div class="form-messages">
                                <asp:Panel ID="pnlSuccess" runat="server" CssClass="alert alert-success" Visible="false">
                                    <i class="fas fa-check-circle"></i>
                                    <strong>Message Sent Successfully!</strong> Thank you for reaching out. I'll review your project details and get back to you within 24 hours.
                                </asp:Panel>
                                
                                <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-error" Visible="false">
                                    <i class="fas fa-exclamation-circle"></i>
                                    <strong>Error Sending Message!</strong> There was a technical issue. Please try again or email me directly at skt104.shujon@gmail.com
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Additional Resources -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="RESOURCES">ADDITIONAL RESOURCES</h2>
            <div class="resources-grid">
                <div class="resource-card">
                    <div class="resource-icon portfolio">
                        <i class="fas fa-folder-open"></i>
                    </div>
                    <h3>View My Portfolio</h3>
                    <p>
                        Explore my latest projects in data science, machine learning, and IoT systems. 
                        See real examples of solutions I've built.
                    </p>
                    <a href="Projects.aspx" class="btn-modern btn-outline">
                        <span>Browse Projects</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="resource-card">
                    <div class="resource-icon resume">
                        <i class="fas fa-file-download"></i>
                    </div>
                    <h3>Download Resume</h3>
                    <p>
                        Get a comprehensive overview of my experience, technical skills, education, 
                        and achievements in data science and software development.
                    </p>
                    <a href="/Content/docs/resume.pdf" target="_blank" class="btn-modern btn-outline">
                        <span>Download CV</span>
                        <i class="fas fa-download"></i>
                    </a>
                </div>
                
                <div class="resource-card">
                    <div class="resource-icon calendar">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3>Schedule a Call</h3>
                    <p>
                        Prefer to discuss your project over a call? Let's schedule a 30-minute 
                        consultation to dive deep into your requirements.
                    </p>
                    <a href="mailto:skt104.shujon@gmail.com?subject=Schedule Project Consultation&body=I'd like to schedule a call to discuss my project. Here are my preferred times:%0A%0A" class="btn-modern btn-outline">
                        <span>Schedule Now</span>
                        <i class="fas fa-phone"></i>
                    </a>
                </div>
                
                <div class="resource-card">
                    <div class="resource-icon skills">
                        <i class="fas fa-tools"></i>
                    </div>
                    <h3>Technical Skills</h3>
                    <p>
                        Review my technical expertise across data science, machine learning, 
                        web development, and IoT technologies with proficiency levels.
                    </p>
                    <a href="Skills.aspx" class="btn-modern btn-outline">
                        <span>View Skills</span>
                        <i class="fas fa-chart-bar"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="FAQ">FREQUENTLY ASKED</h2>
            <div class="faq-grid">
                <div class="faq-item">
                    <h4>What's your typical response time?</h4>
                    <p>I respond to all inquiries within 24 hours, usually much sooner. For urgent projects, feel free to email me directly.</p>
                </div>
                <div class="faq-item">
                    <h4>Do you work on remote projects?</h4>
                    <p>Yes! I work with clients globally and am experienced in remote collaboration using modern tools and communication platforms.</p>
                </div>
                <div class="faq-item">
                    <h4>What types of projects do you prefer?</h4>
                    <p>I'm passionate about data science, machine learning, IoT systems, and research projects that solve real-world problems and create meaningful impact.</p>
                </div>
                <div class="faq-item">
                    <h4>Can you help with existing projects?</h4>
                    <p>Absolutely! I can help optimize existing models, debug code, improve performance, or add new features to your current projects.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Contact Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: var(--text-secondary);
            margin-bottom: 3rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .contact-overview {
            display: flex;
            gap: 3rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .overview-stat {
            text-align: center;
        }

        .overview-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }

        .overview-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        /* Contact Methods */
        .contact-methods {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .contact-method {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2.5rem 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .contact-method:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-dark);
            border-color: var(--accent-color);
        }

        .contact-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: white;
        }

        .contact-method.email .contact-icon {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .contact-method.linkedin .contact-icon {
            background: linear-gradient(135deg, #0077b5 0%, #005885 100%);
        }

        .contact-method.github .contact-icon {
            background: linear-gradient(135deg, #333 0%, #555 100%);
        }

        .contact-method.kaggle .contact-icon {
            background: linear-gradient(135deg, #20beff 0%, #1a9ce8 100%);
        }

        .contact-method h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .contact-method p {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .contact-link {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
            display: block;
            margin-bottom: 1rem;
            transition: var(--transition);
        }

        .contact-link:hover {
            color: var(--text-primary);
            text-decoration: none;
        }

        .contact-availability {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.4rem 1rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }

        /* Contact Form Container */
        .contact-form-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 3rem;
            margin-top: 3rem;
        }

        .form-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .form-subtitle {
            font-size: 1.1rem;
            color: var(--text-secondary);
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Form Styles */
        .contact-form {
            margin-top: 2rem;
        }

        .form-group {
            margin-bottom: 2rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.75rem;
            font-weight: 600;
            color: var(--text-primary);
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 1.2rem 1.5rem;
            border: 2px solid var(--border-color);
            border-radius: var(--border-radius);
            font-size: 1rem;
            background: var(--primary-bg);
            color: var(--text-primary);
            transition: var(--transition);
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 4px rgba(0, 212, 170, 0.1);
            background: var(--card-bg);
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .send-btn {
            padding: 1.2rem 3rem !important;
            font-size: 1.1rem !important;
            font-weight: 600 !important;
        }

        /* Error Messages */
        .error-message {
            color: #ef4444;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: block;
            font-weight: 500;
        }

        /* Alert Styles */
        .alert {
            padding: 1.5rem 2rem;
            border-radius: var(--border-radius);
            margin-top: 2rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 1rem;
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

        /* Resources Grid */
        .resources-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .resource-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2.5rem 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .resource-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
            border-color: var(--accent-color);
        }

        .resource-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 1.8rem;
            color: white;
        }

        .resource-icon.portfolio {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .resource-icon.resume {
            background: linear-gradient(135deg, #FFA726 0%, #FB8C00 100%);
        }

        .resource-icon.calendar {
            background: linear-gradient(135deg, #00b894 0%, #00a085 100%);
        }

        .resource-icon.skills {
            background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%);
        }

        .resource-card h3 {
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .resource-card p {
            color: var(--text-secondary);
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        /* FAQ Grid */
        .faq-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .faq-item {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
            transition: var(--transition);
        }

        .faq-item:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-light);
            border-color: var(--accent-color);
        }

        .faq-item h4 {
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        .faq-item p {
            color: var(--text-secondary);
            line-height: 1.6;
            margin: 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .contact-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .contact-methods,
            .resources-grid,
            .faq-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .contact-form-container {
                padding: 2rem 1.5rem;
            }

            .form-control {
                padding: 1rem 1.25rem;
            }

            .send-btn {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Animate cards on scroll
            const cards = document.querySelectorAll('.contact-method, .resource-card, .faq-item');
            
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);

            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = `all 0.6s ease-out ${index * 0.1}s`;
                observer.observe(card);
            });

            // Form enhancement
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
                if (alert.style.display !== 'none') {
                    setTimeout(() => {
                        alert.style.opacity = '0';
                        alert.style.transform = 'translateY(-10px)';
                        setTimeout(() => {
                            alert.style.display = 'none';
                        }, 300);
                    }, 6000);
                }
            });

            // Animate counter numbers
            const numbers = document.querySelectorAll('.overview-number');
            numbers.forEach(num => {
                const finalValue = num.textContent;
                if (finalValue.includes('?') || finalValue.includes('h')) {
                    return; // Skip non-numeric values
                }
                
                const numValue = parseInt(finalValue.replace('+', ''));
                if (!isNaN(numValue)) {
                    let current = 0;
                    const increment = numValue / 50;
                    
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= numValue) {
                            num.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            num.textContent = Math.floor(current) + (finalValue.includes('+') ? '+' : '');
                        }
                    }, 30);
                }
            });
        });
    </script>
</asp:Content>