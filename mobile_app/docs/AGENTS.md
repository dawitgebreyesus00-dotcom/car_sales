# AGENTS.md - OpenCode Project Rules

## 🎯 Primary Directives

### 1. Read Documentation First
- **Always** read the relevant `.doc` specification before making any changes
- The `new.doc`, `used.doc`, `compare.doc`, `news.doc`, and `alert.doc` files are the source of truth
- Never assume code is wrong - inspect it first per the specification rules

### 2. Preserve Correct and Useful Code
- **Keep** existing working implementations
- **Update** only what the documentation specifies needs changing
- **Repair** broken code, but verify it's broken before fixing
- **Remove** only genuinely redundant code after verification

### 3. Reuse Shared Components
- **Always reuse** existing shared widgets, colors, models, and utilities
- Shared resources are defined in `lib/core/constants/app_colors.dart`
- Shared widgets: `VsBadge`, `TabPageShell`, `AppCarImage`, `ReviewListTile`, `PageTopBar`
- Shared models: `Car` from `filter_results.dart`, `NewsArticle`, `NewsVideo`
- Shared repositories: `MockNewsRepository`, `NotificationsStore`

### 4. Avoid Duplicate Files
- **Do NOT** create duplicate `Car` models - import from `filter_results.dart`
- **Do NOT** create second data repositories - use `MockNewsRepository` or `NotificationsStore`
- **Do NOT** duplicate shared widgets - import from their defined locations
- **Do NOT** rewrite entire pages - follow incremental implementation plans

### 5. Make Focused Changes
- Implement one section at a time per the incremental plans (§22 for new, §18 for used, §23 for compare, §21 for news, §17 for alerts)
- Complete each stage and review before continuing
- Do not attempt all stages in one operation

### 6. Run Verification Checks
- **After every editing session:** Run `flutter analyze` 
- **Fix ALL errors** introduced by your changes before marking complete
- Distinguish pre-existing errors from new errors
- Run relevant `flutter test` tests
- Verify bottom navigation remains functional (5 items, correct selection state)

### 6. Document Your Changes
- The implementation report must list:
  - Files inspected
  - Files modified or created
  - Code preserved
  - Bugs fixed
  - Redundant code removed and why
  - Analysis and test results
  - Missing integrations and remaining issues

---

## 📋 Session Workflow

### Before Starting Any Task:
1. Read the relevant `.doc` specification
2. Inspect the existing code files mentioned in the task
3. Identify what to preserve, fix, update, or remove
4. Report intended file changes

### During Implementation:
1. Make focused, incremental changes
2. Preserve all unrelated functionality
3. Reuse shared components per the documentation
4. Run `flutter analyze` periodically

### Before Completing Any Task:
1. Run `flutter analyze` - fix all new errors
2. Run relevant `flutter test` tests
3. Verify the change matches the documentation specification
4. Document the changes in the implementation report

### End of Session:
1. Summarize what was completed
2. List any remaining issues or open questions
3. Note files that need future attention

---

## 🚫 Prohibited Actions

- ❌ Do NOT create a second `Car` model - import from `filter_results.dart` only
- ❌ Do NOT create a second `MockNewsRepository` - use the existing one
- ❌ Do NOT create a second `NotificationsStore` - use the existing singleton
- ❌ Do NOT duplicate shared widgets (`VsBadge`, `TabPageShell`, `AppCarImage`, etc.)
- ❌ Do NOT change bottom navigation selection state ("Used" must remain selected on Used page)
- ❌ Do NOT claim integrations work unless verified - document limitations
- ❌ Do NOT rewrite entire pages unnecessarily - follow incremental plans
- ❌ Do NOT ignore pre-existing errors - distinguish from new errors
- ❌ Do NOT ignore the documentation specifications

---

## 📁 File Navigation Quick Reference

| Feature | Primary File | Key Dependencies |
|---------|-------------|------------------|
| New Cars | `lib/features/bottom/new/new.dart` | `new_impl.dart`, `app_router.dart`, `app_colors.dart` |
| Used Cars | `lib/features/bottom/used/used.dart` | `used_impl.dart`, `app_router.dart`, `filter_results.dart` |
| Compare | `lib/features/bottom/compare/compare.dart` | `compare.dart`, `select_car.dart`, `compare_catalogue.dart` |
| News | `lib/features/bottom/news/news.dart` | `news.dart`, `mock_news_repository.dart`, `favorites_store.dart` |
| Alerts | `lib/features/bottom/alerts/alerts.dart` | `alerts.dart`, `notifications_store.dart`, `mock_notifications.dart` |

---

## 🛠️ Common Fixes Reference

### P0 Icon Issues
- Change `static IconData` to `static const IconData` in `app_icons.dart`
- Add missing Lucide icon names: `bookmark`, `bookmarkBorder`, `person`, `share`

### P1 Data Resolution
- Fix `byBrandModel` to resolve real cars (compare_catalogue.dart)
- Remove `ListenableBuilder` over-rebuilds (news.dart)
- Verify mock data matches catalogue

### P2 Cleanup
- Extract shared `SkeletonBlock` widget
- Remove dead `AppRoutes.compareCars` constant
- Align global search with shared catalogue

---

## 📞 Need Help?

If unsure about any change:
1. **Read the relevant `.doc` specification first**
2. **Inspect the existing code** - don't assume it's wrong
3. **Check `flutter analyze`** for errors
4. **Preserve working features** - New Cars, Used Cars, Compare, News, Alerts
5. **Report uncertainties** before making changes you're unsure about

---
*These rules ensure consistent, efficient OpenCode sessions that respect existing code and maintain project quality.*