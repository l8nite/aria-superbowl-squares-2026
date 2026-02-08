# Update build timestamp in index.html before commit
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$content = Get-Content "index.html" -Raw
$content = $content -replace "BUILD_TIME_PLACEHOLDER", $timestamp
$content | Set-Content "index.html" -NoNewline
Write-Host "Updated build timestamp to: $timestamp"
