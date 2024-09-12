. (Join-Path $PSScriptRoot "EventLogs.ps1")
clear

$loginoutsTable = getLoginLogoffLogs(15)
$loginoutsTable

$powerupsdownsTable = getStartupShutdownLogs(25)
$powerupsdownsTable

