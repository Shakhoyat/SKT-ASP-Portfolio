<%@ Page Title="Session & Cookie Demo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SessionDemo.aspx.cs" Inherits="WebApplication1.SessionDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Content/css/theme-manager.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Demo Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="text-center">
                <h1 class="section-title-ghost" data-text="SESSION DEMO">SESSION & COOKIE DEMO</h1>
                <p class="hero-description">
                    Experience the enhanced portfolio features including theme switching, user preferences, 
                    visit tracking, and personalized user experience powered by sessions and cookies.
                </p>
            </div>
        </div>
    </div>

    <!-- User Status Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="USER STATUS">USER STATUS & PREFERENCES</h2>
            
            <div class="demo-grid">
                <div class="demo-card">
                    <div class="demo-card-header">
                        <i class="fas fa-user-circle"></i>
                        <h3>Session Information</h3>
                    </div>
                    <div class="demo-card-content">
                        <div class="info-item">
                            <span class="info-label">Session ID:</span>
                            <span class="info-value" id="sessionId"><asp:Literal ID="ltlSessionId" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Visit Start:</span>
                            <span class="info-value"><asp:Literal ID="ltlVisitStart" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Time on Site:</span>
                            <span class="info-value" id="timeOnSite"><asp:Literal ID="ltlTimeOnSite" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Pages Viewed:</span>
                            <span class="info-value"><asp:Literal ID="ltlPagesViewed" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Returning Visitor:</span>
                            <span class="info-value status-<%= IsReturningVisitor() ? "yes" : "no" %>">
                                <%= IsReturningVisitor() ? "Yes" : "No" %>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="demo-card">
                    <div class="demo-card-header">
                        <i class="fas fa-cog"></i>
                        <h3>Current Preferences</h3>
                    </div>
                    <div class="demo-card-content">
                        <div class="info-item">
                            <span class="info-label">Theme:</span>
                            <span class="info-value" id="currentTheme"><asp:Literal ID="ltlCurrentTheme" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Language:</span>
                            <span class="info-value" id="currentLanguage"><asp:Literal ID="ltlCurrentLanguage" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Last Visit:</span>
                            <span class="info-value"><asp:Literal ID="ltlLastVisit" runat="server" /></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Device Type:</span>
                            <span class="info-value"><asp:Literal ID="ltlDeviceType" runat="server" /></span>
                        </div>
                    </div>
                </div>

                <div class="demo-card">
                    <div class="demo-card-header">
                        <i class="fas fa-chart-line"></i>
                        <h3>Analytics Data</h3>
                    </div>
                    <div class="demo-card-content">
                        <div class="info-item">
                            <span class="info-label">Total Visitors:</span>
                            <span class="info-value"><%= Application["TotalVisitors"] ?? 0 %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Active Sessions:</span>
                            <span class="info-value"><%= Application["ActiveSessions"] ?? 0 %></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">App Start Time:</span>
                            <span class="info-value">
                                <%= Application["ApplicationStartTime"] != null ? 
                                    ((DateTime)Application["ApplicationStartTime"]).ToString("MMM dd, yyyy HH:mm") : 
                                    "Unknown" %>
                            </span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Browser:</span>
                            <span class="info-value" id="browserInfo"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Interactive Demo Section -->
    <div class="section section-alt">
        <div class="container">
            <h2 class="section-title-ghost" data-text="INTERACTIVE">INTERACTIVE FEATURES</h2>
            
            <div class="demo-actions">
                <div class="action-group">
                    <h4>Theme & Preferences</h4>
                    <div class="action-buttons">
                        <button type="button" class="btn-demo" data-theme-toggle>
                            <i class="fas fa-palette"></i>
                            Toggle Theme
                        </button>
                        <button type="button" class="btn-demo" onclick="setLanguage('es')">
                            <i class="fas fa-language"></i>
                            Set Spanish
                        </button>
                        <button type="button" class="btn-demo" onclick="setLanguage('en')">
                            <i class="fas fa-language"></i>
                            Set English
                        </button>
                    </div>
                </div>

                <div class="action-group">
                    <h4>Data Management</h4>
                    <div class="action-buttons">
                        <button type="button" class="btn-demo" onclick="showRecentProjects()">
                            <i class="fas fa-history"></i>
                            Show Recent Projects
                        </button>
                        <button type="button" class="btn-demo" onclick="trackTestEvent()">
                            <i class="fas fa-chart-bar"></i>
                            Track Test Event
                        </button>
                        <button type="button" class="btn-demo warning" onclick="clearAllData()">
                            <i class="fas fa-trash"></i>
                            Clear All Data
                        </button>
                    </div>
                </div>

                <div class="action-group">
                    <h4>Preferences Demo</h4>
                    <div class="preference-controls">
                        <div class="preference-item">
                            <label for="customPreference">Custom Preference:</label>
                            <input type="text" id="customPreference" placeholder="Enter a value..." />
                            <button type="button" class="btn-demo small" onclick="saveCustomPreference()">Save</button>
                        </div>
                        <div class="preference-item">
                            <label for="notificationToggle">Enable Notifications:</label>
                            <label class="toggle-switch">
                                <input type="checkbox" id="notificationToggle" onchange="toggleNotifications(this.checked)">
                                <span class="toggle-slider"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="section">
        <div class="container">
            <h2 class="section-title-ghost" data-text="ACTIVITY">RECENT ACTIVITY</h2>
            
            <div class="activity-grid">
                <div class="activity-card">
                    <h4>Recent Projects Viewed</h4>
                    <div id="recentProjectsList" class="activity-list">
                        <div class="activity-item">
                            <i class="fas fa-project-diagram"></i>
                            <span>No recent projects viewed</span>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <h4>Page Views This Session</h4>
                    <div class="activity-list">
                        <asp:Repeater ID="rptPageViews" runat="server">
                            <ItemTemplate>
                                <div class="activity-item">
                                    <i class="fas fa-eye"></i>
                                    <span><%# Eval("Page") %></span>
                                    <small><%# Eval("Time") %></small>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="activity-card">
                    <h4>Tracked Events</h4>
                    <div id="trackedEventsList" class="activity-list">
                        <div class="activity-item">
                            <i class="fas fa-chart-line"></i>
                            <span>No events tracked yet</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Status Indicators -->
    <div class="user-status-indicator" id="statusIndicator">
        Session Active
    </div>

    <!-- Recent Projects Widget -->
    <div class="recent-projects-widget" id="recentProjectsWidget">
        <div class="recent-projects-header">
            <h4>Recent Projects</h4>
            <button type="button" class="recent-projects-close" onclick="hideRecentProjects()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div id="recentProjectsContent">
            <div class="recent-project-item">
                <div class="recent-project-icon">
                    <i class="fas fa-folder"></i>
                </div>
                <div class="recent-project-info">
                    <p class="recent-project-title">No recent projects</p>
                    <p class="recent-project-time">View some projects first</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Analytics Panel -->
    <div class="analytics-panel" id="analyticsPanel">
        <div class="analytics-item">
            <span>Scroll Progress:</span>
            <span class="analytics-value" id="scrollProgress">0%</span>
        </div>
        <div class="analytics-item">
            <span>Click Count:</span>
            <span class="analytics-value" id="clickCount">0</span>
        </div>
        <div class="analytics-item">
            <span>Time on Page:</span>
            <span class="analytics-value" id="timeOnPage">0s</span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        .demo-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .demo-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            overflow: hidden;
            transition: var(--transition);
        }

        .demo-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-dark);
        }

        .demo-card-header {
            background: var(--secondary-bg);
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            border-bottom: 1px solid var(--border-color);
        }

        .demo-card-header i {
            font-size: 1.5rem;
            color: var(--accent-color);
        }

        .demo-card-header h3 {
            margin: 0;
            color: var(--text-primary);
        }

        .demo-card-content {
            padding: 1.5rem;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-label {
            color: var(--text-secondary);
            font-weight: 500;
        }

        .info-value {
            color: var(--text-primary);
            font-weight: 600;
        }

        .status-yes {
            color: #27ae60 !important;
        }

        .status-no {
            color: #e74c3c !important;
        }

        .demo-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .action-group {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
        }

        .action-group h4 {
            margin-top: 0;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .btn-demo {
            background: var(--accent-color);
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
        }

        .btn-demo:hover {
            background: #00b894;
            transform: translateY(-2px);
        }

        .btn-demo.warning {
            background: #e74c3c;
        }

        .btn-demo.warning:hover {
            background: #c0392b;
        }

        .btn-demo.small {
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
        }

        .preference-controls {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .preference-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .preference-item label {
            color: var(--text-secondary);
            font-weight: 500;
            min-width: 120px;
        }

        .preference-item input[type="text"] {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background: var(--secondary-bg);
            color: var(--text-primary);
            min-width: 150px;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 25px;
            min-width: 50px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: var(--border-color);
            transition: 0.3s;
            border-radius: 25px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 19px;
            width: 19px;
            left: 3px;
            bottom: 3px;
            background-color: white;
            transition: 0.3s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background-color: var(--accent-color);
        }

        input:checked + .toggle-slider:before {
            transform: translateX(25px);
        }

        .activity-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .activity-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            padding: 2rem;
        }

        .activity-card h4 {
            margin-top: 0;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
        }

        .activity-list {
            max-height: 200px;
            overflow-y: auto;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.8rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-item i {
            color: var(--accent-color);
            width: 20px;
        }

        .activity-item span {
            color: var(--text-secondary);
            flex: 1;
        }

        .activity-item small {
            color: var(--text-muted);
            font-size: 0.8rem;
        }

        @media (max-width: 768px) {
            .demo-grid,
            .demo-actions,
            .activity-grid {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .preference-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .preference-item label {
                min-width: auto;
            }
        }
    </style>

    <script>
        // Demo page JavaScript
        document.addEventListener('DOMContentLoaded', function() {
            // Show status indicator
            setTimeout(() => {
                const indicator = document.getElementById('statusIndicator');
                if (indicator) {
                    indicator.classList.add('show');
                    if (window.PortfolioPreferences && window.PortfolioPreferences.isReturningVisitor) {
                        indicator.classList.add('returning-visitor');
                        indicator.textContent = 'Welcome Back!';
                    }
                }
            }, 1000);

            // Show analytics panel
            setTimeout(() => {
                const panel = document.getElementById('analyticsPanel');
                if (panel) {
                    panel.classList.add('show');
                }
            }, 1500);

            // Update real-time values
            updateRealTimeValues();
            setInterval(updateRealTimeValues, 1000);

            // Track clicks
            let clickCount = 0;
            document.addEventListener('click', function() {
                clickCount++;
                document.getElementById('clickCount').textContent = clickCount;
            });

            // Track scroll
            window.addEventListener('scroll', function() {
                const scrollPercent = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
                document.getElementById('scrollProgress').textContent = Math.min(scrollPercent, 100) + '%';
            });

            // Load recent projects
            loadRecentProjects();

            // Load tracked events
            loadTrackedEvents();
        });

        function updateRealTimeValues() {
            // Update time on page
            if (window.PortfolioTracking) {
                const timeOnPage = Math.round((new Date() - window.PortfolioTracking.pageLoadTime) / 1000);
                document.getElementById('timeOnPage').textContent = timeOnPage + 's';
            }

            // Update browser info
            const browserInfo = navigator.userAgent.split(' ').slice(-2).join(' ');
            document.getElementById('browserInfo').textContent = browserInfo;
        }

        function setLanguage(lang) {
            if (typeof PortfolioManager !== 'undefined') {
                PortfolioManager.setLanguage(lang);
                showNotification('Language updated to ' + (lang === 'es' ? 'Spanish' : 'English'), 'success');
                setTimeout(() => {
                    document.getElementById('currentLanguage').textContent = lang;
                }, 500);
            }
        }

        function showRecentProjects() {
            if (typeof PortfolioManager !== 'undefined') {
                PortfolioManager.getRecentProjects().then(projects => {
                    const widget = document.getElementById('recentProjectsWidget');
                    if (projects.length > 0) {
                        widget.classList.add('show');
                    } else {
                        showNotification('No recent projects found. Visit the Projects page first!', 'info');
                    }
                });
            }
        }

        function hideRecentProjects() {
            document.getElementById('recentProjectsWidget').classList.remove('show');
        }

        function trackTestEvent() {
            if (typeof PortfolioManager !== 'undefined') {
                PortfolioManager.trackEvent('demo_test_event', {
                    timestamp: new Date().toISOString(),
                    page: 'SessionDemo'
                });
                showNotification('Test event tracked successfully!', 'success');
                loadTrackedEvents();
            }
        }

        function clearAllData() {
            if (confirm('This will clear all session and cookie data. Continue?')) {
                fetch('PreferencesHandler.ashx', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'action=cleardata'
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        showNotification('All data cleared successfully!', 'success');
                        setTimeout(() => location.reload(), 2000);
                    } else {
                        showNotification('Error clearing data: ' + data.error, 'error');
                    }
                });
            }
        }

        function saveCustomPreference() {
            const value = document.getElementById('customPreference').value;
            if (value && typeof PortfolioManager !== 'undefined') {
                PortfolioManager.savePreference('customDemo', value);
                showNotification('Custom preference saved!', 'success');
                document.getElementById('customPreference').value = '';
            }
        }

        function toggleNotifications(enabled) {
            if (typeof PortfolioManager !== 'undefined') {
                PortfolioManager.savePreference('notificationsEnabled', enabled);
                showNotification('Notifications ' + (enabled ? 'enabled' : 'disabled'), 'info');
            }
        }

        function loadRecentProjects() {
            if (typeof PortfolioManager !== 'undefined') {
                PortfolioManager.getRecentProjects().then(projects => {
                    const list = document.getElementById('recentProjectsList');
                    if (projects.length > 0) {
                        list.innerHTML = projects.map(project => `
                            <div class="activity-item">
                                <i class="fas fa-project-diagram"></i>
                                <span>${project.Title}</span>
                                <small>${new Date(project.ViewedAt).toLocaleTimeString()}</small>
                            </div>
                        `).join('');
                    }
                });
            }
        }

        function loadTrackedEvents() {
            const events = JSON.parse(sessionStorage.getItem('portfolioEvents') || '[]');
            const list = document.getElementById('trackedEventsList');
            
            if (events.length > 0) {
                list.innerHTML = events.slice(-5).reverse().map(event => `
                    <div class="activity-item">
                        <i class="fas fa-chart-line"></i>
                        <span>${event.event}</span>
                        <small>${new Date(event.timestamp).toLocaleTimeString()}</small>
                    </div>
                `).join('');
            }
        }

        function showNotification(message, type = 'info') {
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            notification.innerHTML = `
                <div class="notification-header">
                    <h4 class="notification-title">${type.charAt(0).toUpperCase() + type.slice(1)}</h4>
                    <button class="notification-close" onclick="this.parentElement.parentElement.remove()">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <p class="notification-message">${message}</p>
            `;
            
            document.body.appendChild(notification);
            setTimeout(() => notification.classList.add('show'), 100);
            setTimeout(() => notification.remove(), 5000);
        }
    </script>
</asp:Content>