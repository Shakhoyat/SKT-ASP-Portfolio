<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SKT_ASP_Portfolio.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h1 class="display-4">Hi, I'm SKT</h1>
                    <p class="lead">Full Stack Developer & Technology Enthusiast</p>
                    <p class="mb-4">Passionate about creating innovative solutions with modern technologies. 
                       Specialized in .NET development, web applications, and database design.</p>
                    <div class="hero-buttons">
                        <a href="Projects.aspx" class="btn btn-light btn-lg me-3">
                            <i class="fas fa-code"></i> View My Work
                        </a>
                        <a href="Contact.aspx" class="btn btn-outline-light btn-lg">
                            <i class="fas fa-envelope"></i> Get In Touch
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Preview Section -->
    <section class="section bg-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2 class="section-title text-start">About Me</h2>
                    <p class="lead">A passionate developer with expertise in full-stack development.</p>
                    <p>I love creating efficient, scalable, and user-friendly applications. 
                       With a strong foundation in .NET technologies, I bring ideas to life through clean code and innovative solutions.</p>
                    <div class="mb-4">
                        <div class="row">
                            <div class="col-6">
                                <strong><i class="fas fa-map-marker-alt text-primary"></i> Location:</strong><br>
                                <span class="text-muted">Your City, Country</span>
                            </div>
                            <div class="col-6">
                                <strong><i class="fas fa-graduation-cap text-primary"></i> Education:</strong><br>
                                <span class="text-muted">Computer Science</span>
                            </div>
                        </div>
                    </div>
                    <a href="About.aspx" class="btn btn-primary">Learn More About Me</a>
                </div>
                <div class="col-lg-6">
                    <div class="text-center">
                        <img src="Images/profile-placeholder.jpg" alt="SKT Profile" class="img-fluid rounded-circle" style="width: 300px; height: 300px; object-fit: cover; background-color: #e9ecef;">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Preview Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Core Skills</h2>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="skill-item text-center">
                        <div class="skill-icon">
                            <i class="fab fa-microsoft"></i>
                        </div>
                        <h4>.NET Development</h4>
                        <p>ASP.NET, C#, Web Forms, MVC</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="skill-item text-center">
                        <div class="skill-icon">
                            <i class="fas fa-database"></i>
                        </div>
                        <h4>Database Design</h4>
                        <p>SQL Server, T-SQL, Entity Framework</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="skill-item text-center">
                        <div class="skill-icon">
                            <i class="fab fa-html5"></i>
                        </div>
                        <h4>Frontend</h4>
                        <p>HTML5, CSS3, JavaScript, Bootstrap</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="skill-item text-center">
                        <div class="skill-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <h4>Development Tools</h4>
                        <p>Visual Studio, Git, Azure DevOps</p>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <a href="Skills.aspx" class="btn btn-primary">View All Skills</a>
            </div>
        </div>
    </section>

    <!-- Featured Projects Section -->
    <section class="section bg-white">
        <div class="container">
            <h2 class="section-title">Featured Projects</h2>
            <div class="row">
                <asp:Repeater ID="FeaturedProjectsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card project-card h-100">
                                <div class="project-image" style="background-image: url('<%# Eval("ImageUrl") %>')"></div>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Title") %></h5>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <div class="project-tags">
                                        <%# Eval("Technologies") %>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <a href="<%# Eval("DemoUrl") %>" class="btn btn-sm btn-outline-primary me-2" target="_blank">
                                        <i class="fas fa-external-link-alt"></i> Demo
                                    </a>
                                    <a href="<%# Eval("SourceUrl") %>" class="btn btn-sm btn-outline-secondary" target="_blank">
                                        <i class="fab fa-github"></i> Source
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="text-center">
                <a href="Projects.aspx" class="btn btn-primary">View All Projects</a>
            </div>
        </div>
    </section>

    <!-- Contact CTA Section -->
    <section class="section bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h2>Let's Work Together</h2>
                    <p class="lead">Have a project in mind? I'd love to hear about it and discuss how we can bring your ideas to life.</p>
                    <a href="Contact.aspx" class="btn btn-light btn-lg">
                        <i class="fas fa-paper-plane"></i> Start a Conversation
                    </a>
                </div>
            </div>
        </div>
    </section>

</asp:Content>