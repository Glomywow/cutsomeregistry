@echo off

set day=%DATE:~0,2%
set month=%DATE:~3,2%
set year=%DATE:~6,4%

set hour=%TIME:~0,2%
set minute=%TIME:~3,2%



set YYYYMMDDhhmm=%year%-%month%-%day%-%hour%%minute%

echo %YYYYMMDDhhmm%

net stop "1C:Enterprise 8.3 Server Agent (x86-64)"
ping beta
robocopy "C:\Program Files\1cv8\srvinfo\reg_1541" "J:\Log\Bak" /xf *.lst *.lgf /xd "*snccntx*" /e /move
net start "1C:Enterprise 8.3 Server Agent (x86-64)"
7za.exe a -tzip -ssw -mx5 "J:\Log\%YYYYMMDDhhmm%.zip"  "J:\Log\Bak" -sdel
forfiles.exe /p J:\Log\ /s /m *.* /d -60 /c "cmd /c del /q /f @file"
