# The Life Calendar (Android)

An Android implementation of the famous Life Calendar concept, inspired by [The Life Calendar](https://www.thelifecalendar.com/). This app provides a visual representation of your life in weeks, days, or specific goals, helping you visualize time and maintain perspective.

---

## 🚀 Project Overview

This project was built entirely using **Android Command Line Tools** and **Android Studio**. It uses a high-performance `WebView` container to render a responsive web-based calendar interface.

### Project Specifications:
- **App Name:** LifeCalender
- **Package Name:** `com.lifecalender.andrn`
- **Minimum Android Version:** 10.0 (API 29)
- **Target SDK:** Android 14+ (API 36 Ready)
- **Build System:** Gradle (Namespace-based configuration)

### 🔍 Interactive Customization Modes (Deep Dive)

The `mod.sh` script transforms the application logic dynamically before compilation. Here is what each option specifically configures:

#### [1] Year View (Standard)
* **Action:** Sets the app to the default "Days" view.
* **Outcome:** Visualizes the current calendar year. It is ideal for users who want to track their progress through the current 365-day cycle. 
* **Technical Change:** Injects the `/days` endpoint into the WebView loader.

#### [2] Life View (Personalized)
* **Action:** Prompts the user for their Date of Birth (`YYYY-MM-DD`).
* **Outcome:** Generates a "Life Map" visualization. It calculates how many weeks you have lived and how many (statistically) you have left. It turns the app into a memento mori tool, helping you realize the value of every passing week of your life.
* **Technical Change:** Dynamically constructs a URL with the `birthday` query parameter.

#### [3] Goals View (Targeted)
* **Action:** Prompts for a Goal Name (e.g., "Learn Python"), a Start Date, and an End Date.
* **Outcome:** Creates a dedicated countdown and progress tracker for a specific milestone. The WebView renders a custom grid showing exactly how much time remains until your deadline, providing a sense of urgency and focus for long-term projects.
* **Technical Change:** Performs triple-string replacement in the URL to handle the `goal`, `start_date`, and `goal_date` parameters.

#### [4] Reset & Template
* **Action:** Reverts the source code to the `MODIFYME` string.
* **Outcome:** Allows the developer to start fresh or use the project as a template for a different web-to-app conversion without manual file editing.

---

## ✨ Key Features

### 1. High-Performance WebView Integration
- **Responsive Design:** Automatically scales to fit any Android screen resolution.
- **Hardware Acceleration:** Uses `DOM Storage` and `JavaScript` enabled settings to ensure smooth rendering of the Vercel-hosted web app.
- **Navigation Control:** Overridden back-button behavior to allow internal web navigation without closing the app.

### 2. Multi-Mode Configuration (mod.sh)
A custom automation script (`mod.sh`) allows the user to switch between four distinct calendar modes instantly by modifying the Java source code directly from the terminal:
- **Year View:** Displays the standard calendar for the current year.
- **Life View:** Calculates and displays your life progress based on a user-provided Date of Birth (YYYY-MM-DD).
- **Goal View:** Allows tracking of specific life goals (e.g., "Buying a House") by inputting a goal name, start date, and end date.
- **Reset Mode:** Reverts the source code to a template state for fresh configuration.

### 3. Automated Asset Generation
- **Dynamic Logo Creation:** Uses ImageMagick to generate a professional-grade 512x512 radial-gradient logo with "LC" monogramming from scratch.
- **Automated Mipmapping:** A script handles the resizing of the generated logo into five different Android densities:
  - `mdpi` (48x48)
  - `hdpi` (72x72)
  - `xhdpi` (96x96)
  - `xxhdpi` (144x144)
  - `xxxhdpi` (192x192)

### 4. Modern Manifest Architecture
- Adheres to Android 14+ standards by removing the legacy `package` attribute from the `AndroidManifest.xml`.
- Uses the `namespace` property in `build.gradle` for higher compatibility.
- Supports both standard and round icon configurations.

---

## 🛠️ Automated Scripts Included

| Script | Purpose |
| :--- | :--- |
| `app.sh` | Initializes the entire Android directory structure and core Java/Gradle files. |
| `mod.sh` | Interactive CLI to change the App URL, inject DOB, or set custom Goal parameters. |
| `make_logo.sh`| Generates the app icon using ImageMagick and updates the Android Manifest. |

---

## 📦 How to Build

1. **Initialize Project:**
   ```
   bash app.sh
   ```

2. **Customize View:**
   ```
   bash mod.sh
   ```

3. **Compile APK**
   ```
   source ~/.bashrc
   ./gradlew assembleDebug
   ```

---

## 🔗 Credits
- Concept: Inspired by [The Life Calendar](https://www.thelifecalendar.com/)
- Web Engine: Hosted on Vercel at [lifecal-virid.vercel.app](https://www.google.com/search?q=https://lifecal-virid.vercel.app/)
  
