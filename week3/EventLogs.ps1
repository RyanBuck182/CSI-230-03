function getLoginLogoffLogs($days) {
    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

    $loginoutsTable = @()
    for ($i = 0; $i -lt $loginouts.Count; $i++) {
        $event = ""

        if($loginouts[$i].EventId -eq 7001) {$event="Logon"}
        if($loginouts[$i].EventId -eq 7002) {$event="Logoff"}
    
        $userid = $loginouts[$i].ReplacementStrings[1]
        $sid = New-Object System.Security.Principal.SecurityIdentifier($userid)
        $user = $sid.Translate([System.Security.Principal.NTAccount])

        $loginoutsTable += [pscustomobject]@{
             "Time" = $loginouts[$i].TimeGenerated;
               "Id" = $loginouts[$i].InstanceId;
            "Event" = $event;
             "User" = $user;
        }
    }

    return $loginoutsTable
}

function getStartupShutdownLogs($days) {
    $powerupdowns = Get-EventLog System -After (Get-Date).AddDays(-$days) | Where-Object { @(6005, 6006) -contains $_.EventId }

    $powerupdownsTable = @()
    for ($i = 0; $i -lt $powerupdowns.Count; $i++) {
        $event = ""

        if($powerupdowns[$i].EventId -eq 6005) {$event="Startup"}
        if($powerupdowns[$i].EventId -eq 6006) {$event="Shutdown"}
    
        $user = "System"

        $powerupdownsTable += [pscustomobject]@{
             "Time" = $powerupdowns[$i].TimeGenerated;
               "Id" = $powerupdowns[$i].EventId;
            "Event" = $event;
             "User" = $user;
        }
    }

    return $powerupdownsTable
}