# Define the path to your Quartus project folder
$folderPath = "C:\Users\Calvin\OneDrive\Documents\FPGAProjects\Directed-Study-FPGA"

# Start watching the folder for changes
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderPath
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Define the action to take when a change is detected
$action = {
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "Change detected at $time, committing and pushing changes..."

    # Run git commands to commit and push changes
    Set-Location $folderPath
    git add .
    git commit -m "Auto commit: $time"
    git push origin main
}

# Bind the action to the events (changed, created, deleted, renamed)
Register-ObjectEvent $watcher Changed -Action $action
Register-ObjectEvent $watcher Created -Action $action
Register-ObjectEvent $watcher Deleted -Action $action
Register-ObjectEvent $watcher Renamed -Action $action

# Keep the script running to continue monitoring
while ($true) {
    Start-Sleep -Seconds 1
}
