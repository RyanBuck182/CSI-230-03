$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 '

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}

# All my ip addresses start with 184
$ipsoftens = $ips | Where-Object { $_.IP -ilike "184.*" }
$counts = $ipsoftens | Group-Object IP
$counts | Select-Object Count, Name