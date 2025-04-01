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




@Echo on

start "C:\Users\admin\Desktop" InDesign_Set-Up.exe \quiet
start "C:\Users\admin\Desktop" Photoshop_Set-Up.exe \quiet
start "C:\Users\admin\Desktop" Autodesk_AutoCAD_2024_1_2_en-US_setup_webinstall.exe -q
start "C:\Users\admin\Desktop" OfficeSetup_20231129_183625.exe /Configure configuration-Office365-x64.xml
