# SKT Portfolio - Technical Documentation

## Backend Implementation & Database Design

This document provides comprehensive technical details about the backend implementation and database structure of the SKT Portfolio web application built with ASP.NET Framework 4.8.

## Table of Contents

1. [Database Schema & Structure](#database-schema--structure)
2. [Backend Architecture](#backend-architecture)
3. [Key Components](#key-components)
4. [Data Flow & Processing](#data-flow--processing)
5. [Session Management](#session-management)
6. [Security Implementation](#security-implementation)
7. [Testing & Verification Tools](#testing--verification-tools)

---

## Database Schema & Structure

The application uses a SQL Server database with the following tables:

### 1. Projects Table

**Purpose**: Stores all portfolio project information
**Primary Key**: ProjectID (auto-increment)

```sql
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NOT NULL,
    TechStack NVARCHAR(255) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    ImageUrl NVARCHAR(255),
    ProjectUrl NVARCHAR(255),
    GithubUrl NVARCHAR(255),
    Featured BIT DEFAULT 0,
    CompletionDate DATE,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
```

**Table Attributes**:
- **ProjectID**: Unique identifier for each project
- **Title**: Project name (limited to 100 chars)
- **Description**: Detailed project description (500 chars max)
- **TechStack**: Comma-separated list of technologies used
- **Category**: Project classification (e.g., "Web Development", "AI/ML", "Mobile")
- **ImageUrl**: Path to project thumbnail or screenshot
- **ProjectUrl**: Link to live demo/deployment (optional)
- **GithubUrl**: Repository link (optional)
- **Featured**: Boolean flag for featured projects on homepage
- **CompletionDate**: Project completion date
- **CreatedAt/UpdatedAt**: Record timestamp tracking

### 2. Skills Table

**Purpose**: Stores technical skills and proficiency information
**Primary Key**: SkillID (auto-increment)

```sql
CREATE TABLE Skills (
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    ProficiencyLevel INT CHECK (ProficiencyLevel BETWEEN 1 AND 5),
    IconClass NVARCHAR(50),
    ColorHex NVARCHAR(7),
    YearsExperience DECIMAL(3,1),
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

**Table Attributes**:
- **SkillID**: Unique identifier
- **Name**: Skill name (e.g., "Python", "React")
- **Category**: Skill grouping (e.g., "Programming Languages", "Frameworks")
- **ProficiencyLevel**: Numeric rating from 1-5
- **IconClass**: Font Awesome or custom icon reference
- **ColorHex**: Color code for visual representation
- **YearsExperience**: Experience duration in decimal years
- **CreatedAt**: Record timestamp

### 3. Achievements Table

**Purpose**: Stores awards, certifications, and accomplishments
**Primary Key**: AchievementID (auto-increment)

```sql
CREATE TABLE Achievements (
    AchievementID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Organization NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    AchievementType NVARCHAR(50),
    AchievementDate DATE,
    IconClass NVARCHAR(50),
    CertificateUrl NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

**Table Attributes**:
- **AchievementID**: Unique identifier
- **Title**: Achievement name (e.g., "Kaggle Expert", "Azure Developer Associate")
- **Organization**: Issuing authority (e.g., "Microsoft", "Kaggle")
- **Description**: Detailed description
- **AchievementType**: Classification (e.g., "Certification", "Award", "Research")
- **AchievementDate**: Date of attainment
- **IconClass**: Visual icon reference
- **CertificateUrl**: Link to credential verification (optional)
- **CreatedAt**: Record timestamp

### 4. Education Table

**Purpose**: Stores educational background and qualifications
**Primary Key**: EducationID (auto-increment)

```sql
CREATE TABLE Education (
    EducationID INT IDENTITY(1,1) PRIMARY KEY,
    Institution NVARCHAR(100) NOT NULL,
    Degree NVARCHAR(100) NOT NULL,
    Field NVARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    GPA DECIMAL(3,2),
    Description NVARCHAR(500),
    Location NVARCHAR(100),
    LogoUrl NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

**Table Attributes**:
- **EducationID**: Unique identifier
- **Institution**: School/university name
- **Degree**: Qualification type (e.g., "Bachelor of Science", "Master's Degree")
- **Field**: Area of study (e.g., "Computer Science")
- **StartDate/EndDate**: Education period
- **GPA**: Grade point average (optional)
- **Description**: Additional details about coursework or achievements
- **Location**: Geographic location
- **LogoUrl**: Institution logo path
- **CreatedAt**: Record timestamp

### 5. UserPreferences Table

**Purpose**: Stores visitor preferences and session information
**Primary Key**: UserID (GUID)

```sql
CREATE TABLE UserPreferences (
    UserID UNIQUEIDENTIFIER PRIMARY KEY,
    Theme NVARCHAR(20) DEFAULT 'dark',
    Language NVARCHAR(10) DEFAULT 'en',
    LastVisited DATETIME DEFAULT GETDATE(),
    VisitCount INT DEFAULT 1,
    BrowserInfo NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
```

**Table Attributes**:
- **UserID**: Unique session identifier
- **Theme**: UI theme preference ('dark'/'light')
- **Language**: Interface language preference (ISO code)
- **LastVisited**: Most recent visit timestamp
- **VisitCount**: Visit counter
- **BrowserInfo**: User agent information
- **CreatedAt/UpdatedAt**: Record timestamps

### 6. ProjectSkills Junction Table

**Purpose**: Implements many-to-many relationship between Projects and Skills
**Primary Key**: Composite (ProjectID, SkillID)

```sql
CREATE TABLE ProjectSkills (
    ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
    SkillID INT FOREIGN KEY REFERENCES Skills(SkillID),
    PRIMARY KEY (ProjectID, SkillID)
);
```

**Table Attributes**:
- **ProjectID**: Foreign key reference to Projects
- **SkillID**: Foreign key reference to Skills

## Backend Architecture

The application implements a layered architecture:

### 1. Data Access Layer
Files: DatabaseSetup.cs, DatabaseTester.cs, data utilities in App_Code/

This layer handles direct database interactions, including:
- Connection management
- Query execution
- Data population
- Schema validation

```csharp
// Example from DatabaseSetup.cs
public class DatabaseSetup
{
    private string connectionString;
    
    public DatabaseSetup()
    {
        connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
    }
    
    public bool CreateProjectsTable()
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string createTableSQL = @"
                    IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Projects' AND xtype='U')
                    CREATE TABLE Projects (
                        ProjectID INT IDENTITY(1,1) PRIMARY KEY,
                        Title NVARCHAR(100) NOT NULL,
                        Description NVARCHAR(500) NOT NULL,
                        TechStack NVARCHAR(255) NOT NULL,
                        Category NVARCHAR(50) NOT NULL,
                        ImageUrl NVARCHAR(255),
                        ProjectUrl NVARCHAR(255),
                        GithubUrl NVARCHAR(255),
                        Featured BIT DEFAULT 0,
                        CompletionDate DATE,
                        CreatedAt DATETIME DEFAULT GETDATE(),
                        UpdatedAt DATETIME DEFAULT GETDATE()
                    )";
                
                SqlCommand command = new SqlCommand(createTableSQL, connection);
                connection.Open();
                command.ExecuteNonQuery();
                return true;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }
    
    // Additional methods for other tables...
}
```

### 2. Business Logic Layer
Files: BasePage.cs, SessionCookieManager.cs, data processing classes

Handles:
- Session management
- Data transformation and processing
- Business rules enforcement
- Validation logic

```csharp
// Example from SessionCookieManager.cs
public class SessionCookieManager
{
    public static void SaveThemePreference(string theme)
    {
        // Validate input
        if (theme != "dark" && theme != "light")
            theme = "dark";
            
        // Save to session
        HttpContext.Current.Session["UserTheme"] = theme;
        
        // Save to persistent cookie (30 days)
        HttpCookie cookie = new HttpCookie("UserTheme", theme)
        {
            Expires = DateTime.Now.AddDays(30),
            HttpOnly = true,
            SameSite = SameSiteMode.Lax
        };
        
        HttpContext.Current.Response.Cookies.Add(cookie);
        
        // Save to database if user has a session ID
        if (HttpContext.Current.Session["UserID"] != null)
        {
            string userId = HttpContext.Current.Session["UserID"].ToString();
            SaveThemeToDatabase(userId, theme);
        }
    }
    
    private static void SaveThemeToDatabase(string userId, string theme)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
        
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
                IF EXISTS (SELECT 1 FROM UserPreferences WHERE UserID = @UserID)
                    UPDATE UserPreferences SET Theme = @Theme, UpdatedAt = GETDATE() 
                    WHERE UserID = @UserID
                ELSE
                    INSERT INTO UserPreferences (UserID, Theme) VALUES (@UserID, @Theme)";
            
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", userId);
            command.Parameters.AddWithValue("@Theme", theme);
            
            connection.Open();
            command.ExecuteNonQuery();
        }
    }
    
    // Additional methods...
}
```

### 3. Presentation Layer
Files: ASPX pages, Master pages, controls

Responsible for:
- UI rendering
- Data binding
- User interaction handling
- Client-side functionality

```csharp
// Example from Projects.aspx.cs
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        LoadProjects();
        PopulateFilterCategories();
    }
}

private void LoadProjects()
{
    string connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
    string category = Request.QueryString["category"] ?? "All";
    
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        string query = "SELECT ProjectID, Title, Description, TechStack, ImageUrl, " +
                      "ProjectUrl, GithubUrl, Featured, CompletionDate FROM Projects";
        
        // Apply category filter if not "All"
        if (category != "All")
        {
            query += " WHERE Category = @Category";
        }
        
        query += " ORDER BY CompletionDate DESC";
        
        SqlCommand command = new SqlCommand(query, connection);
        
        if (category != "All")
        {
            command.Parameters.AddWithValue("@Category", category);
        }
        
        connection.Open();
        
        SqlDataReader reader = command.ExecuteReader();
        ProjectsRepeater.DataSource = reader;
        ProjectsRepeater.DataBind();
    }
}

// Additional methods...
```

## Key Components

### BasePage Class
Provides foundational functionality for all pages:

```csharp
public abstract class BasePage : System.Web.UI.Page
{
    // Properties
    protected string UserTheme { get; private set; }
    protected bool IsAuthenticated { get; private set; }
    
    // Page events
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        // Initialize user session if needed
        InitializeUserSession();
        
        // Set theme from user preference
        LoadUserTheme();
        
        // Check authentication status
        IsAuthenticated = (Session["AdminAuthenticated"] != null && 
                          (bool)Session["AdminAuthenticated"] == true);
                          
        // Track page visit
        TrackPageVisit();
    }
    
    // Methods for session initialization, theme handling, etc.
    private void InitializeUserSession()
    {
        // Create user ID if not exists
        if (Session["UserID"] == null)
        {
            string userId = Guid.NewGuid().ToString();
            Session["UserID"] = userId;
            
            // Initialize user preferences in database
            InitializeUserPreferences(userId);
        }
    }
    
    private void LoadUserTheme()
    {
        // Try session first
        if (Session["UserTheme"] != null)
        {
            UserTheme = Session["UserTheme"].ToString();
            return;
        }
        
        // Try cookie next
        HttpCookie themeCookie = Request.Cookies["UserTheme"];
        if (themeCookie != null)
        {
            UserTheme = themeCookie.Value;
            Session["UserTheme"] = UserTheme;
            return;
        }
        
        // Default theme
        UserTheme = "dark";
        Session["UserTheme"] = UserTheme;
    }
    
    // Other utility methods...
}
```

### Data Population Components

These utility classes handle initial data setup and population:

```csharp
// Example from PopulateAIMLProjects.cs
public class PopulateAIMLProjects
{
    private string connectionString;
    
    public PopulateAIMLProjects()
    {
        connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
    }
    
    public bool PopulateProjects()
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                
                // Check if projects already exist
                SqlCommand checkCommand = new SqlCommand(
                    "SELECT COUNT(*) FROM Projects WHERE Category = 'AI/ML'", 
                    connection);
                    
                int existingCount = (int)checkCommand.ExecuteScalar();
                if (existingCount > 0)
                {
                    // Projects already populated
                    return true;
                }
                
                // Insert sample AI/ML projects
                string insertSQL = @"
                    INSERT INTO Projects (Title, Description, TechStack, Category, ImageUrl, GithubUrl, Featured, CompletionDate)
                    VALUES 
                    (@Title1, @Description1, @TechStack1, 'AI/ML', '/Content/images/projects/ai-healthcare.jpg', 'https://github.com/Shakhoyat/healthcare-ml', 1, '2023-04-15'),
                    (@Title2, @Description2, @TechStack2, 'AI/ML', '/Content/images/projects/eda-platform.jpg', 'https://github.com/Shakhoyat/eda-platform', 1, '2023-02-10'),
                    (@Title3, @Description3, @TechStack3, 'AI/ML', '/Content/images/projects/cv-detection.jpg', 'https://github.com/Shakhoyat/cv-detection', 0, '2022-11-30')";
                
                SqlCommand insertCommand = new SqlCommand(insertSQL, connection);
                
                // Set parameters for project 1
                insertCommand.Parameters.AddWithValue("@Title1", "Healthcare ML Prediction Model");
                insertCommand.Parameters.AddWithValue("@Description1", "Machine learning model for predicting patient readmission risk based on historical health data with 87% accuracy.");
                insertCommand.Parameters.AddWithValue("@TechStack1", "Python, TensorFlow, Pandas, Scikit-learn, Flask");
                
                // Set parameters for project 2
                insertCommand.Parameters.AddWithValue("@Title2", "Automated EDA Platform");
                insertCommand.Parameters.AddWithValue("@Description2", "Platform that automates exploratory data analysis, reducing analysis time by 70% with automated chart generation and insight detection.");
                insertCommand.Parameters.AddWithValue("@TechStack2", "Python, Streamlit, Pandas, Plotly, NumPy");
                
                // Set parameters for project 3
                insertCommand.Parameters.AddWithValue("@Title3", "Computer Vision Object Detection");
                insertCommand.Parameters.AddWithValue("@Description3", "Real-time object detection system using computer vision techniques with optimized inference for edge devices.");
                insertCommand.Parameters.AddWithValue("@TechStack3", "Python, PyTorch, OpenCV, TensorFlow, YOLO");
                
                insertCommand.ExecuteNonQuery();
                return true;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }
}
```

## Data Flow & Processing

### Project Data Retrieval Flow

1. **User Request**:
   - User navigates to Projects.aspx
   - Optional QueryString parameters: ?category=AI/ML

2. **Page Initialization**:
   - BasePage.OnInit() sets up session and theme
   - Projects.aspx.Page_Load() checks if PostBack

3. **Data Retrieval**:
   - LoadProjects() connects to database
   - SQL query filters projects based on category
   - Data retrieved through SqlDataReader

4. **Data Binding**:
   - ProjectsRepeater.DataSource = reader
   - ProjectsRepeater.DataBind()

5. **UI Rendering**:
   - Repeater template creates project cards
   - HTML output generated and sent to client

## Session Management

The application implements a comprehensive session management system:

### Session Configuration (Web.config)

```xml
<sessionState 
  mode="InProc" 
  timeout="45" 
  cookieless="false" 
  cookieName="ASP.NET_SessionId" 
  regenerateExpiredSessionId="true" 
  cookieSameSite="Lax" 
  useHostingIdentity="false" />
```

### Session Initialization

When a user first visits the site:
1. A unique GUID is generated as UserID
2. Session state is initialized with default values
3. UserPreferences record is created in database
4. Session cookie is issued with secure attributes

```csharp
// From Global.asax
void Session_Start(object sender, EventArgs e) 
{
    // Code that runs when a new session is started
    System.Diagnostics.Debug.WriteLine($"New session started: {Session.SessionID}");
    
    // Generate user ID
    string userId = Guid.NewGuid().ToString();
    Session["UserID"] = userId;
    
    // Set default theme
    Session["UserTheme"] = "dark";
    
    // Initialize user preferences in database
    InitializeUserPreferences(userId);
    
    // Update application counters
    Application.Lock();
    Application["TotalVisitors"] = (int)Application["TotalVisitors"] + 1;
    Application["ActiveSessions"] = (int)Application["ActiveSessions"] + 1;
    Application.UnLock();
    
    System.Diagnostics.Debug.WriteLine($"Session initialized. Total visitors: {Application["TotalVisitors"]}");
}
```

### Cookie Management

The application uses HTTP-only cookies with SameSite protection:

```xml
<httpCookies 
  httpOnlyCookies="true" 
  requireSSL="false" 
  lockItem="false" 
  sameSite="Lax" />
```

## Security Implementation

### 1. Input Validation

All user inputs are validated using:
- Server-side validation for database queries
- Parameterized queries to prevent SQL injection

```csharp
// Example of parameterized query
string query = "SELECT * FROM Projects WHERE Category = @Category";
SqlCommand command = new SqlCommand(query, connection);
command.Parameters.AddWithValue("@Category", categoryName);
```

### 2. Authentication

Admin authentication uses a secure session-based approach:

```csharp
protected void LoginButton_Click(object sender, EventArgs e)
{
    string username = UsernameTextBox.Text;
    string password = PasswordTextBox.Text;
    
    // Validate credentials against secure storage
    if (ValidateAdminCredentials(username, password))
    {
        // Set authentication flag in session
        Session["AdminAuthenticated"] = true;
        Session["AdminUsername"] = username;
        Session["AdminLastActivity"] = DateTime.Now;
        
        // Redirect to admin dashboard or requested page
        string returnUrl = Request.QueryString["returnUrl"];
        if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
        {
            Response.Redirect(returnUrl);
        }
        else
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
    else
    {
        ErrorMessage.Text = "Invalid credentials. Please try again.";
        ErrorMessage.Visible = true;
    }
}
```

### 3. Session Security

- Session IDs are protected with HTTP-only flags
- Session fixation protection via regenerateExpiredSessionId
- Automatic session expiration after 45 minutes of inactivity
- SameSite cookie policy to prevent CSRF attacks

## Testing & Verification Tools

The application includes dedicated testing components:

### 1. Database Test Tools

```csharp
// From DatabaseTester.cs
public class DatabaseTester
{
    private string connectionString;
    
    public DatabaseTester()
    {
        connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
    }
    
    public bool TestConnection()
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                return connection.State == ConnectionState.Open;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }
    
    public DataTable GetTableSchema(string tableName)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            DataTable schema = connection.GetSchema("Columns", new[] { null, null, tableName });
            return schema;
        }
    }
    
    public int GetRowCount(string tableName)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand($"SELECT COUNT(*) FROM {tableName}", connection);
            connection.Open();
            return (int)command.ExecuteScalar();
        }
    }
    
    // Additional test methods...
}
```

### 2. Verification Pages

The application includes specialized test pages:

- **test_database_connection.aspx**: Tests database connectivity
- **test_admin_features.aspx**: Verifies admin functionality
- **database_test_results.aspx**: Displays aggregated test results

---

This technical documentation provides a comprehensive overview of the backend implementation and database structure used in the SKT Portfolio web application. The database schema, code architecture, and key components work together to create a maintainable, secure, and performant system.