#!/bin/bash

# Path to the file
FILE="$HOME/LifeCalender/app/src/main/java/com/lifecalender/andrn/MainActivity.java"

# Base Links
YEAR_URL="https://lifecal-virid.vercel.app/days?height=2340&width=1080"
LIFE_BASE="https://lifecal-virid.vercel.app/life?birthday=USER_DOB&height=2340&width=1080"
GOAL_BASE="https://lifecal-virid.vercel.app/goal?goal=USER_GOAL&goal_date=USER_END&start_date=USER_START&height=2340&width=1080"

echo "--------------------------"
echo "   LifeCalender Modifier  "
echo "--------------------------"
echo "[1] Year"
echo "[2] Life (Requires DOB)"
echo "[3] Goals (Custom Goal)"
echo "[4] Reset to MODIFYME"
echo "--------------------------"
read -p "[ INPUT ] : " CHOICE

case $CHOICE in
    1)
        TARGET_URL=$YEAR_URL
        ;;
    2)
        read -p "[ INPUT ] Date DOB (YYYY-MM-DD): " DOB
        TARGET_URL=${LIFE_BASE/USER_DOB/$DOB}
        ;;
    3)
        read -p "[ INPUT ] Enter your goal (A-Z): " U_GOAL
        read -p "[ INPUT ] Enter start date (YYYY-MM-DD): " U_START
        read -p "[ INPUT ] Enter end date (YYYY-MM-DD): " U_END
        
        TARGET_URL=$GOAL_BASE
        TARGET_URL=${TARGET_URL/USER_GOAL/$U_GOAL}
        TARGET_URL=${TARGET_URL/USER_START/$U_START}
        TARGET_URL=${TARGET_URL/USER_END/$U_END}
        ;;
    4)
        TARGET_URL="MODIFYME"
        ;;
    *)
        echo "Invalid Option. Exiting."
        exit 1
        ;;
esac

# THE FIX: Replace the whole of line 27 with exactly what we want.
# We use 'c' (change) command in sed to overwrite the line.
# Added 8 spaces for correct Java indentation.

sed -i "27c\        webView.loadUrl(\"$TARGET_URL\");" "$FILE"

echo "--------------------------"
echo "[   OK  ] SUCCESS"
echo "--------------------------"
