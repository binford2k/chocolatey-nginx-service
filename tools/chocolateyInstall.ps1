$wrapperExe  = 'C:\ProgramData\chocolatey\bin\nssm.exe'
$serviceExe  = 'C:\ProgramData\chocolatey\bin\nginx.exe'
$configFile  = 'C:\ProgramData\nginx\conf\nginx.conf'
$installRoot = 'C:\ProgramData\nginx\'

$scriptDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$confDir     = (Join-Path $scriptDir -ChildPath "..\confdir") | Resolve-Path

try {
  # Build a simple nginx directory by copying the directory structure from this package
  Copy-Item -Path $confDir -Destination $installRoot –Recurse

  # and then build an nssm service wrapper
  Invoke-Expression "$wrapperExe install nginx $serviceExe -c $configFile -p $installRoot"

  Write-ChocolateySuccess "nginx-service"
} catch {
  Write-ChocolateyFailure "nginx-service" "$($_.Exception.Message)"
  throw
}
