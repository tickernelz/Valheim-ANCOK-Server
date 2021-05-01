@ECHO OFF
:BEGIN
SETLOCAL
SET "plugins=BepInEx\plugins"
SET "config=BepInEx\config"
SET "keepfolderconfig1="
SET "keepfileconfig1="
SET "keepfolderplugins1=ValheimFPSBoost"
SET "keepfileplugins1="
ECHO Updating Valheim ANCOK
ECHO ------------------------
FOR /d %%a IN ("%config%\*") DO IF /i NOT "%%~nxa"=="%keepfolderconfig1%" RD /S /Q "%%a"
FOR %%a IN ("%config%\*") DO IF /i NOT "%%~nxa"=="%keepfileconfig1%" DEL "%%a"
FOR /d %%a IN ("%plugins%\*") DO IF /i NOT "%%~nxa"=="%keepfolderplugins1%" RD /S /Q "%%a"
FOR %%a IN ("%plugins%\*") DO IF /i NOT "%%~nxa"=="%keepfileplugins1%" DEL "%%a"
set GIT_PATH="updater\bin\git.exe"
set BRANCH = "origin"
%GIT_PATH% pull %BRANCH%
%GIT_PATH% reset --hard %BRANCH%
TIMEOUT /T 5
ECHO ------------------------
ECHO Launching Valheim
cmd.exe /c start "Valheim" /high "valheim.exe" "-windows-mode exclusive"
:END