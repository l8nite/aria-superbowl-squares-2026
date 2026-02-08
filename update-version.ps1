# Update build timestamp in HTML files before commit
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$dir = $PSScriptRoot

foreach ($file in @("index.html", "admin.html")) {
    $path = Join-Path $dir $file
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        $content = $content -replace "BUILD_TIME_PLACEHOLDER", $timestamp
        $content | Set-Content $path -NoNewline
        git add $path
        Write-Host "Updated $file build timestamp to: $timestamp"
    }
}
