param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("production", "develop")]
    [string]$Environment,

    [Parameter(Mandatory=$true)]
    [ValidateSet("up", "down", "build")]
    [string]$Action,

    [Parameter(Mandatory=$false)]
    [ValidateSet("-d", "--no-cache", "")]
    [string]$Option = ""
)
$scriptDirectory = Split-Path -Parent $PSCommandPath

$readEnvModuleFile = $scriptDirectory + "\modules\read-env.ps1"
$startEnvironmentFile = $scriptDirectory + "\modules\start-environment.ps1"

. $readEnvModuleFile
. $startEnvironmentFile

$rootDirectory = Join-Path -Path $scriptDirectory -ChildPath "..\..\"

$ccBackendDirectory = $rootDirectory + "\cc-backend"

$ccBackedGoConfigurationFile = $ccBackendDirectory + "\docker\.go_configuration.env"

createEnvironmentVariables -envFilePath $ccBackedGoConfigurationFile

startEnvironment -SubmodulePath $rootDirectory -EnvironmentRelativePath $Environment -Action $Action -Option $Option