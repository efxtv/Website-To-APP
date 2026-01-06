#!/bin/bash
set -e

ICON_URL="https://cdn-icons-png.freepik.com/256/5752/5752262.png"
TMP_ICON="icon_src.png"

echo "[+] Downloading icon..."
curl -L "$ICON_URL" -o "$TMP_ICON"

if [ ! -f "$TMP_ICON" ]; then
    echo "[!] Failed to download icon"
    exit 1
fi

echo "[+] Generating launcher icons..."

convert "$TMP_ICON" -resize 48x48   app/src/main/res/mipmap-mdpi/ic_launcher.png
convert "$TMP_ICON" -resize 72x72   app/src/main/res/mipmap-hdpi/ic_launcher.png
convert "$TMP_ICON" -resize 96x96   app/src/main/res/mipmap-xhdpi/ic_launcher.png
convert "$TMP_ICON" -resize 144x144 app/src/main/res/mipmap-xxhdpi/ic_launcher.png
convert "$TMP_ICON" -resize 192x192 app/src/main/res/mipmap-xxxhdpi/ic_launcher.png

rm "$TMP_ICON"

echo "[✓] Launcher icon updated successfully"
