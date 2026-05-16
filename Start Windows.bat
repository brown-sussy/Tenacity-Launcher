@echo off
setlocal
title Tenacity

set "ROOT=%~dp0"
set "JAVA_EXE=%ROOT%files\jre\bin\java.exe"
set "SAVE_DIR=%ROOT%save"

if not exist "%SAVE_DIR%" mkdir "%SAVE_DIR%"

pushd "%SAVE_DIR%"

"%JAVA_EXE%" ^
  -noverify ^
  -Djava.library.path="..\files\natives" ^
  -cp "..\Tenacity.jar;..\files\libs\*" ^
  net.minecraft.client.main.Main ^
  --version Tenacity ^
  --accessToken 0 ^
  --userProperties {} ^
  --gameDir "." ^
  --assetsDir "..\files\assets" ^
  --assetIndex 1.8 ^
  --width 854 ^
  --height 480

popd
pause
