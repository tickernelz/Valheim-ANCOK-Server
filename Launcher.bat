@ECHO OFF
:BEGIN
SETLOCAL
SET "plugins=BepInEx\plugins"
SET "config=BepInEx\config"
SET "keepconfig1=ValheimFPSBoost"
SET "keepplugins1=ValheimFPSBoost"
SET "keepfile="
ECHO Updating Valheim ANCOK
ECHO ------------------------
FOR /d %%a IN ("%config%\*") DO IF /i NOT "%%~nxa"=="%keepconfig1%" RD /S /Q "%%a"
FOR %%a IN ("%config%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
FOR /d %%a IN ("%plugins%\*") DO IF /i NOT "%%~nxa"=="%keepplugins1%" RD /S /Q "%%a"
FOR %%a IN ("%plugins%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
set GIT_PATH="updater\bin\git.exe"
set BRANCH = "origin"
%GIT_PATH% pull %BRANCH%
%GIT_PATH% reset --hard %BRANCH%
ECHO ------------------------
ECHO Launching Valheim
start "" "valheim.exe" -windows-mode exclusive
:END