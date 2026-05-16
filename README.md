# Tenacity Launcher

## 中文說明

### 新手安裝

1. 前往 Tenacity Launcher 的 GitHub 倉庫。
2. 點擊綠色的 `Code` 按鈕，選擇 `Download ZIP`。
   - 直接下載：<https://github.com/xoo0524tw/Tenacity-Launcher/archive/refs/heads/main.zip>
3. 將下載好的 ZIP 解壓縮到任意資料夾。
4. 開啟解壓縮後的資料夾。
5. 雙擊 `Start Windows.bat`。

第一次啟動時，啟動器會自動檢查 GitHub Releases，下載最新的 `Tenacity.jar`，然後啟動 Tenacity。

### 資料夾說明

```text
Tenacity-Launcher/
  files/              啟動器需要的執行檔、Java、libs、natives、assets
  save/               Minecraft/Tenacity 設定、帳號、截圖、ViaMCP 設定
  Tenacity.jar         第一次啟動後自動下載的 Tenacity 核心
  Start Windows.bat   Windows 啟動腳本
```

一般使用者只需要雙擊 `Start Windows.bat`，不要移動或刪除 `files/` 內的檔案。

### 自動更新

`Start Windows.bat` 會在每次啟動前執行更新檢查：

- 如果沒有 `Tenacity.jar`，會自動下載最新版本。
- 如果 GitHub Releases 有新的 release tag，會自動更新 `Tenacity.jar`。
- 如果網路失敗，但本機已經有 `Tenacity.jar`，會直接使用本機版本啟動。
- 如果是第一次啟動，而且網路失敗導致無法下載 `Tenacity.jar`，啟動器會停止並提示重新嘗試。

Release asset 建議命名為 `Tenacity.jar`。啟動器會優先尋找這個名稱。

### 常見問題

**雙擊後閃退或沒有下載核心**

請確認網路可連線到 GitHub，並確認 GitHub Releases 裡有上傳 `Tenacity.jar`。

**想重新下載核心**

刪除 `Tenacity.jar` 和 `save/Tenacity.version`，再重新執行 `Start Windows.bat`。

**設定和截圖在哪裡**

所有使用者資料都在 `save/` 裡面。

---

## English Guide

### Installation For New Users

1. Open the Tenacity Launcher GitHub repository.
2. Click the green `Code` button, then choose `Download ZIP`.
   - Direct download: <https://github.com/xoo0524tw/Tenacity-Launcher/archive/refs/heads/main.zip>
3. Extract the downloaded ZIP anywhere you want.
4. Open the extracted folder.
5. Double-click `Start Windows.bat`.

On the first launch, the launcher automatically checks GitHub Releases, downloads the latest `Tenacity.jar`, and starts Tenacity.

### Folder Layout

```text
Tenacity-Launcher/
  files/              Runtime files, Java, libs, natives, assets
  save/               Minecraft/Tenacity settings, accounts, screenshots, ViaMCP settings
  Tenacity.jar         Tenacity core, downloaded automatically after the first launch
  Start Windows.bat   Windows launcher script
```

Most users only need to double-click `Start Windows.bat`. Do not move or delete files inside `files/`.

### Auto Update

`Start Windows.bat` checks for updates before launching:

- If `Tenacity.jar` is missing, it downloads the latest version automatically.
- If GitHub Releases has a newer release tag, it updates `Tenacity.jar`.
- If the update check fails but a local `Tenacity.jar` exists, it launches the local version.
- If this is the first launch and the launcher cannot download `Tenacity.jar`, it stops and asks you to try again.

The release asset should be named `Tenacity.jar`. The launcher looks for this file first.

### Troubleshooting

**The launcher closes or does not download the core**

Make sure your connection can reach GitHub, and make sure the latest GitHub Release includes `Tenacity.jar`.

**Force the core to download again**

Delete `Tenacity.jar` and `save/Tenacity.version`, then run `Start Windows.bat` again.

**Where are my settings and screenshots**

All user data is stored inside `save/`.
