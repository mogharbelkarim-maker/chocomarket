# ChocoMarket Setup Checklist

## ✅ Pre-Setup (What's Done)

- [x] Complete Flutter app structure created
- [x] All Dart files implemented
- [x] Firebase dependencies added to pubspec.yaml
- [x] Providers setup (Cart, Language, Currency)
- [x] Screens implemented (Home, Cart, Checkout, Admin)
- [x] Firestore service created
- [x] Bilingual support (EN/AR)
- [x] Dual currency support (USD/LBP)

---

## 📋 Firebase Setup (You Do This)

### 1. Create Firebase Project
- [ ] Go to https://console.firebase.google.com
- [ ] Click "Add project"
- [ ] Name it "ChocoMarket"
- [ ] Enable Google Analytics (optional)
- [ ] Click "Create project"

### 2. Android Setup
- [ ] In Firebase → Project Settings → General
- [ ] Click "Add app" → Android
- [ ] Enter package name: `com.example.chocomarket`
- [ ] Get SHA-1: Run in terminal:
  ```
  cd android
  ./gradlew signingReport
  ```
- [ ] Copy SHA-1 fingerprint to Firebase
- [ ] Download `google-services.json`
- [ ] Save to: `android/app/google-services.json`
- [ ] Register app

### 3. iOS Setup
- [ ] In Firebase → Click "Add app" → iOS
- [ ] Enter Bundle ID: `com.example.chocomarket`
- [ ] Download `GoogleService-Info.plist`
- [ ] Open `ios/Runner.xcworkspace` in Xcode
- [ ] Drag & drop plist into Xcode project
- [ ] Check "Copy items if needed"
- [ ] Register app

### 4. Setup Firestore Database
- [ ] In Firebase Console → Firestore Database
- [ ] Click "Create database"
- [ ] Start in **Test mode**
- [ ] Choose region (e.g., Middle East)
- [ ] Click "Enable"

### 5. Create Products Collection
- [ ] In Firestore → Collections tab
- [ ] Click "Create collection" → Name: `products`
- [ ] Add documents with this structure:

```
Document ID: choco_1
{
  "nameEn": "Dark Chocolate Bar",
  "nameAr": "قطعة الشوكولاتة الداكنة",
  "priceLBP": 50000,
  "priceUSD": 33.33,
  "unit": "100g",
  "available": true
}
```

- [ ] Add at least 3-4 more products (see sample_firestore_data.json)

### 6. Configure Security Rules
- [ ] In Firestore → Rules tab
- [ ] Replace with rules from FIREBASE_SETUP.md
- [ ] Click "Publish"

---

## 💻 Local Setup (Run These Commands)

### In PowerShell (Windows)
```powershell
# Navigate to project
cd c:\Users\Toshiba\Documents\chocomarket

# Clean (if needed)
flutter clean

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### On macOS/Linux
```bash
cd ~/path/to/chocomarket
flutter clean
flutter pub get
flutter run
```

---

## 🧪 Testing Checklist

### Customer Features
- [ ] App starts without errors
- [ ] Products load from Firestore
- [ ] Can toggle language (EN/AR)
- [ ] Can toggle currency (USD/LBP)
- [ ] Can add items to cart
- [ ] Cart shows correct prices
- [ ] Can remove items from cart
- [ ] Can navigate to checkout
- [ ] Can enter customer details
- [ ] Order submits to Firestore

### Admin Features
- [ ] Click admin icon (👤)
- [ ] Enter PIN: `1234`
- [ ] See orders dashboard
- [ ] Can view all orders
- [ ] Can update order status
- [ ] Status updates reflect in Firestore

### Data Persistence
- [ ] Close and reopen app
- [ ] Products still load
- [ ] Cart items still there
- [ ] Language preference saved
- [ ] Currency preference saved
- [ ] Orders visible in admin panel

---

## 🚀 Deployment Checklist

### Before Release
- [ ] Change admin PIN from `1234` to secure PIN
- [ ] Update Firestore security rules for production
- [ ] Test all features one more time
- [ ] Add real product images
- [ ] Update app icon & splash screen
- [ ] Change app package name if needed

### Build APK (Android)
```powershell
flutter build apk --release
# Output: build/app/outputs/flutter-app.apk
```

### Build IPA (iOS)
```powershell
flutter build ios --release
# Follow Xcode instructions for App Store
```

---

## 📞 Need Help?

### Common Issues

**Q: "flutter: command not found"**
- A: Add Flutter to PATH or use full path

**Q: Products not showing**
- A: Check Firestore has `products` collection with sample data

**Q: Firebase not initializing**
- A: Verify google-services.json and GoogleService-Info.plist paths

**Q: Admin PIN not working**
- A: Default PIN is `1234` (check admin_pin_screen.dart line 14)

See FIREBASE_SETUP.md for detailed troubleshooting.

---

## 📁 Files Created for You

| File | Purpose |
|------|---------|
| `README.md` | Full documentation |
| `FIREBASE_SETUP.md` | Step-by-step Firebase guide |
| `sample_firestore_data.json` | Sample product data |
| `QUICK_SETUP.bat` | Setup batch script |
| `SETUP_CHECKLIST.md` | This file |

---

## 🎯 Completion Status

**Code**: ✅ 100% Complete
**Setup Guide**: ✅ 100% Complete
**Sample Data**: ✅ Ready to use
**Documentation**: ✅ Comprehensive

**You are at**: 👈 Firebase configuration step

**Next action**: Follow FIREBASE_SETUP.md step-by-step

---

**Estimated time to completion**: 15-20 minutes ⏱️
