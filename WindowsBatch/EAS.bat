rem SETUP:
@echo off
color 0A
cls
goto login

rem LOGIN:
:login
cls

set /p Password="login:"

if [%Password%] == [5239] goto TEB_101
goto loginerror

:loginerror
cls
echo LOGIN ERROR
pause
goto login

rem USERS:
:TEB_101
cls
echo Welcome, TheEndBoss_101
echo.
goto end

rem EXIT BARCH:
:end
echo.
echo Paused!
pause
@echo on
color 0F
cls