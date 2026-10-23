# IMPLEMENTATION_PLAN.md - Task Tracking and Implementation Order

## 📊 Current Project Status

### Completed Features (Fully Implemented)
- ✅ Bottom navigation (5 items: New, Used, Compare, News, Alerts)
- ✅ Shared widget library (VsBadge, TabPageShell, AppCarImage, PageTopBar)
- ✅ Core color system in `app_colors.dart` (muted blue palette + legacy colors)
- ✅ Icon system in `app_icons.dart` (P0 fixes applied)
- ✅ Car model in `filter_results.dart` (`newCars` + `allCars` catalogues)
- ✅ Navigation routes in `app_routes.dart`
- ✅ Bottom navigation bar implementation
- ✅ FeaturedWidgets: VsBadge, SkeletonBlock, etc.

### Incomplete Features (In Progress / Needs Work)
- ⚠️ New Cars main page - partially implemented (some sections from §22 of new.doc)
- ⚠️ Used Cars main page - partially implemented (some sections from §18 of used.doc)
- ⚠️ Compare Cars feature - P0/P1 bugs fixed, but P2 cleanup remaining
- ⚠️ News feature - P0 icon fixes needed, P1 ListenableBuilder over-rebuild
- ⚠️ Alerts feature - P0 icon fixes needed, basic structure present

### Upcoming Features (Planned)
- ⏳ Complete New Cars implementation per §22 (10 stages)
- ⏳ Complete Used Cars implementation per §18 (10 stages)
- ⏳ Complete Compare P2 cleanup (SkeletonBlock extraction, route cleanup)
- ⏳ Complete News P2 fixes (ListenableBuilder, search wiring)
- ⏳ Complete Alerts P2 cleanup (empty state, AppDimens for car images)

---

## 📋 Implementation Priority Order

### Phase 1: Foundation (Weeks 1-2)
| Task | Depends On | Status |
|------|-----------|--------|
| 1. Fix P0 icon constants (`app_icons.dart`) | None | ⬜ Pending |
| 2. Make icons `static const IconData` | P0.1 | ⬜ Pending |
| 3. Fix `select_car.dart` import (compare_catalogue) | P0.2 | ⬜ Pending |
| 4. Run `flutter analyze` - confirm zero errors in Compare | P0-P0.4 | ⬜ Pending |
| 5. **Phase 1 Complete** - Compile clean | All P0 | ⬜ Pending |

### Phase 2: New Cars Feature (Weeks 3-8)
| Task | Depends On | Status |
|------|-----------|--------|
| 6. Stage 1 - Make it compile (new.dart) | Phase 1 | ⬜ Pending |
| 7. Stage 2 - Fix review data (byBrandModel) | Stage 1 | ⬜ Pending |
| 8. Stage 3 - Correct specification table | Stage 2 | ⬜ Pending |
| 9. Stage 4 - Clean up duplication (SkeletonBlock) | Stage 3 | ⬜ Pending |
| 10. Stage 5 - Polish interactions | Stage 4 | ⬜ Pending |
| 11. Stage 6 - Harden states (loading/error/empty) | Stage 5 | ⬜ Pending |
| 12. Stage 7 - Verify on device | Stage 6 | ⬜ Pending |
| 13. **Phase 2 Complete** - New Cars fully implemented | All stages | ⬜ Pending |

### Phase 3: Used Cars Implementation (Weeks 9-12)
| Task | Depends On | Status |
|------|-----------|--------|
| 14. Stage 1 - Make it compile (used.dart) | Phase 1 | ⬜ Pending |
| 15. Stage 2 - Fix favourite rebuild | Stage 1 | ⬜ Pending |
| 16. Stage 3 - Wire search screen | Stage 2 | ⬜ Pending |
| 17. Stage 4 - Harden empty states | Stage 3 | ⬜ Pending |
| 18. Stage 5 - Polish interactions | Stage 4 | ⬜ Pending |
| 19. Stage 6 - Verify on device | Stage 5 | ⬜ Pending |
| 20. **Phase 3 Complete** - Used Cars fully implemented | All stages | ⬜ Pending |

### Phase 4: Compare Feature Completion (Weeks 9-10)
| Task | Depends On | Status |
|------|-----------|--------|
| 21. Stage 6 - Harden states (compare) | Compare P1 fixes | ⬜ Pending |
| 22. Stage 7 - Verify on device (compare) | Stage 21 | ⬜ Pending |
| 23. **Phase 4 Complete** - Compare fully compiled | All P0-P1 fixed | ⬜ Pending |

### Phase 5: News Feature (Weeks 9-12)
| Task | Depends On | Status |
|------|-----------|--------|
| 24. Stage 1 - Make it compile (news.dart) | Phase 1 | ⬜ Pending |
| 25. Stage 2 - Fix favourite rebuild | Stage 1 | ⬜ Pending |
| 26. Stage 3 - Wire search screen | Stage 2 | ⬜ Pending |
| 27. Stage 3 - Harden empty states | Stage 3 | ⬜ Pending |
| 28. Stage 4 - Polish interactions | Stage 4 | ⬜ Pending |
| 29. Stage 5 - Verify on device | Stage 5 | ⬜ Pending |
| 30. **Phase 5 Complete** - News fully implemented | All stages | ⬜ Pending |

### Phase 6: Alerts Feature Completion (Weeks 9-10)
| Task | Depends On | Status |
|------|-----------|--------|
| 31. Stage 2 - Verify favourite/reveal logic | Alerts Stage 1 | ⬜ Pending |
| 32. Stage 3 - Wire notification taps | Stage 2 | ⬜ Pending |
| 33. Stage 4 - Harden empty state | Stage 3 | ⬜ Pending |
| 34. Stage 5 - Polish interactions | Stage 4 | ⬜ Pending |
| 35. Stage 6 - Verify on device | Stage 5 | ⬜ Pending |
| 36. **Phase 6 Complete** - Alerts fully implemented | All stages | ⬜ Pending |

---

## 📅 Suggested Weekly Schedule

### Week 1: P0 Fixes Foundation
- Focus: `app_icons.dart` changes, `const` fields
- Run `flutter analyze` daily
- Document pre-existing errors
- **Goal:** Zero P0 errors in Compare feature

### Week 2: Compile Cleanup
- Focus: All features compile without errors
- Fix P0 issues across all 5 features
- **Goal:** `flutter analyze` reports zero errors in each feature

### Week 3-4: New Cars - Stages 1-4
- Focus: New Cars foundation (header, search, quick filters)
- Complete stages 1-4 per incremental plan
- **Goal:** New Cars header and basic structure functional

### Week 5-6: New Cars - Stages 5-7
- Focus: Featured cars, filters, comparison preview
- Complete stages 5-7 per incremental plan
- **Goal:** New Cars full functionality

### Week 5-6: Used Cars - Stages 1-3
- Focus: Used Cars foundation (header, location, city grid)
- Complete stages 1-3 per incremental plan
- **Goal:** Used Cars basic structure functional

### Week 7-8: Used Cars - Stages 4-6
- Focus: Filters, popular cars, sell banner
- Complete stages 4-6 per incremental plan
- **Goal:** Used Cars full functionality

### Week 7-8: Compare P2 Cleanup
- Focus: SkeletonBlock extraction, route cleanup
- Complete P2 items from section 22
- **Goal:** Compare feature cleaned up

### Week 9-10: News - Stages 1-3
- Focus: Foundation (icon fixes, favourite rebuild, search wiring)
- Complete stages 1-3 per incremental plan
- **Goal:** News basic structure functional

### Week 11-12: Alerts - Stages 1-3
- Focus: Icon fixes, favourite logic, notification taps
- Complete stages 1-3 per incremental plan
- **Goal:** Alerts basic structure functional

---

## 📋 Monthly Milestones

### Month 1 (Weeks 1-4)
- ✅ P0 fixes across all features
- ✅ All features compile cleanly
- ✅ Foundation laid for incremental implementation

### Month 2 (Weeks 5-8)
- ✅ New Cars fully implemented (stages 1-7)
- ✅ Used Cars foundation started (stages 1-3)
- ✅ Compare P2 cleanup completed

### Month 3 (Weeks 9-12)
- ✅ Used Cars fully implemented (stages 1-7)
- ✅ News fully implemented (stages 1-5)
- ✅ Alerts fully implemented (stages 1-5)
- ✅ All features verified on device

### Month 13+: Maintenance
- Bug fixes and minor enhancements
- Performance optimization
- New feature additions as needed

---

## 📋 Task Tracking Template

### For Each Task:

```
## Task: [Task Description] [Section Reference]

**Status:** ⬜ Not Started ⬜ In Progress ✅ Complete

**Dependencies:** [List task IDs this depends on]

**Estimated Effort:** [e.g., 2 days, 1 week]

**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

**Completed:** [Date when completed]

**Notes:** [Any relevant notes, issues encountered, decisions made]
```

---

## 🔍 Quality Gates

### Before Moving to Next Stage:
- [ ] `flutter analyze` passes with zero errors for the feature
- [ ] Relevant `flutter test` tests pass
- [ ] Documentation spec section is fully implemented
- [ ] Bottom navigation still functional (5 items, "Used" selected)
- [ ] No regressions in other features
- [ ] Implementation report documented (files inspected, preserved, modified, bugs fixed)

### Before Moving to Next Feature:
- [ ] All previous features still compile and function
- [ ] Shared widgets still work correctly
- [ ] Color system consistent across all pages
- [ ] Navigation unchanged (5 items, correct selection states)
- [ ] Documentation updated for completed feature

---

## 🛠️ Common Dependency Reference

| Feature | Stage 1 | Stage 2 | Stage 3 | Stage 4 | Stage 5 | Stage 6 | Stage 7 |
|---------|---------|---------|---------|---------|---------|---------|---------|
| **New Cars** | P0 fixes | Favourite rebuild | Search wiring | Empty states | Interactions | States on device | Device verification |
| **Used Cars** | P0 fixes | Favourite rebuild | Search wiring | Empty states | Interactions | States on device | Device verification |
| **Compare** | P0-P1 fixes | Specification table | SkeletonBlock cleanup | Interactions | States on device | Device verification | - |
| **News** | Icon fixes | ListenableBuilder | Search wiring | Empty states | Interactions | Device verification | - |
| **Alerts** | Icon fixes | Favourite/reveal logic | Notification taps | Empty state | Interactions | Device verification | - |

---
*This implementation plan provides a structured, incremental approach to completing all five features while maintaining code quality and avoiding regressions.*