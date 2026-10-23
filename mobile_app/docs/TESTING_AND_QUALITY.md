# TESTING_AND_QUALITY.md - Quality Assurance and Testing

## ✅ Testing Standards

### `flutter analyze` Requirements

**Must Pass:**
- Zero errors in the feature being worked on
- Zero errors in features sharing modified widgets/models
- No new pre-existing errors introduced
- All `const_with_non_constant_argument` errors resolved (P0-4 fix)
- All `const` widget tree issues fixed

**Run Command:**
```bash
flutter analyze lib/
```

**Report Requirements:**
- List all errors found
- Distinguish pre-existing vs. new errors
- List files modified in current session
- Provide fix priority (P0, P1, P2)

### `flutter test` Requirements

**Must Pass:**
- All existing widget navigation tests
- No test failures introduced by changes
- Test coverage not degraded (existing coverage maintained)

**Run Command:**
```bash
flutter test
```

**Test Categories:**
- Widget tests for navigation flow
- Widget tests for feature-specific interactions
- Integration tests (if applicable)

---

## 📱 Layout Consistency Checks

### Visual Regression Checks

- [ ] Bottom navigation bar: 5 items, correct selection state
- [ ] Color palette: Muted Blue (`#647FA3`) used consistently
- [ ] Typography: Text sizes/rweights per DESIGN_SYSTEM.md
- [ ] Spacing: AppDimens tokens used consistently
- [ ] Borders: Border Gray (`#D9E0E8`) where specified
- [ ] Cards: Correct corner radii (radiusMd: 12, radiusLg: 20)
- [ ] No unexpected colored backgrounds on car images
- [ ] Bottom navigation "Used" remains selected on Used Cars page

### Manual Checks

- [ ] Layout on physical device or emulator
- [ ] Portrait and landscape where applicable
- [ ] Text truncation/ellipsis working correctly
- [ ] Image loading and error fallbacks
- [ ] Touch targets minimum 44×44px
- [ ] Safe area handling on notched devices

### Layout Consistency Checklist per Feature

#### New Cars Page
- [ ] Header and search aligned correctly
- [ ] Quick filters in correct order (Budget, Body Type, Fuel Type)
- [ ] Promotional banner correct proportions
- [ ] Recently Viewed Cars and Continue Your Journey in correct order
- [ ] Recommended For You has multiple rows
- [ ] Featured Cars has Popular/Just Launched/Upcoming tabs
- [ ] Featured cards include View Price Breakdown
- [ ] Explore by Brand has grid and View All Brands
- [ ] Popular Filters has Body Type, Budget, Fuel Type
- [ ] Filtered car list and View All action present
- [ ] Price disclaimers in appropriate locations
- [ ] Compare Cars and More Comparisons present
- [ ] Latest Car Updates has three tabs
- [ ] News/media cards and More News present

#### Used Cars Page
- [ ] Header and location chip aligned correctly
- [ ] Promo carousel correct proportions and rounded corners
- [ ] "Find Second Hand Cars" card border, shadow, action buttons
- [ ] Location search field correct height, border, placeholder text
- [ ] City grid has exactly 3 columns with dividers
- [ ] "Other Cities" tile present and styled
- [ ] Filter tabs (Budget, Body Type, Fuel Type, Transmission) correct order
- [ ] Filter chips correct icons and styling
- [ ] Popular models car cards correct width, image height, price format
- [ ] Brands grid 3-column layout with monogram logos
- [ ] "View All Used Cars" button present and styled
- [ ] "Want to Sell Your Car?" banner correct description and 2×2 feature grid
- [ ] Feature items correct icon + label layout
- [ ] "Sell Your Car" button at bottom of banner present and styled
- [ ] "Tools You May Need" section correct title, gap, two tool items
- [ ] Tool items correct icons, titles, descriptions, chevrons
- [ ] Price disclaimer present with recommended wording
- [ ] Bottom navigation has 5 items with "Used" selected

#### Compare Cars Page
- [ ] Tab bar shows "Compare Cars" with search and saved-reviews actions
- [ ] Two equal selector panels side by side with VS badge centred
- [ ] "+ Add Car" and "Compare" buttons share row equally
- [ ] "POPULAR CAR COMPARISONS" shows two cards initially
- [ ] "Less Comparisons" and "More Comparisons" appear/disappear correctly
- [ ] "COMPARISON TESTS" shows horizontal carousel of 272-wide cards
- [ ] "Read all expert reviews" is full width
- [ ] Detail screen shows two headers, 40px VS badge, swap/reset actions, all spec sections
- [ ] Review screen shows title, author, cover, overview, at-a-glance table, body paragraphs, "View Full Comparison" button

#### News Page
- [ ] Tab bar shows "News" with search and favourites actions
- [ ] Two main tabs: "News & Reviews" (default) and "Images & Videos"
- [ ] When "News & Reviews" active, filter pills: All / Reviews / Special Reports
- [ ] Article cards show cover image, category badge (coloured pill), title (3 lines max), author, time ago, view count
- [ ] Favourite button on each article toggles and shows snackbar
- [ ] When "Images & Videos" active, sub-tabs: "Images" / "Videos"
- [ ] Video cards show cover image, play button, category badge, title, author, time ago, views, likes
- [ ] Collection cards show cover image, 360° badge (if applicable), image count badge, vehicle name
- [ ] Empty state shows automotive illustration + "All Caught Up"
- [ ] Skeleton cards appear while data loads (3 vertical blocks)

#### Alerts Page
- [ ] Tab bar shows "Alerts" at bottom with badge showing unread count (if any)
- [ ] Alerts screen header shows "Notifications" and "Clear all" button when notifications
- [ ] Notification list shows rows with read/unread styling
- [ ] Unread rows have pale blue background (#F7FAFF) and primary-coloured dot
- [ ] Read rows have surface background (#FAFAFA) and disabled text colour
- [ ] Each row has icon on left (car/news/search/bell, colour-coded by type), title, description, time ago
- [ ] Unread rows show right-aligned 8px primary-coloured dot; read rows do not
- [ ] If notification has car image, appears on far right (60×52, rounded corners)
- [ ] When no notifications, "All Caught Up" empty state appears with illustration (bell + small car in pale blue circle)
- [ ] "Clear all" button hidden when no notifications
- [ ] Swiping left dismisses notification and updates unread count badge
- [ ] Tapping notification marks read and navigates to correct screen
- [ ] "Clear all" dismisses all and shows "All Caught Up" empty state
- [ ] Bottom navigation badge updates number when notifications dismissed/cleared

---

## 🔍 Navigation Consistency Checks

### Bottom Navigation

- [ ] 5 items present: New, Used, Compare, News, Alerts
- [ ] "Used" selected when on Used Cars page
- [ ] "Compare" selected when on Compare page
- [ ] "News" selected when on News page
- [ ] "Alerts" selected when on Alerts page
- [ ] White background on bottom navigation bar
- [ ] Consistent outline icons (Lucide style)
- [ ] Tap navigation works to all feature pages
- [ ] PageView animates when swiping between tabs
- [ ] No double-tap issues or accidental tab switches

### Page Navigation

- [ ] All feature page navigations work from bottom nav
- [ ] Back arrow on detail screens returns to NewsScreen
- [ ] Search icon opens NewsSearchScreen
- [ ] Favourite toggle saves/removes and shows snackbar
- [ ] "Clear all" dismisses all notifications shows "All Caught Up"
- [ ] Swipe-to-dismiss updates unread count badge
- [ ] Navigation targets correct (car→CarDetails, article→ArticleDetail, etc.)

### Route Consistency

- [ ] All routes from `app_routes.dart` working
- [ ] No dead constants (e.g., `AppRoutes.compareCars` should be removed or used)
- [ ] Named routes matching router configuration
- [ ] Parameter passing correct between screens

---

## 🐛 Error Detection

### `flutter analyze` Error Categories

| Severity | Action |
|----------|--------|
| **P0 (Blocker)** | Must fix before any feature work. Icon constants, `const` fields, imports |
| **P1 (Correctness)** | Fix before completing feature. Data resolution, UI behavior |
| **P2 (Cleanup)** | Fix after features working. Cleanup, redundancy removal |
| **Info/Warnings** | Address if related to changes, otherwise document |

**Error Response Workflow:**

1. **Run** `flutter analyze lib/`
2. **Categorize** each error (P0, P1, P2, Info)
3. **Fix** P0 errors first (block all other work)
4. **Fix** P1 errors for feature completion
5. **Document** P2 items in implementation report
6. **Ignore** pre-existing errors (list in report separately)
7. **Re-run** `flutter analyze` to verify

### Common P0/P1 Fixes Reference

| Issue | File | Fix |
|-------|------|-----|
| `static IconData` instead of `static const IconData` | `app_icons.dart` | Change to `static const` |
| `import ../../../../shared/common/filter_results/new_cars.dart` does not exist | `select_car.dart` | Change to `filter_results.dart` |
| `byBrandModel` falls back to `newCars.first` | `compare_catalogue.dart` | Fix resolution or add cars to catalogue |
| Hard-coded "Used" in compare details | `compare_details.dart` | Remove hard-code, derive from catalogue |
| `SkeletonBlock` duplicated 3 places | Multiple files | Extract to shared widget |
| `onPressed: null` silently fails | `compare.dart` | Disable button or replace selection |
| Raw `Image.asset` while rest uses `AppCarImage` | `compare_details.dart` | Use `AppCarImage` |
| Global search doesn't return matching cars | `search.dart` | Align with shared catalogue |
| "+ Add Car" does nothing when both slots filled | `compare.dart` | Disable button or replace selection |

---

## 🏁 Performance Checks

### Build Performance

- [ ] `flutter build apk --release` completes without errors
- [ ] `flutter build appbundle --release` completes without errors
- [ ] Build time acceptable (under 5 minutes typical)

### Runtime Performance

- [ ] No jank or frame drops on scrolling
- [ ] ListViews scroll smoothly (30fps minimum)
- [ ] Images load without memory warnings
- [ ] No widget rebuild storms (especially Favourite toggles)
- [ ] Bottom navigation tab switching instant (no animation lag)

### Memory Usage

- [ ] No memory leaks detected (run app, navigate, navigate back, OOM not occurring)
- [ ] Image caching working correctly
- [ ] No widget tree retaining obsolete state

### Network Performance (if applicable)

- [ ] No unnecessary rebuilds when data changes
- [ ] Loading states shown appropriately
- [ ] Error states shown when fetch fails
- [ ] Empty states shown when data empty

---

## 📊 Quality Gate Checklist

### Before Each Development Session:

- [ ] `flutter analyze` run on `lib/`
- [ ] Pre-existing errors listed separately from new errors
- [ ] Bottom navigation state verified
- [ ] Documentation for current feature reviewed

### After Each Development Session:

- [ ] `flutter analyze` run - zero new errors
- [ ] `flutter test` passes (existing tests)
- [ ] Implementation report updated
- [ ] Features verified on device/emulator
- [ ] Screenshots if UI changes made
- [ ] Next session tasks noted

### Before Feature Completion:

- [ ] `flutter analyze` - zero errors in feature
- [ ] `flutter test` - all tests pass
- [ ] Layout verified on device (portrait)
- [ ] Navigation verified (bottom tab + detail back)
- [ ] Color consistency checked (per DESIGN_SYSTEM.md)
- [ ] Implementation report complete
- [ ] No regressions in other features
- [ ] Documentation updated

### Before Month-end Review:

- [ ] All features analyzed with zero critical errors
- [ ] All tests passing
- [ ] Performance acceptable on device
- [ ] Documentation complete (all 6 `.md` files)
- [ ] Implementation plans updated
- [ ] Pre-existing vs. new errors clearly distinguished

---

## 📬 Bug Reporting Format

When reporting bugs found during testing:

```
## Bug Report: [Title]

**Feature:** [New Cars / Used Cars / Compare / News / Alerts]
**Section:** [Specific section/file]
**Severity:** [P0 / P1 / P2 / Cosmetic]

**Description:**
[Clear description of the bug]

**Steps to Reproduce:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]

**Error Output:**
```
[flutter analyze output or stack trace]
```

**Device/Emulator:**
- Device: [e.g., Pixel 5]
- OS Version: [e.g., Android 13]
- Flutter Version: [e.g., 3.22.2]
- Dart Version: [e.g., 3.5.]
```

---

## 📈 Quality Metrics Tracker

| Metric | Target | Current | Status |
|--------|--------|---------|--------|
| `flutter analyze` errors (feature) | 0 | - | - |
| `flutter test` tests | All pass | - | - |
| Bottom nav consistency | 100% | - | - |
| Color violations (hardcoded hex) | 0 | - | - |
| Widget rebuild storms | < 5/sec | - | - |
| Memory leaks | 0 | - | - |
| Device test passes | 100% | - | - |

---
*This testing and quality document ensures consistent quality standards across all feature development and maintains the project's code health.*