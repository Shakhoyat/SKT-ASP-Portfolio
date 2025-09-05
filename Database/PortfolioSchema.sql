-- Portfolio Database Schema
-- Run this script in SQL Server Management Studio or Visual Studio Database Project

-- Create Projects table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Projects' AND xtype='U')
BEGIN
    CREATE TABLE Projects (
        ProjectId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(200) NOT NULL,
        Description NTEXT NOT NULL,
        ShortDescription NVARCHAR(500) NOT NULL,
        TechnologiesUsed NVARCHAR(500) NOT NULL,
        ProjectUrl NVARCHAR(500) NULL,
        GitHubUrl NVARCHAR(500) NULL,
        ImageUrl NVARCHAR(500) NULL,
        StartDate DATE NOT NULL,
        EndDate DATE NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 0,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
    )
END

-- Insert sample data
IF NOT EXISTS (SELECT * FROM Projects)
BEGIN
    INSERT INTO Projects (Title, Description, ShortDescription, TechnologiesUsed, ProjectUrl, GitHubUrl, ImageUrl, StartDate, EndDate, IsActive, DisplayOrder)
    VALUES 
    ('E-Commerce Platform', 
     'A comprehensive e-commerce solution built with ASP.NET Web Forms featuring user authentication, product catalog, shopping cart functionality, and payment integration. The application includes an admin panel for managing products, orders, and customer data. Implemented with responsive design and modern UI components.',
     'Full-featured e-commerce solution with shopping cart, payment integration, and admin panel',
     'ASP.NET Web Forms, C#, SQL Server, HTML5, CSS3, JavaScript, PayPal API',
     'https://demo-ecommerce.example.com',
     'https://github.com/username/ecommerce-platform',
     '/Content/images/projects/ecommerce.jpg',
     '2023-01-15', 
     '2023-04-30', 
     1, 
     1),
    
    ('Task Management System', 
     'A collaborative task management application designed for teams to organize, track, and manage projects efficiently. Features include task assignment, progress tracking, deadline management, file attachments, and real-time notifications. Built with a focus on user experience and productivity.',
     'Team collaboration tool for project and task management with real-time updates',
     'ASP.NET Web Forms, C#, SQL Server, AJAX, jQuery, SignalR',
     'https://taskmanager.example.com',
     'https://github.com/username/task-manager',
     '/Content/images/projects/taskmanager.jpg',
     '2023-05-01', 
     '2023-08-15', 
     1, 
     2),
    
    ('Personal Finance Tracker', 
     'A personal finance management application that helps users track income, expenses, budgets, and financial goals. Includes data visualization with charts and graphs, category-based expense tracking, and financial reporting. Designed with security and privacy as top priorities.',
     'Personal finance management tool with budgeting and expense tracking',
     'ASP.NET Web Forms, C#, SQL Server, Chart.js, Bootstrap',
     NULL,
     'https://github.com/username/finance-tracker',
     '/Content/images/projects/finance.jpg',
     '2023-09-01', 
     NULL, 
     1, 
     3),
    
    ('Customer Support Portal', 
     'A customer support ticketing system that streamlines customer service operations. Features include ticket creation, assignment, status tracking, knowledge base integration, and automated email notifications. Includes both customer and admin interfaces.',
     'Customer support ticketing system with knowledge base and automation',
     'ASP.NET Web Forms, C#, SQL Server, SMTP Integration, HTML/CSS',
     'https://support.example.com',
     'https://github.com/username/support-portal',
     '/Content/images/projects/support.jpg',
     '2022-10-01', 
     '2022-12-31', 
     1, 
     4)
END

-- Create Skills table (for future use)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Skills' AND xtype='U')
BEGIN
    CREATE TABLE Skills (
        SkillId INT IDENTITY(1,1) PRIMARY KEY,
        SkillName NVARCHAR(100) NOT NULL,
        Category NVARCHAR(50) NOT NULL, -- 'Programming', 'Framework', 'Tool', 'Database', etc.
        ProficiencyLevel INT NOT NULL, -- 1-100 percentage
        Description NVARCHAR(1000) NULL,
        IconClass NVARCHAR(100) NULL,
        IconColor NVARCHAR(20) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 0,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
    )
END

-- Create Achievements table (for future use)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Achievements' AND xtype='U')
BEGIN
    CREATE TABLE Achievements (
        AchievementId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(200) NOT NULL,
        Description NTEXT NOT NULL,
        AchievementDate DATE NOT NULL,
        Organization NVARCHAR(200) NULL,
        CertificateUrl NVARCHAR(500) NULL,
        ImageUrl NVARCHAR(500) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 0,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
    )
END

-- Create Education table (for future use)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Education' AND xtype='U')
BEGIN
    CREATE TABLE Education (
        EducationId INT IDENTITY(1,1) PRIMARY KEY,
        Institution NVARCHAR(200) NOT NULL,
        Degree NVARCHAR(200) NOT NULL,
        FieldOfStudy NVARCHAR(200) NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE NULL,
        Grade NVARCHAR(20) NULL,
        Description NTEXT NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 0,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
    )
END

-- Create ContactMessages table (for future use)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ContactMessages' AND xtype='U')
BEGIN
    CREATE TABLE ContactMessages (
        MessageId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Email NVARCHAR(200) NOT NULL,
        Subject NVARCHAR(200) NOT NULL,
        Message NTEXT NOT NULL,
        IsRead BIT NOT NULL DEFAULT 0,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        ReadDate DATETIME NULL
    )
END

-- Add indexes for better performance
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Projects_IsActive_DisplayOrder')
    CREATE INDEX IX_Projects_IsActive_DisplayOrder ON Projects (IsActive, DisplayOrder)

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Skills_Category_IsActive')
    CREATE INDEX IX_Skills_Category_IsActive ON Skills (Category, IsActive)

PRINT 'Database schema created successfully!'