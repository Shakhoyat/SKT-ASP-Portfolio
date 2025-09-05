<%@ Page Title="Database Setup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatabaseSetup.aspx.cs" Inherits="WebApplication1.DatabaseSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Database Setup Page -->
    <div class="section">
        <div class="container">
            <h1 class="section-title">Database Setup</h1>
            
            <!-- Connection Status -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-database"></i> Database Connection Status
                        </h3>
                        <div id="connectionStatus">
                            <asp:Label ID="lblConnectionStatus" runat="server" CssClass="status-message"></asp:Label>
                        </div>
                        <div style="margin-top: 1rem;">
                            <asp:Button ID="btnTestConnection" runat="server" 
                                        Text="Test Connection" 
                                        CssClass="btn btn-primary" 
                                        OnClick="btnTestConnection_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Database Schema Setup -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-table"></i> Database Schema
                        </h3>
                        <p class="card-text">
                            Create the required database tables for the portfolio application.
                        </p>
                        <div class="mb-3">
                            <strong>Required Tables:</strong>
                            <ul style="margin-top: 0.5rem;">
                                <li>Projects</li>
                                <li>Skills</li>
                                <li>Achievements</li>
                                <li>Education</li>
                                <li>ContactMessages</li>
                            </ul>
                        </div>
                        <asp:Label ID="lblSchemaStatus" runat="server" CssClass="status-message"></asp:Label>
                        <div style="margin-top: 1rem;">
                            <asp:Button ID="btnCreateSchema" runat="server" 
                                        Text="Create Database Schema" 
                                        CssClass="btn btn-secondary" 
                                        OnClick="btnCreateSchema_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-file-import"></i> Sample Data
                        </h3>
                        <p class="card-text">
                            Insert sample projects, skills, and other data to get started quickly.
                        </p>
                        <div class="mb-3">
                            <strong>Sample Data Includes:</strong>
                            <ul style="margin-top: 0.5rem;">
                                <li>4 Sample Projects</li>
                                <li>Programming Skills</li>
                                <li>Framework Skills</li>
                                <li>Tools & Technologies</li>
                            </ul>
                        </div>
                        <asp:Label ID="lblDataStatus" runat="server" CssClass="status-message"></asp:Label>
                        <div style="margin-top: 1rem;">
                            <asp:Button ID="btnInsertSampleData" runat="server" 
                                        Text="Insert Sample Data" 
                                        CssClass="btn btn-secondary" 
                                        OnClick="btnInsertSampleData_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Database Information -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-info-circle"></i> Database Information
                        </h3>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Server:</strong> <asp:Label ID="lblServerName" runat="server"></asp:Label></p>
                                <p><strong>Database:</strong> <asp:Label ID="lblDatabaseName" runat="server"></asp:Label></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Connection String:</strong></p>
                                <div style="background-color: #f8f9fa; padding: 0.5rem; border-radius: 0.25rem; font-family: monospace; font-size: 0.875rem; word-break: break-all;">
                                    <asp:Label ID="lblConnectionString" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Manual Setup Instructions -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-tools"></i> Manual Setup Instructions
                        </h3>
                        <p class="card-text">
                            If the automatic setup doesn't work, you can manually run the SQL script:
                        </p>
                        <ol>
                            <li>Open SQL Server Management Studio</li>
                            <li>Connect to your SQL Server instance: <strong><asp:Label ID="lblManualServer" runat="server"></asp:Label></strong></li>
                            <li>Create a new database named: <strong><asp:Label ID="lblManualDatabase" runat="server"></asp:Label></strong></li>
                            <li>Open and execute the SQL script file: <code>Database/PortfolioSchema.sql</code></li>
                            <li>Refresh this page to verify the setup</li>
                        </ol>
                        <div style="margin-top: 1rem;">
                            <a href="/Database/PortfolioSchema.sql" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-download"></i> Download SQL Script
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-title">
                            <i class="fas fa-bolt"></i> Quick Actions
                        </h3>
                        <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                            <asp:Button ID="btnFullSetup" runat="server" 
                                        Text="Complete Setup (Schema + Data)" 
                                        CssClass="btn btn-primary" 
                                        OnClick="btnFullSetup_Click" />
                            <asp:Button ID="btnResetDatabase" runat="server" 
                                        Text="Reset Database" 
                                        CssClass="btn btn-outline-secondary" 
                                        OnClick="btnResetDatabase_Click" 
                                        OnClientClick="return confirm('Are you sure you want to reset the database? This will delete all data.');" />
                            <a href="Projects.aspx" class="btn btn-secondary">View Projects Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        .status-message {
            padding: 0.5rem;
            border-radius: 0.25rem;
            font-weight: 500;
        }
        .status-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .status-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .status-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeaa7;
        }
        .status-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
    </style>
</asp:Content>