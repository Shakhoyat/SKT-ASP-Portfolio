-- =================================================================
-- CREATE ACHIEVEMENTS TABLE WITH COMPLETE SCHEMA
-- =================================================================

-- Drop table if it exists (use with caution in production)
-- IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Achievements')
-- BEGIN
--     DROP TABLE Achievements;
--     PRINT 'Existing Achievements table dropped.';
-- END

-- Create Achievements table with complete schema
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Achievements')
BEGIN
    CREATE TABLE Achievements (
        AchievementId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(200) NOT NULL,
        AchievementType NVARCHAR(50) NOT NULL DEFAULT 'Achievement',
        Organization NVARCHAR(200) NOT NULL,
        Description NVARCHAR(1000) NOT NULL,
        AchievementDate DATE NOT NULL,
        ImageUrl NVARCHAR(500) NULL,
        CertificateUrl NVARCHAR(500) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        DisplayOrder INT NOT NULL DEFAULT 1,
        CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),
        UpdatedDate DATETIME2 NOT NULL DEFAULT GETDATE()
    );
    
    PRINT 'Achievements table created successfully with complete schema.';
    
    -- Create indexes for better performance
    CREATE INDEX IX_Achievements_IsActive ON Achievements(IsActive);
    CREATE INDEX IX_Achievements_DisplayOrder ON Achievements(DisplayOrder);
    CREATE INDEX IX_Achievements_AchievementDate ON Achievements(AchievementDate DESC);
    CREATE INDEX IX_Achievements_AchievementType ON Achievements(AchievementType);
    
    PRINT 'Indexes created successfully.';
END
ELSE
BEGIN
    PRINT 'Achievements table already exists.';
    
    -- Add missing columns if table exists but columns are missing
    
    -- Check and add ImageUrl column
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'ImageUrl')
    BEGIN
        ALTER TABLE Achievements ADD ImageUrl NVARCHAR(500) NULL;
        PRINT 'ImageUrl column added to existing Achievements table.';
    END
    
    -- Check and add CertificateUrl column
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'CertificateUrl')
    BEGIN
        ALTER TABLE Achievements ADD CertificateUrl NVARCHAR(500) NULL;
        PRINT 'CertificateUrl column added to existing Achievements table.';
    END
    
    -- Check and add DisplayOrder column
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'DisplayOrder')
    BEGIN
        ALTER TABLE Achievements ADD DisplayOrder INT NOT NULL DEFAULT 1;
        PRINT 'DisplayOrder column added to existing Achievements table.';
    END
    
    -- Update any existing achievements with default DisplayOrder if NULL
    UPDATE Achievements SET DisplayOrder = 1 WHERE DisplayOrder IS NULL;
    
    -- Ensure CreatedDate and UpdatedDate have proper defaults
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'CreatedDate')
    BEGIN
        ALTER TABLE Achievements ADD CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE();
        PRINT 'CreatedDate column added to existing Achievements table.';
    END
    
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'UpdatedDate')
    BEGIN
        ALTER TABLE Achievements ADD UpdatedDate DATETIME2 NOT NULL DEFAULT GETDATE();
        PRINT 'UpdatedDate column added to existing Achievements table.';
    END
END

-- Insert sample achievements for testing (optional)
IF NOT EXISTS (SELECT * FROM Achievements)
BEGIN
    INSERT INTO Achievements (Title, AchievementType, Organization, Description, AchievementDate, ImageUrl, CertificateUrl, IsActive, DisplayOrder)
    VALUES 
    ('Kaggle Expert Status', 'Expert', 'Kaggle Platform', 'Achieved Expert status on Kaggle through consistent participation in data science competitions and high-performance solutions.', '2023-06-15', '/Content/images/achievements/kaggle-expert.jpg', 'https://www.kaggle.com/shakhoyatshujon', 1, 1),
    
    ('Microsoft Azure Developer Associate', 'Certification', 'Microsoft', 'Demonstrated expertise in developing cloud applications and services on Microsoft Azure platform.', '2023-05-20', '/Content/images/achievements/azure-cert.jpg', 'https://learn.microsoft.com/en-us/certifications/azure-developer/', 1, 2),
    
    ('National Hackathon Winner', 'Award', 'Tech Innovation Hub', 'First place winner in national hackathon for developing innovative IoT solution for smart agriculture.', '2023-03-10', '/Content/images/achievements/hackathon-winner.jpg', '', 1, 3),
    
    ('Research Paper Publication', 'Research', 'IEEE Conference', 'Published research paper on "Deep Learning Applications in Healthcare Prediction Models" in IEEE conference.', '2023-01-15', '/Content/images/achievements/research-paper.jpg', 'https://ieeexplore.ieee.org/', 1, 4),
    
    ('GitHub Open Source Contributor', 'Milestone', 'GitHub', 'Active contributor to multiple open source projects with 500+ contributions and 50+ stars on personal repositories.', '2022-12-01', '/Content/images/achievements/github-contributor.jpg', 'https://github.com/Shakhoyat', 1, 5),
    
    ('Competitive Programming Master', 'Achievement', 'Codeforces', 'Solved 700+ competitive programming problems across multiple platforms including Codeforces, LeetCode, and HackerRank.', '2022-10-30', '/Content/images/achievements/coding-master.jpg', 'https://codeforces.com/', 1, 6);
    
    PRINT 'Sample achievements inserted successfully.';
END
ELSE
BEGIN
    PRINT 'Achievements table already contains data. Skipping sample data insertion.';
END

-- Create a trigger to automatically update UpdatedDate on record modification
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_Achievements_UpdatedDate')
BEGIN
    EXEC('
    CREATE TRIGGER tr_Achievements_UpdatedDate
    ON Achievements
    AFTER UPDATE
    AS
    BEGIN
        SET NOCOUNT ON;
        
        UPDATE Achievements 
        SET UpdatedDate = GETDATE()
        FROM Achievements a
        INNER JOIN inserted i ON a.AchievementId = i.AchievementId;
    END
    ');
    
    PRINT 'UpdatedDate trigger created successfully.';
END

-- Display final table structure
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Achievements'
ORDER BY ORDINAL_POSITION;

PRINT 'Achievements table setup completed successfully!';
PRINT 'Table is ready for use with ImageUrl, CertificateUrl, and all necessary columns.';

-- Display current row count
DECLARE @RowCount INT;
SELECT @RowCount = COUNT(*) FROM Achievements;
PRINT 'Current number of achievements in table: ' + CAST(@RowCount AS VARCHAR(10));