# ✅ ChocoMarket - Complete Step-by-Step Checklist

## Phase 1: Install Flutter (15 minutes)

### Download Flutter
- [ ] Go to https://flutter.dev/docs/get-started/install
- [ ] Click "Windows"
- [ ] Download Flutter ZIP (~500MB)
- [ ] Location: Downloads folder

### Extract Flutter
- [ ] Right-click downloaded ZIP
- [ ] Select "Extract All..."
- [ ] Choose: `C:\flutter`
- [ ] Wait for extraction (~1 min)
- [ ] Verify folder exists: `C:\flutter\bin\flutter.bat`

### Add to PATH
- [ ] Press `Win + X`
- [ ] Type "env"
- [ ] Click "Edit the system environment variables"
- [ ] Click "Environment Variables..."
- [ ] Under "User variables", find "Path"
- [ ] Click "Edit"
- [ ] Click "New"
- [ ] Type: `C:\flutter\bin`
- [ ] Click "OK" three times

### Verify Installation
- [ ] Open **new** PowerShell window
- [ ] Run: `flutter --version`
- [ ] See version output (✅ Success!)
- [ ] Run: `flutter doctor`
- [ ] See checkmarks for Windows, Android Studio, Chrome, Visual Studio

**Phase 1 Complete:** ✅

---

## Phase 2: Setup ChocoMarket Project (10 minutes)

### Navigate to Project
- [ ] Open PowerShell
- [ ] Run: `cd c:\Users\Toshiba\Documents\chocomarket`
- [ ] Current folder shows: `.../chocomarket>`

### Clean Flutter
- [ ] Run: `flutter clean`
- [ ] Waits for completion

### Get Dependencies
- [ ] Run: `flutter pub get`
- [ ] Takes 1-2 minutes
- [ ] See output: "Got dependencies"
- [ ] File `pubspec.lock` created

### Verify Setup
- [ ] Run: `flutter doctor`
- [ ] Check for:
  - [ ] ✓ Flutter (stable)
  - [ ] ✓ Windows Version
  - [ ] ✓ Android toolchain
  - [ ] ✓ Visual Studio

**Phase 2 Complete:** ✅

---

## Phase 3: Firebase Setup (30 minutes)

### Create Firebase Project
- [ ] Go to https://console.firebase.google.com
- [ ] Sign in with Google account
- [ ] Click "Create a project"
- [ ] Project name: `ChocoMarket`
- [ ] Uncheck "Enable Google Analytics"
- [ ] Click "Create project"
- [ ] Wait 2-3 minutes
- [ ] See Firebase dashboard

### Add Android App
- [ ] In Firebase: Click "+ Add app"
- [ ] Select "Android"
- [ ] Package name: `com.example.chocomarket`
- [ ] Click "Register app"
- [ ] Click "Download google-services.json"
- [ ] Save file
- [ ] Copy to: `android/app/google-services.json`
- [ ] Verify file exists in correct location

### Add iOS App (Optional - only if using Mac)
- [ ] In Firebase: Click "+ Add app"
- [ ] Select "iOS"
- [ ] Bundle ID: `com.example.chocomarket`
- [ ] Click "Register app"
- [ ] Download `GoogleService-Info.plist`
- [ ] Open `ios/Runner.xcworkspace` in Xcode
- [ ] Drag plist into Xcode
- [ ] Check "Copy items if needed"

### Create Firestore Database
- [ ] In Firebase: Left sidebar → "Firestore Database"
- [ ] Click "Create database"
- [ ] Select "Start in test mode"
- [ ] Region: "europe-west1" (or nearest to you)
- [ ] Click "Enable"
- [ ] Wait 1-2 minutes for creation

### Create Products Collection
- [ ] In Firestore: Click "Create collection"
- [ ] Collection name: `products`
- [ ] Click "Next"

#### Add Product 1: Dark Chocolate
- [ ] Click "Auto ID"
- [ ] Add fields:
  - [ ] `nameEn` (string): "Dark Chocolate Bar"
  - [ ] `nameAr` (string): "قطعة الشوكولاتة الداكنة"
  - [ ] `priceLBP` (number): 50000
  - [ ] `priceUSD` (number): 33.33
  - [ ] `unit` (string): "100g"
  - [ ] `available` (boolean): true
- [ ] Click "Save"

#### Add Product 2: Milk Chocolate
- [ ] Click "Add document"
- [ ] Auto ID: yes
- [ ] Fields:
  - [ ] `nameEn`: "Milk Chocolate"
  - [ ] `nameAr`: "الشوكولاتة البيضاء"
  - [ ] `priceLBP`: 45000
  - [ ] `priceUSD`: 30
  - [ ] `unit`: "100g"
  - [ ] `available`: true
- [ ] Click "Save"

#### Add Product 3: Hazelnut Spread
- [ ] Click "Add document"
- [ ] Fields:
  - [ ] `nameEn`: "Hazelnut Spread"
  - [ ] `nameAr`: "كريمة البندق"
  - [ ] `priceLBP`: 75000
  - [ ] `priceUSD`: 50
  - [ ] `unit`: "200g"
  - [ ] `available`: true
- [ ] Click "Save"

#### Add Product 4: Cocoa Powder
- [ ] Click "Add document"
- [ ] Fields:
  - [ ] `nameEn`: "Cocoa Powder"
  - [ ] `nameAr`: "مسحوق الكاكاو"
  - [ ] `priceLBP`: 35000
  - [ ] `priceUSD`: 23.33
  - [ ] `unit`: "250g"
  - [ ] `available`: false
- [ ] Click "Save"

#### Add Product 5: Almond Chocolate
- [ ] Click "Add document"
- [ ] Fields:
  - [ ] `nameEn`: "Almond Chocolate"
  - [ ] `nameAr`: "شوكولاتة اللوز"
  - [ ] `priceLBP`: 60000
  - [ ] `priceUSD`: 40
  - [ ] `unit`: "150g"
  - [ ] `available`: true
- [ ] Click "Save"

#### Add Product 6: Pistachio Delight
- [ ] Click "Add document"
- [ ] Fields:
  - [ ] `nameEn`: "Pistachio Delight"
  - [ ] `nameAr`: "متعة الفستق"
  - [ ] `priceLBP`: 85000
  - [ ] `priceUSD`: 56.67
  - [ ] `unit`: "200g"
  - [ ] `available`: true
- [ ] Click "Save"

### Configure Security Rules
- [ ] In Firestore: Click "Rules" tab
- [ ] Select all text (Ctrl+A)
- [ ] Paste these rules:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /products/{document=**} {
      allow read;
    }
    match /orders/{document=**} {
      allow create;
      allow read, update: if false;
    }
  }
}
```

- [ ] Click "Publish"
- [ ] See message: "Rules updated successfully"

**Phase 3 Complete:** ✅

---

## Phase 4: Run Your App (5 minutes)

### Launch Android Emulator
- [ ] Open Android Studio
- [ ] Tools → AVD Manager
- [ ] Select emulator
- [ ] Click play button ▶️
- [ ] Wait for emulator to boot (1-2 min)

### Run Flutter App
- [ ] In PowerShell, in project folder
- [ ] Run: `flutter run`
- [ ] App builds and installs
- [ ] See: "✓ Built build/app/outputs/apk/debug/app-debug.apk"
- [ ] App opens on emulator

**Phase 4 Complete:** ✅

---

## Phase 5: Test Features (10 minutes)

### Test Customer Features
- [ ] **Products load**: See 6 chocolate products
- [ ] **Language toggle**: Click 🌐 icon
  - [ ] Text changes to Arabic
  - [ ] Click again → English
- [ ] **Currency toggle**: Click 💱 icon
  - [ ] Prices change to USD
  - [ ] Click again → LBP
- [ ] **Add to cart**: Click "Add" on a product
  - [ ] See snackbar: "Product added to cart"
- [ ] **View cart**: Click 🛒 icon
  - [ ] See product in cart list
  - [ ] See total price
  - [ ] See delete button ✕
- [ ] **Remove from cart**: Click ✕ on product
  - [ ] Product removed
  - [ ] Total updates
- [ ] **Checkout**: Click "Checkout" button
  - [ ] See form: Name, Phone, Address
- [ ] **Fill checkout form**:
  - [ ] Name: "John Doe"
  - [ ] Phone: "+961 123 456 789"
  - [ ] Address: "123 Main St, Beirut"
- [ ] **Place order**: Click "Place Order"
  - [ ] See message: "Order placed successfully!"
  - [ ] App returns to home
- [ ] **Verify in Firestore**:
  - [ ] Go to Firebase Console
  - [ ] Firestore → orders collection
  - [ ] See new order with:
    - [ ] name: "John Doe"
    - [ ] phone: "+961 123 456 789"
    - [ ] address: "123 Main St, Beirut"
    - [ ] status: "pending"

### Test Admin Features
- [ ] **Access admin panel**: Click 👤 icon
  - [ ] See PIN input
- [ ] **Enter wrong PIN**: Type "0000"
  - [ ] Click "Enter"
  - [ ] See error: "Wrong PIN"
- [ ] **Clear and enter correct PIN**: Type "1234"
  - [ ] Click "Enter"
  - [ ] Navigate to Admin Orders screen
- [ ] **View orders**:
  - [ ] See your test order
  - [ ] Name: "John Doe"
- [ ] **Update status**:
  - [ ] Click status dropdown
  - [ ] Select "preparing"
  - [ ] Status changes in real-time
- [ ] **Verify in Firestore**:
  - [ ] Check orders collection
  - [ ] Status is now "preparing"

**Phase 5 Complete:** ✅

---

## Phase 6: Customization (Optional)

### Change Admin PIN
- [ ] Open `lib/screens/admin_pin_screen.dart`
- [ ] Find line: `final adminPin = '1234';`
- [ ] Change to: `final adminPin = 'YOUR_PIN';`
- [ ] Save file
- [ ] Hot reload (R in terminal)
- [ ] Test new PIN works

### Change Theme Color
- [ ] Open `lib/main.dart`
- [ ] Find: `theme: ThemeData(primarySwatch: Colors.brown)`
- [ ] Change `Colors.brown` to any color:
  - [ ] `Colors.blue`
  - [ ] `Colors.green`
  - [ ] `Colors.orange`
  - [ ] etc.
- [ ] Save file
- [ ] Hot reload (R)
- [ ] See new color in app

### Add Products
- [ ] Go to Firebase Console
- [ ] Firestore → products collection
- [ ] Click "Add document"
- [ ] Add new product with same fields
- [ ] Refresh app
- [ ] See new product appear

**Phase 6 Complete (Optional):** ✅

---

## Phase 7: Build for Release (Advanced)

### Build APK (for Android)
- [ ] In PowerShell: `flutter build apk --release`
- [ ] Wait 2-3 minutes
- [ ] File: `build/app/outputs/flutter-app.apk`
- [ ] Size: ~50-80 MB

### Build IPA (for iOS - requires Mac)
- [ ] In terminal: `flutter build ios --release`
- [ ] Open Xcode: `open ios/Runner.xcworkspace`
- [ ] Archive and export
- [ ] Upload to App Store

### Build Web
- [ ] In PowerShell: `flutter build web --release`
- [ ] Files in: `build/web/`
- [ ] Deploy to hosting service

**Phase 7 Complete (Advanced):** ✅

---

## Final Checklist

### Pre-Launch
- [ ] All features tested
- [ ] Admin PIN changed from '1234'
- [ ] Firebase security rules reviewed
- [ ] Sample products verified
- [ ] Orders save to Firestore correctly
- [ ] All screens accessible
- [ ] No errors in console
- [ ] App runs on emulator/device

### Post-Launch
- [ ] Share app with users
- [ ] Collect feedback
- [ ] Monitor Firestore usage
- [ ] Update products as needed
- [ ] Track orders from admin panel
- [ ] Scale as needed

---

## Troubleshooting Checklist

### If Flutter isn't found
- [ ] Check PATH includes: `C:\flutter\bin`
- [ ] Restart PowerShell
- [ ] Run: `flutter --version`

### If dependencies fail
- [ ] Run: `flutter clean`
- [ ] Run: `flutter pub get`
- [ ] Check internet connection

### If app crashes on startup
- [ ] Check `google-services.json` exists
- [ ] Check Firestore database is created
- [ ] Run: `flutter clean && flutter run`

### If products don't load
- [ ] Check Firestore has `products` collection
- [ ] Check all 6 products are added
- [ ] Check security rules are published
- [ ] Restart app: `flutter run`

### If admin PIN doesn't work
- [ ] Check PIN in `admin_pin_screen.dart` line 14
- [ ] Default PIN: `1234`
- [ ] Restart app

### If orders don't save
- [ ] Check Firestore `orders` collection exists
- [ ] Check security rules allow `create`
- [ ] Check internet connection
- [ ] Check Firestore write quota

---

## Success Indicators

✅ **You're done when:**
- Flutter installs successfully
- Dependencies download without errors
- Firebase project is created
- google-services.json is added
- Firestore database has 6 products
- Security rules are published
- App runs without crashes
- Products load from Firestore
- Cart works (add/remove)
- Checkout saves orders
- Admin panel authenticates with PIN
- Orders appear in Firestore

---

## Time Estimates

| Phase | Task | Time |
|-------|------|------|
| 1 | Install Flutter | 15 min |
| 2 | Setup Project | 10 min |
| 3 | Firebase Setup | 30 min |
| 4 | Run App | 5 min |
| 5 | Test Features | 10 min |
| **Total** | **All Setup** | **~70 minutes** |

---

## Quick Reference Commands

```powershell
# Navigate to project
cd c:\Users\Toshiba\Documents\chocomarket

# Clean
flutter clean

# Get dependencies
flutter pub get

# Run app
flutter run

# Check status
flutter doctor

# Build APK
flutter build apk --release

# Build Web
flutter build web --release
```

---

**You've got this! Follow each checkbox and you'll have a working app in ~1.5 hours! 🎉**

**Start with Phase 1: Install Flutter ⬆️**
