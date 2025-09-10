@echo off
echo Fixing Roslyn Compiler Path Issue...
echo.

REM Check if roslyn folder exists
if not exist "bin\roslyn" (
    echo Creating roslyn directory...
    mkdir "bin\roslyn"
)

REM Check if packages directory exists
if not exist "packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\tools\Roslyn45" (
    echo Error: NuGet packages not found. Please restore NuGet packages first.
    echo Run: nuget restore
    pause
    exit /b 1
)

REM Copy Roslyn compiler files
echo Copying Roslyn compiler files...
xcopy "packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\tools\Roslyn45\*" "bin\roslyn\" /E /I /Y > nul

if exist "bin\roslyn\csc.exe" (
    echo.
    echo ? SUCCESS: Roslyn compiler files copied successfully!
    echo Your application should now run without the "Could not find csc.exe" error.
) else (
    echo.
    echo ? ERROR: Failed to copy compiler files.
    echo Please check that NuGet packages are properly restored.
)

echo.
echo Press any key to close...
pause > nul