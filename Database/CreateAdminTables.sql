-- =================================================================
-- COMPLETE DATABASE SCHEMA FOR SKT PORTFOLIO ADMIN SYSTEM
-- Compatible with SQL Server and .NET Framework 4.8
-- =================================================================

-- 1. PROJECTS TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Projects' AND xtype='U')
BEGIN
    CREATE TABLE Projects (
        ProjectId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(255) NOT NULL,
        Description NTEXT,
        ShortDescription NVARCHAR(500),
        TechnologiesUsed NVARCHAR(500),
        ProjectUrl NVARCHAR(500),
        GitHubUrl NVARCHAR(500),
        ImageUrl NVARCHAR(500),
        StartDate DATETIME NOT NULL,
        EndDate DATETIME NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
    
    CREATE INDEX IX_Projects_IsActive ON Projects(IsActive);
    CREATE INDEX IX_Projects_DisplayOrder ON Projects(DisplayOrder);
    PRINT 'Projects table created successfully.';
END
ELSE
    PRINT 'Projects table already exists.';

-- 2. SKILLS TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Skills' AND xtype='U')
BEGIN
    CREATE TABLE Skills (
        SkillId INT IDENTITY(1,1) PRIMARY KEY,
        SkillName NVARCHAR(100) NOT NULL,
        SkillLevel INT NOT NULL CHECK (SkillLevel >= 1 AND SkillLevel <= 100),
        CategoryId INT NOT NULL DEFAULT 1,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
    
    CREATE INDEX IX_Skills_SkillName ON Skills(SkillName);
    CREATE INDEX IX_Skills_CategoryId ON Skills(CategoryId);
    CREATE INDEX IX_Skills_IsActive ON Skills(IsActive);
    PRINT 'Skills table created successfully.';
END
ELSE
    PRINT 'Skills table already exists.';

-- 3. ACHIEVEMENTS TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Achievements' AND xtype='U')
BEGIN
    CREATE TABLE Achievements (
        AchievementId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(255) NOT NULL,
        AchievementType NVARCHAR(100),
        Organization NVARCHAR(255),
        Description NTEXT,
        AchievementDate DATETIME NOT NULL,
        CertificateUrl NVARCHAR(500),
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
    
    CREATE INDEX IX_Achievements_AchievementDate ON Achievements(AchievementDate);
    CREATE INDEX IX_Achievements_Type ON Achievements(AchievementType);
    CREATE INDEX IX_Achievements_IsActive ON Achievements(IsActive);
    PRINT 'Achievements table created successfully.';
END
ELSE
    PRINT 'Achievements table already exists.';

-- 4. EDUCATION TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Education' AND xtype='U')
BEGIN
    CREATE TABLE Education (
        EducationId INT IDENTITY(1,1) PRIMARY KEY,
        InstitutionName NVARCHAR(255) NOT NULL,
        Degree NVARCHAR(255) NOT NULL,
        FieldOfStudy NVARCHAR(255),
        StartDate DATETIME NOT NULL,
        EndDate DATETIME NULL,
        GPA NVARCHAR(10),
        Location NVARCHAR(255),
        Description NTEXT,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
    
    CREATE INDEX IX_Education_Institution ON Education(InstitutionName);
    CREATE INDEX IX_Education_StartDate ON Education(StartDate);
    CREATE INDEX IX_Education_IsActive ON Education(IsActive);
    PRINT 'Education table created successfully.';
END
ELSE
    PRINT 'Education table already exists.';

-- 5. CONTACT MESSAGES TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ContactMessages' AND xtype='U')
BEGIN
    CREATE TABLE ContactMessages (
        MessageId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(255) NOT NULL,
        Email NVARCHAR(255) NOT NULL,
        Subject NVARCHAR(255),
        MessageBody NTEXT NOT NULL,
        Phone NVARCHAR(50),
        ProjectType NVARCHAR(100),
        IsRead BIT NOT NULL DEFAULT 0,
        IsReplied BIT NOT NULL DEFAULT 0,
        MessageDate DATETIME NOT NULL DEFAULT GETDATE(),
        ReadDate DATETIME NULL,
        ReplyDate DATETIME NULL,
        AdminNotes NTEXT
    );
    
    CREATE INDEX IX_ContactMessages_Email ON ContactMessages(Email);
    CREATE INDEX IX_ContactMessages_MessageDate ON ContactMessages(MessageDate);
    CREATE INDEX IX_ContactMessages_IsRead ON ContactMessages(IsRead);
    PRINT 'ContactMessages table created successfully.';
END
ELSE
    PRINT 'ContactMessages table already exists.';

-- 6. ADMIN USERS TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='AdminUsers' AND xtype='U')
BEGIN
    CREATE TABLE AdminUsers (
        AdminId INT IDENTITY(1,1) PRIMARY KEY,
        Username NVARCHAR(50) NOT NULL UNIQUE,
        PasswordHash NVARCHAR(255) NOT NULL,
        Email NVARCHAR(255),
        FullName NVARCHAR(255),
        IsActive BIT NOT NULL DEFAULT 1,
        LastLogin DATETIME NULL,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
    
    CREATE INDEX IX_AdminUsers_Username ON AdminUsers(Username);
    CREATE INDEX IX_AdminUsers_IsActive ON AdminUsers(IsActive);
    PRINT 'AdminUsers table created successfully.';
END
ELSE
    PRINT 'AdminUsers table already exists.';

-- 7. ADMIN ACTIVITY LOG TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='AdminActivityLog' AND xtype='U')
BEGIN
    CREATE TABLE AdminActivityLog (
        LogId INT IDENTITY(1,1) PRIMARY KEY,
        AdminId INT,
        Activity NVARCHAR(500) NOT NULL,
        EntityType NVARCHAR(50), -- Projects, Skills, Achievements, etc.
        EntityId INT NULL,
        IPAddress NVARCHAR(50),
        UserAgent NVARCHAR(500),
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        FOREIGN KEY (AdminId) REFERENCES AdminUsers(AdminId)
    );
    
    CREATE INDEX IX_AdminActivityLog_AdminId ON AdminActivityLog(AdminId);
    CREATE INDEX IX_AdminActivityLog_CreatedDate ON AdminActivityLog(CreatedDate);
    CREATE INDEX IX_AdminActivityLog_EntityType ON AdminActivityLog(EntityType);
    PRINT 'AdminActivityLog table created successfully.';
END
ELSE
    PRINT 'AdminActivityLog table already exists.';

-- 8. SKILL CATEGORIES LOOKUP TABLE (Optional - for better normalization)
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SkillCategories' AND xtype='U')
BEGIN
    CREATE TABLE SkillCategories (
        CategoryId INT IDENTITY(1,1) PRIMARY KEY,
        CategoryName NVARCHAR(100) NOT NULL UNIQUE,
        Description NVARCHAR(500),
        IconClass NVARCHAR(50),
        ColorHex NVARCHAR(7),
        DisplayOrder INT NOT NULL DEFAULT 1,
        IsActive BIT NOT NULL DEFAULT 1
    );
    
    -- Insert default categories
    INSERT INTO SkillCategories (CategoryName, Description, IconClass, DisplayOrder) VALUES
    ('Programming', 'Programming Languages', 'fas fa-code', 1),
    ('Framework', 'Frameworks and Libraries', 'fas fa-layer-group', 2),
    ('Database', 'Database Technologies', 'fas fa-database', 3),
    ('Frontend', 'Frontend Technologies', 'fab fa-html5', 4),
    ('Tools', 'Development Tools', 'fas fa-tools', 5);
    
    PRINT 'SkillCategories table created and populated successfully.';
END
ELSE
    PRINT 'SkillCategories table already exists.';

-- 9. SITE SETTINGS TABLE
-- =================================================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SiteSettings' AND xtype='U')
BEGIN
    CREATE TABLE SiteSettings (
        SettingId INT IDENTITY(1,1) PRIMARY KEY,
        SettingKey NVARCHAR(100) NOT NULL UNIQUE,
        SettingValue NTEXT,
        Description NVARCHAR(500),
        DataType NVARCHAR(50) DEFAULT 'string', -- string, int, bool, date
        Category NVARCHAR(100) DEFAULT 'General',
        IsEditable BIT NOT NULL DEFAULT 1,
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedBy NVARCHAR(100)
    );
    
    -- Insert default settings
    INSERT INTO SiteSettings (SettingKey, SettingValue, Description, Category) VALUES
    ('SiteName', 'SKT Portfolio', 'Website Name', 'General'),
    ('SiteTagline', 'Data Scientist & Full Stack Developer', 'Website Tagline', 'General'),
    ('ContactEmail', 'skt104.shujon@gmail.com', 'Primary Contact Email', 'Contact'),
    ('LinkedInUrl', 'https://www.linkedin.com/in/shakhoyat-shujon-313ba5336/', 'LinkedIn Profile URL', 'Social'),
    ('GitHubUrl', 'https://github.com/Shakhoyat', 'GitHub Profile URL', 'Social'),
    ('KaggleUrl', 'https://www.kaggle.com/shakhoyatshujon', 'Kaggle Profile URL', 'Social'),
    ('MaintenanceMode', 'false', 'Enable/Disable Maintenance Mode', 'System'),
    ('AllowContactForm', 'true', 'Enable/Disable Contact Form', 'Contact');
    
    CREATE INDEX IX_SiteSettings_Category ON SiteSettings(Category);
    PRINT 'SiteSettings table created and populated successfully.';
END
ELSE
    PRINT 'SiteSettings table already exists.';

-- =================================================================
-- CREATE DEFAULT ADMIN USER (admin/admin123)
-- =================================================================
IF NOT EXISTS (SELECT * FROM AdminUsers WHERE Username = 'admin')
BEGIN
    INSERT INTO AdminUsers (Username, PasswordHash, Email, FullName, IsActive) 
    VALUES ('admin', 'admin123', 'admin@portfolio.com', 'Administrator', 1);
    PRINT 'Default admin user created (admin/admin123).';
END
ELSE
    PRINT 'Default admin user already exists.';

-- =================================================================
-- SUMMARY
-- =================================================================
PRINT '';
PRINT '=================================================================';
PRINT 'DATABASE SCHEMA CREATION COMPLETED SUCCESSFULLY!';
PRINT '=================================================================';
PRINT 'Tables Created:';
PRINT '1. Projects - Portfolio projects management';
PRINT '2. Skills - Technical skills with categories and levels';
PRINT '3. Achievements - Certifications, awards, accomplishments';
PRINT '4. Education - Academic background and qualifications';
PRINT '5. ContactMessages - Contact form submissions';
PRINT '6. AdminUsers - Admin user accounts';
PRINT '7. AdminActivityLog - Admin activity tracking';
PRINT '8. SkillCategories - Skill categorization lookup';
PRINT '9. SiteSettings - Website configuration settings';
PRINT '';
PRINT 'Default Admin Login: admin / admin123';
PRINT 'Ready for ASP.NET Web Forms integration!';
PRINT '=================================================================';