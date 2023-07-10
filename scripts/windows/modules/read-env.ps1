

function createEnvironmentVariables {
    param (
        [string]$envFilePath
    )

    $envLines = Get-Content -Path $envFilePath

    foreach ($line in $envLines) {
        if ($line -match '^\s*#') {
            continue
        }

        $parts = $line -split '=', 2

        if ($parts.Length -eq 2) {
            $envName = $parts[0].Trim()
            $envValue = $parts[1].Trim()

            Set-Item -Path Env:$envName -Value $envValue
        }
    }
}