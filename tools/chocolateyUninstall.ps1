$wrapperExe  = "$env:ChocolateyInstall\bin\nssm.exe"

Invoke-Expression "$wrapperExe stop nginx" -ErrorAction SilentlyContinue
Invoke-Expression "$wrapperExe remove nginx confirm"
