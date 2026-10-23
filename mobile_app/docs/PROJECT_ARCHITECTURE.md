# PROJECT_ARCHITECTURE.md - Project Structure Documentation

## 📁 Folder Structure Overview

### Feature Organization (Phase 7)

```
lib/features/bottom/
├── new/              # New Cars main page
│   ├── new.dart              # Public widget (API entry point)
│   ├── new_impl.dart         # Internal implementation
│   │   ├── widgets/          # Section-specific widgets
│   │   ├── models/           # Domain models
│   │   └── new_cars_page.dart # Main page assembler
│   └── docs/               # Local documentation
├── used/              # Used Cars main page
│   ├── used.dart               # Public widget
│   ├── used_impl.dart          # Internal implementation
│   └── docs/                 # Local documentation
├── compare/           # Compare Cars feature
│   ├── compare.dart              # CompareScreen (tab page)
│   ├── select_car/               # Car picker screen
│   │   └── select_car.dart
│   ├── compare_details/          # Comparison details screen
│   │   └── compare_details.dart
│   ├── compare_catalogue/        # Data gateway and review flow
│   │   ├── compare_catalogue.dart   # ComparisonReview + CompareCatalogue
│   │   ├── all_reviews_screen.dart
│   │   ├── expert_review_screen.dart
│   │   ├── saved_reviews_screen.dart
│   │   ├── review_list_tile.dart
│   │   └── review_card.dart
│   ├── widgets/                  # Shared widgets (DO NOT duplicate)
│   │   └── vs_badge.dart         # VsBadge - shared
│   │   └── tab_page_shell.dart   # TabPageShell - shared
│   │   └── app_car_image.dart    # AppCarImage - shared
│   └── docs/                     # Local documentation
├── news/                # News feature
│   ├── news.dart                   # NewsScreen (tab page)
│   ├── new_impl.dart                 # Internal implementation
│   ├── widgets/                  # News-specific widgets
│   │   ├── _ArticleCard.dart       # Article card (shared)
│   │   ├── _VideoCard.dart         # Video card (shared)
│   │   ├── _CollectionCard.dart    # Collection card (shared)
│   │   ├── _FilterPills.dart       # Filter pills (shared)
│   │   └── _UnderlineTab.dart      # Underline tab (shared)
│   ├── models/                     # News models
│   │   ├── news_article.dart       # NewsArticle model
│   │   ├── news_video.dart         # NewsVideo model
│   │   └── vehicle_image_collection.dart
│   ├── data/                       # Data layer (SINGLE SOURCE)
│   │   ├── mock_news_repository.dart # MockNewsRepository - DO NOT duplicate
│   │   └── favorites_store.dart     # FavoritesStore.instance - shared
│   └── docs/                       # Local documentation
└── alerts/                # Alerts feature
    ├── alerts.dart                   # AlertsScreen (tab page)
    ├── alerts_impl.dart              # Internal implementation
    ├── models/                       # AppNotification model + enum
    │   └── app_notification.dart
    ├── data/                         # Data layer (SINGLE SOURCE)
    │   ├── notifications_store.dart  # NotificationsStore.instance - singleton
    │   └── mock_notifications.dart   # mockNotifications - constant list
    └── docs/                         # Local documentation
```

### Core Library Structure

```
lib/core/
├── constants/              # AppColors, AppDimens, AppIcons
│   ├── app_colors.dart     # Muted blue palette + legacy colors
│   ├── app_dimens.dart     # Spacing and radius tokens
│   └── app_icons.dart      # Lucide icons (const const IconData)
├── navigation/             # Route management
│   ├── app_routes.dart     # Route name constants
│   ├── app_router.dart     # Route configuration
│   ├── bottom_nav_bar.dart # Five-item bottom navigation
│   └── navigation_shell.dart # PageView shell
├── shared/                 # Cross-feature shared resources
│   ├── common/             # Shared models and utilities
│   │   ├── filter_results/filter_results.dart  # Car model + newCars catalogue
│   │   └── car_details/car_details_screen.dart # Car details screen
│   └── widgets/            # Shared widgets (NEVER duplicate)
│       ├── vs_badge.dart         # VsBadge - comparison feature
│       ├── tab_page_shell.dart   # TabPageShell - all bottom tabs
│       ├── app_car_image.dart    # AppCarImage - image with fallback
│       ├── page_top_bar.dart     # PageTopBar - News & Alerts
│       └── ...                   # Other shared widgets
├── theme/                  # Theme configuration
└── utils/                  # Utility functions
```

### Route Map

| Route Constant | Path | Target | Feature |
| ------------- | ---- | ------ | -------- |
| `AppRoutes.home` | `/home` | `NewCarsPage` | New Cars |
| `AppRoutes.newCars` | `/new-cars` | `NewCarsPage` | New Cars |
| `AppRoutes.usedCars` | `/used-cars` | `UsedScreen` | Used Cars |
| `AppRoutes.compare` | `/compare` | `CompareScreen` | Compare Cars |
| `AppRoutes.news` | `/news` | `NewsScreen` | News |
| `AppRoutes.alerts` | `/alerts` | `AlertsScreen` | Alerts |
| `AppRoutes.searchCars` | `/search-cars` | `CarSearchScreen` | Shared search |
| `AppRoutes.location` | `/location` | `CarLocationScreen` | Used Cars |
| `AppRoutes.sellCar` | `/sell-car` | `PlaceholderScreen` | Sell Car |
| `AppRoutes.checkCarValuation` | `/check-car-valuation` | `PlaceholderScreen` | Valuation |
| `AppRoutes.loan` | `/loan` | `PlaceholderScreen` | Car Loan |
| `AppRoutes.favourites` | `/favourites` | `PlaceholderScreen` | Favourites |

**Rule:** Bottom navigation order is fixed: New (0), Used (1), **Compare** (2), **News** (3), **Alerts** (4). Do not change this order.

---

## 🏗️ Shared Widgets (CRITICAL - DO NOT Duplicate)

| Widget | File | Used By |
|--------|------|---------|
| `VsBadge` | `lib/shared/widgets/vs_badge.dart` | Compare feature (between two car images) |
| `TabPageShell` | `lib/shared/widgets/tab_page_shell.dart` | All bottom tab pages (New, Used, Compare, News, Alerts) |
| `AppCarImage` | `lib/shared/widgets/app_car_image.dart` | All features (car image with error fallback) |
| `ReviewListTile` | `lib/features/bottom/compare/compare_catalogue/review_list_tile.dart` | Compare feature (All Reviews + Saved Reviews) |
| `PageTopBar` | `lib/shared/widgets/page_top_bar.dart` | News and Alerts features (shared top bar) |
| `NewsSkeletonCards` | `lib/features/bottom/news/widgets/news_skeleton_cards.dart` | News feature (loading state) |
| `NewsEmptyState` | `lib/features/bottom/news/widgets/news_empty_state.dart` | News feature (empty state) |

**Rule:** If a widget is shared, **import it from its defined location - do NOT copy or recreate**.

---

## 🗂️ Shared Models

| Model | File | Features That Use It |
|-------|------|---------------------|
| `Car` | `lib/shared/common/filter_results/filter_results.dart` | New Cars, Used Cars, Compare (read-only) |
| `NewsArticle` | `lib/features/bottom/news/models/news_article.dart` | News feature only |
| `NewsVideo` | `lib/features/bottom/news/models/news_video.dart` | News feature only |
| `VehicleImageCollection` | `lib/features/bottom/news/models/vehicle_image_collection.dart` | News feature only |
| `AppNotification` | `lib/features/bottom/alerts/models/app_notification.dart` | Alerts feature only |
| `ComparisonReview` | `lib/features/bottom/compare/compare_catalogue/compare_catalogue.dart` | Compare feature only |

**Rule:** Do NOT create second versions of any model. Import from the defined location.

---

## 📦 Asset Management

### Icon Assets

- **Package:** `lucide_icons_flutter` (version 4.0.1)
- **Defined in:** `lib/core/constants/app_icons.dart`
- **Must be `static const IconData`** (not `static IconData`) - P0 fix required
- **Defined icons:** `AppIcons.compare`, `AppIcons.bookmark`/`bookmarkBorder`, `AppIcons.person`, `AppIcons.share`, `AppIcons.news`, `AppIcons.notification`, `AppIcons.alerts`

**P0 Fix Required:** Change all icon fields from `static IconData` to `static const IconData`

### Image Assets

- **Location:** `lib/assets/images/` (or `mobile_app/assets/images/`)
- **Naming convention:** `<ModelName>.jpg` (e.g., `BMW 7 Series.jpg`)
- **Format:** JPEG/PNG with proper aspect ratios
- **Fallback:** `image_not_supported_outlined` icon when file missing
- **Rule:** Images must use `BoxFit.cover` - never stretched

### Data Assets

- **Mock notifications:** `lib/features/bottom/alerts/data/mock_notifications.dart` - 8 sample notifications (all 4 types)
- **Mock news:** `lib/features/bottom/news/data/mock_news_repository.dart` - articles, videos, collections
- **Car catalogue:** `lib/shared/common/filter_results/filter_results.dart` - `newCars` + `allCars` lists

---

## 🔄 Services & Data Layer

### Repository Pattern (Singleton where applicable)

| Service | Type | Singleton | Features |
|---------|------|-----------|----------|
| `MockNewsRepository` | Data repository | **Yes** (single source) | News articles, videos, collections |
| `NotificationsStore` | State management | **Yes** (singleton) | Alerts notifications, unread count |
| `FavoritesStore` | Favourite tracking | **Yes** (session-scoped) | News article favourites |

**CRITICAL Rules:**
- **Do NOT** create second repositories
- **Do NOT** create second data stores
- All widgets must read from the singleton instances
- When backend arrives, only swap `fetch*` methods - UI does not change

---

## 📋 File Responsibility Matrix

| File | Primary Responsibility | Related Features |
|------|----------------------|------------------|
| `app_colors.dart` | Color palette for entire app | All features |
| `app_icons.dart` | Icon definitions for entire app | All features |
| `filter_results.dart` | `Car` model + `newCars`/`allCars` catalogues | New Cars, Used Cars, Compare |
| `app_router.dart` | Route configuration | All features |
| `bottom_nav_bar.dart` | 5-item bottom navigation | All features |
| `new_impl.dart` | New Cars implementation | New Cars |
| `used_impl.dart` | Used Cars implementation | Used Cars |
| `compare_impl.dart` | Compare implementation | Compare |
| `news_impl.dart` | News implementation | News |
| `alerts_impl.dart` | Alerts implementation | Alerts |

---

## 🚫 Critical Constraints

### 1. Single Car Model
- **Only one** `Car` model from `filter_results.dart`
- **Never** create `new_cars.dart`, `used_cars.dart`, or any duplicate
- Compare feature reads the shared `newCars` catalogue - **no second database**

### 2. Single Comparison Engine
- **Only one** `CompareCatalogue` from `compare_catalogue.dart`
- **Never** build own list of cars or reviews
- Cached futures: `fetchPopularPairs()` and `fetchReviews()`

### 3. Shared Widgets Must NOT Be Duplicated
- `VsBadge`, `TabPageShell`, `AppCarImage` - import only
- `PageTopBar` - shared between News and Alerts
- Duplication is P1-5 (SkeletonBlock) and P1-7 (search alignment)

### 3. Bottom Navigation
- **Fixed 5-item order:** New, Used, Compare, News, Alerts
- **Never add second navigation bar** inside any feature page
- **Selection state:** "Used" must remain selected on Used Cars page
- **Icon:** `AppIcons.compare` (`LucideIcons.gitCompare`) for Compare tab

### 4. Color System
- All colors from `AppColors` class - no hardcoded hex in widget code
- Muted Blue (`#647FA3`) is primary brand across all features
- Preserve legacy Ethiopian green (`#1B5E20`) where specified
- No second color palettes per feature

### 5. State Management
- **No third-party state packages** - use `StatefulWidget` local state + static caches
- **Bookmarks/saved reviews** are session-scoped - document this limitation
- **News favourites** via `FavoritesStore.instance` only
- **Alerts** via `NotificationsStore.instance` only

---

## 📂 Recommended IDE/Project Structure

### Opening the Project

```
car_sales/
├── mobile_app/          # Flutter project root
│   ├── lib/             # Source code
│   │   ├── core/        # Constants, theme, utils
│   │   ├── features/    # Bottom navigation features
│   │   └── shared/      # Shared widgets/models
│   ├── docs/            # Documentation (AGENTS.md, DESIGN_SYSTEM.md, etc.)
│   └── test/            # Widget tests
├── docs/                # Project-level documentation
│   ├── AGENTS.md        # OpenCode rules (READ FIRST)
│   ├── DESIGN_SYSTEM.md # Visual design system
│   ├── PROJECT_ARCHITECTURE.md # Structure docs
│   ├── DATA_AND_MODELS.md # Data models
│   ├── IMPLEMENTATION_PLAN.md # Task tracking
│   └── TESTING_AND_QUALITY.md # Quality checks
└── .gitignore           # Standard Flutter gitignore
```

---

## 🔄 When to Add New Files

**NEVER add a new file if:**

- [ ] An existing file can be extended to cover the new functionality
- [ ] The functionality overlaps with an existing feature
- [ ] A shared widget already exists for this purpose
- [ ] The data model already exists (import it instead)

**ALWAYS create a new file if:**

- [ ] The functionality is fundamentally different from existing features
- [ ] No shared widget exists and building one would be over-engineering
- [ ] The data model has no relationship to existing models
- [ ] The route/screen is truly unique and not part of the bottom navigation

**Before creating any new file, check:**
1. [ ] Does an existing file serve this purpose (partially or fully)?
2. [ ] Can the existing file be modified minimally?
3. [ ] Does this violate any of the "Critical Constraints" above?
4. [ ] Is this documented in the `.doc` specifications?

---

## 📬 Communication & Session Management

### For Single Developer (You)

- Use **one shared set of rules** (`AGENTS.md`)
- Keep **one OpenCode session** active at a time
- **Check in** progress before starting a new session
- **Update** `IMPLEMENTATION_PLAN.md` after each session

### If Multiple Sessions Ever Occur

- **One session** modifies a file at a time
- **Other sessions** wait or read-only
- **Never modify the same shared widget** simultaneously
- **Sync** before starting new tasks: "What was completed last session?"
- **Reference** `AGENTS.md` rules for conflict resolution

### File Ownership

- **Core constants:** `app_colors.dart`, `app_icons.dart`, `app_dimens.dart` - owned by project architecture
- **Feature widgets:** Owned by their respective feature (`new_impl.dart`, `used_impl.dart`, etc.)
- **Shared widgets:** Owned by `lib/shared/` - modification requires reviewing impact on all features
- **Documentation:** Owned by `docs/` - all `.doc` files are source truth

---
*This architecture document ensures consistent code organization, prevents duplicate files, and provides clear ownership for the Flutter car_sales application.*