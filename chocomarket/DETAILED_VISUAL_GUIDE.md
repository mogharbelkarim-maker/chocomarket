# 📖 ChocoMarket - Detailed Visual Setup Guide

## Part 1: Install Flutter

### Step 1.1: Download Flutter

**What to do:**
1. Go to https://flutter.dev/docs/get-started/install
2. Click "Windows"
3. Download the latest stable version (ZIP file, ~500MB)

**Screenshot simulation:**
```
Flutter.dev
├── Get Started
│   ├── Install (← Click here)
│   │   ├── Windows
│   │   │   └── Download ZIP ← Download this
│   │   ├── macOS
│   │   └── Linux
```

**Expected file:** `flutter_windows_3.x.x-stable.zip` (varies by version)

### Step 1.2: Extract Flutter

**What to do:**
1. Right-click the downloaded ZIP file
2. Select "Extract All..."
3. Choose location: `C:\flutter` (recommended)
4. Wait for extraction to complete (~1 minute)

**Result:**
```
C:\flutter\
├── bin\
│   ├── flutter.bat
│   ├── flutter.bat.sha256sum
│   └── ... (other tools)
├── packages\
├── dev\
└── ... (other folders)
```

### Step 1.3: Add Flutter to PATH (Windows)

**What to do:**

1. **Open Environment Variables:**
   - Press `Win + X`
   - Type "env" in search
   - Click "Edit the system environment variables"

2. **Navigate to PATH:**
   - Click "Environment Variables..." button
   - In "User variables" section, find "Path"
   - Click "Edit"

3. **Add Flutter path:**
   - Click "New"
   - Type: `C:\flutter\bin`
   - Click "OK" three times to save

**Visual:**
```
System Properties
└── Environment Variables
    ├── User variables for [YourName]
    │   ├── TEMP
    │   ├── TMP
    │   └── Path ← Click and Edit
    │       ├── C:\Program Files\...
    │       ├── C:\Windows\System32
    │       └── C:\flutter\bin ← Add this line
```

### Step 1.4: Verify Flutter Installation

**Open a new PowerShell and run:**

```powershell
flutter --version
```

**Expected output:**
```
Flutter 3.x.x • channel stable • ...
Engine • Dart 3.x.x
```

If you see this, **Flutter is installed!** ✅

---

## Part 2: Setup ChocoMarket Project

### Step 2.1: Open Project in Terminal

**In PowerShell:**

```powershell
cd c:\Users\Toshiba\Documents\chocomarket
```

**Expected:**
```
PS C:\Users\Toshiba\Documents\chocomarket>
```

### Step 2.2: Get Dependencies

**Run:**

```powershell
flutter pub get
```

**What happens:**
- Takes 1-2 minutes
- Downloads Firebase, Provider, and other packages
- Creates `pubspec.lock` file

**Expected output:**
```
Running "flutter pub get" in chocomarket...
Resolving dependencies...
Downloading firebase_core 2.24.0...
Downloading cloud_firestore 4.13.0...
Downloading provider 6.0.0...
... (more packages)
```

**Completion:**
```
✓ Got dependencies
```

### Step 2.3: Check Everything

**Run:**

```powershell
flutter doctor
```

**Expected output:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, ...)
[✓] Windows Version (Installed version of Windows is version ...)
[✓] Android toolchain - develop for Android devices (...)
[✓] Chrome - develop for web
[✓] Visual Studio - develop for Windows
```

All checkmarks ✓ = Good to go!

---

## Part 3: Firebase Setup (Most Important!)

### Step 3.1: Create Firebase Project

**Go to:** https://console.firebase.google.com

**Do this:**
1. Click "Create a project"
2. Enter name: `ChocoMarket`
3. Uncheck "Enable Google Analytics" (optional)
4. Click "Create project"
5. Wait 2-3 minutes for creation

**Visual:**
```
firebase.google.com
├── Create a project
│   ├── Project name: ChocoMarket
│   ├── Google Analytics: [unchecked]
│   └── Create ← Click
```

**Result:** You'll see your Firebase dashboard

### Step 3.2: Add Android App

**In Firebase Console:**

1. Click "+ Add app" button
2. Select "Android" icon
3. Enter:
   - Package name: `com.example.chocomarket`
4. Click "Register app"
5. Click "Download google-services.json"
6. Save to: `android/app/google-services.json`

**Visual:**
```
Firebase Console
├── Project Overview
│   ├── + Add app ← Click
│   │   ├── Android ← Select
│   │   └── Package name: com.example.chocomarket
└── Download google-services.json ← Download here
    └── Save to: android/app/google-services.json
```

**File location check:**
```
c:\Users\Toshiba\Documents\chocomarket\
└── android/
    └── app/
        └── google-services.json ← Should be here
```

### Step 3.3: Add iOS App (If you have Mac)

**In Firebase Console:**

1. Click "+ Add app"
2. Select "iOS" icon
3. Enter:
   - Bundle ID: `com.example.chocomarket`
4. Click "Register app"
5. Download `GoogleService-Info.plist`
6. Open `ios/Runner.xcworkspace` in Xcode
7. Drag & drop the plist file into Xcode
8. Check "Copy items if needed"

**Visual:**
```
Firebase Console
├── + Add app
│   ├── iOS ← Select
│   └── Bundle ID: com.example.chocomarket
└── Download GoogleService-Info.plist
    └── Add to Xcode: ios/Runner/GoogleService-Info.plist
```

### Step 3.4: Create Firestore Database

**In Firebase Console:**

1. Left sidebar → "Firestore Database"
2. Click "Create database"
3. Start in **Test mode** (important!)
4. Choose region: **Middle East** (or closest to you)
5. Click "Enable"

**Visual:**
```
Firebase Console
├── Firestore Database ← Click
│   ├── Create database
│   │   ├── Mode: Test mode ← Select
│   │   ├── Region: Middle East
│   │   └── Enable ← Click
```

**Wait 1-2 minutes for database creation...**

### Step 3.5: Create Products Collection

**In Firestore Console:**

1. Click "Create collection"
2. Name: `products`
3. Click "Next"
4. Click "Auto ID" to auto-generate ID
5. Add fields:

**Field 1:**
```
Field: nameEn
Type: String
Value: Dark Chocolate Bar
```

**Field 2:**
```
Field: nameAr
Type: String
Value: قطعة الشوكولاتة الداكنة
```

**Field 3:**
```
Field: priceLBP
Type: Number
Value: 50000
```

**Field 4:**
```
Field: priceUSD
Type: Number
Value: 33.33
```

**Field 5:**
```
Field: unit
Type: String
Value: 100g
```

**Field 6:**
```
Field: available
Type: Boolean
Value: true
```

6. Click "Save"

**Visual:**
```
Firestore Console
├── Collections
│   ├── + Create collection
│   │   ├── Name: products
│   │   └── Add documents
│   └── products/
│       └── Document (Auto ID)
│           ├── nameEn: "Dark Chocolate Bar"
│           ├── nameAr: "قطعة الشوكولاتة الداكنة"
│           ├── priceLBP: 50000
│           ├── priceUSD: 33.33
│           ├── unit: "100g"
│           └── available: true
```

### Step 3.6: Add More Products

Repeat Step 3.5 for each product:

**Product 2:**
```
nameEn: Milk Chocolate
nameAr: الشوكولاتة البيضاء
priceLBP: 45000
priceUSD: 30
unit: 100g
available: true
```

**Product 3:**
```
nameEn: Hazelnut Spread
nameAr: كريمة البندق
priceLBP: 75000
priceUSD: 50
unit: 200g
available: true
```

**Product 4:**
```
nameEn: Cocoa Powder
nameAr: مسحوق الكاكاو
priceLBP: 35000
priceUSD: 23.33
unit: 250g
available: false
```

**Product 5:**
```
nameEn: Almond Chocolate
nameAr: شوكولاتة اللوز
priceLBP: 60000
priceUSD: 40
unit: 150g
available: true
```

**Product 6:**
```
nameEn: Pistachio Delight
nameAr: متعة الفستق
priceLBP: 85000
priceUSD: 56.67
unit: 200g
available: true
```

**Result:** 6 products in Firestore ✅

### Step 3.7: Configure Security Rules

**In Firestore Console:**

1. Click "Rules" tab (next to "Data")
2. Replace all text with:

```firestore rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow anyone to read products
    match /products/{document=**} {
      allow read;
    }
    
    // Allow anyone to create orders
    match /orders/{document=**} {
      allow create;
      allow read, update: if false;
    }
  }
}
```

3. Click "Publish"

**Visual:**
```
Firestore Console
├── Rules ← Click
│   ├── [Rules editor with above code]
│   └── Publish ← Click
```

---

## Part 4: Run Your App

### Step 4.1: Back to PowerShell

```powershell
cd c:\Users\Toshiba\Documents\chocomarket
flutter run
```

**What happens:**
- Flutter builds the app
- Launches on Android emulator or connected device
- Takes 2-3 minutes first time

**Expected output:**
```
Launching lib\main.dart on ...
Running "flutter pub get"...
Building for Android...
... (compilation messages)
✓ Built ...
Installing and launching...
```

**Result:** App opens on emulator/device ✅

### Step 4.2: Test the App

**Customer Features to Test:**
- ✅ Products load (should see 6 chocolate items)
- ✅ Click language icon (EN ↔ AR switch)
- ✅ Click currency icon (USD ↔ LBP switch)
- ✅ Click "Add" on a product
- ✅ Click cart icon, see items
- ✅ Click "Checkout"
- ✅ Fill in name, phone, address
- ✅ Click "Place Order"

**Admin Features to Test:**
- ✅ Click admin icon (👤)
- ✅ Enter PIN: `1234`
- ✅ See orders from checkout
- ✅ Change order status
- ✅ See status update in Firestore

---

## 🎉 Success Checklist

- [x] Flutter installed
- [x] Dependencies downloaded
- [x] Firebase project created
- [x] google-services.json added
- [x] Firestore database created
- [x] 6 products added
- [x] Security rules configured
- [x] App runs without errors
- [x] Products load from Firestore
- [x] Customer features work
- [x] Admin features work

**All done! 🎉**

---

## Troubleshooting

### "flutter: command not found"
- Make sure you added `C:\flutter\bin` to PATH
- Restart PowerShell
- Run `flutter --version` to verify

### "Products not showing"
- Check Firestore has `products` collection
- Verify google-services.json is in `android/app/`
- Restart app: `flutter run`

### "Build errors"
```powershell
flutter clean
flutter pub get
flutter run
```

### "Firebase errors"
- Verify google-services.json exists
- Check Firestore security rules are published
- Restart app

---

**You're set! Enjoy your ChocoMarket app! 🍫**
