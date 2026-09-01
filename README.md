# Kayan · Local Brand 🛍️

A modern, feature-rich **Flutter e-commerce** application showcasing a complete product management system, clean architecture, a beautiful responsive UI, and seamless **Firebase** integration.

Proudly responsive: it adapts from a phone-friendly single column all the way up to a 4-column desktop grid, so the same codebase powers phones, tablets and the web.

![Flutter](https://img.shields.io/badge/Flutter-3.41.6-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.11-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-4285F4?style=for-the-badge)
![Firebase](https://img.shields.io/badge/Firebase-Auth%20%2B%20Firestore-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 🌐 Live Demo

The app is live on **Firebase Hosting**:

> **https://kayan-25fea.web.app**

Resize the browser window to see the responsive layout adapt (1 → 2 → 3 → 4 product columns).

---

## ✨ Features

### 📱 **Responsive Design**
- **Adaptive product grid** — auto switches between 1/2/3/4 columns based on screen width so cards always stay a comfortable size
- **Desktop navigation** — a side `NavigationRail` replaces the glass bottom bar on wide screens
- **Two-column layouts** — product details and the "add product" form split side-by-side on large screens
- **Centered constrained content** — content is capped at 1200px and centered on big displays
- **Breakpoint helpers** — `AppBreakpoints` + `context.isMobile / isTablet / isDesktop` in `lib/core/utils/responsive.dart`

### 🔐 **Authentication & Security**
- **Email/password auth** via Firebase Authentication (sign up / sign in / sign out)
- **Auth-state routing** — the root `StreamBuilder` in `main.dart` switches between Login and Home automatically
- **Hardened Firestore rules** — products are publicly readable, but **writes are restricted to an admin UID only**; every other collection is fully locked down
- **Sensitive config git-ignored** — `firestore.rules`, `google-services.json` and `firebase_options.dart` stay out of version control

### 🏪 **Product Discovery**
- **Firebase Firestore** — products are read live from the `products` collection via streams
- **Loading States** — skeleton loaders and progress indicators
- **Error Handling** — graceful fallbacks with user-friendly messages
- **Category Filtering** — horizontal scrolling category chips

### 🛒 **Shopping Experience**
- **Product Catalog** — browse products with images, categories, and pricing
- **Favorites System** — heart toggle backed by a shared `ProductManager`; a dedicated favorites screen stays in sync
- **Product Details** — full-screen view with descriptions, fabric care, and specifications
- **Add to Cart** — products added to a shared cart list from the details screen

### ➕ **Product Management (Admin)**
- **Add New Products** — comprehensive validated form (admin-only via Firestore rules)
- **Delete products** — from the home screen
- **Image Placeholders** — main image + sub-image UI
- **Variant Support** — sizes, SKU, pricing tiers
- **Inventory Tracking** — stock quantity management

### 🎨 **Design System**
- **Custom Theme** — Material 3 light theme with a curated palette
- **Typography** — Google Fonts (Bodoni Moda + Inter)
- **Spacing / Radius** — consistent design tokens
- **Glassmorphism** — frosted glass bottom navigation

---

## 🏗️ Architecture

```
lib/
├── api/
│   ├── auth_service.dart          # Firebase Auth (sign in/up/out)
│   ├── firebase_service.dart      # Cloud Firestore CRUD + streams
│   └── product_service.dart       # Legacy REST API client
├── core/
│   ├── routing/
│   │   ├── app_router.dart        # Route generator
│   │   └── routes.dart            # Route name constants
│   ├── theme/
│   │   ├── app_color.dart         # Color palette
│   │   ├── app_spacing.dart       # Spacing tokens
│   │   ├── app_radius.dart        # Radius tokens
│   │   ├── app_typography.dart    # Text styles
│   │   └── app_theme.dart         # ThemeData composition
│   ├── utils/
│   │   ├── responsive.dart        # Breakpoints + responsive helpers
│   │   ├── app_validators.dart    # Form validation logic
│   │   └── extenstions/capitalized.dart
│   └── widgets/
│       ├── app_bar.dart           # Custom app bar
│       ├── nav_bar.dart           # Glassmorphism bottom nav
│       ├── nav_item.dart          # Nav item component
│       └── kayan_network_image.dart
├── managers/
│   └── product_manager.dart       # Shared ChangeNotifier singleton (favorites, cart, products)
├── models/
│   └── product_model.dart         # Product data model + JSON mapping
├── pages/
│   ├── home_screen.dart           # Product listing (main screen)
│   ├── favorites_screen.dart      # Saved favorites view
│   ├── cart_screen.dart           # Cart view
│   ├── product_details.dart       # Product detail view
│   ├── add_product_screen.dart    # Admin product creation
│   ├── login_screen.dart          # Auth sign-in
│   ├── signup_screen.dart         # Auth sign-up
│   ├── splash_screen.dart         # Branded splash during auth check
│   └── screens.dart               # Barrel exports for pages
├── widgets/
│   ├── product_grid.dart          # Responsive 1-4 column product grid
│   ├── category_card.dart         # Product card component
│   ├── form_field.dart            # Reusable form input
│   ├── selectable_box.dart        # Chip selection component
│   └── sub_image.dart             # Sub-image placeholder
├── home.dart                      # Root scaffold + responsive nav
└── main.dart                      # App entry + auth-state routing
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** ≥ 3.41 (Dart ≥ 3.11)
- A **Firebase project** (or the project this app is wired to)
- Android Studio / VS Code with Flutter extensions
- Chrome (for web) or an Android/iOS device/emulator

> The Firebase config files (`firebase_options.dart`, `google-services.json`) are **git-ignored**. To run the app locally you'll need Firebase setup for your platform — see [Firebase setup](#-firebase-setup).

### Installation

```bash
# Clone the repository
git clone https://github.com/asaerxd6767/local_brand.git
cd local_brand

# Install dependencies
flutter pub get

# Run on available device
flutter run
```

### Platform Setup

| Platform | Command |
|----------|---------|
| **Android** | `flutter run -d android` |
| **iOS** | `flutter run -d ios` |
| **Web (Chrome)** | `flutter run -d chrome` |

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core framework |
| `firebase_core` | ^4.14.0 | Firebase bootstrap |
| `cloud_firestore` | ^6.9.0 | Product catalog (Firestore) |
| `firebase_auth` | ^6.6.1 | Email/password authentication |
| `http` | ^1.6.0 | Legacy REST API requests |
| `google_fonts` | ^6.2.1 | Typography (Bodoni Moda + Inter) |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

**Dev Dependencies:** `flutter_test`, `flutter_lints`.

> **Note:** A `dependency_overrides` pin (`firebase_core_web: 3.10.0`) is applied to work around [flutterfire#18611](https://github.com/firebase/flutterfire/issues/18611) — `firebase_core_web 3.11.0` requires Dart ≥ 3.12. Remove the pin after upgrading Flutter to ≥ 3.44.

---

## 🎯 Key Implementation Details

### Firebase Service (`lib/api/firebase_service.dart`)
Thin wrapper around Cloud Firestore that reads the `products` collection and exposes CRUD + a live stream:
```dart
CollectionReference get _products => FirebaseFirestore.instance.collection('products');

Stream<List<ProductModel>> productsStream() {
  return _products.snapshots().map(
    (snapshot) => snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList(),
  );
}
```

### Auth-state routing (`lib/main.dart`)
The root widget listens to Firebase auth state and points the router at Login or Home automatically, so no manual navigation is needed after signing in/out.

### Responsive Product Grid (`lib/widgets/product_grid.dart`)
Uses a `LayoutBuilder` to pick the column count from the real available width, then sizes cards by a 3:4 image ratio so they scale cleanly without overflow.

### State Management (`lib/managers/product_manager.dart`)
A singleton `ChangeNotifier` holds favorites, cart and products so every screen stays in sync with `ListenableBuilder` — no external state library.

---

## 🔥 Firebase Setup

1. Create a Firebase project and enable **Authentication** (Email/Password) + **Cloud Firestore**.
2. Add your platforms (Android/iOS/Web) and download the platform config.
3. Wire config into `lib/firebase_options.dart` (typically via `flutterfire configure`).
4. Create at least one user (**Authentication → Users**); note its **UID**.
5. Deploy the security rules below so only that admin can write.

### Firestore Rules (`firestore.rules`)
```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Products are public catalog data — anyone can read.
    match /products/{productId} {
      allow read: if true;
      // ONLY the admin UID(s) below may create/update/delete.
      allow write: if request.auth != null
                    && request.auth.uid in ["YOUR_ADMIN_UID"];
    }
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

---

## 🚢 Deployment (Web)

```bash
# Build a production web bundle
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

The site is hosted at **https://kayan-25fea.web.app** (and `kayan-25fea.firebaseapp.com`).

> **Browser caching:** after a new release, hard-refresh (`Ctrl+Shift+R`) if you don't see changes.

---

## 🧪 Testing

```bash
# Run unit/widget tests
flutter test

# Run static analysis
flutter analyze
```

Tests cover the responsive building blocks: the product card renders correctly, the grid collapses to a single column on phones, expands to multiple columns on wide screens, and stays horizontally centered.

---

## 🗺️ Roadmap

- [x] **User Authentication** — Firebase Auth integration
- [x] **Responsive layout** — adaptive grid, desktop nav, multi-column forms
- [x] **Web deployment** — Firebase Hosting
- [x] **Firestore security rules** — admin-only writes
- [ ] **Cart Screen & Checkout** — persistence
- [ ] **Persist favorites & cart** — survive app restarts
- [ ] **Wishlist Sync** — Cloud-firestore backed favorites
- [ ] **Push Notifications** — order updates & promotions
- [ ] **Admin Dashboard** — full product CRUD panel
- [ ] **Dark Mode** — full theme switching
- [ ] **Localization** — multi-language (AR/EN)
- [ ] **CI/CD** — GitHub Actions for build & deploy

---

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Run `flutter analyze` before committing
- Format with `dart format .`

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 🙏 Acknowledgments

- [Firebase](https://firebase.google.com/) — Authentication, Firestore, Hosting
- [FakeStore API](https://fakestoreapi.com/) — Legacy product data
- [Google Fonts](https://fonts.google.com/) — Typography
- [Flutter Team](https://flutter.dev/) — Amazing framework
- [Unsplash](https://unsplash.com/) — Placeholder imagery

---

## 📞 Contact

**Asser Mohammed** — [LinkedIn](https://www.linkedin.com/in/asser-mohammed-795769322/) — mohammedasser070@gmail.com

Project Link: [https://github.com/asaerxd6767/local_brand](https://github.com/asaerxd6767/local_brand)

---

<p align="center">

**Made with ❤️ using Flutter**

⭐ Star this repo if you found it helpful!

</p>