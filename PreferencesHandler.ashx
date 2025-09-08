<%@ WebHandler Language="C#" Class="PreferencesHandler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using WebApplication1.Utilities;

/// <summary>
/// HTTP Handler for managing user preferences via AJAX calls
/// Handles theme switching, language changes, and other user preferences
/// </summary>
public class PreferencesHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);

        try
        {
            string action = context.Request["action"] ?? "";
            
            switch (action.ToLower())
            {
                case "settheme":
                    SetTheme(context);
                    break;
                case "setlanguage":
                    SetLanguage(context);
                    break;
                case "setpreference":
                    SetPreference(context);
                    break;
                case "getpreferences":
                    GetPreferences(context);
                    break;
                case "trackproject":
                    TrackProject(context);
                    break;
                case "getrecentprojects":
                    GetRecentProjects(context);
                    break;
                case "cleardata":
                    ClearData(context);
                    break;
                default:
                    WriteError(context, "Invalid action specified");
                    break;
            }
        }
        catch (Exception ex)
        {
            WriteError(context, $"Server error: {ex.Message}");
        }
    }

    /// <summary>
    /// Set theme preference
    /// </summary>
    private void SetTheme(HttpContext context)
    {
        string theme = context.Request["theme"] ?? "dark";
        
        // Validate theme
        if (theme != "dark" && theme != "light")
        {
            WriteError(context, "Invalid theme. Must be 'dark' or 'light'");
            return;
        }

        SessionCookieManager.SetThemePreference(theme);
        WriteSuccess(context, new { theme = theme, message = "Theme updated successfully" });
    }

    /// <summary>
    /// Set language preference
    /// </summary>
    private void SetLanguage(HttpContext context)
    {
        string language = context.Request["language"] ?? "en";
        
        // Validate language (extend as needed)
        string[] supportedLanguages = { "en", "es", "fr", "de", "it", "pt", "ja", "zh" };
        if (Array.IndexOf(supportedLanguages, language) == -1)
        {
            WriteError(context, "Unsupported language");
            return;
        }

        SessionCookieManager.SetLanguagePreference(language);
        WriteSuccess(context, new { language = language, message = "Language updated successfully" });
    }

    /// <summary>
    /// Set custom preference
    /// </summary>
    private void SetPreference(HttpContext context)
    {
        string key = context.Request["key"];
        string value = context.Request["value"];

        if (string.IsNullOrEmpty(key))
        {
            WriteError(context, "Preference key is required");
            return;
        }

        SessionCookieManager.UpdatePreference(key, value);
        WriteSuccess(context, new { key = key, value = value, message = "Preference updated successfully" });
    }

    /// <summary>
    /// Get all user preferences
    /// </summary>
    private void GetPreferences(HttpContext context)
    {
        var preferences = SessionCookieManager.GetUserPreferences();
        var theme = SessionCookieManager.GetThemePreference();
        var language = SessionCookieManager.GetLanguagePreference();
        var lastVisit = SessionCookieManager.GetLastVisit();
        var visitData = SessionCookieManager.GetVisitData();

        var response = new
        {
            theme = theme,
            language = language,
            lastVisit = lastVisit?.ToString("yyyy-MM-dd HH:mm:ss"),
            isReturningVisitor = lastVisit.HasValue,
            currentSession = new
            {
                sessionId = context.Session.SessionID,
                startTime = visitData?.StartTime.ToString("yyyy-MM-dd HH:mm:ss"),
                pagesViewed = visitData?.PageViewCount ?? 0,
                timeOnSite = visitData?.SessionDuration.TotalMinutes ?? 0
            },
            preferences = preferences?.Preferences ?? new System.Collections.Generic.Dictionary<string, object>()
        };

        WriteSuccess(context, response);
    }

    /// <summary>
    /// Track project view
    /// </summary>
    private void TrackProject(HttpContext context)
    {
        string projectIdStr = context.Request["projectId"];
        string projectTitle = context.Request["title"] ?? "Unknown Project";

        if (!int.TryParse(projectIdStr, out int projectId))
        {
            WriteError(context, "Invalid project ID");
            return;
        }

        SessionCookieManager.TrackProjectView(projectId, projectTitle);
        WriteSuccess(context, new { projectId = projectId, title = projectTitle, message = "Project view tracked" });
    }

    /// <summary>
    /// Get recent projects
    /// </summary>
    private void GetRecentProjects(HttpContext context)
    {
        var recentProjects = SessionCookieManager.GetRecentProjects();
        WriteSuccess(context, new { recentProjects = recentProjects });
    }

    /// <summary>
    /// Clear all session and cookie data
    /// </summary>
    private void ClearData(HttpContext context)
    {
        SessionCookieManager.ClearAllData();
        WriteSuccess(context, new { message = "All data cleared successfully" });
    }

    /// <summary>
    /// Write success response
    /// </summary>
    private void WriteSuccess(HttpContext context, object data)
    {
        var response = new { success = true, data = data };
        var json = new JavaScriptSerializer().Serialize(response);
        context.Response.Write(json);
    }

    /// <summary>
    /// Write error response
    /// </summary>
    private void WriteError(HttpContext context, string message)
    {
        context.Response.StatusCode = 400;
        var response = new { success = false, error = message };
        var json = new JavaScriptSerializer().Serialize(response);
        context.Response.Write(json);
    }

    public bool IsReusable
    {
        get { return false; }
    }
}