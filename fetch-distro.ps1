# Declare constants
$DISTRO_EXEC              = "ubuntu2404.exe"
# $DISTRO_USER              = "jonathan"
$DISTRO_WINGET_LOCAL_ID   = "CanonicalGroupLimited.Ubuntu24.04LTS_79rhkp1fndgsc"
$DISTRO_WINGET_PACKAGE_ID = "9NZ3KLHXDJP5"
$DISTRO_NAME_WSL          = "Ubuntu-24.04"

# Initialize internal flags with default values
$FLAG_distro_installed  = $false

function Install_Distro {

    $distro_check = (winget list --id $DISTRO_WINGET_LOCAL_ID) -match "$DISTRO_WINGET_LOCAL_ID"

    if ($distro_check) {

        $FLAG_distro_installed = $true

    }

    if (-not $FLAG_distro_installed) {

        Write-Output "Distro not found - downloading base image..."

        Install_Distro_Base
        Install_Packages

        Write-Output "Distro installed!"
        Write-Output "Launching interactive session to configure user / password..."

        Start-Process $DISTRO_EXEC

        exit 0

    }
    
}

function Install_Distro_Base {
    
    winget install --id $DISTRO_WINGET_PACKAGE_ID
    
}

function Install_Packages {

    $bash_command = 'apt update && apt upgrade -y && apt install dos2unix xfce4'

    wsl -d $DISTRO_NAME_WSL -u root -e bash -c "$bash_command"

}

function Main {

    Install_Distro

}

Main
