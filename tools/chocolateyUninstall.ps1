$wrapperExe  = 'C:\ProgramData\chocolatey\bin\nssm.exe'

try {
  Invoke-Expression "$wrapperExe stop nginx"
  Invoke-Expression "$wrapperExe remove nginx"

  Write-ChocolateySuccess "nginx-service"
} catch {
  Write-ChocolateyFailure "nginx-service" "$($_.Exception.Message)"
  throw
}
