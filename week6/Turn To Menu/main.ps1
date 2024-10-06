. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot Process-Management-4.ps1)

clear

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - Display the last 10 apache logs`n"
$Prompt += "2 - Display the last 10 failed logins`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start chrome, or stop it if already running`n"
$Prompt += "5 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        $logs = ApacheLogs1
        Write-Host ($logs | Select -First 10 | Format-Table | Out-String)
    }

    elseif($choice -eq 2){ 
        $userLogins = getFailedLogins 999
        Write-Host ($userLogins | Format-Table | Out-String)
    }

    elseif($choice -eq 3) {
        $timeSince = Read-Host -Prompt "Please enter the number of days to search back."
        $userLogins = getFailedLogins $timeSince
        
        Write-Host ($userLogins | Group-Object -Property User | Where-Object { $_.Count -gt 10 } | Select-Object Name, Count | Format-Table | Out-String)
    }

    elseif($choice -eq 4){
        $chrome = Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

        if ($chrome.Length -eq 0) {
            Start-Process chrome "https://www.champlain.edu"
        } else {
            Stop-Process -Name chrome
        }
    }

    else {
        Write-Host "Please enter a number between 1 and 5."
    }
}