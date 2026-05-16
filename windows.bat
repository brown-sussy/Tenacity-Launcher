@echo off
title Tenacity Launcher

:: 定義各個環境目錄的位置 (依照目前的專案結構去抓)
set ASSETS_DIR=run\assets
set NATIVES_DIR=dependency\natives
set GAME_DIR=run

:: 將你主要的客戶端核心跟所有的外部 Libs 取入啟動陣列 (; 符號代表並列讀取)
set CLASSPATH="Tenacity.jar;dependency\libs\*"

:: 如果你的專案有編譯根目錄的 [Start.java](cci:7://file:///c:/Users/USER/IdeaProjects/Tenacity/Start.java:0:0-0:0)，你可以用 Start 當主類別
:: 或者用最原生的 `net.minecraft.client.main.Main` 也是一樣的
set MAIN_CLASS=net.minecraft.client.main.Main

echo [*] Starting Tenacity Client...

:: 呼叫 Java 並帶入 Djava.library.path 讓引擎讀到 3D 的 DLL (natives)，接著輸入 Minecraft 需要的所有參數
"%~dp0dependency\jre\bin\java.exe" -noverify -Djava.library.path="%NATIVES_DIR%" -cp %CLASSPATH% %MAIN_CLASS% --version Tenacity --accessToken 0 --userProperties {} --gameDir "%GAME_DIR%" --assetsDir "%ASSETS_DIR%" --assetIndex 1.8 --width 854 --height 480

pause
