@echo off
del /f /q gm13b_eas_sys.gma
echo Deleted gm13b_eas_sys.gma
"D:\SteamLibrary\steamapps\common\GarrysMod\bin\gmad.exe" create -folder D:\SteamLibrary\steamapps\common\GarrysMod\garrysmod\addons\EAS\Comp\gm13b_eas_sys
"D:\SteamLibrary\steamapps\common\GarrysMod\bin\gmpublish.exe" update -addon gm13b_eas_sys.gma -id "2802018714" -changes "Fixed something"
