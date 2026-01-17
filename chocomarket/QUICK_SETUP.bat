@echo off
REM ChocoMarket - Quick Setup Script

echo.
echo ================================================
echo   ChocoMarket Flutter App - Quick Setup
echo ================================================
echo.

echo Step 1: Cleaning Flutter...
flutter clean
echo ✓ Cleaned

echo.
echo Step 2: Getting dependencies...
flutter pub get
echo ✓ Dependencies installed

echo.
echo Step 3: Checking Flutter setup...
flutter doctor
echo.

echo ================================================
echo   NEXT STEPS:
echo ================================================
echo.
echo 1. Open FIREBASE_SETUP.md for detailed Firebase setup
echo.
echo 2. Key tasks:
echo    - Create Firebase project at firebase.google.com
echo    - Download google-services.json (Android)
echo    - Download GoogleService-Info.plist (iOS)
echo    - Create Firestore "products" collection
echo    - Add sample data from sample_firestore_data.json
echo.
echo 3. Run the app:
echo    flutter run
echo.
echo 4. Test admin panel with PIN: 1234
echo.
echo ================================================
echo.

pause
