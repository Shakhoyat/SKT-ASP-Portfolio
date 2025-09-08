using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Comprehensive session and cookie management for the portfolio
/// Handles user preferences, tracking, and enhanced user experience
/// </summary>
public static class SessionCookieManager
{
    #region Session Constants
    private const string SESSION_USER_PREFERENCES = "UserPreferences";
    private const string SESSION_VISIT_DATA = "VisitData";
    private const string SESSION_VIEWED_PROJECTS = "ViewedProjects";
    private const string SESSION_CONTACT_ATTEMPTS = "ContactAttempts";
    private const string SESSION_THEME_PREFERENCE = "ThemePreference";
    private const string SESSION_LANGUAGE_PREFERENCE = "LanguagePreference";
    private const string SESSION_PORTFOLIO_ANALYTICS = "PortfolioAnalytics";
    #endregion

    #region Cookie Constants
    private const string COOKIE_USER_PREFERENCES = "PortfolioPrefs";
    private const string COOKIE_RECENT_PROJECTS = "RecentProjects";
    private const string COOKIE_VISIT_HISTORY = "VisitHistory";
    private const string COOKIE_THEME = "PortfolioTheme";
    private const string COOKIE_LANGUAGE = "PortfolioLang";
    private const string COOKIE_ANALYTICS_ID = "PortfolioAnalytics";
    private const string COOKIE_LAST_VISIT = "LastVisit";
    #endregion

    #region User Preferences Management

    /// <summary>
    /// Get user preferences from session/cookies
    /// </summary>
    public static UserPreferences GetUserPreferences()
    {
        var prefs = HttpContext.Current.Session[SESSION_USER_PREFERENCES] as UserPreferences;
        if (prefs == null)
        {
            prefs = LoadPreferencesFromCookie() ?? new UserPreferences();
            HttpContext.Current.Session[SESSION_USER_PREFERENCES] = prefs;
        }
        return prefs;
    }

    /// <summary>
    /// Save user preferences to session and cookies
    /// </summary>
    public static void SaveUserPreferences(UserPreferences preferences)
    {
        HttpContext.Current.Session[SESSION_USER_PREFERENCES] = preferences;
        SavePreferencesToCookie(preferences);
    }

    /// <summary>
    /// Update specific preference
    /// </summary>
    public static void UpdatePreference(string key, object value)
    {
        var prefs = GetUserPreferences();
        prefs.SetPreference(key, value);
        SaveUserPreferences(prefs);
    }

    #endregion

    #region Theme Management

    /// <summary>
    /// Get current theme preference
    /// </summary>
    public static string GetThemePreference()
    {
        // Check session first
        var theme = HttpContext.Current.Session[SESSION_THEME_PREFERENCE] as string;
        if (string.IsNullOrEmpty(theme))
        {
            // Check cookie
            var cookie = HttpContext.Current.Request.Cookies[COOKIE_THEME];
            theme = cookie?.Value ?? "dark"; // Default to dark theme
            HttpContext.Current.Session[SESSION_THEME_PREFERENCE] = theme;
        }
        return theme;
    }

    /// <summary>
    /// Set theme preference
    /// </summary>
    public static void SetThemePreference(string theme)
    {
        HttpContext.Current.Session[SESSION_THEME_PREFERENCE] = theme;
        
        var cookie = new HttpCookie(COOKIE_THEME, theme)
        {
            Expires = DateTime.Now.AddYears(1),
            HttpOnly = false // Allow JavaScript access for theme switching
        };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    #endregion

    #region Language Management

    /// <summary>
    /// Get language preference
    /// </summary>
    public static string GetLanguagePreference()
    {
        var lang = HttpContext.Current.Session[SESSION_LANGUAGE_PREFERENCE] as string;
        if (string.IsNullOrEmpty(lang))
        {
            var cookie = HttpContext.Current.Request.Cookies[COOKIE_LANGUAGE];
            lang = cookie?.Value ?? "en"; // Default to English
            HttpContext.Current.Session[SESSION_LANGUAGE_PREFERENCE] = lang;
        }
        return lang;
    }

    /// <summary>
    /// Set language preference
    /// </summary>
    public static void SetLanguagePreference(string language)
    {
        HttpContext.Current.Session[SESSION_LANGUAGE_PREFERENCE] = language;
        
        var cookie = new HttpCookie(COOKIE_LANGUAGE, language)
        {
            Expires = DateTime.Now.AddYears(1),
            HttpOnly = true
        };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    #endregion

    #region Visit Tracking

    /// <summary>
    /// Initialize visit data for new session
    /// </summary>
    public static void InitializeVisit()
    {
        var visitData = new VisitData
        {
            SessionId = HttpContext.Current.Session.SessionID,
            StartTime = DateTime.Now,
            LastActivity = DateTime.Now,
            PagesViewed = new List<string>(),
            UserAgent = HttpContext.Current.Request.UserAgent,
            IPAddress = GetClientIP(),
            Referrer = HttpContext.Current.Request.UrlReferrer?.ToString()
        };

        HttpContext.Current.Session[SESSION_VISIT_DATA] = visitData;
        SetLastVisitCookie();
    }

    /// <summary>
    /// Track page view
    /// </summary>
    public static void TrackPageView(string pageName)
    {
        var visitData = GetVisitData();
        if (visitData != null)
        {
            visitData.LastActivity = DateTime.Now;
            visitData.PagesViewed.Add($"{pageName}|{DateTime.Now:HH:mm:ss}");
            visitData.PageViewCount++;
        }
    }

    /// <summary>
    /// Get current visit data
    /// </summary>
    public static VisitData GetVisitData()
    {
        return HttpContext.Current.Session[SESSION_VISIT_DATA] as VisitData;
    }

    #endregion

    #region Project Tracking

    /// <summary>
    /// Track viewed project
    /// </summary>
    public static void TrackProjectView(int projectId, string projectTitle)
    {
        // Session tracking
        var viewedProjects = HttpContext.Current.Session[SESSION_VIEWED_PROJECTS] as List<int> ?? new List<int>();
        if (!viewedProjects.Contains(projectId))
        {
            viewedProjects.Add(projectId);
            HttpContext.Current.Session[SESSION_VIEWED_PROJECTS] = viewedProjects;
        }

        // Cookie tracking for recent projects
        var recentProjects = GetRecentProjects();
        var projectInfo = new RecentProject
        {
            ProjectId = projectId,
            Title = projectTitle,
            ViewedAt = DateTime.Now
        };

        // Remove if already exists and add to front
        recentProjects.RemoveAll(p => p.ProjectId == projectId);
        recentProjects.Insert(0, projectInfo);

        // Keep only last 5 projects
        if (recentProjects.Count > 5)
        {
            recentProjects = recentProjects.GetRange(0, 5);
        }

        SaveRecentProjects(recentProjects);
    }

    /// <summary>
    /// Get recently viewed projects
    /// </summary>
    public static List<RecentProject> GetRecentProjects()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_RECENT_PROJECTS];
        if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
        {
            try
            {
                var serializer = new JavaScriptSerializer();
                return serializer.Deserialize<List<RecentProject>>(cookie.Value) ?? new List<RecentProject>();
            }
            catch
            {
                return new List<RecentProject>();
            }
        }
        return new List<RecentProject>();
    }

    #endregion

    #region Contact Form Tracking

    /// <summary>
    /// Track contact form submission attempt
    /// </summary>
    public static void TrackContactAttempt(bool successful, string email = null)
    {
        var attempts = HttpContext.Current.Session[SESSION_CONTACT_ATTEMPTS] as List<ContactAttempt> ?? new List<ContactAttempt>();
        
        attempts.Add(new ContactAttempt
        {
            Timestamp = DateTime.Now,
            Successful = successful,
            Email = email,
            IPAddress = GetClientIP()
        });

        // Keep only last 10 attempts
        if (attempts.Count > 10)
        {
            attempts = attempts.GetRange(attempts.Count - 10, 10);
        }

        HttpContext.Current.Session[SESSION_CONTACT_ATTEMPTS] = attempts;
    }

    /// <summary>
    /// Check if user has exceeded contact attempts
    /// </summary>
    public static bool HasExceededContactLimit()
    {
        var attempts = HttpContext.Current.Session[SESSION_CONTACT_ATTEMPTS] as List<ContactAttempt> ?? new List<ContactAttempt>();
        var recentAttempts = attempts.Where(a => a.Timestamp > DateTime.Now.AddMinutes(-15)).ToList().Count;
        return recentAttempts >= 3; // Max 3 attempts per 15 minutes
    }

    #endregion

    #region Analytics

    /// <summary>
    /// Initialize analytics for session
    /// </summary>
    public static void InitializeAnalytics()
    {
        var analyticsId = GetOrCreateAnalyticsId();
        var analytics = new PortfolioAnalytics
        {
            AnalyticsId = analyticsId,
            SessionStart = DateTime.Now,
            TimeOnSite = TimeSpan.Zero,
            BounceRate = 0,
            DeviceInfo = GetDeviceInfo()
        };

        HttpContext.Current.Session[SESSION_PORTFOLIO_ANALYTICS] = analytics;
    }

    /// <summary>
    /// Update analytics data
    /// </summary>
    public static void UpdateAnalytics()
    {
        var analytics = HttpContext.Current.Session[SESSION_PORTFOLIO_ANALYTICS] as PortfolioAnalytics;
        if (analytics != null)
        {
            analytics.TimeOnSite = DateTime.Now - analytics.SessionStart;
            var visitData = GetVisitData();
            if (visitData != null)
            {
                analytics.BounceRate = visitData.PageViewCount <= 1 ? 100 : 0;
            }
        }
    }

    #endregion

    #region Helper Methods

    /// <summary>
    /// Get client IP address
    /// </summary>
    private static string GetClientIP()
    {
        string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        return ip ?? "Unknown";
    }

    /// <summary>
    /// Load preferences from cookie
    /// </summary>
    private static UserPreferences LoadPreferencesFromCookie()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_USER_PREFERENCES];
        if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
        {
            try
            {
                var serializer = new JavaScriptSerializer();
                return serializer.Deserialize<UserPreferences>(cookie.Value);
            }
            catch
            {
                return null;
            }
        }
        return null;
    }

    /// <summary>
    /// Save preferences to cookie
    /// </summary>
    private static void SavePreferencesToCookie(UserPreferences preferences)
    {
        try
        {
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(preferences);
            
            var cookie = new HttpCookie(COOKIE_USER_PREFERENCES, json)
            {
                Expires = DateTime.Now.AddYears(1),
                HttpOnly = true
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Error saving preferences to cookie: {ex.Message}");
        }
    }

    /// <summary>
    /// Save recent projects to cookie
    /// </summary>
    private static void SaveRecentProjects(List<RecentProject> projects)
    {
        try
        {
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(projects);
            
            var cookie = new HttpCookie(COOKIE_RECENT_PROJECTS, json)
            {
                Expires = DateTime.Now.AddDays(30),
                HttpOnly = true
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Error saving recent projects: {ex.Message}");
        }
    }

    /// <summary>
    /// Set last visit cookie
    /// </summary>
    private static void SetLastVisitCookie()
    {
        var cookie = new HttpCookie(COOKIE_LAST_VISIT, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
        {
            Expires = DateTime.Now.AddYears(1),
            HttpOnly = true
        };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    /// <summary>
    /// Get or create analytics ID
    /// </summary>
    private static string GetOrCreateAnalyticsId()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_ANALYTICS_ID];
        if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
        {
            return cookie.Value;
        }

        var analyticsId = Guid.NewGuid().ToString();
        var newCookie = new HttpCookie(COOKIE_ANALYTICS_ID, analyticsId)
        {
            Expires = DateTime.Now.AddYears(2),
            HttpOnly = true
        };
        HttpContext.Current.Response.Cookies.Add(newCookie);
        return analyticsId;
    }

    /// <summary>
    /// Get device information
    /// </summary>
    private static string GetDeviceInfo()
    {
        var userAgent = HttpContext.Current.Request.UserAgent ?? "";
        
        if (userAgent.Contains("Mobile") || userAgent.Contains("Android") || userAgent.Contains("iPhone"))
            return "Mobile";
        else if (userAgent.Contains("Tablet") || userAgent.Contains("iPad"))
            return "Tablet";
        else
            return "Desktop";
    }

    /// <summary>
    /// Get last visit date
    /// </summary>
    public static DateTime? GetLastVisit()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_LAST_VISIT];
        if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
        {
            if (DateTime.TryParse(cookie.Value, out DateTime lastVisit))
            {
                return lastVisit;
            }
        }
        return null;
    }

    /// <summary>
    /// Clear all session and cookie data
    /// </summary>
    public static void ClearAllData()
    {
        // Clear session
        HttpContext.Current.Session.Clear();

        // Clear cookies
        var cookieNames = new[] 
        { 
            COOKIE_USER_PREFERENCES, COOKIE_RECENT_PROJECTS, COOKIE_VISIT_HISTORY,
            COOKIE_THEME, COOKIE_LANGUAGE, COOKIE_ANALYTICS_ID, COOKIE_LAST_VISIT
        };

        foreach (var cookieName in cookieNames)
        {
            var cookie = new HttpCookie(cookieName)
            {
                Expires = DateTime.Now.AddDays(-1)
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
    }

    #endregion
}

#region Data Models

/// <summary>
/// User preferences data model
/// </summary>
public class UserPreferences
{
    public Dictionary<string, object> Preferences { get; set; }
    public DateTime LastUpdated { get; set; }

    public UserPreferences()
    {
        Preferences = new Dictionary<string, object>();
        LastUpdated = DateTime.Now;
    }

    public void SetPreference(string key, object value)
    {
        Preferences[key] = value;
        LastUpdated = DateTime.Now;
    }

    public T GetPreference<T>(string key, T defaultValue = default(T))
    {
        if (Preferences.ContainsKey(key))
        {
            try
            {
                return (T)Preferences[key];
            }
            catch
            {
                return defaultValue;
            }
        }
        return defaultValue;
    }
}

/// <summary>
/// Visit data model
/// </summary>
public class VisitData
{
    public string SessionId { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime LastActivity { get; set; }
    public List<string> PagesViewed { get; set; }
    public int PageViewCount { get; set; }
    public string UserAgent { get; set; }
    public string IPAddress { get; set; }
    public string Referrer { get; set; }

    public VisitData()
    {
        PagesViewed = new List<string>();
        PageViewCount = 0;
    }

    public TimeSpan SessionDuration => LastActivity - StartTime;
}

/// <summary>
/// Recent project model
/// </summary>
public class RecentProject
{
    public int ProjectId { get; set; }
    public string Title { get; set; }
    public DateTime ViewedAt { get; set; }
}

/// <summary>
/// Contact attempt model
/// </summary>
public class ContactAttempt
{
    public DateTime Timestamp { get; set; }
    public bool Successful { get; set; }
    public string Email { get; set; }
    public string IPAddress { get; set; }
}

/// <summary>
/// Portfolio analytics model
/// </summary>
public class PortfolioAnalytics
{
    public string AnalyticsId { get; set; }
    public DateTime SessionStart { get; set; }
    public TimeSpan TimeOnSite { get; set; }
    public double BounceRate { get; set; }
    public string DeviceInfo { get; set; }
}

#endregion