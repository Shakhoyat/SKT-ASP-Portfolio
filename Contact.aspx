<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SKT_ASP_Portfolio.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Contact Hero Section -->
    <section class="hero-section bg-gradient-success">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4 text-white mb-4">Get In Touch</h1>
                    <p class="lead text-white mb-4">
                        I'm always interested in new opportunities, collaborations, and exciting projects. 
                        Whether you have a question, a project idea, or just want to connect, I'd love to hear from you.
                    </p>
                    <div class="contact-stats">
                        <div class="row justify-content-center">
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="contact-stat">
                                    <i class="fas fa-clock text-white mb-2"></i>
                                    <div class="text-white">
                                        <strong>Response Time</strong><br>
                                        <small>Within 24 hours</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="contact-stat">
                                    <i class="fas fa-globe text-white mb-2"></i>
                                    <div class="text-white">
                                        <strong>Available</strong><br>
                                        <small>Remote & On-site</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="contact-stat">
                                    <i class="fas fa-handshake text-white mb-2"></i>
                                    <div class="text-white">
                                        <strong>Collaboration</strong><br>
                                        <small>Team Projects Welcome</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="contact-stat">
                                    <i class="fas fa-coffee text-white mb-2"></i>
                                    <div class="text-white">
                                        <strong>Consultation</strong><br>
                                        <small>Free Initial Meeting</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="section bg-white">
        <div class="container">
            <div class="row">
                <!-- Contact Form -->
                <div class="col-lg-8 mb-5">
                    <div class="contact-form-container">
                        <h2 class="section-title text-start">Send Me a Message</h2>
                        <p class="text-muted mb-4">Fill out the form below and I'll get back to you as soon as possible.</p>
                        
                        <!-- Success/Error Messages -->
                        <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success" Visible="false">
                            <i class="fas fa-check-circle me-2"></i>
                            <strong>Thank you!</strong> Your message has been sent successfully. I'll respond within 24 hours.
                        </asp:Panel>
                        
                        <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert alert-danger" Visible="false">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Error!</strong> There was a problem sending your message. Please try again.
                        </asp:Panel>

                        <div class="contact-form">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtFirstName" class="form-label">First Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Your first name" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" 
                                        ErrorMessage="First name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="txtLastName" class="form-label">Last Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Your last name" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" 
                                        ErrorMessage="Last name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtEmail" class="form-label">Email Address <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="your.email@example.com" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                        ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                        ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" ErrorMessage="Please enter a valid email address" 
                                        CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="txtPhone" class="form-label">Phone Number</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="(123) 456-7890"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="ddlSubject" class="form-label">Subject <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-select">
                                        <asp:ListItem Value="">Select a subject...</asp:ListItem>
                                        <asp:ListItem Value="General Inquiry">General Inquiry</asp:ListItem>
                                        <asp:ListItem Value="Project Collaboration">Project Collaboration</asp:ListItem>
                                        <asp:ListItem Value="Job Opportunity">Job Opportunity</asp:ListItem>
                                        <asp:ListItem Value="Freelance Work">Freelance Work</asp:ListItem>
                                        <asp:ListItem Value="Technical Question">Technical Question</asp:ListItem>
                                        <asp:ListItem Value="Partnership">Partnership</asp:ListItem>
                                        <asp:ListItem Value="Other">Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject" 
                                        ErrorMessage="Please select a subject" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="ddlPriority" class="form-label">Priority</label>
                                    <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-select">
                                        <asp:ListItem Value="Normal" Selected="True">Normal</asp:ListItem>
                                        <asp:ListItem Value="High">High</asp:ListItem>
                                        <asp:ListItem Value="Urgent">Urgent</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="txtMessage" class="form-label">Message <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" 
                                    placeholder="Please describe your project, question, or how I can help you..." required="true"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                                    ErrorMessage="Message is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="form-text">Minimum 10 characters required.</div>
                            </div>
                            
                            <div class="mb-4">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkCopyEmail" runat="server" CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkCopyEmail">
                                        Send me a copy of this message
                                    </label>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                                <asp:Button ID="btnSendMessage" runat="server" CssClass="btn btn-primary btn-lg me-md-2" 
                                    Text="Send Message" OnClick="btnSendMessage_Click" />
                                <asp:Button ID="btnClear" runat="server" CssClass="btn btn-outline-secondary btn-lg" 
                                    Text="Clear Form" OnClick="btnClear_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Information -->
                <div class="col-lg-4">
                    <div class="contact-info">
                        <h3 class="mb-4">Contact Information</h3>
                        
                        <div class="contact-item mb-4">
                            <div class="contact-icon">
                                <i class="fas fa-envelope text-primary"></i>
                            </div>
                            <div class="contact-details">
                                <h6>Email Address</h6>
                                <p class="text-muted mb-0">skt.portfolio@email.com</p>
                                <small class="text-muted">Best way to reach me</small>
                            </div>
                        </div>
                        
                        <div class="contact-item mb-4">
                            <div class="contact-icon">
                                <i class="fas fa-phone text-primary"></i>
                            </div>
                            <div class="contact-details">
                                <h6>Phone Number</h6>
                                <p class="text-muted mb-0">+1 (555) 123-4567</p>
                                <small class="text-muted">Available 9 AM - 6 PM EST</small>
                            </div>
                        </div>
                        
                        <div class="contact-item mb-4">
                            <div class="contact-icon">
                                <i class="fas fa-map-marker-alt text-primary"></i>
                            </div>
                            <div class="contact-details">
                                <h6>Location</h6>
                                <p class="text-muted mb-0">Your City, Your State</p>
                                <small class="text-muted">Open to remote opportunities</small>
                            </div>
                        </div>
                        
                        <div class="contact-item mb-4">
                            <div class="contact-icon">
                                <i class="fas fa-clock text-primary"></i>
                            </div>
                            <div class="contact-details">
                                <h6>Availability</h6>
                                <p class="text-muted mb-0">Monday - Friday</p>
                                <small class="text-muted">Flexible hours for projects</small>
                            </div>
                        </div>
                        
                        <!-- Social Links -->
                        <div class="social-links-section mt-5">
                            <h6 class="mb-3">Connect With Me</h6>
                            <div class="social-links">
                                <a href="#" class="social-link" target="_blank" data-bs-toggle="tooltip" title="LinkedIn">
                                    <i class="fab fa-linkedin"></i>
                                </a>
                                <a href="#" class="social-link" target="_blank" data-bs-toggle="tooltip" title="GitHub">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="#" class="social-link" target="_blank" data-bs-toggle="tooltip" title="Twitter">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#" class="social-link" target="_blank" data-bs-toggle="tooltip" title="Stack Overflow">
                                    <i class="fab fa-stack-overflow"></i>
                                </a>
                                <a href="#" class="social-link" target="_blank" data-bs-toggle="tooltip" title="Email">
                                    <i class="fas fa-envelope"></i>
                                </a>
                            </div>
                        </div>
                        
                        <!-- Download Resume -->
                        <div class="resume-download mt-4">
                            <a href="#" class="btn btn-outline-primary w-100" target="_blank">
                                <i class="fas fa-download me-2"></i>Download Resume
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Frequently Asked Questions</h2>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="faq1">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">
                                    What types of projects do you work on?
                                </button>
                            </h2>
                            <div id="collapse1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    I specialize in web applications using ASP.NET Web Forms and MVC, database design and development with SQL Server, 
                                    and API development. I work on everything from small business websites to enterprise-level applications.
                                </div>
                            </div>
                        </div>
                        
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="faq2">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">
                                    What is your typical project timeline?
                                </button>
                            </h2>
                            <div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Project timelines vary based on complexity and scope. Small projects typically take 2-4 weeks, 
                                    medium projects 1-3 months, and larger enterprise applications 3-6 months. I provide detailed 
                                    timelines during the planning phase.
                                </div>
                            </div>
                        </div>
                        
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="faq3">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3">
                                    Do you work with teams or individually?
                                </button>
                            </h2>
                            <div id="collapse3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    I'm comfortable working both independently and as part of a team. I have experience collaborating 
                                    with designers, project managers, and other developers using tools like Git, Azure DevOps, and Slack.
                                </div>
                            </div>
                        </div>
                        
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="faq4">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4">
                                    What technologies do you specialize in?
                                </button>
                            </h2>
                            <div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    My core expertise includes C#, ASP.NET Web Forms/MVC, SQL Server, JavaScript, HTML5, CSS3, and Bootstrap. 
                                    I also work with Entity Framework, Web APIs, and various development tools like Visual Studio and Git.
                                </div>
                            </div>
                        </div>
                        
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="faq5">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5">
                                    Are you available for remote work?
                                </button>
                            </h2>
                            <div id="collapse5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Yes! I'm fully equipped for remote work with excellent communication skills and experience with 
                                    remote collaboration tools. I'm also open to on-site work for local projects when needed.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="section bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2>Ready to Start Your Project?</h2>
                    <p class="lead mb-4">
                        Let's discuss your ideas and see how I can help bring them to life. 
                        Every great project starts with a conversation.
                    </p>
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="#" class="btn btn-light btn-lg scroll-to-form">
                            <i class="fas fa-paper-plane"></i> Send Message
                        </a>
                        <a href="Projects.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-eye"></i> View My Work
                        </a>
                        <a href="Skills.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-code"></i> My Skills
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>