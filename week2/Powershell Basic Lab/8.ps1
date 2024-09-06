cd C:\Users\champuser\CSI-230-03\scripts

$files=(Get-ChildItem)
for ($j=0; $j -le $files.Length; $j++) {
    if ($files[$j].Name -ilike "*ps1") {
        Write-Host $files[$j].Name
    }
}