$wrapperExe  = 'C:\ProgramData\chocolatey\bin\nssm.exe'

try {
  Invoke-Expression "$wrapperExe stop nginx" -ErrorAction SilentlyContinue
  Invoke-Expression "$wrapperExe remove nginx confirm"

  Write-ChocolateySuccess "nginx-service"
} catch {
  Write-ChocolateyFailure "nginx-service" "$($_.Exception.Message)"
  throw
}

