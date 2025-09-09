using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public static class SessionCookieManager
{
    public static UserPreferences GetUserPreferences()
    {
        var prefs = HttpContext.Current.Session["UserPreferences"] as UserPreferences;
        if (prefs == null)
        {
            var cookie = HttpContext.Current.Request.Cookies["PortfolioPrefs"];
            if (cookie != null)
            {
                try
                {
                    prefs = new JavaScriptSerializer().Deserialize<UserPreferences>(cookie.Value);
                }
                catch { }
            }
            prefs = prefs ?? new UserPreferences();
            HttpContext.Current.Session["UserPreferences"] = prefs;
        }
        return prefs;
    }

    public static void SaveUserPreferences(UserPreferences preferences)
    {
        HttpContext.Current.Session["UserPreferences"] = preferences;
        try
        {
            var json = new JavaScriptSerializer().Serialize(preferences);
            var cookie = new HttpCookie("PortfolioPrefs", json) { Expires = DateTime.Now.AddYears(1), HttpOnly = true };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        catch { }
    }

    public static void UpdatePreference(string key, object value)
    {
        var prefs = GetUserPreferences();
        prefs.Preferences[key] = value;
        prefs.LastUpdated = DateTime.Now;
        SaveUserPreferences(prefs);
    }

    public static string GetThemePreference()
    {
        var theme = HttpContext.Current.Session["ThemePreference"] as string;
        if (string.IsNullOrEmpty(theme))
        {
            var cookie = HttpContext.Current.Request.Cookies["PortfolioTheme"];
            theme = cookie != null ? cookie.Value : "dark";
            HttpContext.Current.Session["ThemePreference"] = theme;
        }
        return theme;
    }

    public static void SetThemePreference(string theme)
    {
        HttpContext.Current.Session["ThemePreference"] = theme;
        var cookie = new HttpCookie("PortfolioTheme", theme) { Expires = DateTime.Now.AddYears(1), HttpOnly = false };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    public static string GetLanguagePreference()
    {
        var lang = HttpContext.Current.Session["LanguagePreference"] as string;
        if (string.IsNullOrEmpty(lang))
        {
            var cookie = HttpContext.Current.Request.Cookies["PortfolioLang"];
            lang = cookie != null ? cookie.Value : "en";
            HttpContext.Current.Session["LanguagePreference"] = lang;
        }
        return lang;
    }

    public static void SetLanguagePreference(string language)
    {
        HttpContext.Current.Session["LanguagePreference"] = language;
        var cookie = new HttpCookie("PortfolioLang", language) { Expires = DateTime.Now.AddYears(1), HttpOnly = true };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    public static void InitializeVisit()
    {
        string referrer = null;
        if (HttpContext.Current.Request.UrlReferrer != null)
            referrer = HttpContext.Current.Request.UrlReferrer.ToString();

        var visitData = new VisitData
        {
            SessionId = HttpContext.Current.Session.SessionID,
            StartTime = DateTime.Now,
            LastActivity = DateTime.Now,
            PagesViewed = new List<string>(),
            UserAgent = HttpContext.Current.Request.UserAgent,
            IPAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] ?? "Unknown",
            Referrer = referrer
        };

        HttpContext.Current.Session["VisitData"] = visitData;
        var cookie = new HttpCookie("LastVisit", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")) { Expires = DateTime.Now.AddYears(1), HttpOnly = true };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    public static void TrackPageView(string pageName)
    {
        var visitData = HttpContext.Current.Session["VisitData"] as VisitData;
        if (visitData != null)
        {
            visitData.LastActivity = DateTime.Now;
            visitData.PagesViewed.Add($"{pageName}|{DateTime.Now:HH:mm:ss}");
            visitData.PageViewCount++;
        }
    }

    public static VisitData GetVisitData()
    {
        return HttpContext.Current.Session["VisitData"] as VisitData;
    }

    public static void TrackProjectView(int projectId, string projectTitle)
    {
        var viewedProjects = HttpContext.Current.Session["ViewedProjects"] as List<int> ?? new List<int>();
        if (!viewedProjects.Contains(projectId))
        {
            viewedProjects.Add(projectId);
            HttpContext.Current.Session["ViewedProjects"] = viewedProjects;
        }

        var recentProjects = GetRecentProjects();
        for (int i = recentProjects.Count - 1; i >= 0; i--)
        {
            if (recentProjects[i].ProjectId == projectId)
            {
                recentProjects.RemoveAt(i);
                break;
            }
        }
        recentProjects.Insert(0, new RecentProject { ProjectId = projectId, Title = projectTitle, ViewedAt = DateTime.Now });
        if (recentProjects.Count > 5) 
        {
            var newList = new List<RecentProject>();
            for (int i = 0; i < 5; i++) newList.Add(recentProjects[i]);
            recentProjects = newList;
        }

        try
        {
            var json = new JavaScriptSerializer().Serialize(recentProjects);
            var cookie = new HttpCookie("RecentProjects", json) { Expires = DateTime.Now.AddDays(30), HttpOnly = true };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        catch { }
    }

    public static List<RecentProject> GetRecentProjects()
    {
        var cookie = HttpContext.Current.Request.Cookies["RecentProjects"];
        if (cookie != null)
        {
            try
            {
                return new JavaScriptSerializer().Deserialize<List<RecentProject>>(cookie.Value) ?? new List<RecentProject>();
            }
            catch { }
        }
        return new List<RecentProject>();
    }

    public static void TrackContactAttempt(bool successful, string email = null)
    {
        var attempts = HttpContext.Current.Session["ContactAttempts"] as List<ContactAttempt> ?? new List<ContactAttempt>();
        attempts.Add(new ContactAttempt
        {
            Timestamp = DateTime.Now,
            Successful = successful,
            Email = email,
            IPAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] ?? "Unknown"
        });

        if (attempts.Count > 10) 
        {
            var newList = new List<ContactAttempt>();
            for (int i = attempts.Count - 10; i < attempts.Count; i++) newList.Add(attempts[i]);
            attempts = newList;
        }
        HttpContext.Current.Session["ContactAttempts"] = attempts;
    }

    public static bool HasExceededContactLimit()
    {
        var attempts = HttpContext.Current.Session["ContactAttempts"] as List<ContactAttempt> ?? new List<ContactAttempt>();
        var cutoffTime = DateTime.Now.AddMinutes(-15);
        int recentCount = 0;
        for (int i = 0; i < attempts.Count; i++)
        {
            if (attempts[i].Timestamp > cutoffTime) recentCount++;
        }
        return recentCount >= 3;
    }

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
        HttpContext.Current.Session["PortfolioAnalytics"] = analytics;
    }

    public static void UpdateAnalytics()
    {
        var analytics = HttpContext.Current.Session["PortfolioAnalytics"] as PortfolioAnalytics;
        if (analytics != null)
        {
            analytics.TimeOnSite = DateTime.Now - analytics.SessionStart;
            var visitData = GetVisitData();
            if (visitData != null) analytics.BounceRate = visitData.PageViewCount <= 1 ? 100 : 0;
        }
    }

    public static DateTime? GetLastVisit()
    {
        var cookie = HttpContext.Current.Request.Cookies["LastVisit"];
        if (cookie != null)
        {
            DateTime lastVisit;
            if (DateTime.TryParse(cookie.Value, out lastVisit))
                return lastVisit;
        }
        return null;
    }

    public static void ClearAllData()
    {
        HttpContext.Current.Session.Clear();
        var cookieNames = new[] { "PortfolioPrefs", "RecentProjects", "VisitHistory", "PortfolioTheme", "PortfolioLang", "PortfolioAnalytics", "LastVisit" };
        foreach (var cookieName in cookieNames)
        {
            var cookie = new HttpCookie(cookieName) { Expires = DateTime.Now.AddDays(-1) };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
    }

    private static string GetOrCreateAnalyticsId()
    {
        var cookie = HttpContext.Current.Request.Cookies["PortfolioAnalytics"];
        if (cookie != null && !string.IsNullOrEmpty(cookie.Value)) return cookie.Value;

        var analyticsId = Guid.NewGuid().ToString();
        var newCookie = new HttpCookie("PortfolioAnalytics", analyticsId) { Expires = DateTime.Now.AddYears(2), HttpOnly = true };
        HttpContext.Current.Response.Cookies.Add(newCookie);
        return analyticsId;
    }

    private static string GetDeviceInfo()
    {
        var userAgent = HttpContext.Current.Request.UserAgent ?? "";
        if (userAgent.Contains("Mobile") || userAgent.Contains("Android") || userAgent.Contains("iPhone")) return "Mobile";
        if (userAgent.Contains("Tablet") || userAgent.Contains("iPad")) return "Tablet";
        return "Desktop";
    }
}

public class UserPreferences
{
    public Dictionary<string, object> Preferences { get; set; } = new Dictionary<string, object>();
    public DateTime LastUpdated { get; set; } = DateTime.Now;

    public void SetPreference(string key, object value)
    {
        Preferences[key] = value;
        LastUpdated = DateTime.Now;
    }

    public T GetPreference<T>(string key, T defaultValue = default(T))
    {
        if (Preferences.ContainsKey(key))
        {
            try { return (T)Preferences[key]; }
            catch { return defaultValue; }
        }
        return defaultValue;
    }
}

public class VisitData
{
    public string SessionId { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime LastActivity { get; set; }
    public List<string> PagesViewed { get; set; } = new List<string>();
    public int PageViewCount { get; set; } = 0;
    public string UserAgent { get; set; }
    public string IPAddress { get; set; }
    public string Referrer { get; set; }
    public TimeSpan SessionDuration => LastActivity - StartTime;
}

public class RecentProject
{
    public int ProjectId { get; set; }
    public string Title { get; set; }
    public DateTime ViewedAt { get; set; }
}

public class ContactAttempt
{
    public DateTime Timestamp { get; set; }
    public bool Successful { get; set; }
    public string Email { get; set; }
    public string IPAddress { get; set; }
}

public class PortfolioAnalytics
{
    public string AnalyticsId { get; set; }
    public DateTime SessionStart { get; set; }
    public TimeSpan TimeOnSite { get; set; }
    public double BounceRate { get; set; }
    public string DeviceInfo { get; set; }
}