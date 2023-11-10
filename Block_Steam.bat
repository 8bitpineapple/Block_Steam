@echo off
set RuleName=Block_Steam

:: Check if the firewall rule exists
netsh advfirewall firewall show rule name="%RuleName%" > nul 2>&1

if %errorlevel% equ 0 (
    :: Firewall Rule Exists
    echo Firewall rule "%RuleName%" exists.
    goto ToggleFireWallRule
    

) else (
:: Firewall Rule Doesn't Exist
    echo Firewall rule "%RuleName%" does not exist.
    goto CreateRule
)


:CreateRule
setlocal enabledelayedexpansion

:: Find Steam installation folder from Windows registry
set "SteamRegKey="
if defined ProgramFiles(x86) set "SteamRegKey=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam"
if not defined ProgramFiles(x86) set "SteamRegKey=HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam"

set "SteamExePath="
for /f "tokens=2*" %%a in ('reg query "%SteamRegKey%" /v InstallPath ^| find "InstallPath"') do set "SteamExePath=%%b"

if not defined SteamExePath (
    echo Steam not found in the registry.
    goto :Done
)

:: Append \steam.exe to the installation path
set "SteamExePath=!SteamExePath!\steam.exe"

:: Display Steam installation path
echo Steam executable is located at: %SteamExePath%

:: Check if the rule already exists
netsh advfirewall firewall show rule name="%RuleName%" > nul 2>&1

if %errorlevel% neq 0 (
    echo Creating firewall rule to block Steam executable.
    netsh advfirewall firewall add rule name="%RuleName%" dir=out program="%SteamExePath%" action=block
    echo Firewall rule created.
) else (
    echo Firewall rule "%RuleName%" already exists. No action taken.
)

goto Done

:ToggleFireWallRule
:: Check if the rule is enabled
netsh advfirewall firewall show rule name="%RuleName%" | find "Enabled:                              Yes" > nul

if %errorlevel% equ 0 (
    echo Enabling Internet Acess for Steam
    netsh advfirewall firewall set rule name="%RuleName%" new enable=no
    echo Internet access available.

) else (
    echo Disabling Internet Acess for Steam
    netsh advfirewall firewall set rule name="%RuleName%" new enable=yes
    echo Internet access disabled.
)
goto Done


:Done
pause
exit /b
