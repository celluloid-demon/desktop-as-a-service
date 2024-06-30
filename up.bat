@echo off

REM Fetch distro and necessary packages.

@REM powershell -NoProfile -ExecutionPolicy Bypass -File ".\fetch-distro.ps1"

REM 1: up-vcxsrv

@REM start "" /B ".\xfce.xlaunch"

REM wsl --distribution ubuntu-24.04 -u jonathan -e bash --login -c "dos2unix ./up-xfce && ./up-xfce"
REM wsl --distribution ubuntu-24.04 -u jonathan -e byobu new-session -d -s xfce-session -l "dos2unix ./up-xfce && ./up-xfce && exec bash"

REM Summary:
REM - Change up-xfce line endings
REM - Run up-xfce in a login shell

@REM wsl --distribution ubuntu-24.04 -u jonathan -e tmux new-session -d -s xfce 'dos2unix ./up-xfce && bash --login -c ./up-xfce'
wsl --distribution ubuntu-24.04 -u jonathan -e tmux new-session -d -s xfce 'dos2unix ./up-xfce && bash --login -c ./up-xfce'

@REM timeout /t 2 /nobreak > nul

@REM wsl --distribution ubuntu-24.04 -u jonathan -e tmux attach-session -t xfce
