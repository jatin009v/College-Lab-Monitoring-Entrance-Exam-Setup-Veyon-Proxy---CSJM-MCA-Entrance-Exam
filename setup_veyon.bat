//Batch Script

@echo off
title Veyon Client Auto-Configurator
echo ----------------------------------------------------------
echo Veyon Client Setup Shuru Ho Raha Hai...
echo ----------------------------------------------------------

:: 1. Veyon Configurator ka path check karna (Default path)
set "VEYON_CLI=C:\Program Files\Veyon\veyon-cli.exe"

if not exist "%VEYON_CLI%" (
    echo [ERROR] Veyon installed nahi hai ya path galat hai!
    pause
    exit
)

:: 2. Authentication Method set karna (Key File)
echo Setting Authentication Method to Key File...
"%VEYON_CLI%" config set Authentication/Method 1

:: 3. Public Key Import karna
:: NOTE: 'Your_Key_Name' ki jagah apni key ka naam likho jo Master pe rakha tha
:: NOTE: 'my_public_key.pem' ki jagah apni file ka asli naam likho
echo Importing Public Key...
"%VEYON_CLI%" authkeys import Exam_2026/public "%~dp0my_public_key.pem"

:: 4. Service Restart karna settings apply karne ke liye
echo Restarting Veyon Service...
net stop VeyonService
net start VeyonService

echo ----------------------------------------------------------
echo Setup Successfully Complete! Ab ye PC Master se connect ho jayega.
echo ----------------------------------------------------------
pause
