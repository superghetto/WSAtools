@echo off

:: The following lines are used to check admin access.
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    GOTO start
) ELSE (
    ECHO Please run this script as administrator. If you didn't know how to run it, then right click then Run as Administrator.
    pause
    exit
)

:start
echo Windows Subsystem for Android installation script
echo This script simplifies the installation of Windows Subsystem for Android and requires compatible Windows 11 computers to install it, no matter you're a Windows Insider or a normal Windows user.
echo This might take 1.2GB of your storage space. Data charges apply.
echo pause
echo Starting download...
:: Change the line below to use a different installer. See https://github.com/weareblahs/wsa-auto-install[hash]how-this-works---a-teardown.
aria2c -x 16 -s 16 -o wsa_installation.msixbundle "https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbFUxUzJPMlNvMmtxVFMzRWxlenljN3hhbXBUP2U9Mkx0SHh4/root/content" 

echo Starting installation...
:: After downloading, take the renamed file to install through Powershell.
powershell Add-AppxPackage -Path wsa_installation.msixbundle

echo Installation complete!
echo Before you try out Windows Subsystem for Android, make sure you enable "Virtual Machine Platform" under the "Turn Windows features on or off" section.
pause
exit
