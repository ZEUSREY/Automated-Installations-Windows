::::::::::::::::::::::::::::::::::::::::::::
:: Instalador Automático Janeano Riera
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM In this state it will Run shell as admin (example) - add your code here
REM ECHO %batchName% Arguments: %1 %2 %3 %4 %5 %6 %7 %8 %9
REM cmd /k


REM @Echo on desactivar optimizacion del disco







REM @Echo on detener Wupdates

sc config wuauserv start= disabled

REM C:\Users\Administrator>net stop wuauserv
REM The Windows Update service is stopping.
REM The Windows Update service was stopped successfully.

REM @Echo on Desabilitar updates

REM C:\>sc config wuauserv start= disabled
REM  [SC] ChangeServiceConfig SUCCESS


@Echo on


if not exist "C:\temp" mkdir C:\temp

xcopy d:\temp c:\temp /s /e /h /K /D /Y
start "" cmd /c "echo Asegurate de haber actualizado la tienda de aplicaciones &echo(&pause"
@Echo on
start "C:\temp" winget#2.bat
REM start "C:\temp" InDesign_Set-Up.exe \quiet
REM start "C:\temp" Photoshop_Set-Up.exe \quiet
REM echo start "C:\temp" Autodesk_AutoCAD_2024_1_2_en-US_setup_webinstall.exe -q
REM start "C:\temp" OfficeSetup_20231129_183625.exe configuration-Office365-x64.xml
REM start "C:\temp" MSTeams-x64.msix
REM start "C:\temp" epskit_x64.exe
REM start "C:\temp" OneDriveSetup.exe
start "C:\temp" HostsMan_Setup.exe /VERYSILENT /NORESTART
start "" cmd /c "echo Desactivaste las notificaciones de Windows? &echo(&pause"
start "" cmd /c "echo Desactivaste aplicaciones en segundo plano &echo(&pause"
start "" cmd /c "echo Cabiar el nombre al equipo y registrarlo en el inventario &echo(&pause"
start "" cmd /c "echo Optimizar los efectos visuales, dejar iconos y fuentes visibles&echo(&pause"
start "" cmd /c "echo Revisa que las aplicaciones esten instaladas&echo(&pause"
powershell -noexit "& ""C:\temp\disableNotifications.ps1"""



timeout 3600>nul
exit
