# Script to download and install Roslyn compiler files
$projectPath = "E:\asp3"
$roslynPath = Join-Path $projectPath "bin\roslyn"
$nugetUrl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetPath = Join-Path $projectPath "nuget.exe"

# Create roslyn directory if it doesn't exist
if (-not (Test-Path $roslynPath)) {
    New-Item -ItemType Directory -Path $roslynPath -Force | Out-Null
    Write-Host "Created directory: $roslynPath"
}

# Download nuget.exe if necessary
if (-not (Test-Path $nugetPath)) {
    Write-Host "Downloading NuGet.exe..."
    $webClient = New-Object System.Net.WebClient
    try {
        $webClient.DownloadFile($nugetUrl, $nugetPath)
        Write-Host "NuGet.exe downloaded successfully."
    }
    catch {
        Write-Error "Failed to download NuGet.exe: $_"
        exit 1
    }
}

# Install Microsoft.CodeDom.Providers.DotNetCompilerPlatform package
Write-Host "Installing Microsoft.CodeDom.Providers.DotNetCompilerPlatform..."
& $nugetPath install Microsoft.CodeDom.Providers.DotNetCompilerPlatform -Version 2.0.1 -OutputDirectory "$projectPath\packages"

# Copy Roslyn files to the bin\roslyn directory
$packagePath = Join-Path $projectPath "packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1"
$roslynSourcePath = Join-Path $packagePath "tools\roslyn-4.0.0-4.21055.31"

if (Test-Path $roslynSourcePath) {
    Write-Host "Copying Roslyn files to $roslynPath..."
    Copy-Item -Path "$roslynSourcePath\*" -Destination $roslynPath -Recurse -Force
    Write-Host "Roslyn files copied successfully."
} else {
    Write-Host "Could not find Roslyn source files at $roslynSourcePath"
    # Try to find roslyn files in the package
    $roslynFiles = Get-ChildItem -Path $packagePath -Recurse -Filter "csc.exe"
    if ($roslynFiles.Count -gt 0) {
        $foundRoslynPath = Split-Path -Parent $roslynFiles[0].FullName
        Write-Host "Found Roslyn files at $foundRoslynPath"
        Copy-Item -Path "$foundRoslynPath\*" -Destination $roslynPath -Recurse -Force
        Write-Host "Roslyn files copied successfully."
    } else {
        Write-Error "Could not find Roslyn compiler files in the package."
    }
}

Write-Host "Script completed."