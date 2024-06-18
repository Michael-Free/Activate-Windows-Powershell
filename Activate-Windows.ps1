function Set-KmsActivation {
    param(
        [string]$KmsClientKey,
        [string]$KmsServer
    )

    $SlmgrPath = Join-Path -Path $env:SystemRoot -ChildPath "System32\slmgr.vbs"

    if (-not [string]::IsNullOrWhiteSpace($KmsClientKey)) {
        Write-Output "Installing KMS Client Key silently..."
        cscript.exe //Nologo $SlmgrPath /ipk $KmsClientKey
    } else {
        Write-Output "KMS Client Key is not provided."
    }

    if (-not [string]::IsNullOrWhiteSpace($KmsServer)) {
        Write-Output "Setting KMS Server to $KmsServer silently..."
        cscript.exe //Nologo $SlmgrPath /skms $KmsServer
    } else {
        Write-Output "KMS Server is not provided."
    }

    Write-Output "Activating Windows silently..."
    cscript.exe //Nologo $SlmgrPath /ato 

    Write-Output "Checking Activation Status..."
    cscript.exe //Nologo $SlmgrPath /dli
}

function Set-MakActivation {
    param(
        [string]$MakKey
    )

    $SlmgrPath = Join-Path -Path $env:SystemRoot -ChildPath "System32\slmgr.vbs"

    if (-not [string]::IsNullOrWhiteSpace($MakKey)) {
        Write-Output "Installing MAK Key silently..."
        cscript.exe //Nologo $SlmgrPath /ipk $MakKey

        Write-Output "Activating Windows silently..."
        cscript.exe //Nologo $SlmgrPath /ato

        Write-Output "Checking Activation Status..."
        cscript.exe //Nologo $SlmgrPath /dli
    } else {
        Write-Output "MAK Key is not provided."
    }
}
