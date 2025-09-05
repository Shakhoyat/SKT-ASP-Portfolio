<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="WebApplication1.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Skills Hero Section -->
    <div class="section" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title" style="color: white; margin-bottom: 1rem;">Technical Skills</h1>
                <p style="font-size: 1.2rem; opacity: 0.9; max-width: 600px; margin: 0 auto;">
                    A comprehensive overview of my technical expertise and proficiency levels 
                    across various programming languages, frameworks, and tools.
                </p>
            </div>
        </div>
    </div>

    <!-- Skills Categories -->
    <div class="section">
        <div class="container">
            <!-- Programming Languages -->
            <div class="mb-5">
                <h2 class="section-title">Programming Languages</h2>
                <div class="row">
                    <asp:Repeater ID="rptProgrammingLanguages" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 mb-4">
                                <div class="card">
                                    <div class="skill-item">
                                        <div class="skill-header">
                                            <h4 class="skill-name">
                                                <i class="<%# Eval("IconClass") %>" style="color: <%# Eval("IconColor") %>; margin-right: 0.5rem;"></i>
                                                <%# Eval("SkillName") %>
                                            </h4>
                                            <span class="skill-percentage"><%# Eval("ProficiencyLevel") %>%</span>
                                        </div>
                                        <div class="skill-bar">
                                            <div class="skill-progress" style="width: <%# Eval("ProficiencyLevel") %>%;"></div>
                                        </div>
                                        <p class="skill-description"><%# Eval("Description") %></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- Frameworks & Technologies -->
            <div class="mb-5" style="background-color: #f8f9fa; padding: 3rem 0; margin: 0 -20px;">
                <div class="container">
                    <h2 class="section-title">Frameworks & Technologies</h2>
                    <div class="row">
                        <asp:Repeater ID="rptFrameworks" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4 mb-4">
                                    <div class="card text-center">
                                        <i class="<%# Eval("IconClass") %> fa-3x mb-3" style="color: <%# Eval("IconColor") %>;"></i>
                                        <h4 class="card-title"><%# Eval("SkillName") %></h4>
                                        <div class="skill-level-badge skill-level-<%# Eval("ProficiencyLevel").ToString().ToLower() %>">
                                            <%# GetProficiencyText(Eval("ProficiencyLevel")) %>
                                        </div>
                                        <p class="card-text"><%# Eval("Description") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- Tools & Software -->
            <div class="mb-5">
                <h2 class="section-title">Tools & Software</h2>
                <div class="row">
                    <asp:Repeater ID="rptTools" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3 mb-4">
                                <div class="card text-center tool-card">
                                    <i class="<%# Eval("IconClass") %> fa-2x mb-2" style="color: <%# Eval("IconColor") %>;"></i>
                                    <h5 class="card-title"><%# Eval("SkillName") %></h5>
                                    <p class="card-text small"><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- Soft Skills -->
            <div class="section" style="background-color: #212529; color: white; padding: 3rem 0; margin: 0 -20px;">
                <div class="container">
                    <h2 class="section-title" style="color: white;">Professional Skills</h2>
                    <div class="row">
                        <div class="col-md-3 text-center mb-4">
                            <i class="fas fa-lightbulb fa-3x mb-3" style="color: #ffc107;"></i>
                            <h4 style="color: white;">Problem Solving</h4>
                            <p style="color: #adb5bd;">Analytical thinking and creative solution development</p>
                        </div>
                        <div class="col-md-3 text-center mb-4">
                            <i class="fas fa-users fa-3x mb-3" style="color: #17a2b8;"></i>
                            <h4 style="color: white;">Team Collaboration</h4>
                            <p style="color: #adb5bd;">Effective communication and teamwork</p>
                        </div>
                        <div class="col-md-3 text-center mb-4">
                            <i class="fas fa-clock fa-3x mb-3" style="color: #28a745;"></i>
                            <h4 style="color: white;">Time Management</h4>
                            <p style="color: #adb5bd;">Efficient project planning and execution</p>
                        </div>
                        <div class="col-md-3 text-center mb-4">
                            <i class="fas fa-graduation-cap fa-3x mb-3" style="color: #007bff;"></i>
                            <h4 style="color: white;">Continuous Learning</h4>
                            <p style="color: #adb5bd;">Staying updated with latest technologies</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Skills Summary -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="section-title" style="text-align: left;">Skills Summary</h2>
                    <p style="font-size: 1.1rem; line-height: 1.6; color: #6c757d;">
                        My technical expertise spans across multiple domains of software development. 
                        I'm particularly strong in backend development with ASP.NET and database design with SQL Server. 
                        I also have solid frontend skills and am always eager to learn new technologies.
                    </p>
                    <p style="font-size: 1.1rem; line-height: 1.6; color: #6c757d;">
                        I believe in writing clean, maintainable code and following industry best practices. 
                        My experience includes working on both small projects and large-scale applications.
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <h4 class="card-title">Experience Level</h4>
                        <div style="font-size: 3rem; color: #007bff; font-weight: bold;">
                            <asp:Literal ID="ltlExperienceYears" runat="server" Text="2+" />
                        </div>
                        <p class="card-text">Years of Development Experience</p>
                        <div class="mt-3">
                            <a href="Projects.aspx" class="btn btn-primary">View My Projects</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="section" style="background-color: #f8f9fa;">
        <div class="container text-center">
            <h2 class="section-title">Interested in Working Together?</h2>
            <p style="font-size: 1.1rem; color: #6c757d; margin-bottom: 2rem;">
                I'm always open to discussing new opportunities and challenging projects.
            </p>
            <a href="Contact.aspx" class="btn btn-primary" style="margin-right: 1rem;">Get In Touch</a>
            <a href="Projects.aspx" class="btn btn-secondary">View My Work</a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>