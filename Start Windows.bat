@echo off
setlocal
title Tenacity

set "ROOT=%~dp0"
set "JAVA_EXE=%ROOT%files\jre\bin\java.exe"
set "SAVE_DIR=%ROOT%save"
set "RELEASE_REPO=xoo0524tw/Tenacity-Launcher"

if not exist "%SAVE_DIR%" mkdir "%SAVE_DIR%"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%ROOT%files\Update-Tenacity.ps1" -Root "%ROOT%." -Repo "%RELEASE_REPO%"
if errorlevel 1 (
  echo [Updater] Failed to check or download the latest Tenacity.jar.
  if exist "%ROOT%Tenacity.jar" (
    echo [Updater] Launching the local Tenacity.jar instead.
  ) else (
    echo [Updater] Tenacity.jar is missing. Please check your internet connection and try again.
    pause
    exit /b 1
  )
)

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
