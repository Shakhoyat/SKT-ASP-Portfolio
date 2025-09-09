<%@ Page Title="Achievements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="WebApplication1.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Achievements Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="ACHIEVEMENTS">MY ACHIEVEMENTS</h1>
                <p class="hero-description">
                    A showcase of my professional accomplishments, certifications, research contributions, and milestones 
                    that demonstrate my expertise in data science, machine learning, and innovative technology solutions. 
                    Each achievement represents dedication, growth, and impact in the tech community.
                </p>
                
                <!-- Dynamic Achievement Overview Stats -->
                <div class="achievements-overview">
                    <asp:Literal ID="ltlTotalAchievements" runat="server"></asp:Literal>
                    <asp:Literal ID="ltlCertifications" runat="server"></asp:Literal>
                    <asp:Literal ID="ltlAwards" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <!-- Filter/Sort Section -->
    <div class="filter-section">
        <div class="container">
            <div class="filter-controls">
                <div class="filter-group">
                    <label for="ddlAchievementType" class="filter-label">Filter by Type:</label>
                    <asp:DropDownList ID="ddlAchievementType" runat="server" CssClass="filter-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlAchievementType_SelectedIndexChanged">
                        <asp:ListItem Text="All Achievements" Value="All" Selected="True" />
                        <asp:ListItem Text="Certifications" Value="Certification" />
                        <asp:ListItem Text="Awards" Value="Award" />
                        <asp:ListItem Text="Research" Value="Research" />
                        <asp:ListItem Text="Expert Status" Value="Expert" />
                        <asp:ListItem Text="Competitions" Value="Competition" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>
                
                <div class="filter-group">
                    <label for="ddlSortOrder" class="filter-label">Sort by:</label>
                    <asp:DropDownList ID="ddlSortOrder" runat="server" CssClass="filter-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlSortOrder_SelectedIndexChanged">
                        <asp:ListItem Text="Most Recent" Value="DateDesc" Selected="True" />
                        <asp:ListItem Text="Oldest First" Value="DateAsc" />
                        <asp:ListItem Text="A-Z" Value="TitleAsc" />
                        <asp:ListItem Text="Z-A" Value="TitleDesc" />
                        <asp:ListItem Text="By Type" Value="Type" />
                    </asp:DropDownList>
                </div>
                
                <div class="results-count">
                    <asp:Literal ID="ltlResultsCount" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <!-- Dynamic Achievements by Type -->
    <asp:PlaceHolder ID="phAchievementSections" runat="server"></asp:PlaceHolder>

    <!-- No Results Message -->
    <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="no-results-panel">
        <div class="container text-center">
            <div class="no-results-content">
                <i class="fas fa-trophy fa-4x"></i>
                <h3>No Achievements Found</h3>
                <p>No achievements match your current filter criteria. Try adjusting your filters or check back later for new achievements.</p>
                <asp:Button ID="btnClearFilters" runat="server" Text="Clear Filters" CssClass="btn-modern btn-primary" OnClick="btnClearFilters_Click" />
            </div>
        </div>
    </asp:Panel>

    <!-- Call to Action -->
    <div class="section">
        <div class="container text-center">
            <h2 class="section-title-ghost" data-text="ACHIEVE MORE">LET'S ACHIEVE MORE</h2>
            <p class="cta-description">
                These achievements represent my journey of continuous learning and innovation. Ready to collaborate 
                on groundbreaking projects? Let's combine our expertise to create solutions that make a real impact.
            </p>
            <div class="cta-buttons">
                <a href="Projects.aspx" class="btn-modern btn-primary">
                    <span>View My Projects</span>
                    <i class="fas fa-folder-open"></i>
                </a>
                <a href="Contact.aspx" class="btn-modern btn-secondary">
                    <span>Start Collaboration</span>
                    <i class="fas fa-handshake"></i>
                </a>
                <a href="https://www.kaggle.com/shakhoyatshujon" target="_blank" class="btn-modern btn-outline">
                    <span>Kaggle Profile</span>
                    <i class="fab fa-kaggle"></i>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Achievements Page Specific Styles */
        .hero-description {
            font-size: 1.2rem;
            line-height: 1.7;
            color: #ccc;
            margin-bottom: 3rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .achievements-overview {
            display: flex;
            gap: 3rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .overview-stat {
            text-align: center;
        }

        .overview-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: #667eea;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(102, 126, 234, 0.3);
        }

        .overview-label {
            font-size: 0.9rem;
            color: #888;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        /* Filter Section */
        .filter-section {
            background: #111;
            padding: 2rem 0;
            border-top: 1px solid #222;
            border-bottom: 1px solid #222;
        }

        .filter-controls {
            display: flex;
            gap: 2rem;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .filter-label {
            color: #ccc;
            font-weight: 500;
            font-size: 0.9rem;
            margin-right: 0.5rem;
        }

        .filter-dropdown {
            background: #1a1a1a;
            border: 1px solid #333;
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9rem;
            min-width: 150px;
            transition: all 0.3s ease;
        }

        .filter-dropdown:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
        }

        .filter-dropdown option {
            background: #1a1a1a;
            color: #fff;
        }

        .results-count {
            color: #888;
            font-size: 0.9rem;
            font-weight: 500;
            margin-left: 1rem;
        }

        /* Achievement Type Sections */
        .achievement-type-section {
            padding: 3rem 0;
            border-top: 1px solid #111;
        }

        .achievement-type-section:first-child {
            border-top: none;
        }

        .type-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .type-title {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .type-description {
            color: #888;
            font-size: 1rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .type-count {
            display: inline-block;
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-top: 1rem;
        }

        /* Achievements Grid */
        .achievements-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .achievement-card {
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            border: 1px solid #333;
            border-radius: 12px;
            padding: 2.5rem;
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .achievement-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .achievement-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(102, 126, 234, 0.3);
            border-color: #667eea;
        }

        .achievement-card:hover::before {
            opacity: 1;
        }

        .achievement-header {
            display: flex;
            align-items: flex-start;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .achievement-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2rem;
            color: white;
            flex-shrink: 0;
            border: 3px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .achievement-card:hover .achievement-icon {
            transform: scale(1.1) rotate(5deg);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        /* Achievement Type Icons */
        .achievement-icon.certification {
            background: linear-gradient(135deg, #0078d4 0%, #005a9e 100%);
        }

        .achievement-icon.award {
            background: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
            color: #333;
        }

        .achievement-icon.research {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .achievement-icon.expert {
            background: linear-gradient(135deg, #20beff 0%, #1da1f2 100%);
        }

        .achievement-icon.competition {
            background: linear-gradient(135deg, #00d4aa 0%, #00b894 100%);
        }

        .achievement-icon.other {
            background: linear-gradient(135deg, #636e72 0%, #2d3436 100%);
        }

        .achievement-info {
            flex: 1;
        }

        .achievement-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
            line-height: 1.3;
        }

        .achievement-card:hover .achievement-title {
            color: #667eea;
        }

        .achievement-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }

        .achievement-organization {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .achievement-date {
            background: #333;
            color: #ccc;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .achievement-type-badge {
            background: rgba(0, 212, 170, 0.1);
            color: #00d4aa;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .achievement-description {
            color: #ccc;
            line-height: 1.6;
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
        }

        .achievement-card:hover .achievement-description {
            color: #fff;
        }

        /* No Results Panel */
        .no-results-panel {
            padding: 4rem 0;
            text-align: center;
        }

        .no-results-content {
            max-width: 500px;
            margin: 0 auto;
        }

        .no-results-content i {
            color: #333;
            margin-bottom: 2rem;
        }

        .no-results-content h3 {
            color: #666;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .no-results-content p {
            color: #888;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        /* CTA Section */
        .cta-description {
            font-size: 1.2rem;
            color: #ccc;
            margin-bottom: 3rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .achievements-overview {
                flex-direction: column;
                gap: 1.5rem;
            }

            .filter-controls {
                flex-direction: column;
                gap: 1rem;
            }

            .filter-group {
                flex-direction: column;
                text-align: center;
                gap: 0.5rem;
            }

            .achievements-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .achievement-header {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .achievement-meta {
                justify-content: center;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn-modern {
                width: 100%;
                max-width: 300px;
            }
        }

        @media (max-width: 480px) {
            .achievement-card {
                padding: 1.5rem;
            }

            .achievement-icon {
                width: 60px;
                height: 60px;
                font-size: 1.8rem;
            }

            .achievement-title {
                font-size: 1.2rem;
            }

            .type-title {
                font-size: 1.5rem;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Animate cards on scroll
            const cards = document.querySelectorAll('.achievement-card');
            
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

            // Animate counter numbers
            const numbers = document.querySelectorAll('.overview-number');
            numbers.forEach(num => {
                const finalValue = num.textContent;
                const numValue = parseInt(finalValue.replace(/[^\d]/g, ''));
                
                if (!isNaN(numValue) && numValue > 0) {
                    let current = 0;
                    const increment = numValue / 50;
                    
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= numValue) {
                            num.textContent = finalValue;
                            clearInterval(timer);
                        } else {
                            const currentNum = Math.floor(current);
                            if (finalValue.includes('+')) {
                                num.textContent = currentNum + '+';
                            } else {
                                num.textContent = currentNum;
                            }
                        }
                    }, 30);
                }
            });
        });
    </script>
</asp:Content>