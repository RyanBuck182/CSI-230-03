﻿. (Join-Path $PSScriptRoot "Apache-Logs.ps1")
clear

$loggedIps = getIPs -page "*" -code "404" -browser "Firefox"

$counts = $loggedIps | Group-Object IP
$counts | Select-Object Count, Name

$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap