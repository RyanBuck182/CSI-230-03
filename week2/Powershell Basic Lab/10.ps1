$scriptsPath = "C:\Users\champuser\CSI-230-03\scripts"

cd $scriptsPath
$files = Get-ChildItem

$folderPath = "$scriptsPath\outfolder"
$filePath = Join-Path $folderPath "out.csv"

$files | Where-Object { $_.Extension -eq ".ps1" } | Export-Csv -Path $filePath
