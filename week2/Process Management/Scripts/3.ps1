$stoppedServices =  Get-Service | Where-Object { $_.Status -eq "Stopped" } | Sort-Object
$stoppedServices
$stoppedServices | Export-Csv -Path "../stoppedServices.csv"