-- =================================================================
-- ADD IMAGEURL COLUMN TO ACHIEVEMENTS TABLE
-- =================================================================

-- Check if the column already exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'Achievements' AND COLUMN_NAME = 'ImageUrl')
BEGIN
    -- Add ImageUrl column to Achievements table
    ALTER TABLE Achievements 
    ADD ImageUrl NVARCHAR(500) NULL;
    
    PRINT 'ImageUrl column added to Achievements table successfully.';
END
ELSE
BEGIN
    PRINT 'ImageUrl column already exists in Achievements table.';
END

-- Optionally update any existing achievements with a default placeholder
-- UPDATE Achievements SET ImageUrl = '/Content/images/placeholder-achievement.jpg' WHERE ImageUrl IS NULL;

PRINT 'Achievements table ImageUrl update completed.';