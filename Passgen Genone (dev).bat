@echo off
setlocal enabledelayedexpansion
title Genone (devopt)
chcp 65001 >nul
:: add a title
goto gen1

:gen1
:: show a logo
cls
echo ██████╗  █████╗ ███████╗███████╗ ██████╗ ███████╗███╗   ██╗     ██████╗ ███████╗███╗   ██╗ ██████╗ ███╗   ██╗███████╗
echo ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝ ██╔════╝████╗  ██║    ██╔════╝ ██╔════╝████╗  ██║██╔═══██╗████╗  ██║██╔════╝
echo ██████╔╝███████║███████╗███████╗██║  ███╗█████╗  ██╔██╗ ██║    ██║  ███╗█████╗  ██╔██╗ ██║██║   ██║██╔██╗ ██║█████╗  
echo ██╔═══╝ ██╔══██║╚════██║╚════██║██║   ██║██╔══╝  ██║╚██╗██║    ██║   ██║██╔══╝  ██║╚██╗██║██║   ██║██║╚██╗██║██╔══╝  
echo ██║     ██║  ██║███████║███████║╚██████╔╝███████╗██║ ╚████║    ╚██████╔╝███████╗██║ ╚████║╚██████╔╝██║ ╚████║███████╗
echo ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝     ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
echo.
echo                                          Passgen Genone - Build 19-02-2025
echo                                           Type a command, or write "info"
echo.
goto cm

:cm
set /p command=^>^>^>
:: prompt the user for a command
if "%command%"=="about" goto cm-about
if "%command%"=="info" goto cm-info
if "%command%"=="developer" goto cm-developer
if "%command%"=="gen" goto cm-gen
echo Invalid syntax or command
goto cm

:cm-about
:: about a program
cls
echo  ██████╗ ███████╗███╗   ██╗    Passgen Genone
echo ██╔════╝ ██╔════╝████╗  ██║    Author: Escobar
echo ██║  ███╗█████╗  ██╔██╗ ██║    Build number: 1x0
echo ██║   ██║██╔══╝  ██║╚██╗██║    Current engine: Genone 2xx
echo ╚██████╔╝███████╗██║ ╚████║    Date compiled: 19-02-25
echo  ╚═════╝ ╚══════╝╚═╝  ╚═══╝    Developer build: False
echo  ██████╗ ███╗   ██╗███████╗    Encoding: UTF-8
echo ██╔═══██╗████╗  ██║██╔════╝    
echo ██║   ██║██╔██╗ ██║█████╗      Downloaded from GitHub
echo ██║   ██║██║╚██╗██║██╔══╝      Genone does NOT store your passwords anywhere!
echo ╚██████╔╝██║ ╚████║███████╗    They are stored temporarily in your terminal,
echo  ╚═════╝ ╚═╝  ╚═══╝╚══════╝    and they get deleted after you exit the :gen process.
goto cm

:cm-info
:: show t7he list of commands
echo Availible commands;
echo about - About this program
echo developer - Show developer options (authentication required)
echo gen - Generate a password
echo info - Show this screen
goto cm

:cm-gen
cls
echo  ██████╗ ███████╗███╗   ██╗ ██████╗ ███╗   ██╗███████╗
echo ██╔════╝ ██╔════╝████╗  ██║██╔═══██╗████╗  ██║██╔════╝
echo ██║  ███╗█████╗  ██╔██╗ ██║██║   ██║██╔██╗ ██║█████╗  
echo ██║   ██║██╔══╝  ██║╚██╗██║██║   ██║██║╚██╗██║██╔══╝  
echo ╚██████╔╝███████╗██║ ╚████║╚██████╔╝██║ ╚████║███████╗
echo  ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
:: fixed length for password
set length=14
:: what characters could be used
set chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()
:: initialize passwords variable
set password=
:: the good part hell yeah
for /l %%i in (1,1,!length!) do (
    set /a index=!random! %% 72
    call set "password=%%password%%%%chars:~!index!,1%%"
)

:: what is that passwords man
echo.
echo Generated password: !password!
echo.
echo To generate more, type in "gen" in the console more times
goto cm

::devstuff
:cm-developer
:: check if ran for admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo devopt loading error: run script with administrative privileges
    echo press 1 to force into :cm-developer-sc (unrecommended)
    echo press 2 to exit
    set /p choice-exit-or-load=nmb-
    if "%choice-exit-or-load%"=="1" goto cm-developer-sc-01
    if "%choice-exit-or-load%"=="2" goto cm
    goto cm
)

:cm-developer-sc-01
cls
echo ██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ████████╗
echo ██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗╚══██╔══╝
echo ██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝   ██║
echo ██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝    ██║ 
echo ██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║        ██║ 
echo ╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝        ╚═╝ 
echo enter any key to login as: dev-operator
pause >nul
goto cm-developer-sc

:cm-developer-sc
:: Youre in
cls
echo ██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ████████╗
echo ██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗╚══██╔══╝
echo ██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝   ██║
echo ██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝    ██║ 
echo ██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║        ██║ 
echo ╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝        ╚═╝ 
echo enter a command to begin. you can use "./devopt-help"
goto cm-developer-sc-loop

:cm-developer-sc-loop
:: cmd type thing
set /p dev_command=dev-operator'int'^>
if "%dev_command%"=="./devopt-help" goto cm-developer-cm-help
if "%dev_command%"=="./show-source" goto cm-developer-cm-source
if "%dev_command%"=="./check-updates" goto cm-developer-cm-upd
if "%dev_command%"=="./download-updates" goto cm-developer-cm-upd0
if "%dev_command%"=="./exit" goto cm
echo invalid command. type "./devopt-help" for a list of commands.
goto cm-developer-sc-loop

:cm-developer-cm-help
:: commands
echo availible commands
echo ./devopt-help - show this screen
echo ./show-source - view the sourcecode
echo ./check-updates - view availible updates
echo ./download-updates - add updates to an update folder
echo ./exit - exit devopt
goto cm-developer-sc-loop

:cm-developer-cm-source
:: see source code
cls
echo acquiring source code.. this might take a while
timeout /t 3 /nobreak >nul
echo done!
echo.
type "%~f0"
pause
goto cm-developer-sc

:cm-developer-cm-upd
echo checking for updates...
:: fetch update information from a github repository
curl -L -o update_info.txt "https://raw.githubusercontent.com/escobands/genone/main/updatearch/infoupd/upd-info-23.txt"
echo.
echo update Information:
echo.
type update_info.txt
del update_info.txt
pause
goto cm-developer-sc-loop

:cm-developer-cm-upd0
:: update
cls
set /p update_folder=enter the folder to download updates: 
if not exist "%update_folder%" (
    echo error: the folder "%update_folder%" does not exist, or is invalid
    pause
    goto cm-developer-sc-loop
)
echo downloading updates to %update_folder%...
:: download updates from GitHub
curl -L -o "%update_folder%\update.zip" "https://github.com/escobands/genone/main/updatearch/reference/update.zip"
if errorlevel 1 (
    echo error: failed to download updates / No updates to install
    pause
    goto cm-developer-sc-loop
)
echo updates downloaded successfully.
pause
goto cm-developer-sc-loop

