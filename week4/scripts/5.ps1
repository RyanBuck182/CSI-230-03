﻿Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ', ' 400 '