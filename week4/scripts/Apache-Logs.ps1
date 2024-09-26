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

function ApacheLogs1() {
    $logsnotformatted = Get-Content C:\xampp\apache\logs\access.log
    $tableRecords = @()
    
    for ($i=0; $i -lt $logsnotformatted.Count; $i++) {
        $words = $logsnotformatted[$i].Split(" ")

        $tableRecords += [pscustomobject]@{ `
            "IP" = $words[0]; `
            "Time" = $words[3].Trim('['); `
            "Method" = $words[5].Trim('"'); `
            "Page" = $words[6]; `
            "Protocol" = $words[7].Trim('"'); `
            "Response" = $words[8]; `
            "Referrer" = $words[10].Trim('"'); `
            "Client" = $words[11..($words.Length-1)]; `
        }
    }

    # Most of my ips start with 184
    return $tableRecords | Where-Object { $_.IP -ilike "184.*" }
}