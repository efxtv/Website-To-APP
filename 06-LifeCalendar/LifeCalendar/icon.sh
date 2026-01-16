#!/bin/bash

# Configuration
PROJECT_DIR="$HOME/LifeCalender"
RES_DIR="$PROJECT_DIR/app/src/main/res"
MANIFEST="$PROJECT_DIR/app/src/main/AndroidManifest.xml"
SOURCE_IMG="$PROJECT_DIR/logo.png"

echo "Creating a professional logo using ImageMagick..."

# 1. Create a 512x512 logo from scratch using a more compatible gradient syntax
# If radial-gradient fails, it will at least create a solid DeepSkyBlue background
convert -size 512x512 radial-gradient:"#00BFFF-#000000" \
    -fill white -pointsize 250 -gravity center -font DejaVu-Sans-Bold \
    -draw "text 0,0 'LC'" \
    "$SOURCE_IMG" || \
convert -size 512x512 xc:DeepSkyBlue \
    -fill white -pointsize 250 -gravity center -font DejaVu-Sans-Bold \
    -draw "text 0,0 'LC'" \
    "$SOURCE_IMG"

if [ ! -f "$SOURCE_IMG" ]; then
    echo "Error: Failed to create logo.png."
    exit 1
fi

echo "Generating Android Icons (Mipmaps)..."

# 2. Define densities and sizes
declare -A DENSITIES=( 
    ["mipmap-mdpi"]=48 
    ["mipmap-hdpi"]=72 
    ["mipmap-xhdpi"]=96 
    ["mipmap-xxhdpi"]=144 
    ["mipmap-xxxhdpi"]=192 
)

for DIR in "${!DENSITIES[@]}"; do
    SIZE="${DENSITIES[$DIR]}"
    mkdir -p "$RES_DIR/$DIR"
    # Create standard and round versions
    convert "$SOURCE_IMG" -resize "${SIZE}x${SIZE}" "$RES_DIR/$DIR/ic_launcher.png"
    convert "$SOURCE_IMG" -resize "${SIZE}x${SIZE}" "$RES_DIR/$DIR/ic_launcher_round.png"
    echo "Created $DIR/ic_launcher.png"
done

echo "Updating AndroidManifest.xml..."

# 3. Ensure Manifest uses the icon
if ! grep -q "android:icon" "$MANIFEST"; then
    sed -i 's/<application/<application android:icon="@mipmap\/ic_launcher" android:roundIcon="@mipmap\/ic_launcher_round"/' "$MANIFEST"
    echo "Manifest updated."
else
    echo "Manifest already contains icon reference."
fi

echo "----------------------------------------"
echo "Success! Build your APK with: ./gradlew assembleDebug"
