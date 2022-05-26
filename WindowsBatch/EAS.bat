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
echo LOGIN:
echo.
set /p Password="Password: "

if [%Password%] == [5239] goto TEB_101
if [%Password%] == [1389] goto FLUFFY
if [%Password%] == [0001] goto MOBENIX
if [%Password%] == [6163] goto MILO
if [%Password%] == [3189] goto CACHE
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
set UserAllCaps=THEENDBOSS_101
set UserOrg=PEP
set UserCall=TEB_101
cls
goto main

:FLUFFY
title USER: IMAFLUFFYCAT
set User=imafluffycat
set UserAllCaps=IMAFLUFFYCAT
set UserOrg=CIV
set UserCall=FLUFFY
cls
goto main

:MOBENIX
title USER: 
set User=olv
set UserAllCaps=OLV
set UserOrg=ARC
set UserCall=MOBENIX
cls
goto main

:MILO
title USER: 
set User=milo
set UserAllCaps=MILO
set UserOrg=AMTF
set UserCall=MILO
cls
goto main

:CACHE
title USER: 
set User=cache99
set UserAllCaps=CACHE99
set UserOrg=CIV
set UserCall=CACHE
cls
goto main

rem MAIN:
:main
cls
echo EAS BATCH SYSTEM:
echo.
echo Welcome, %UserAllCaps%
echo What would you like to do?
echo 1: Make Message, 2: Print Values, 3: Update Github, 4:  Send Disocrd Webhooks, 5: Exit
set /p choice=""
if [%choice%] == [1] goto MakeEASMessage
if [%choice%] == [2] goto printvalues
if [%choice%] == [3] goto UpdateGithub
if [%choice%] == [4] goto SendDiscordWebhooks
if [%choice%] == [5] goto end
goto mainerror

:mainerror
title SELECTION ERROR
cls
echo EAS BATCH SYSTEM:
echo.
echo SELECTION ERROR
pause
goto main

:printvalues
cls
echo EAS BATCH SYSTEM:
echo PRINT VALUES:
echo.
echo Password: %Password%
echo choice: %choice%
echo User: %User%
echo UserAllCaps: %UserAllCaps%
echo UserOrg: %UserOrg%
echo UserCall: %UserCall%
echo eee: %eee%
echo tts: %tts%
echo ate: %ate%
echo purgetime: %purgetime%
echo pssccc: %pssccc%
echo message: %message%
echo.
echo DONE
pause
goto main

:MakeEASMessage
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo.
echo What would you like to do?
echo 1: Custom, 2: Premade
set /p choice=""
if [%choice%] == [1] goto MakeEASMessageCustom
if [%choice%] == [2] goto MakeEASMessagePremade
goto MakeEASMessageError

:MakeEASMessageError
title SELECTION ERROR
cls
echo EAS BATCH SYSTEM:
echo.
echo SELECTION ERROR
pause
goto MakeEASMessage

:MakeEASMessageCustom
echo EVENTS: LOOK AT HELP FILE FOR MORE INFO.
set /p eee=""
echo TTS: true/false
set /p tts=""
echo @everyone: true/false
set /p ate=""
echo Purge Time: 0000-9600
set /p purgetime=""
echo PSSCCC: LOOK AT HELP FILE FOR MORE INFO.
set /p pssccc=""
echo Message: 
set /p message=""
echo DONE
echo.
pause
goto main

:MakeEASMessagePremade
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo PREMADE:
echo.
echo What would you like to do?
echo 1: RDT, 2: RWT, 3: RMT, 4: EAN
set /p choice=""
if [%choice%] == [1] goto MakeEASMessagePremadeRDT
if [%choice%] == [2] goto MakeEASMessagePremadeRWT
if [%choice%] == [3] goto MakeEASMessagePremadeRMT
if [%choice%] == [4] goto MakeEASMessagePremadeEAN
goto MakeEASMessagePremadeError

:MakeEASMessagePremadeError
title SELECTION ERROR
cls
echo EAS BATCH SYSTEM:
echo.
echo SELECTION ERROR
pause
goto MakeEASMessagePremade

:MakeEASMessagePremadeRDT
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo PREMADE:
echo RDT PRESET
echo.
set eee=RDT
set tts=false
set ate=false
set purgetime=1200
echo PSSCCC: LOOK AT HELP FILE FOR MORE INFO.
set /p pssccc=""
set message="This is a coordinated daily test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
echo DONE
echo.
pause
goto main

:MakeEASMessagePremadeRWT
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo PREMADE:
echo RWT PRESET
echo.
set eee=RWT
echo TTS: true/false
set /p tts=""
set ate=false
set purgetime=1200
echo PSSCCC: LOOK AT HELP FILE FOR MORE INFO.
set /p pssccc=""
set message="This is a coordinated wealky test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
echo DONE
echo.
pause
goto main

:MakeEASMessagePremadeRMT
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo PREMADE:
echo RDT PRESET
echo.
set eee=RMT
echo TTS: true/false
set /p tts=""
echo @everyone: true/false
set /p ate=""
set purgetime=1200
echo PSSCCC: LOOK AT HELP FILE FOR MORE INFO.
set /p pssccc=""
set message="This is a coordinated monthly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
echo DONE
echo.
pause
goto main

:MakeEASMessagePremadeEAN
cls
echo EAS BATCH SYSTEM:
echo MAKE EAS MESSAGE:
echo PREMADE:
echo EAN PRESET
echo.
set eee=EAN
echo TTS: true/false
set /p tts=""
set ate=true
echo Purge Time: 0000-9600
set /p purgetime=""
echo PSSCCC: LOOK AT HELP FILE FOR MORE INFO.
set /p pssccc=""
set message="We interrupt our programming; this is a national emergency. This is an Emergency Action Notification. All broadcast stations and cable systems shall transmit this Emergency Action Notification Message. This station has interrupted its regular programming at the request of the %UserOrg% to participate in the Emergency Alert System.  During this emergency, most stations will remain on the air providing news and information to the public in assigned areas. This is %User%. We will continue to serve the %UserOrg% area. If you are not in this Local Area, you should tune to stations providing news and information for your Local Area. You are listening to the Emergency Alert System serving the %UserOrg% area. Do not use your telephone. The telephone lines should be kept open for emergency use. Do not spam the ${ORG} Discord. The Discord channels should be kept open for emergency use."
echo DONE
echo.
pause
goto main

:UpdateGithub
cls
echo EAS BATCH SYSTEM:
echo UPDATE GITHUB:
echo.
echo WIP
echo DONE
echo.
pause
goto main

rem DISCORD WEBHOOKs:
:SendDiscordWebhooks
cls
echo EAS BATCH SYSTEM:
echo DISCORD WEBHOOKS:
echo.
echo What would you like to do?
echo 1: NewARC, 2: ARC, 3: Custom
set /p choice=""
if [%choice%] == [1] goto SendDiscordWebhook1
if [%choice%] == [2] goto SendDiscordWebhook2
if [%choice%] == [3] goto SendDiscordWebhook0
goto :webhookerror

:webhookerror
title SELECTION ERROR
cls
echo EAS BATCH SYSTEM:
echo.
echo SELECTION ERROR
pause
goto SendDiscordWebhooks

:SendDiscordWebhook1
cls
echo EAS BATCH SYSTEM:
echo DISCORD WEBHOOK 1:
echo.
set WEBHOOK_URL=""
rem ???
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"hello\"}" ^
  %WEBHOOK_URL%
echo DONE
echo.
pause
goto main

:SendDiscordWebhook2
cls
echo EAS BATCH SYSTEM:
echo DISCORD WEBHOOK 2:
echo.
set WEBHOOK_URL=""
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"hello\"}" ^
  %WEBHOOK_URL%
echo DONE
echo.
pause
goto main

:SendDiscordWebhook0
cls
echo EAS BATCH SYSTEM:
echo DISCORD WEBHOOKS:
echo.
set /p WEBHOOK_URL="Webhook: "
rem ???
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"hello\"}" ^
  %WEBHOOK_URL%
echo DONE
echo.
pause
goto main

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