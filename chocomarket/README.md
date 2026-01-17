# 🍫 ChocoMarket - Flutter E-Commerce App

Complete bilingual (English/Arabic) chocolate market app with Firebase backend, admin panel, and dual currency support (USD/LBP).

## 📋 Project Structure

```
lib/
├── main.dart                    # App initialization & Firebase setup
├── models/
│   └── product.dart            # Product model
├── providers/
│   ├── cart_provider.dart       # Shopping cart state
│   ├── currency_provider.dart   # USD/LBP toggle
│   └── language_provider.dart   # EN/AR toggle
├── screens/
│   ├── home_screen.dart         # Product browsing
│   ├── cart_screen.dart         # Shopping cart
│   ├── checkout_screen.dart     # Order placement
│   ├── admin_pin_screen.dart    # Admin authentication
│   └── admin_orders_screen.dart # Order management
├── services/
│   └── firestore_service.dart   # Firebase operations
└── utils/
    └── app_strings.dart         # Bilingual strings
```

## 🚀 Features

### Customer Features
- ✅ **Real-time product catalog** (from Firestore)
- ✅ **Bilingual support** (English / العربية)
- ✅ **Dual currency** (USD / LBP)
- ✅ **Shopping cart** with add/remove items
- ✅ **Checkout** with customer details
- ✅ **Order tracking** (pending → preparing → out → delivered)

### Admin Features
- 🔐 **PIN-protected** admin panel (PIN: `1234`)
- 📊 **Order management** dashboard
- 🔄 **Real-time order status** updates
- 📦 **Order tracking** through 4 states

### Technical Features
- 🔥 **Firebase Firestore** for data persistence
- 👥 **Provider** for state management
- 🌍 **Flutter localization** for multi-language support
- 🎨 **Material Design** UI

---

## ⚙️ Installation & Setup

### Prerequisites
- **Flutter SDK** (v3.0+) → [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Firebase Project** → [Create at firebase.google.com](https://firebase.google.com)
- **Android Studio / Xcode** for emulator

### Quick Start

1. **Install dependencies**
   ```powershell
   flutter pub get
   ```

2. **Complete Firebase Setup** - See [FIREBASE_SETUP.md](FIREBASE_SETUP.md)

3. **Run the app**
   ```powershell
   flutter run
   ```

---

## 📱 Usage

### Customer Mode
1. Browse products (real-time from Firestore)
2. Toggle language (EN ↔ AR)
3. Toggle currency (USD ↔ LBP)
4. Add items to cart
5. Checkout with delivery details
6. Place order (saved to Firestore)

### Admin Mode
1. Click admin icon (👤)
2. Enter PIN: `1234`
3. View all customer orders
4. Update order status:
   - `pending` → new order
   - `preparing` → being packed
   - `out` → in delivery
   - `delivered` → completed

---

## 📦 Dependencies

See [pubspec.yaml](pubspec.yaml) for complete list:
- `firebase_core` ^2.24.0
- `cloud_firestore` ^4.13.0
- `provider` ^6.0.0
- `flutter_localizations` (SDK)

---

## 📂 Setup Files Included

| File | Purpose |
|------|---------|
| [FIREBASE_SETUP.md](FIREBASE_SETUP.md) | Step-by-step Firebase configuration |
| [sample_firestore_data.json](sample_firestore_data.json) | Sample product data to import |
| [QUICK_SETUP.bat](QUICK_SETUP.bat) | Windows batch script for setup |

---

## 🔐 Security

### Admin PIN
Default: `1234`

Change in [lib/screens/admin_pin_screen.dart](lib/screens/admin_pin_screen.dart) line 14:
```dart
final adminPin = '1234'; // Change this
```

### Firestore Security Rules
See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) Step 5 for security rules that:
- Allow public read of products
- Allow anyone to create orders
- Restrict order updates (admin only)

---

## 🛠️ Customization

### Add Products
Add documents to Firestore `products` collection:
```json
{
  "nameEn": "Product Name",
  "nameAr": "اسم المنتج",
  "priceLBP": 50000,
  "priceUSD": 33.33,
  "unit": "100g",
  "available": true
}
```

### Change Theme Color
Edit [main.dart](lib/main.dart):
```dart
theme: ThemeData(primarySwatch: Colors.brown)
```

### Add Translations
Edit [app_strings.dart](lib/utils/app_strings.dart)

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| Products not showing | Check Firestore `products` collection exists with sample data |
| Firebase not initializing | Verify `google-services.json` in `android/app/` |
| Build errors | Run `flutter clean` then `flutter pub get` |
| Admin PIN not working | Check PIN in `admin_pin_screen.dart` (default: `1234`) |

See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed troubleshooting.

---

## 📊 Architecture

**State Management**: Provider package
- `CartProvider` - Shopping cart items & totals
- `LanguageProvider` - EN/AR language toggle  
- `CurrencyProvider` - USD/LBP currency toggle

**Database**: Firestore
- `products/` - Product catalog
- `orders/` - Customer orders

**Screens**:
- Home - Product browsing
- Cart - Shopping cart
- Checkout - Order placement
- Admin PIN - Authentication
- Admin Orders - Order management

---

## 🚀 Next Steps

1. Review the code structure
2. Complete [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
3. Add sample data from [sample_firestore_data.json](sample_firestore_data.json)
4. Run with `flutter run`
5. Test all features
6. Customize for your market
7. Deploy to Play Store / App Store

---

## 📄 Customer Features - Full List

- ✅ Product browsing with real-time updates
- ✅ Bilingual product names (EN/AR)
- ✅ Dual currency pricing (USD/LBP)
- ✅ Product availability status
- ✅ Add/remove from cart
- ✅ Cart total calculation
- ✅ Checkout with customer details
- ✅ Order submission to Firestore
- ✅ Order status notifications
- ✅ Language toggle (persistent)
- ✅ Currency toggle (persistent)

```
lib/
├── main.dart                 # App entry point
├── providers/
│   ├── cart_provider.dart
│   ├── language_provider.dart
│   └── currency_provider.dart
├── models/
│   └── product.dart
├── services/
│   └── firestore_service.dart
├── screens/
│   ├── home_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── admin_pin_screen.dart
│   └── admin_orders_screen.dart
└── utils/
    └── app_strings.dart
```

## Setup Instructions

1. **Install Flutter**: Make sure you have Flutter installed
   ```bash
   flutter --version
   ```

2. **Get Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Update `firebase.json` with your Firebase credentials
   - Enable Firestore and Authentication in Firebase Console

4. **Firestore Collections**:
   
   **products** collection:
   ```json
   {
     "nameEn": "Dark Chocolate",
     "nameAr": "شوكولاتة داكنة",
     "priceLBP": 50000,
     "priceUSD": 33.5,
     "unit": "kg",
     "available": true
   }
   ```

   **orders** collection:
   ```json
   {
     "name": "John Doe",
     "phone": "+961 123 456",
     "address": "Beirut, Lebanon",
     "items": ["Dark Chocolate"],
     "total": 33.5,
     "status": "pending",
     "createdAt": "2026-01-18"
   }
   ```

5. **Run the App**:
   ```bash
   flutter run
   ```

## Features

### Customer Side
- Browse products with bilingual names
- View prices in LBP or USD
- Add/remove items from cart
- Place orders with delivery information
- Order tracking

### Admin Side
- PIN-protected admin panel (default: `1234`)
- View all orders in real-time
- Update order status (pending → preparing → out → delivered)

## Default Admin PIN
```
1234
```
⚠️ **Change this in production!** Edit the `adminPin` value in [lib/screens/admin_pin_screen.dart](lib/screens/admin_pin_screen.dart#L13)

## Technologies Used
- **Flutter**: UI framework
- **Provider**: State management
- **Firebase**: Backend (Firestore & Authentication)
- **flutter_localizations**: Internationalization (i18n)

## License
This project is open source and available under the MIT License.
