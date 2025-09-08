/**
 * Portfolio Preferences and Tracking Library
 * Handles theme switching, user preferences, and analytics
 */
window.PortfolioManager = (function() {
    'use strict';

    // Private variables
    let currentTheme = 'dark';
    let currentLanguage = 'en';
    let initialized = false;
    let trackingEnabled = true;

    // Configuration
    const config = {
        handlerUrl: 'PreferencesHandler.ashx',
        cookiePrefix: 'Portfolio_',
        trackingInterval: 30000, // 30 seconds
        autoSaveInterval: 60000  // 1 minute
    };

    // Initialize the manager
    function init() {
        if (initialized) return;
        
        console.log('Portfolio Manager initializing...');
        
        // Load current preferences
        loadPreferences();
        
        // Set up event listeners
        setupEventListeners();
        
        // Start tracking timers
        if (trackingEnabled) {
            startTracking();
        }
        
        // Apply theme immediately
        applyTheme();
        
        initialized = true;
        console.log('Portfolio Manager initialized');
        
        // Trigger initialization event
        triggerEvent('portfolioManagerInit', { theme: currentTheme, language: currentLanguage });
    }

    // Load preferences from server or local storage
    function loadPreferences() {
        // First check if preferences are available from server-side
        if (window.PortfolioPreferences) {
            currentTheme = window.PortfolioPreferences.theme || 'dark';
            currentLanguage = window.PortfolioPreferences.language || 'en';
        } else {
            // Fallback to local storage
            currentTheme = localStorage.getItem(config.cookiePrefix + 'theme') || 'dark';
            currentLanguage = localStorage.getItem(config.cookiePrefix + 'language') || 'en';
        }
    }

    // Set up event listeners
    function setupEventListeners() {
        // Theme switcher
        document.addEventListener('click', function(e) {
            if (e.target.matches('[data-theme-toggle]')) {
                e.preventDefault();
                toggleTheme();
            }
        });

        // Language switcher
        document.addEventListener('change', function(e) {
            if (e.target.matches('[data-language-selector]')) {
                setLanguage(e.target.value);
            }
        });

        // Track external links
        document.addEventListener('click', function(e) {
            if (e.target.matches('a[href^="http"]:not([href*="' + location.hostname + '"])')) {
                trackEvent('external_link_click', {
                    url: e.target.href,
                    text: e.target.textContent.trim()
                });
            }
        });

        // Track form submissions
        document.addEventListener('submit', function(e) {
            if (e.target.matches('form')) {
                trackEvent('form_submit', {
                    form: e.target.id || e.target.name || 'unnamed',
                    action: e.target.action
                });
            }
        });

        // Track download links
        document.addEventListener('click', function(e) {
            if (e.target.matches('a[download], a[href$=".pdf"], a[href$=".doc"], a[href$=".docx"]')) {
                trackEvent('download_click', {
                    file: e.target.href,
                    type: e.target.href.split('.').pop()
                });
            }
        });

        // Save preferences before page unload
        window.addEventListener('beforeunload', function() {
            savePreferencesToLocalStorage();
        });

        // Visibility change tracking
        document.addEventListener('visibilitychange', function() {
            if (document.visibilityState === 'hidden') {
                trackEvent('page_hidden');
            } else {
                trackEvent('page_visible');
            }
        });
    }

    // Theme management
    function toggleTheme() {
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        setTheme(newTheme);
    }

    function setTheme(theme) {
        if (theme !== 'dark' && theme !== 'light') {
            console.warn('Invalid theme:', theme);
            return;
        }

        currentTheme = theme;
        applyTheme();
        saveThemeToServer(theme);
        trackEvent('theme_changed', { theme: theme });
        
        triggerEvent('themeChanged', { theme: theme });
    }

    function applyTheme() {
        document.documentElement.setAttribute('data-theme', currentTheme);
        document.body.className = document.body.className.replace(/\btheme-\w+/g, '') + ' theme-' + currentTheme;
        
        // Update theme toggle buttons
        const toggles = document.querySelectorAll('[data-theme-toggle]');
        toggles.forEach(toggle => {
            toggle.setAttribute('data-current-theme', currentTheme);
            const icon = toggle.querySelector('i');
            if (icon) {
                icon.className = currentTheme === 'dark' ? 'fas fa-sun' : 'fas fa-moon';
            }
        });

        // Save to localStorage as backup
        localStorage.setItem(config.cookiePrefix + 'theme', currentTheme);
    }

    // Language management
    function setLanguage(language) {
        currentLanguage = language;
        document.documentElement.setAttribute('data-lang', language);
        saveLanguageToServer(language);
        trackEvent('language_changed', { language: language });
        
        triggerEvent('languageChanged', { language: language });
        
        // Save to localStorage as backup
        localStorage.setItem(config.cookiePrefix + 'language', language);
    }

    // Server communication
    function saveThemeToServer(theme) {
        makeRequest('settheme', { theme: theme })
            .then(response => {
                console.log('Theme saved to server:', response);
            })
            .catch(error => {
                console.error('Error saving theme:', error);
            });
    }

    function saveLanguageToServer(language) {
        makeRequest('setlanguage', { language: language })
            .then(response => {
                console.log('Language saved to server:', response);
            })
            .catch(error => {
                console.error('Error saving language:', error);
            });
    }

    function savePreference(key, value) {
        makeRequest('setpreference', { key: key, value: value })
            .then(response => {
                console.log('Preference saved:', response);
            })
            .catch(error => {
                console.error('Error saving preference:', error);
            });
    }

    function trackProjectView(projectId, title) {
        makeRequest('trackproject', { projectId: projectId, title: title })
            .then(response => {
                console.log('Project view tracked:', response);
                triggerEvent('projectTracked', { projectId: projectId, title: title });
            })
            .catch(error => {
                console.error('Error tracking project:', error);
            });
    }

    function getRecentProjects() {
        return makeRequest('getrecentprojects')
            .then(response => {
                return response.data.recentProjects;
            });
    }

    // Tracking functions
    function trackEvent(eventName, data) {
        if (!trackingEnabled) return;
        
        const eventData = {
            event: eventName,
            timestamp: new Date().toISOString(),
            data: data || {},
            page: location.pathname,
            sessionId: getSessionId()
        };
        
        console.log('Tracking event:', eventData);
        
        // Store in sessionStorage for potential server sync
        const events = JSON.parse(sessionStorage.getItem('portfolioEvents') || '[]');
        events.push(eventData);
        
        // Keep only last 50 events
        if (events.length > 50) {
            events.splice(0, events.length - 50);
        }
        
        sessionStorage.setItem('portfolioEvents', JSON.stringify(events));
        
        triggerEvent('eventTracked', eventData);
    }

    function startTracking() {
        // Track scroll depth
        let maxScroll = 0;
        let scrollTimer;
        
        window.addEventListener('scroll', function() {
            clearTimeout(scrollTimer);
            scrollTimer = setTimeout(function() {
                const scrollPercent = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
                if (scrollPercent > maxScroll) {
                    maxScroll = scrollPercent;
                    if (maxScroll % 25 === 0) { // Track at 25%, 50%, 75%, 100%
                        trackEvent('scroll_milestone', { percent: maxScroll });
                    }
                }
            }, 250);
        });

        // Track time milestones
        const timeMarks = [30, 60, 120, 300]; // 30s, 1m, 2m, 5m
        timeMarks.forEach(seconds => {
            setTimeout(() => {
                trackEvent('time_milestone', { seconds: seconds });
            }, seconds * 1000);
        });

        // Auto-save preferences periodically
        setInterval(savePreferencesToLocalStorage, config.autoSaveInterval);
    }

    // Utility functions
    function makeRequest(action, data) {
        const params = new URLSearchParams({ action: action });
        
        if (data) {
            Object.keys(data).forEach(key => {
                params.append(key, data[key]);
            });
        }

        return fetch(config.handlerUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (!data.success) {
                throw new Error(data.error || 'Unknown error');
            }
            return data;
        });
    }

    function savePreferencesToLocalStorage() {
        const preferences = {
            theme: currentTheme,
            language: currentLanguage,
            timestamp: new Date().toISOString()
        };
        localStorage.setItem(config.cookiePrefix + 'preferences', JSON.stringify(preferences));
    }

    function getSessionId() {
        return sessionStorage.getItem('portfolioSessionId') || 
               (Math.random().toString(36).substr(2, 9) + Date.now().toString(36));
    }

    function triggerEvent(eventName, data) {
        const event = new CustomEvent(eventName, { detail: data });
        document.dispatchEvent(event);
    }

    // Public API
    return {
        // Initialization
        init: init,
        
        // Theme management
        getTheme: () => currentTheme,
        setTheme: setTheme,
        toggleTheme: toggleTheme,
        
        // Language management
        getLanguage: () => currentLanguage,
        setLanguage: setLanguage,
        
        // Preferences
        savePreference: savePreference,
        
        // Project tracking
        trackProjectView: trackProjectView,
        getRecentProjects: getRecentProjects,
        
        // Event tracking
        trackEvent: trackEvent,
        enableTracking: () => { trackingEnabled = true; },
        disableTracking: () => { trackingEnabled = false; },
        
        // Utilities
        isInitialized: () => initialized,
        getConfig: () => ({ ...config })
    };
})();

// Auto-initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', PortfolioManager.init);
} else {
    PortfolioManager.init();
}