# ☁️ ChocoMarket - Cloud-Ready Setup

## For Cloud Platforms (Replit, GitHub Codespaces, Gitpod, etc.)

This setup works on **any cloud development environment** that supports Flutter.

### Supported Platforms:
- ✅ **Replit** (replit.com)
- ✅ **GitHub Codespaces** (github.com)
- ✅ **Gitpod** (gitpod.io)
- ✅ **Google Cloud Shell** (console.cloud.google.com)
- ✅ **AWS Cloud9** (aws.amazon.com/cloud9)
- ✅ **Heroku** (with buildpack)

---

## Option 1: Replit Setup

### Step 1: Import Project to Replit

1. Go to https://replit.com
2. Sign up (free account)
3. Click "+ Create"
4. Select "Import from GitHub"
5. Enter: `https://github.com/YOUR_GITHUB/chocomarket`
6. Click "Import"

### Step 2: Install Flutter (Automatic)

Replit may auto-detect Flutter. If not:

```bash
# In Replit Shell
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz | tar xJ
export PATH=$PATH:$HOME/flutter/bin
flutter doctor
```

### Step 3: Get Dependencies

```bash
flutter pub get
```

### Step 4: Run on Replit

```bash
flutter run -d chrome
```

**Opens app in browser!** 🌐

---

## Option 2: GitHub Codespaces Setup

### Step 1: Create Codespace

1. Go to your GitHub repo
2. Click "Code" → "Codespaces"
3. Click "Create codespace on main"
4. Wait for environment to load

### Step 2: Install Flutter

In terminal:

```bash
git clone https://github.com/flutter/flutter.git ~/flutter
export PATH=$PATH:~/flutter/bin
flutter doctor
```

### Step 3: Setup Project

```bash
cd chocomarket
flutter pub get
```

### Step 4: Run Web Version

```bash
flutter run -d chrome
```

**App runs in browser preview!** 🌐

---

## Option 3: Gitpod Setup

### Step 1: Open in Gitpod

Go to: `https://gitpod.io#https://github.com/YOUR_GITHUB/chocomarket`

(Replace with your repo)

### Step 2: Auto Setup

Gitpod auto-installs Flutter. If not:

```bash
brew install flutter
flutter doctor
```

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Run App

```bash
flutter run -d web
```

Opens in Gitpod browser preview!

---

## Option 4: Google Cloud Shell Setup

### Step 1: Open Cloud Shell

Go to: https://console.cloud.google.com/cloudshell/open

### Step 2: Clone Project

```bash
git clone https://github.com/YOUR_GITHUB/chocomarket.git
cd chocomarket
```

### Step 3: Install Flutter

```bash
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz
tar xf flutter_linux_3.10.0-stable.tar.xz
export PATH=$PATH:$PWD/flutter/bin
flutter doctor
```

### Step 4: Get Dependencies

```bash
flutter pub get
```

### Step 5: Run Web Version

```bash
flutter run -d web
```

**Web version runs in Cloud Shell terminal!** 🌐

---

## Common Cloud Commands

### Install Flutter in Any Cloud Environment

```bash
# Download Flutter
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz | tar xJ

# Add to PATH
export PATH=$PATH:$HOME/flutter/bin

# Verify
flutter --version
```

### Get Dependencies

```bash
cd chocomarket
flutter pub get
```

### Run Web Version

```bash
flutter run -d web
```

### Run Android Emulator (if available)

```bash
flutter run
```

### Build for Web

```bash
flutter build web
flutter run -d web --release
```

---

## Cloud Platform Comparison

| Platform | Browser | Android | iOS | Cost | Speed |
|----------|---------|---------|-----|------|-------|
| **Replit** | ✅ | ✅ | ⚠️ | Free | Fast |
| **GitHub Codespaces** | ✅ | ⚠️ | ❌ | $15/mo | Very Fast |
| **Gitpod** | ✅ | ✅ | ❌ | Free | Fast |
| **Google Cloud Shell** | ✅ | ✅ | ❌ | Free | Medium |
| **AWS Cloud9** | ✅ | ✅ | ❌ | $0.50/hr | Fast |

**Recommendation for beginners:** Start with **Replit** or **Gitpod** (free, easy to use)

---

## Cloud Setup for Firebase

### Step 1: Enable Firebase in Cloud Project

```bash
gcloud services enable firestore.googleapis.com
gcloud services enable firebase.googleapis.com
```

### Step 2: Create Firestore Database

```bash
gcloud firestore databases create --location=europe-west1
```

### Step 3: Add Products via CLI

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Set project
firebase use --add

# Add product
firebase firestore:add products choco_1 nameEn "Dark Chocolate Bar"
```

### Step 4: Use in App

Update `GOOGLE_APPLICATION_CREDENTIALS`:

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account-key.json"
```

---

## Running Tests in Cloud

### Cloud Unit Tests

```bash
flutter test
```

### Cloud Integration Tests

```bash
flutter drive --target=test_driver/app.dart
```

### Cloud Performance Tests

```bash
flutter test --verbose
```

---

## Deployment Options

### Option A: Deploy Web to GitHub Pages

```bash
# Build web
flutter build web

# Deploy
git add build/web
git commit -m "Deploy web"
git push origin main
```

### Option B: Deploy to Firebase Hosting

```bash
# Install Firebase tools
npm install -g firebase-tools

# Login
firebase login

# Initialize
firebase init hosting

# Deploy
firebase deploy
```

### Option C: Deploy to Heroku

Create `Procfile`:

```
release: flutter pub get
web: flutter run -d web --dart-define=FLUTTER_WEB_USE_SKIA=true
```

```bash
heroku create chocomarket
git push heroku main
```

### Option D: Deploy to Vercel

Create `vercel.json`:

```json
{
  "buildCommand": "flutter build web",
  "outputDirectory": "build/web"
}
```

```bash
npm install -g vercel
vercel
```

---

## Environment Variables in Cloud

### Set Firebase Credentials

```bash
# In cloud environment
export FIREBASE_API_KEY="your-api-key"
export FIREBASE_PROJECT_ID="chocomarket-xyz"
export FIREBASE_AUTH_DOMAIN="chocomarket.firebaseapp.com"
```

### Use in App

Update `lib/main.dart`:

```dart
final firebaseConfig = FirebaseOptions(
  apiKey: const String.fromEnvironment('FIREBASE_API_KEY'),
  projectId: const String.fromEnvironment('FIREBASE_PROJECT_ID'),
  authDomain: const String.fromEnvironment('FIREBASE_AUTH_DOMAIN'),
);
```

---

## Continuous Integration in Cloud

### GitHub Actions Workflow

Create `.github/workflows/build.yml`:

```yaml
name: Build & Test

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter build web
```

### Push to Deploy

```bash
git push origin main
# GitHub Actions automatically:
# - Installs dependencies
# - Runs tests
# - Builds app
# - Deploys to Firebase/Heroku/Vercel
```

---

## Cloud Advantages

✅ **No local setup needed**
✅ **Access from anywhere**
✅ **Automatic backups**
✅ **Easy team collaboration**
✅ **Continuous deployment**
✅ **Scales automatically**
✅ **Always up-to-date environment**

---

## Quick Cloud Commands Summary

```bash
# Clone project
git clone https://github.com/YOUR_GITHUB/chocomarket.git
cd chocomarket

# Setup Flutter
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz | tar xJ
export PATH=$PATH:$PWD/flutter/bin

# Install dependencies
flutter pub get

# Run web version
flutter run -d web

# Deploy to Firebase
firebase init hosting
flutter build web
firebase deploy
```

---

## Recommended Cloud Setup

### For Development:
**Gitpod** (free, easy, instant setup)

### For Deployment:
**Firebase Hosting** (free tier, automatic HTTPS, CDN)

### For Production:
**Google Cloud Run** (scalable, pay-per-use, fast)

---

## Support

All cloud platforms support Flutter out of the box!

- **Replit**: No setup needed
- **GitHub Codespaces**: Built-in terminal
- **Gitpod**: Pre-configured for Flutter
- **Google Cloud Shell**: gcloud CLI
- **AWS Cloud9**: EC2 instance with terminal

---

**Cloud development is the future! ☁️**

Enjoy building ChocoMarket in the cloud!
