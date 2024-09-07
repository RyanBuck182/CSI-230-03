$chrome = Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

if ($chrome.Length -eq 0) {
    Start-Process chrome "https://www.champlain.edu"
} else {
    Stop-Process -Name chrome
}