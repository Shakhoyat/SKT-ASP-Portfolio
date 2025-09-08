<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        
        // Set the unobtrusive validation mode to None to avoid jQuery dependency issues
        System.Web.UI.ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        
        System.Diagnostics.Debug.WriteLine("Portfolio Application Started");
        
        // Initialize application-level counters
        Application["TotalVisitors"] = 0;
        Application["ActiveSessions"] = 0;
        Application["ApplicationStartTime"] = DateTime.Now;
    }

    void Application_End(object sender, EventArgs e) 
    {
        // Code that runs on application shutdown
        System.Diagnostics.Debug.WriteLine("Portfolio Application Ended");
    }

    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        Exception ex = Server.GetLastError();
        if (ex != null)
        {
            System.Diagnostics.Debug.WriteLine($"Application Error: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"Stack Trace: {ex.StackTrace}");
            
            // Log error details for debugging
            try
            {
                string errorLog = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] Error: {ex.Message} | URL: {Request.Url} | User Agent: {Request.UserAgent}";
                System.Diagnostics.Debug.WriteLine(errorLog);
            }
            catch
            {
                // Ignore logging errors
            }
        }
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        System.Diagnostics.Debug.WriteLine($"New session started: {Session.SessionID}");
        
        // Update application counters
        Application.Lock();
        Application["TotalVisitors"] = (int)Application["TotalVisitors"] + 1;
        Application["ActiveSessions"] = (int)Application["ActiveSessions"] + 1;
        Application.UnLock();
        
        System.Diagnostics.Debug.WriteLine($"Session initialized. Total visitors: {Application["TotalVisitors"]}");
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        System.Diagnostics.Debug.WriteLine($"Session ended: {Session.SessionID}");
        
        // Update application counters
        Application.Lock();
        Application["ActiveSessions"] = Math.Max(0, (int)Application["ActiveSessions"] - 1);
        Application.UnLock();
        
        System.Diagnostics.Debug.WriteLine($"Active sessions: {Application["ActiveSessions"]}");
    }

</script>