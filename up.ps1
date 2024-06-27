# Declare constants
$FEDORA_EXEC            = "fedora.exe"
$FEDORA_USER            = "jonathan"
$FEDORA_WINGET_ID       = "9NPCP8DRCHSN"
$FEDORA_WSL_DISTRO_NAME = "Fedora"

# Initialize internal flags with default values
$FLAG_fedora_installed  = $false
$FLAG_fedora_configured = $false

function Install_Fedora {

    $fedora_check = (winget list --id $FEDORA_WINGET_ID) -match "$FEDORA_WINGET_ID"

    if ($fedora_check) {

        $FLAG_fedora_installed = $true

    }

    if (-not $FLAG_fedora_installed) {

        Write-Output "Fedora not found - downloading base image..."

        Install_Fedora_Base

        Write-Output "Fedora installed!"
        Write-Output "Launching interactive session to configure user / password..."

        Start-Process $FEDORA_EXEC

        exit 0

    }
    
}

function Install_Fedora_Base {
    
    winget install --id $FEDORA_WINGET_ID
    
}

function Configure_Fedora {

    $wsl_config = "/etc/wsl.conf"
    
    $fedora_config_check = (wsl -d $FEDORA_WSL_DISTRO_NAME ls $wsl_config)

    if ($fedora_config_check)  {

        $FLAG_fedora_configured = $true

    }

    if (-not $FLAG_fedora_configured) {

        Write-Output "SystemD not detected, enabling..."

        Set_SystemD

        Restart_Fedora

        Install_Packages

        Configure_LightDM

    }
    
}

function Set_SystemD {

    $bash_command = 'echo -e "[boot]\\nsystemd=true" >> /etc/wsl.conf'

    wsl -d $FEDORA_WSL_DISTRO_NAME -e sudo bash -c "$bash_command"

}

function Restart_Fedora {

    wsl -d $FEDORA_WSL_DISTRO_NAME --terminate $FEDORA_WSL_DISTRO_NAME

}

function Install_Packages {

    $bash_command = 'dnf upgrade -y'

    wsl -d $FEDORA_WSL_DISTRO_NAME -e sudo bash -c "$bash_command"

    $bash_command = 'dnf groupinstall -y "KDE Plasma Workspaces"'

    wsl -d $FEDORA_WSL_DISTRO_NAME -e sudo bash -c "$bash_command"

    $bash_command = 'dnf install -y dos2unix lightdm'

    wsl -d $FEDORA_WSL_DISTRO_NAME -e sudo bash -c "$bash_command"

}

function Configure_LightDM {

    $bash_command = "dos2unix ./bootstrap-kde-plasma && ./bootstrap-kde-plasma"

    wsl -d $FEDORA_WSL_DISTRO_NAME -u $FEDORA_USER -e bash -c "$bash_command"

}

function Main {

    Install_Fedora

    Configure_Fedora

}

Main
