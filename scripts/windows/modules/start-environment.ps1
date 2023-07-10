
function startEnvironment {
    param (
        [string]$SubmodulePath,

        [string]$EnvironmentRelativePath,

        [string]$Action,

        [string]$Option
    )

    $dockerComposeFileDirectory = $SubmodulePath + "\" + $EnvironmentRelativePath

    $command = "docker-compose -f $dockerComposeFileDirectory\docker-compose.yml $Action $Option"

    Invoke-Expression $command
}