@echo off
REM ChocoMarket - Automated Setup Script
REM This script automates everything except Firebase configuration

setlocal enabledelayedexpansion

color 0A
cls

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║        ChocoMarket - Automated Setup Script                ║
echo ║            Flutter E-Commerce App                          ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Set project path
set PROJECT_PATH=c:\Users\Toshiba\Documents\chocomarket
cd /d %PROJECT_PATH%

if not exist "pubspec.yaml" (
    echo ERROR: pubspec.yaml not found!
    echo This script must be run from the project root directory
    pause
    exit /b 1
)

echo ✓ Project found: %PROJECT_PATH%
echo.

REM Step 1: Check Flutter installation
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 1: Checking Flutter Installation...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
flutter --version
if errorlevel 1 (
    echo.
    echo ✗ ERROR: Flutter is not installed or not in PATH
    echo.
    echo SOLUTION: Install Flutter from https://flutter.dev/docs/get-started/install
    echo Then restart your terminal and run this script again
    echo.
    pause
    exit /b 1
)
echo ✓ Flutter found
echo.

REM Step 2: Clean Flutter
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 2: Cleaning Flutter Cache...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
flutter clean
echo ✓ Flutter cache cleaned
echo.

REM Step 3: Get dependencies
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 3: Installing Dependencies...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
flutter pub get
if errorlevel 1 (
    echo.
    echo ✗ ERROR: Failed to get dependencies
    pause
    exit /b 1
)
echo ✓ Dependencies installed
echo.

REM Step 4: Check Flutter setup
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 4: Running Flutter Doctor...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
flutter doctor
echo.

REM Step 5: Check for Firebase configuration
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 5: Checking Firebase Configuration...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if exist "android\app\google-services.json" (
    echo ✓ Android: google-services.json found
) else (
    echo ✗ Android: google-services.json NOT found
    echo   You need to download this from Firebase Console
)

if exist "ios\Runner\GoogleService-Info.plist" (
    echo ✓ iOS: GoogleService-Info.plist found
) else (
    echo ✗ iOS: GoogleService-Info.plist NOT found
    echo   You need to download this from Firebase Console
)
echo.

REM Step 6: Summary
echo ╔════════════════════════════════════════════════════════════╗
echo ║                    SETUP COMPLETE                          ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

echo ✓ Flutter dependencies installed
echo ✓ Project ready to run
echo.

REM Check if Firebase files are ready
if not exist "android\app\google-services.json" (
    goto FIREBASE_NEEDED
)
if not exist "ios\Runner\GoogleService-Info.plist" (
    goto FIREBASE_NEEDED
)

echo ✓ Firebase configuration files detected
echo.
echo YOU CAN NOW RUN:
echo   flutter run
echo.
pause
exit /b 0

:FIREBASE_NEEDED
echo ⚠️  FIREBASE SETUP REQUIRED
echo.
echo You still need to:
echo   1. Create Firebase project at firebase.google.com
echo   2. Download google-services.json (Android)
echo   3. Download GoogleService-Info.plist (iOS)
echo   4. Place files in correct locations (see FIREBASE_SETUP.md)
echo   5. Create Firestore database
echo   6. Add sample products to Firestore
echo   7. Configure Firestore security rules
echo.
echo DETAILED GUIDE: Open FIREBASE_SETUP.md in your editor
echo.
echo Once Firebase setup is complete, run:
echo   flutter run
echo.
pause
exit /b 0
