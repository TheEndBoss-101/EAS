@echo off
SET WEBHOOK_URL=https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g
SET User=imafluffycat
SET CallSign=FLUFFY
SET ORG=CIV

echo Welcome, User %User%
echo DISCORD EAS WEBHOOK WINDOWS BATCH.
echo VER: 2.0, DEV.
echo REPORT TO TheEndBoss_101 FOR ANY ERRORS.
echo DO NOT SHARE!

echo.
echo "Options: DMO" 
set /p EEE="Enter EEE{Event}: "
echo.
echo "Options: PSSCCC" 
echo "Format: P, SS, CCC"
set /p PSSCCC="Enter PSSCCC{FIPS Code}: "
echo.
echo "Options: Purge Time"
echo "Format: Hour, Hour, Muinte, Muinte"
set /p HHMM="Enter HHMM: "
echo.
echo "Format: NONE ANY OF THE FOLLOWING CHARACTERS: -"
set /p Message="Enter Message: "
echo.

echo %ORG%-%EEE%-%HHMM%-%CallSign%+%Message%

:choice
echo.
set /P c=Are you sure you want to continue[Y/N]?
echo.
if /I "%c:~,1%" EQU "Y" goto :continue
if /I "%c:~,1%" EQU "N" goto :abort
goto :choice

:continue
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"EAS EVENT: ``` %ORG%-%EEE%-%HHMM%-%CallSign%+%Message% ``` Transcript: ``` %Message% ```\"}" ^
  %WEBHOOK_URL%
  goto :end

:abort

echo ABORTED

:end