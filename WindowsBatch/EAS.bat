rem SETUP:
@echo off
color 0A
cls
goto login

rem LOGIN:
:login
title LOGIN
cls

echo EAS BATCH SYSTEM:
echo.
set /p Password="login: "

if [%Password%] == [5239] goto TEB_101
goto loginerror

:loginerror
title LOGIN ERROR
cls
echo EAS BATCH SYSTEM:
echo.
echo LOGIN ERROR
pause
goto login

rem USERS:
:TEB_101
title USER: THEENDBOSS_101
set User=TheEndBoss_101
set UserOrg=TEB_101
cls
echo EAS BATCH SYSTEM:
echo.
echo Welcome, TheEndBoss_101
echo What would you like to do?
set /p whattodo="1: Send EAS Message "
if [%whattodo%] == [1] goto SendDiscordWebhooks
goto :TEB_101
rem echo.
rem goto end

rem DISCORD WEBHOOKs:
:SendDiscordWebhooks
set /p whatwebhook="1: NewARC, 2: ARC "
if [%whatwebhook%] == [1] goto SendDiscordWebhook1
goto :SendDiscordWebhooks

rem DISCORD WEBHOOK1:
:SendDiscordWebhook1
set WEBHOOK_URL=""
rem ???
curl ^
  -H "Content-Type: application/json" ^
  -d "{"content": "/:rotating_light/:** \=\=\= /*/E/A/S /M/E/S/S/A/G/E/* /=/=/= /*/* /:rotating_light/: \nHeader/: \`ORG-EEE-PSSCCC-HHMM-LLLLLLLL\` \nMessage/: \`MSG\`\"}" ^
  %WEBHOOK_URL%
goto end

rem DISCORD WEBHOOK2:
:SendDiscordWebhook2
set WEBHOOK_URL=""
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"hello\"}" ^
  %WEBHOOK_URL%
goto end

rem EXIT BATCH:
:end
echo.
echo Paused!
pause
color 0F
title Command Prompt
cls
cmd /k
@echo on