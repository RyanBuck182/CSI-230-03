function getIPs($page, $code, $browser) {
    $page = '/' + $page + ' '
    $code = ' ' + $code + ' '
    $browser = ' ' + $browser + '/'
    
    $logs = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String -Pattern $page | Select-String -Pattern $code | Select-String -Pattern $browser
    
    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    $ipsUnorganized = $regex.Matches($logs)

    $ips = @()
    for($i=0; $i -lt $ipsUnorganized.Count; $i++){
        $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
    }

    return $ips
}