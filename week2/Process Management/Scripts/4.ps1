$chrome = Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

if ($chrome.Length -eq $null) {
    Start-Process "chrome.exe" "https://www.champlain.edu"
} else {
    for ($i=0; $i -lt $chrome.Length; $i++) {
        $chrome[$i].Kill()
    }
}
