$wrapperExe  = "$env:ChocolateyInstall\bin\nssm.exe"
$serviceExe  = "$env:ChocolateyInstall\bin\nginx.exe"
$configFile  = 'C:\ProgramData\nginx\conf\nginx.conf'
$installRoot = 'C:\ProgramData\nginx'

$scriptDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$confDir     = (Join-Path $scriptDir -ChildPath "..\conf") | Resolve-Path

# Build a simple nginx directory by copying the directory structure from this package
Copy-Item -Path "$confDir" -Destination "$installRoot" –Recurse -Force

# and then build an nssm service wrapper
Invoke-Expression "$wrapperExe install nginx $serviceExe -c $configFile -p $installRoot"
