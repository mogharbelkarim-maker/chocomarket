@echo off
REM ChocoMarket - Automated GitHub Push Script
REM This script pushes your project to GitHub automatically

setlocal enabledelayedexpansion

cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║      ChocoMarket - GitHub Push Setup Script               ║
echo ║            Upload to GitHub in 2 minutes                  ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ✗ ERROR: Git is not installed!
    echo.
    echo SOLUTION: 
    echo 1. Download from: https://git-scm.com/download/win
    echo 2. Run installer (accept all defaults)
    echo 3. Restart your terminal
    echo 4. Run this script again
    echo.
    pause
    exit /b 1
)

echo ✓ Git found
echo.

REM Set variables
set PROJECT_PATH=c:\Users\Toshiba\Documents\chocomarket
set /p GITHUB_USERNAME="Enter your GitHub username: "
set /p GITHUB_REPO="Enter your repo name (default: chocomarket): "

if "%GITHUB_REPO%"=="" (
    set GITHUB_REPO=chocomarket
)

set GITHUB_URL=https://github.com/%GITHUB_USERNAME%/%GITHUB_REPO%.git

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Configuration:
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo GitHub Username: %GITHUB_USERNAME%
echo Repository: %GITHUB_REPO%
echo URL: %GITHUB_URL%
echo.
echo ⚠️  IMPORTANT: You must:
echo 1. Have a GitHub account (create at github.com if needed)
echo 2. Have already created the repository "%GITHUB_REPO%"
echo 3. Have Git installed and configured
echo.

set /p CONFIRM="Continue? (y/n): "
if /i not "%CONFIRM%"=="y" (
    echo Cancelled.
    pause
    exit /b 0
)

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 1: Navigate to project
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
cd /d %PROJECT_PATH%
if errorlevel 1 (
    echo ✗ ERROR: Cannot navigate to project folder
    pause
    exit /b 1
)
echo ✓ In project: %PROJECT_PATH%
echo.

REM Check if already a git repo
if exist .git (
    echo ✓ Git repository already initialized
    echo.
    echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    echo Step 2: Update remote URL
    echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    git remote remove origin
    git remote add origin %GITHUB_URL%
    echo ✓ Remote URL set to: %GITHUB_URL%
) else (
    echo ✓ Initializing new git repository
    echo.
    echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    echo Step 2: Initialize Git
    echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    git init
    git config user.name "%GITHUB_USERNAME%"
    git config user.email "user@example.com"
    git remote add origin %GITHUB_URL%
    echo ✓ Git initialized
)
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 3: Stage files
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git add .
echo ✓ All files staged
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 4: Commit
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git commit -m "Initial commit: ChocoMarket Flutter app"
if errorlevel 1 (
    echo ✓ No changes to commit (already up to date)
) else (
    echo ✓ Committed
)
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 5: Push to GitHub
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo This may ask for:
echo - GitHub username
echo - GitHub password (or token)
echo.
git push -u origin main
if errorlevel 1 (
    echo.
    echo ⚠️  Push failed. This usually means:
    echo 1. Repository doesn't exist on GitHub
    echo 2. Wrong GitHub credentials
    echo 3. No internet connection
    echo.
    echo SOLUTION:
    echo 1. Go to https://github.com/new
    echo 2. Create repository "%GITHUB_REPO%"
    echo 3. Run this script again
    echo.
    pause
    exit /b 1
)
echo ✓ Pushed to GitHub
echo.

echo ╔════════════════════════════════════════════════════════════╗
echo ║                   SUCCESS! ✓                               ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Your project is now on GitHub!
echo.
echo Next steps:
echo 1. Go to https://replit.com
echo 2. Sign up (free)
echo 3. Click "+ Create"
echo 4. Select "Import from GitHub"
echo 5. Paste: %GITHUB_URL%
echo 6. Click "Import"
echo.
echo That's it! Replit will set up Flutter automatically.
echo.
echo Then run in Replit terminal:
echo   flutter pub get
echo   flutter run -d chrome
echo.
echo Your app will open in browser! 🎉
echo.
pause
