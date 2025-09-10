-- =================================================================
-- CREATE ACHIEVEMENTS TABLE - COMPLETE SCHEMA
-- =================================================================

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

-- Create indexes for better performance
CREATE INDEX IX_Achievements_IsActive ON Achievements(IsActive);
CREATE INDEX IX_Achievements_DisplayOrder ON Achievements(DisplayOrder);
CREATE INDEX IX_Achievements_AchievementDate ON Achievements(AchievementDate DESC);