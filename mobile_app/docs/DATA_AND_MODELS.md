# DATA_AND_MODELS.md - Data Models and Structures

## 🚗 Car Model (Shared)

### `Car` Model - `lib/shared/common/filter_results/filter_results.dart`

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `image` | `String` | Asset file name (e.g. `'BMW 7 Series.jpg'`) | `'BMW 7 Series.jpg'` |
| `name` | `String` | Display name (includes year) | `'BMW 7 Series 2025'` |
| `brand` | `String` | Brand name | `'BMW'` |
| `km` | `String` | Mileage (e.g. `'0 km'`, `'50000 km'`) | `'0 km'` |
| `fuel` | `String` | Fuel type | `'Petrol'`, `'Diesel'`, `'Hybrid'`, `'Electric'` |
| `transmission` | `String` | Transmission type | `'Automatic'`, `'Manual'` |
| `body` | `String` | Body type | `'Sedan'`, `'SUV/MUV'`, `'Hatchback'` |
| `price` | `int` | Price in ETB (Ethiopian Birr) | `8400000` |

### Derived Properties

| Property | Formula/Logic | Example |
|----------|--------------|---------|
| `priceText` | `price.toString().replaceAllMapped(RegExp(r'\(d\))(?=\(d{3})+$'), '${m[1]},') + ' ETB'` | `'8,400,000 ETB'` |
| `year` | Regex `(\d{4})$` from name, else `null` | `'2025'` |
| `modelName` | Name minus brand and year | `'7 Series'` |

### Key Rules

- **Price format:** ETB only, no INR, no lakh notation
- **km format:** `'0 km'`, `'50000 km'` etc.
- **Fuel types:** Petrol, Diesel, CNG, Electric, LPG, Hybrid
- **Body types:** Sedan, Hatchback, SUV/MUV, Coupe, MUV
- **No Indian rupees** - all prices in Ethiopian Birr

---

## 📰 News Data Models

### `NewsArticle` Model - `lib/features/bottom/news/models/news_article.dart`

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `id` | `String` | Unique identifier | `'article-123'` |
| `category` | `String` | Article category | `'News'`, `'Reviews'`, `'Features'`, `'EV News'`, `'Used Cars'`, etc. |
| `title` | `String` | Article headline | `'Toyota Corolla Review: A Complete Evaluation'` |
| `imageAsset` | `String` | Cover image asset name | `'toyota_corolla.jpg'` |
| `author` | `String` | Article author | `'Rediet Mengistu'` |
| `timeAgo` | `String` | Time ago string | `'18 Sep 2026'` |
| `views` | `int` | View count | `1245` |
| `body` | `List<String>` | Article body paragraphs | `['Paragraph 1', 'Paragraph 2']` |
| `publishedDate` | `String` | Optional publish date | `'18 Sep 2026'` |
| `priceTag` | `String?` | Optional price tag | `'Contact for price'` |
| `keywords` | `List<String>` | Search keywords | `['Toyota', 'Corolla', 'Review']` |

### `categoryColorOf()` Function

Deterministic color per category:

| Category | Color | Hex |
|----------|-------|-----|
| `Reviews` | accent | `#0F8F83` (teal) |
| `Road Test` | teal | `#0F8F83` |
| `Features` | deep purple | `#5E35B1` |
| `Special Reports` | red | `#FF6D4C41` |
| `EV News` | success | `#16A34A` (green) |
| `New Cars` | primaryLight | `#FFE0B2` (light amber) |
| `Used Cars` | brown | `#6D4C41` |
| `Car Prices` | orange | `#FFF57F17` |
| `Maintenance` | mid gray | `#546E7A` |
| `Buying Guide` | purple | `#7B1FA2` |
| `News` (default) | primary | `#1B5E20` (Ethiopian green) |

### `NewsArticle.searchMatches(String query)` Method

Case-insensitive search across:

- `title.toLowerCase().contains(q)`
- `category.toLowerCase().contains(q)`
- `keywords.any((k) => k.toLowerCase().contains(q))`

### `NewsArticle.categoryColor` Getter

Returns the color for the article's category via `categoryColorOf(category)`.

---

### `NewsVideo` Model - `lib/features/bottom/news/models/news_video.dart`

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `id` | `String` | Unique identifier | `'video-123'` |
| `title` | `String` | Video title | `'Toyota Corolla Test Drive'` |
| `imageAsset` | `String` | Thumbnail asset name | `'toyota_corolla_thumb.jpg'` |
| `author` | `String` | Video author | `'John Doe'` |
| `timeAgo` | `String` | Time ago string | `'18 Sep 2026'` |
| `views` | `int` | View count | `892` |
| `body` | `List<String>` | Video description/tags | `['Specifications', 'Performance']` |

### `VehicleImageCollection` Model - `lib/features/bottom/news/models/vehicle_image_collection.dart`

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `id` | `String` | Unique identifier | `'collection-123'` |
| `vehicleName` | `String` | Vehicle name | `'Toyota Corolla'` |
| `imageAssets` | `List<String>` | Cover image assets | `['img1.jpg', 'img2.jpg', 'img3.jpg']` |
| `imageCount` | `int` | Total image count | `3` |
| `has360View` | `bool` | Whether 360° view available | `true`/ `false` |
| `searchMatches(String query)` | Method | Search across title, keywords | |

---

## 📋 Alerts Data Models

### `AppNotificationType` Enum - `lib/features/bottom/alerts/models/app_notification.dart`

| Value | Type | Description | Example Notification |
|-------|------|-------------|---------------------|
| `car` | `String` | Car notification | `'You have a new listing notification'` |
| `article` | `String` | Article notification | `'New review published'` |
| `savedSearch` | `String` | Saved search notification | `'Your search found results'` |
| `general` | `String` | General notification | `'Important notice'` |

### `AppNotification` Model - `lib/features/bottom/alerts/models/app_notification.dart`

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `id` | `String` | Unique identifier | `'n1'` |
| `type` | `AppNotificationType` | Notification type | `AppNotificationType.car` |
| `title` | `String` | Notification title | `'New BMW Listed'` |
| `description` | `String` | Notification description | `'A 2025 BMW 7 Series is now available'` |
| `timeAgo` | `String` | Time ago string | `'2 minutes ago'` |
| `read` | `bool` | Read status (defaults to `false`) | `false`/ `true` |
| `carImage` | `String?` | Car image asset (for car type) | `'BMW 7 Series.jpg'` |
| `actionLabel` | `String?` | Action button label | `'View Car'` |
| `targetArticleId` | `String?` | Article ID (for article type) | `'art-123'` |
| `targetCarName` | `String?` | Car name (for car type) | `'BMW 7 Series 2025'` |

### `mockNotifications` Constant List

8 sample notifications demonstrating all 4 types:

| ID | Type | Title | Description | Time Ago | Read |
|----|------|-------|-------------|----------|------|
| `n1` | `car` | `'BMW 7 Series 2025'` | `'A 2025 BMW 7 Series is now available'` | `'2 minutes ago'` | `false` |
| `n2` | `car` | `'BMW 5 Series 2025'` | `'A 2025 BMW 5 Series is now available'` | `'1 hour ago'` | `true` |
| `n3` | `article` | `'New Car Review Published'` | `'New expert review of Toyota Corolla'` | `'18 Sep 2026'` | `false` |
| `n4` | `savedSearch` | `'Saved Search Results'` | `'Your search for SUV cars found 5 results'` | `' yesterday'` | `false` |
| `n5` | `general` | `'Important Notice'` | `'Terms and conditions update'` | `' yesterday'` | `true` |
| `n6` | `general` | `'System Update'` | `'App maintenance scheduled'` | `'2 days ago'` | `false` |
| `n7` | `car` | `'Mercedes-AMG G 63'` | `'A 2025 Mercedes-AMG G 63 is now available'` | `'3 days ago'` | `true` |
| `n8` | `article` | `'Weekly Roundup'` | `'This week's car reviews and news'` | `'5 days ago'` | `false` |

**Key Fields by Type:**

| Type | `targetCarName` | `targetArticleId` | `actionLabel` | Navigation Target |
|------|-----------------|-------------------|---------------|-------------------|
| `car` | Must match `allCars` catalogue | `null` | `'View Car'` | `CarDetailsScreen` or `PlaceholderScreen` |
| `article` | `null` | Must match article IDs | `'Read Article'` | `ArticleDetailScreen` or `PlaceholderScreen` |
| `savedSearch` | `null` | `null` | `'View Results'` | `CarSearchScreen` |
| `general` | `null` | `null` | `'View Details'` | `PlaceholderScreen` (`'Notice'`, `'More details coming soon.'`) |

---

## 📊 Comparison Data Structures

### `ComparisonReview` Model - `lib/features/bottom/compare/compare_catalogue/compare_catalogue.dart`

| Field | Type | Description |
|-------|------|-------------|
| `id` | `String` | Unique review ID (e.g. `'rev-vitz-swift'`) |
| `carA` | `Car` | First car in comparison |
| `carB` | `Car` | Second car in comparison |
| `title` | `String` | Review title (must match the two cars) |
| `author` | `String` | Review author name |
| `date` | `String` | Review date (e.g. `'18 Sep 2026'`) |
| `summary` | `String` | Brief summary (2-3 sentences) |
| `paragraphs` | `List<String>` | Full review paragraphs (3-5 paragraphs) |

### Key Rule: Every `ComparisonReview` must reference two real `Car` objects from the shared catalogue so the specification table can never contradict the article.

### `CompareCatalogue` Data Gateway

| Method | Behavior |
|--------|----------|
| `fetchPopularPairs()` | Resolves every distinct pair from `newCars` catalogue after 350ms simulated delay. Returns `List<({Car a, Car b})>`. Result cached in `_pairsFuture`. |
| `fetchReviews()` | Resolves built review list after 350ms simulated delay. Result cached in `_reviewsFuture`. |
| `refresh()` | Clears both cached futures so next fetch truly reloads. Used by retry actions. Does not clear bookmarks. |
| `isSaved(String reviewId)` | Checks in-memory bookmark set |
| `toggleSaved(String reviewId)` | Toggles bookmark status, returns `true` if newly saved |
| `buildComparisonShareText(Car a, Car b)` | Builds clipboard summary text format |

### Review Specification Table Rows (Per compare_doc §13.4)

| Section | Rows | Source |
| -------- | ---- | -------- |
| `Basic Information` | Price, Year, Condition, Mileage | `priceText`, `year`, hard-coded "New", `km` |
| `Engine & Performance` | Engine size, type, power, torque, cylinders | `N/A` (not in model) - decide to extend or trim |
| `Transmission` | Transmission, drive type | `transmission`, `N/A` |
| `Fuel` | Fuel type, fuel economy | `fuel`, `N/A` |
| `Dimensions` | Length, width, height, ground clearance, boot space | `N/A` |
| `Features` | Air conditioning, airbags, ABS, etc. | `N/A` |

**Rule:** Missing/blank values render `N/A`. **Never invent values.**

### Popular Comparison Pairs

Generated from shared `newCars` catalogue:

```dart
for (var i = 0; i < newCars.length; i++) {
  for (var j = i + 1; j < newCars.length; j++) {
    pairs.add((a: newCars[i], b: newCars[j]));
  }
}
```

With 4 cars: 6 pairs. Grows automatically as catalogue grows.

---

## 📋 Sample Data Tables

### New Cars Catalogue (`newCars`)

| Image | Brand | Model | KM | Fuel | Transmission | Body | Price (ETB) |
|-------|-------|-------|-----|------|------------|------|------------|
| `BMW 7 Series.jpg` | BMW | BMW 7 Series 2025 | `0 km` | Petrol | Automatic | Sedan | `8,400,000` |
| `BMW 5 Series.jpg` | BMW | BMW 5 Series 2025 | `0 km` | Hybrid | Automatic | Sedan | `9,703,200` |
| `Porsche Panamera.jpg` | Porsche | Porsche Panamera 2025 | `0 km` | Hybrid/Petrol | Automatic | Sedan | `39,400,000` |
| `BYD Sealion 7.jpg` | BYD | BYD Sealion 7 2025 | `0 km` | Electric | Automatic | SUV/MUV | `7,000,000` |

### Used Cars Catalogue (`allCars`)

| Image | Brand | Model | KM | Fuel | Transmission | Body | Price (ETB) |
|-------|-------|-------|-----|------|------------|------|------------|
| `photo_1.jpg` | BMW | BMW 7 Series 2025 | `0 km` | Petrol | Automatic | Sedan | `8,400,000` |
| `photo_2.jpg` | BMW | BMW 5 Series 2025 | `0 km` | Hybrid | Automatic | Sedan | `9,703,200` |
| `photo_9.jpg` | Porsche | Porsche Panamera 2025 | `0 km` | Hybrid/Petrol | Automatic | Sedan | `39,400,000` |
| `photo_10.jpg` | BYD | BYD Sealion 7 2025 | `0 km` | Electric | Automatic | SUV/MUV | `7,000,000` |

### 8 Sample Alerts Notifications

| ID | Type | Title | Description | Time Ago | Read |
|----|------|-------|-------------|----------|------|
| n1 | car | BMW 7 Series 2025 | A 2025 BMW 7 Series is now available | 2 minutes ago | false |
| n2 | car | BMW 5 Series 2025 | A 2025 BMW 5 Series is now available | 1 hour ago | true |
| n3 | article | New Car Review Published | New expert review of Toyota Corolla | 18 Sep 2026 | false |
| n4 | savedSearch | Saved Search Results | Your search for SUV cars found 5 results | yesterday | false |
| n5 | general | Important Notice | Terms and conditions update | yesterday | true |
| n6 | general | System Update | App maintenance scheduled | 2 days ago | false |
| n7 | car | Mercedes-AMG G 63 | A 2025 Mercedes-AMG G 63 is now available | 3 days ago | true |
| n8 | article | Weekly Roundup | This week's car reviews and news | 5 days ago | false |

---

## 🔄 Data Flow Summary

### New Cars → Uses `Car` model from `filter_results.dart`
- Reads `newCars` catalogue (4 cars currently)
- Price in ETB, no INR/lakh
- Images from `assets/images/`

### Used Cars → Uses `Car` model from `filter_results.dart`
- Reads `allCars` catalogue (same 4 cars + different images)
- Price in ETB, no INR/lakh
- Different images (with "its used car" suffix pattern)

### Compare → Reads shared `newCars` catalogue
- **NO second catalogue** - uses the same one as New Cars
- `CompareCatalogue.fetchPopularPairs()` generates pairs from `newCars`
- `ComparisonReview` objects reference real cars from catalogue

### News → Uses `NewsArticle` + `NewsVideo` models
- Single `MockNewsRepository` data source
- 24 articles, 5 videos, 5 collections (currently)
- Favourites via `FavoritesStore.instance` (session-scoped)

### Alerts → Uses `AppNotification` + `NotificationsStore`
- Single `NotificationsStore.instance` data source
- 8 mock notifications (all 4 types)
- Session-only store - lost on app restart

---
*All data structures are defined in single locations - never create duplicates. Import from the defined paths.*