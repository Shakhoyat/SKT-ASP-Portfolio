<%@ Page Title="Admin - Messages" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminMessages.aspx.cs" Inherits="WebApplication1.AdminMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Admin Messages Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 style="color: white; margin-bottom: 1rem;">Contact Messages</h1>
                    <p style="font-size: 1.2rem; opacity: 0.9; color: white;">
                        View and manage contact form submissions from your portfolio visitors.
                    </p>
                </div>
                <div class="col-md-4 text-right">
                    <a href="AdminDashboard.aspx" class="btn btn-outline-light">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Messages Management -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="admin-header">
                            <h2>Contact Messages</h2>
                            <div class="admin-actions">
                                <asp:Button ID="btnMarkAllRead" runat="server" Text="Mark All Read" 
                                          CssClass="btn btn-outline-primary" OnClick="btnMarkAllRead_Click" />
                                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" 
                                          CssClass="btn btn-outline-primary" OnClick="btnRefresh_Click" />
                            </div>
                        </div>

                        <!-- Messages List -->
                        <div class="admin-content">
                            <asp:Repeater ID="rptMessages" runat="server" OnItemCommand="rptMessages_ItemCommand">
                                <ItemTemplate>
                                    <div class='<%# "message-item " + (!(bool)Eval("IsRead") ? "unread" : "") %>'>
                                        <div class="message-header">
                                            <div class="sender-info">
                                                <div class="sender-avatar">
                                                    <%# GetSenderInitials(Eval("Name").ToString()) %>
                                                </div>
                                                <div class="sender-details">
                                                    <h4><%# Eval("Name") %></h4>
                                                    <div class="contact-info">
                                                        <span class="email">
                                                            <i class="fas fa-envelope"></i>
                                                            <a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
                                                        </span>
                                                        <%# !string.IsNullOrEmpty(Eval("Phone")?.ToString()) ? 
                                                           "<span class=\"phone\"><i class=\"fas fa-phone\"></i>" + Eval("Phone") + "</span>" : "" %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="message-meta">
                                                <div class="message-date">
                                                    <i class="fas fa-calendar"></i>
                                                    <%# Eval("FormattedCreatedDate") %>
                                                </div>
                                                <div class="message-subject">
                                                    <span class="subject-tag"><%# GetSubjectDisplay(Eval("Subject").ToString()) %></span>
                                                </div>
                                                <div class="message-status">
                                                    <%# (bool)Eval("IsRead") ? 
                                                       "<span class=\"status-read\"><i class=\"fas fa-check-circle\"></i> Read</span>" : 
                                                       "<span class=\"status-unread\"><i class=\"fas fa-circle\"></i> Unread</span>" %>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="message-content">
                                            <p><%# Eval("Message") %></p>
                                        </div>
                                        
                                        <div class="message-actions">
                                            <asp:LinkButton ID="btnReply" runat="server" 
                                                          CommandName="Reply" 
                                                          CommandArgument='<%# Eval("ContactMessageId") %>'
                                                          CssClass="btn btn-sm btn-primary">
                                                <i class="fas fa-reply"></i> Reply
                                            </asp:LinkButton>
                                            
                                            <asp:LinkButton ID="btnToggleRead" runat="server" 
                                                          CommandName="ToggleRead" 
                                                          CommandArgument='<%# Eval("ContactMessageId") %>'
                                                          CssClass='<%# "btn btn-sm " + ((bool)Eval("IsRead") ? "btn-outline-secondary" : "btn-success") %>'>
                                                <i class='<%# "fas " + ((bool)Eval("IsRead") ? "fa-eye-slash" : "fa-check") %>'></i>
                                                <%# (bool)Eval("IsRead") ? "Mark Unread" : "Mark Read" %>
                                            </asp:LinkButton>
                                            
                                            <asp:LinkButton ID="btnDelete" runat="server" 
                                                          CommandName="Delete" 
                                                          CommandArgument='<%# Eval("ContactMessageId") %>'
                                                          CssClass="btn btn-sm btn-danger"
                                                          OnClientClick="return confirm('Are you sure you want to delete this message?');">
                                                <i class="fas fa-trash"></i> Delete
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                            <!-- Empty state -->
                            <asp:Panel ID="pnlEmptyState" runat="server" Visible="false">
                                <div class="empty-state">
                                    <i class="fas fa-inbox fa-3x"></i>
                                    <h3>No Messages Yet</h3>
                                    <p>When visitors contact you through the portfolio contact form, their messages will appear here.</p>
                                </div>
                            </asp:Panel>
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
                <div class="col-md-12">
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
        /* Admin Messages specific styles */
        .message-item {
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            background: var(--card-bg);
            transition: var(--transition);
        }

        .message-item:hover {
            box-shadow: var(--shadow-medium);
        }

        .message-item.unread {
            border-left: 4px solid var(--accent-color);
            background: rgba(0, 212, 170, 0.02);
        }

        .message-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }

        .sender-info {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }

        .sender-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            flex-shrink: 0;
        }

        .sender-details h4 {
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            font-size: 1.1rem;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .contact-info span {
            font-size: 0.85rem;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .contact-info a {
            color: var(--accent-color);
            text-decoration: none;
        }

        .contact-info a:hover {
            text-decoration: underline;
        }

        .message-meta {
            text-align: right;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            align-items: flex-end;
        }

        .message-date {
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .subject-tag {
            background: rgba(0, 212, 170, 0.1);
            color: var(--accent-color);
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-read {
            color: var(--text-muted);
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .status-unread {
            color: var(--accent-color);
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
            font-weight: 600;
        }

        .message-content {
            padding: 1.5rem;
        }

        .message-content p {
            color: var(--text-primary);
            line-height: 1.6;
            margin: 0;
            white-space: pre-wrap;
        }

        .message-actions {
            display: flex;
            gap: 0.75rem;
            padding: 1rem 1.5rem;
            background: rgba(0, 212, 170, 0.02);
            border-top: 1px solid var(--border-color);
            justify-content: flex-end;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            border-radius: 6px;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-secondary);
        }

        .empty-state i {
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .empty-state h3 {
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .message-header {
                flex-direction: column;
                gap: 1rem;
            }

            .message-meta {
                align-items: flex-start;
                text-align: left;
            }

            .message-actions {
                flex-wrap: wrap;
                justify-content: center;
            }

            .contact-info {
                flex-direction: column;
            }
        }
    </style>

    <script>
        // Admin Messages enhancements
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

            // Add click to expand message functionality
            const messageItems = document.querySelectorAll('.message-item');
            messageItems.forEach(item => {
                const content = item.querySelector('.message-content');
                const actions = item.querySelector('.message-actions');
                
                // Initially collapse long messages
                if (content && content.scrollHeight > 100) {
                    content.style.maxHeight = '100px';
                    content.style.overflow = 'hidden';
                    content.style.cursor = 'pointer';
                    content.title = 'Click to expand';
                    
                    content.addEventListener('click', function() {
                        if (this.style.maxHeight === '100px') {
                            this.style.maxHeight = 'none';
                            this.title = 'Click to collapse';
                        } else {
                            this.style.maxHeight = '100px';
                            this.title = 'Click to expand';
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>