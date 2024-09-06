$folderpath = "C:\Users\champuser\CSI-230-03\scripts\outfolder\"

if (Test-Path $folderpath) {
    Write-Host "Folder Already Exists"
}
else {
    New-Item -ItemType "directory" -Path $folderpath
}