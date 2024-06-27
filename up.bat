@echo off

REM Fetch distro and necessary packages.

powershell -NoProfile -ExecutionPolicy Bypass -File ".\fetch-distro.ps1"

REM up-x

start "" /B ".\xfce.xlaunch"

REM up-pulseaudio

start "" /B "C:\pulseaudio\bin\pulseaudio.exe"

REM up-xfce

REM wsl --distribution ubuntu-24.04 -u jonathan -e bash --login -c "dos2unix ./up-xfce && ./up-xfce"
wsl --distribution ubuntu-24.04 -u jonathan -e byobu new-session -d -s xfce-session -l "dos2unix ./up-xfce && ./up-xfce && exec bash"

timeout /t 2 /nobreak > nul

wsl --distribution ubuntu-24.04 -u jonathan -e byobu attach -t xfce-session
