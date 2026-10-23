Clear-Host
# Check for Administrative rights
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "WARNING: You must run this PowerShell window as Administrator to apply registry changes!" -ForegroundColor Red
    Pause
    Exit
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "         WEBVIEW2 ACTIVATOR MENU         " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " [1] Activate WebView2 for GoDaddy M365"
Write-Host " [2] Exit"
Write-Host ""

$Selection = Read-Host "Enter your choice (1 or 2)"

if ($Selection -eq "1") {
    Write-Host "`nFetching the Registry modification script..." -ForegroundColor Yellow
    
    # Target the new /scripts/ folder location in your repository
    $ActivateScriptUrl = "https://githubusercontent.com"
    
    irm $ActivateScriptUrl | iex
} 
else {
    Write-Host "Exiting." -ForegroundColor Gray
}
