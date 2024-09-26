﻿. (Join-Path $PSScriptRoot "Apache-Logs.ps1")
clear

$loggedIps = getIPs -page "*" -code "404" -browser "Firefox"

# All my ip addresses start with 184
$counts = $loggedIps | Group-Object IP
$counts | Select-Object Count, Name