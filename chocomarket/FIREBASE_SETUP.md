# ChocoMarket - Firebase Setup Guide

## Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create a project"
3. Name it "ChocoMarket" (or your choice)
4. Enable Google Analytics (optional)

## Step 2: Add Firebase to Flutter App

### Android Setup:
1. In Firebase Console → Project Settings → General tab
2. Scroll down and click "Add app" → Select Android
3. Enter:
   - Package name: `com.example.chocomarket` (from pubspec.yaml)
   - SHA-1 fingerprint: Run in terminal:
     ```powershell
     cd android
     .\gradlew signingReport
     ```
   - Copy the SHA-1 from debug key
4. Download `google-services.json`
5. Place it in: `android/app/google-services.json`

### iOS Setup:
1. In Firebase Console → Add app → Select iOS
2. Enter Bundle ID: `com.example.chocomarket` (check in Xcode)
3. Download `GoogleService-Info.plist`
4. Open Xcode: `ios/Runner.xcworkspace`
5. Drag & drop the plist file into Xcode
6. Make sure "Copy items if needed" is checked

## Step 3: Enable Firestore Database

1. In Firebase Console → Firestore Database
2. Click "Create database"
3. Start in **Test mode** (for development)
4. Choose region closest to you
5. Click "Enable"

## Step 4: Create Collections & Sample Data

### Collection 1: `products`
Create these documents:

#### Document ID: `choco_1`
```json
{
  "nameEn": "Dark Chocolate Bar",
  "nameAr": "قطعة الشوكولاتة الداكنة",
  "priceLBP": 50000,
  "priceUSD": 33.33,
  "unit": "100g",
  "available": true
}
```

#### Document ID: `choco_2`
```json
{
  "nameEn": "Milk Chocolate",
  "nameAr": "الشوكولاتة البيضاء",
  "priceLBP": 45000,
  "priceUSD": 30,
  "unit": "100g",
  "available": true
}
```

#### Document ID: `choco_3`
```json
{
  "nameEn": "Hazelnut Spread",
  "nameAr": "كريمة البندق",
  "priceLBP": 75000,
  "priceUSD": 50,
  "unit": "200g",
  "available": true
}
```

#### Document ID: `choco_4`
```json
{
  "nameEn": "Cocoa Powder",
  "nameAr": "مسحوق الكاكاو",
  "priceLBP": 35000,
  "priceUSD": 23.33,
  "unit": "250g",
  "available": false
}
```

### Collection 2: `orders` (Auto-created when first order placed)
Leave empty - will populate automatically

## Step 5: Set Firestore Security Rules

1. In Firebase Console → Firestore → Rules tab
2. Replace with:

```firestore rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Public read access to products
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

## Step 6: Install Dependencies

```powershell
flutter pub get
```

## Step 7: Run the App

```powershell
flutter run
```

## Testing the App

### Customer Features:
- ✅ Browse products (loads from Firestore)
- ✅ Toggle language EN/AR
- ✅ Toggle currency USD/LBP
- ✅ Add items to cart
- ✅ Place order

### Admin Panel:
- 📌 Admin PIN: `1234`
- ✅ View all orders
- ✅ Update order status (pending → preparing → out → delivered)

## Troubleshooting

### Products not loading?
- Check Firestore has `products` collection
- Verify security rules allow read access
- Check Firebase is initialized correctly in code

### Orders not saving?
- Ensure `orders` collection exists
- Check Firestore security rules allow write

### Build errors?
- Run: `flutter clean`
- Run: `flutter pub get`
- Run: `flutter run`

## Change Admin PIN (Security)

Edit [lib/screens/admin_pin_screen.dart](lib/screens/admin_pin_screen.dart) line 14:

```dart
final adminPin = '1234'; // Change this to your PIN
```

Change to any 4-digit PIN you want.

---

**Need help?** Check Flutter & Firebase documentation or ask!
