#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$SCRIPT_DIR/"
JAVA_EXE=""
SAVE_DIR="${ROOT}save"
RELEASE_REPO="xoo0524tw/Tenacity-Launcher"

mkdir -p "$SAVE_DIR"

if [ -x "${ROOT}files/jrex64-linux/bin/java" ]; then
    JAVA_EXE="${ROOT}files/jrex64-linux/bin/java"
elif command -v java &>/dev/null; then
    JAVA_EXE="$(command -v java)"
else
    echo "[Launcher] Java not found."
    echo "[Launcher] Please install Java 8 or place a Linux JRE in files/jrex64-linux/"
    echo "[Launcher]   Debian/Ubuntu:  sudo apt install openjdk-8-jre"
    echo "[Launcher]   Arch:            sudo pacman -S jre8-openjdk"
    echo "[Launcher]   Fedora:          sudo dnf install java-1.8.0-openjdk"
    exit 1
fi

echo "[Launcher] Using Java: $JAVA_EXE"

SCRIPT_DIR_FOR_UPDATE="$ROOT"
if ! bash "${ROOT}files/Update-Tenacity.sh" --root "$ROOT" --repo "$RELEASE_REPO"; then
    echo "[Updater] Failed to check or download the latest Tenacity.jar."
    if [ -f "${ROOT}Tenacity.jar" ]; then
        echo "[Updater] Launching the local Tenacity.jar instead."
    else
        echo "[Updater] Tenacity.jar is missing. Please check your internet connection and try again."
        exit 1
    fi
fi

cd "$SAVE_DIR"

exec "$JAVA_EXE" \
    -noverify \
    -Djava.library.path="${ROOT}files/natives" \
    -cp "${ROOT}Tenacity.jar:${ROOT}files/libs/*" \
    net.minecraft.client.main.Main \
    --version Tenacity \
    --accessToken 0 \
    --userProperties '{}' \
    --gameDir "." \
    --assetsDir "${ROOT}files/assets" \
    --assetIndex 1.8 \
    --width 854 \
    --height 480
