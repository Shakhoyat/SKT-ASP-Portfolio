<%@ Page Title="Database Setup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatabaseSetup.aspx.cs" Inherits="WebApplication1.DatabaseSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Database Setup Hero -->
    <div class="hero" style="padding: 6rem 0;">
        <div class="container text-center">
            <div style="background: rgba(255,255,255,0.15); width: 120px; height: 120px; border-radius: 50%; margin: 0 auto 2rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem; backdrop-filter: blur(10px); border: 3px solid rgba(255,255,255,0.2);">
                <i class="fas fa-database"></i>
            </div>
            <h1 style="color: white; margin-bottom: 1rem; font-size: 3rem;">Database Setup</h1>
            <p style="color: white; opacity: 0.9; font-size: 1.1rem; max-width: 600px; margin: 0 auto;">
                Configure your portfolio database with just a few clicks. This setup wizard will help you 
                create the necessary tables and populate them with sample data.
            </p>
        </div>
    </div>

    <!-- Setup Steps -->
    <div class="section">
        <div class="container">
            <!-- Connection Status -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem;">
                            <div style="background: rgba(255,255,255,0.2); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.5rem;">
                                <i class="fas fa-wifi"></i>
                            </div>
                            <h3 style="color: white; margin: 0;">Database Connection Status</h3>
                        </div>
                        <div id="connectionStatus">
                            <asp:Label ID="lblConnectionStatus" runat="server" CssClass="status-message"></asp:Label>
                        </div>
                        <div style="margin-top: 1.5rem;">
                            <asp:Button ID="btnTestConnection" runat="server" 
                                        Text="Test Connection" 
                                        CssClass="btn btn-secondary" 
                                        OnClick="btnTestConnection_Click" 
                                        style="background: white; color: var(--primary-color); border: none;" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Setup Options -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem;">
                            <div style="background: var(--gradient-primary); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-table"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Database Schema</h3>
                        </div>
                        <p class="card-text">
                            Create the required database tables for the portfolio application.
                        </p>
                        <div style="background: #f8f9fa; padding: 1rem; border-radius: 8px; margin: 1.5rem 0;">
                            <strong style="color: var(--text-primary);">Required Tables:</strong>
                            <ul style="margin: 0.5rem 0 0 1.5rem; color: var(--text-secondary);">
                                <li>Projects</li>
                                <li>Skills</li>
                                <li>Achievements</li>
                                <li>Education</li>
                                <li>ContactMessages</li>
                            </ul>
                        </div>
                        <asp:Label ID="lblSchemaStatus" runat="server" CssClass="status-message"></asp:Label>
                        <div style="margin-top: 1.5rem;">
                            <asp:Button ID="btnCreateSchema" runat="server" 
                                        Text="Create Database Schema" 
                                        CssClass="btn btn-primary" 
                                        OnClick="btnCreateSchema_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" style="height: 100%;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem;">
                            <div style="background: var(--gradient-accent); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-file-import"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Sample Data</h3>
                        </div>
                        <p class="card-text">
                            Insert sample projects, skills, and other data to get started quickly.
                        </p>
                        <div style="background: #f8f9fa; padding: 1rem; border-radius: 8px; margin: 1.5rem 0;">
                            <strong style="color: var(--text-primary);">Sample Data Includes:</strong>
                            <ul style="margin: 0.5rem 0 0 1.5rem; color: var(--text-secondary);">
                                <li>4 Sample Projects</li>
                                <li>Programming Skills</li>
                                <li>Framework Skills</li>
                                <li>Tools & Technologies</li>
                            </ul>
                        </div>
                        <asp:Label ID="lblDataStatus" runat="server" CssClass="status-message"></asp:Label>
                        <div style="margin-top: 1.5rem;">
                            <asp:Button ID="btnInsertSampleData" runat="server" 
                                        Text="Insert Sample Data" 
                                        CssClass="btn btn-primary" 
                                        OnClick="btnInsertSampleData_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Database Information -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: linear-gradient(135deg, #00b894 0%, #00a085 100%); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-info-circle"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Database Information</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px; margin-bottom: 1rem;">
                                    <p style="margin-bottom: 0.75rem;"><strong>Server:</strong> <asp:Label ID="lblServerName" runat="server" style="color: var(--primary-color); font-weight: 600;"></asp:Label></p>
                                    <p style="margin-bottom: 0;"><strong>Database:</strong> <asp:Label ID="lblDatabaseName" runat="server" style="color: var(--primary-color); font-weight: 600;"></asp:Label></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px;">
                                    <p style="margin-bottom: 0.75rem;"><strong>Connection String:</strong></p>
                                    <div style="background: white; padding: 1rem; border-radius: 6px; font-family: 'Courier New', monospace; font-size: 0.85rem; word-break: break-all; border: 1px solid #e9ecef;">
                                        <asp:Label ID="lblConnectionString" runat="server" style="color: var(--text-secondary);"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card" style="background: linear-gradient(135deg, #fdcb6e 0%, #f39c12 100%); color: white; border: none;">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: rgba(255,255,255,0.2); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.5rem;">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <h3 style="color: white; margin: 0;">Quick Actions</h3>
                        </div>
                        <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                            <asp:Button ID="btnFullSetup" runat="server" 
                                        Text="Complete Setup (Schema + Data)" 
                                        CssClass="btn" 
                                        OnClick="btnFullSetup_Click" 
                                        style="background: white; color: var(--warning); border: none; font-weight: 600;" />
                            <asp:Button ID="btnResetDatabase" runat="server" 
                                        Text="Reset Database" 
                                        CssClass="btn" 
                                        OnClick="btnResetDatabase_Click" 
                                        OnClientClick="return confirm('Are you sure you want to reset the database? This will delete all data.');" 
                                        style="background: rgba(255,255,255,0.2); color: white; border: 2px solid white;" />
                            <a href="Projects.aspx" class="btn" style="background: rgba(255,255,255,0.2); color: white; border: 2px solid white; text-decoration: none;">
                                <i class="fas fa-external-link-alt" style="margin-right: 0.5rem;"></i>
                                View Projects Page
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Manual Setup Instructions -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="background: linear-gradient(135deg, #e84393 0%, #d63384 100%); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem;">
                                <i class="fas fa-tools"></i>
                            </div>
                            <h3 class="card-title" style="margin: 0;">Manual Setup Instructions</h3>
                        </div>
                        <div style="background: #f8f9fa; padding: 2rem; border-radius: 8px; margin-bottom: 2rem;">
                            <p class="card-text" style="margin-bottom: 1.5rem;">
                                If the automatic setup doesn't work, you can manually run the SQL script:
                            </p>
                            <ol style="color: var(--text-secondary); line-height: 1.8;">
                                <li>Open SQL Server Management Studio</li>
                                <li>Connect to your SQL Server instance: <strong style="color: var(--primary-color);"><asp:Label ID="lblManualServer" runat="server"></asp:Label></strong></li>
                                <li>Create a new database named: <strong style="color: var(--primary-color);"><asp:Label ID="lblManualDatabase" runat="server"></asp:Label></strong></li>
                                <li>Open and execute the SQL script file: <code style="background: white; padding: 0.25rem 0.5rem; border-radius: 4px; color: var(--text-primary);">Database/PortfolioSchema.sql</code></li>
                                <li>Refresh this page to verify the setup</li>
                            </ol>
                        </div>
                        <div>
                            <a href="/Database/PortfolioSchema.sql" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-download" style="margin-right: 0.5rem;"></i>
                                Download SQL Script
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        /* Enhanced status message styles for the new theme */
        .status-message {
            padding: 1rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            border: none;
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: block;
            backdrop-filter: blur(10px);
        }

        .status-success {
            background: rgba(0, 184, 148, 0.9);
            color: white;
            box-shadow: 0 4px 15px rgba(0, 184, 148, 0.3);
        }

        .status-error {
            background: rgba(232, 67, 147, 0.9);
            color: white;
            box-shadow: 0 4px 15px rgba(232, 67, 147, 0.3);
        }

        .status-warning {
            background: rgba(253, 203, 110, 0.9);
            color: white;
            box-shadow: 0 4px 15px rgba(253, 203, 110, 0.3);
        }

        .status-info {
            background: rgba(108, 92, 231, 0.9);
            color: white;
            box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
        }

        /* Button hover effects */
        .card .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        /* Card animations */
        .card {
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }
    </style>

    <script>
        // Add smooth animations for status updates
        function animateStatusUpdate(element) {
            element.style.opacity = '0';
            element.style.transform = 'translateY(10px)';
            setTimeout(function() {
                element.style.transition = 'all 0.3s ease';
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }, 100);
        }

        // Auto-refresh status after operations
        document.addEventListener('DOMContentLoaded', function() {
            var statusElements = document.querySelectorAll('.status-message');
            statusElements.forEach(function(element) {
                if (element.textContent.trim()) {
                    animateStatusUpdate(element);
                }
            });
        });
    </script>
</asp:Content>