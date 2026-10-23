# DESIGN_SYSTEM.md - Visual Design System

## 🎨 Brand Identity

**Primary Brand Color: Muted Blue**
- **Hex:** `#647FA3`
- **Usage:** Brand identity, selected navigation icons, active states, important highlights
- **Emotional Tone:** Professional, trustworthy, modern Ethiopian marketplace

**Supporting Colors**

| Color | Hex | Usage |
|-------|-----|-------|
| Dark Muted Blue | `#526D91` | Primary buttons (Search, Sell Your Car), prominent actions |
| Light Blue | `#EAF0F7` | Selected filter chips, subtle highlights, light blue backgrounds |
| Deep Navy | `#34465E` | Headings, important text, strong visual emphasis |
| White | `#FFFFFF` | Main background color, car listing cards |
| Cool Gray | `#F1F4F8` | Secondary sections, input backgrounds, subtle surfaces |
| Secondary Text Gray | `#64748B` | Descriptions, subtitles, less important information |
| Border Gray | `#D9E0E8` | Card borders, dividers, input outlines |

**Preserved Legacy Colors (Ethiopian Market)**
- Brand Accent (Ethiopian Green): `#1B5E20`
- Success Green: `#16A34A` (successful actions)
- Warning/Amber: `#D97706` (warnings)
- Error Red: `#DC2626` (destructive actions)
- Price Accent: `#E65100` (prices)

---

## 📐 Typography

### Type Scale

| Element | Size (px) | Weight | Usage |
|---------|-----------|--------|-------|
| Main section headings | 24-30 | Semibold (w600) | Section titles |
| Subsection headings | 18-22 | Semibold (w600) | Sub-section titles |
| Vehicle names | 15-19 | Regular (w400) | Car model names |
| Prices | 16-19 | Medium (w500) | Price displays |
| Brand names and metadata | 13-16 | Regular (w400) | Brand labels, specs |
| Disclaimers | 14-16 | Regular (w400) | Price disclaimers |
| Buttons and tabs | 15-18 | Medium (w500) | Button labels, tab labels |

### Typography Rules
- Prevent text clipping - allow names and descriptions to wrap naturally
- Use `Theme.of(context).textTheme` consistently across all pages
- Font family: Robothet (or project's specified font)
- Line height: 1.2 for body, 1.4 for headings

---

## 📐 Spacing and Layout

### Spacing Scale

| Token | Value (px) | Usage |
|-------|------------|-------|
| `spacing_xs` | 4 | Minimal gaps |
| `spacing_sm` | 8 | Small gaps between items |
| `spacing_md` | 16 | Standard spacing |
| `spacing_lg` | 24 | Major section spacing |
| `spacing_xl` | 32 | Large spacing between sections |

### Layout Proportions

- **60%** white backgrounds (`#FFFFFF`)
- **25%** light neutral surfaces (`#F1F4F8`)
- **15%** blue accents and brand elements (`#647FA3`, `#526D91`, `#EAF0F7`)

### Card Design

- **Corner radius:** 10-16px (radiusSm: 8, radiusMd: 12, radiusLg: 20)
- **Fill:** White (`#FFFFFF`) or Cool Gray (`#F1F4F8`)
- **Borders:** 1px Border Gray (`#D9E0E8`)
- **Shadows:** Subtle only, avoid heavy/ dark shadows
- **Padding:** Consistent horizontal padding of `spacing_lg` (24px)

### Screen Margins

- Horizontal page margins: 20-30px
- Vertical section spacing: 28-40px

---

## 🧭 Navigation Design

### Bottom Navigation Bar

| Property | Specification |
|----------|--------------|
| **Background** | White (`#FFFFFF`) |
| **Items** | 5 items: New, Used, Compare, News, Alerts |
| **Selected Item** | Muted Blue icon + label (`#647FA3`) |
| **Unselected Item** | Gray icon + label (`#6B7280`) |
| **Height** | 64px (standard bottom nav) |
| **Safe Area** | Proper Android safe-area handling |

### Navigation Icon Style

- **Consistent size** across all items
- **Consistent stroke weight** (if outlined)
- **Consistent style** (all Lucide or all Material, not mixed)
- **Muted Blue** (`#647FA3`) when selected
- **Gray** (`#6B7280`) when unselected

### Page-Specific Navigation

| Page | Selected State |
|------|---------------|
| New Cars | "New" selected |
| Used Cars | "Used" selected |
| Compare | "Compare" selected |
| News | "News" selected |
| Alerts | "Alerts" selected |

---

## 📦 Card Design

### Car Card

| Property | Specification |
|----------|--------------|
| **Background** | White (`#FFFFFF`) |
| **Corner radius** | 10-16px |
| **Border** | 1px Border Gray (`#D9E0E8`) optional |
| **Padding** | Consistent horizontal `spacing_lg` (24px) |
| **Max width** | Adapt to available width |
| **Image** | Retain aspect ratio, no stretching, suitable fallback |
| **Content** | Brand, model, price, key specs |

### Comparison Card (Compare Feature)

| Property | Specification |
|----------|--------------|
| **Background** | White (`#FFFFFF`) or Cool Gray (`#F1F4F8`) |
| **Corner radius** | radiusLg (20px) |
| **Border** | 1px Divider (`#D9E0E8`) |
| **VS Badge** | Muted Blue (`#647FA3`), circular, diameter ~32px |
| **Padding** | `spacing_md` (16px) internal spacing |

### Feature Card (Sell Your Car Banner)

| Property | Specification |
|----------|--------------|
| **Background** | White (`#FFFFFF`) with subtle surface |
| **Corner radius** | radiusLg (20px) |
| **Feature items** | Circular icon (38px) + label |
| **Grid** | 2×2 grid with `spacing_lg` (24px) gaps |
| **Action button** | Full-width outlined button at bottom |

---

## 🎯 Filter Design

### Filter Chips

| State | Background | Text Color | Border |
|-------|------------|------------|--------|
| **Selected** | Light Blue (`#EAF0F7`) | Muted Blue (`#647FA3`) | Light Blue border |
| **Unselected** | Surface (`#FAFAFA` or `#FFFFFF`) | Secondary Text Gray (`#64748B`) | Divider border (`#D9E0E8`) |

### Filter Tabs (Horizontal Tab Bar)

| State | Text Color | Background | Indicator |
|-------|------------|------------|-----------|
| **Selected** | Muted Blue (`#647FA3`) | White (`#FFFFFF`) | Muted Blue underline |
| **Unselected** | Secondary Text Gray (`#64748B`) | Disabled surface | Gray/Dim |

### Filter Options (Per Feature)

- **New Cars:** Budget, Body Type, Fuel Type, Transmission
- **Used Cars:** Budget, Body Type, Fuel Type, Transmission
- **Compare:** No filters on popular list (P1-7 issue)
- **News:** Filter pills: All / Reviews / Special Reports

---

## 🎨 Color Usage by Page

### New Cars Page

- **Primary:** Muted Blue (`#647FA3`) for tabs, accents, highlights
- **Buttons:** Dark Muted Blue (`#526D91`) for primary, Light Blue (`#EAF0F7`) for selected filters
- **Background:** White (`#FFFFFF`)
- **Borders:** Border Gray (`#D9E0E8`)
- **Disclaimers:** Deep Navy (`#34465E`) or Secondary Text Gray (`#64748B`)

### Used Cars Page

- **Primary:** Muted Blue (`#647FA3`) for selected tabs/chips
- **Primary Buttons:** Dark Muted Blue (`#526D91`) - "Sell Your Car", "Search"
- **Background:** White (`#FFFFFF`)
- **Special:** Red notification dot (`#FF0000`) for location/badge
- **Sell Your Car Banner:** Teal outlined button with Secondary Text Gray

### Compare Cars Page

- **Primary:** Muted Blue (`#647FA3`) for VS badge, selected states
- **Buttons:** Muted Blue outlined, Deep Navy (`#34465E`) for headings
- **Background:** White (`#FFFFFF`) for scaffold, Cool Gray (`#F1F4F8`) for cards
- **Dividers:** Border Gray (`#D9E0E8`)
- **Price Text:** Muted Blue (`#647FA3`) or Amber (`#E65100`)

### News Page

- **Primary:** Muted Blue (`#647FA3`) for selected filter pills
- **Category Colors:** Preserved existing (Purple `#5E35B1`, Brown `#6D4C41`, Orange `#F57F17`, etc.)
- **Background:** White (`#FFFFFF`) for scaffold, Cool Gray (`#F1F4F8`) for cards
- **Favourite:** Green (`#16A34A`) for saved state
- **Empty State:** Pale Blue (`#E9F1FB`) illustration background

### Alerts Page

- **Primary:** Muted Blue (`#647FA3`) for unread dot, navigation selection
- **Notification Types:**
  - Car: Muted Blue (`#647FA3`) icon/color
  - Article: Primary (`#1B5E20`) icon/color
  - Saved Search: Search icon color
  - General: Rose (`#8D6E63`) icon/color
- **Background:** White (`#FFFFFF`) for screen, Cool Gray (`#F7FAFF`) for unread rows
- **Clear All:** Primary (`#1B5E20`) text color
- **Empty State:** Pale Blue (`#E9F1FB`) with bell + car illustration

---

## 📱 Responsive Considerations

### Mobile First

- All layouts adapt from 320px mobile to larger screens
- Bottom navigation remains fixed at bottom
- Horizontal scroll for car cards, filter chips, brand grids
- Vertical scroll for main page content
- Pinned header/search remain visible during scroll

### Touch Targets

- Minimum 44px × 44px touch targets for all buttons and icons
- Adequate spacing between tappable elements (minimum `spacing_md` / 16px)
- Focus states for keyboard navigation

### Orientation

- Portrait: Primary layout (all pages)
- Landscape: Enhanced layouts where beneficial (car comparison, brand grids)

---

## 📦 Asset Guidelines

### Icon Style

- **Primary:** Lucide Icons package (consistent across all features)
- **Secondary:** Material Icons where project already uses them (accepted pattern)
- **Navigation icons:** Consistent style, size, stroke weight
- **Action icons:** Play, heart, search, close, filter, etc.

### Image Assets

- **Car images:** Retain aspect ratios, no forced stretching
- **Fallbacks:** Error states with placeholder icons (`image_not_supported_outlined`)
- **No stretched images** to fit card dimensions
- **Optimized sizes** for mobile display

### Color Assets

- All colors from `AppColors` class in `lib/core/constants/app_colors.dart`
- **No hardcoded hex values** in widget code - use constants
- **Gradients** from the brand gradient definitions
- **SVG or vector assets** for logos and icons where possible

---

## 📋 Quick Color Reference Table

| Purpose | Color | Hex | AppColors Constant |
|---------|-------|-----|-------------------|
| Brand Primary | Muted Blue | `#647FA3` | `AppColors.brandPrimary` |
| Brand Darker | Dark Muted Blue | `#526D91` | `AppColors.brandPrimaryDark` |
| Brand Light | Light Blue | `#EAF0F7` | `AppColors.brandPrimaryLight` |
| Brand Deep | Deep Navy | `#34465E` | `AppColors.brandDeepNavy` |
| White | White | `#FFFFFF` | `AppColors.background` |
| Light Neutral | Cool Gray | `#F1F4F8` | `AppColors.surfaceLight` |
| Text Secondary | Secondary Gray | `#64748B` | `AppColors.textSecondary` |
| Borders | Border Gray | `#D9E0E8` | `AppColors.divider` |
| Success | Green | `#16A34A` | `AppColors.success` |
| Warning | Amber | `#D97706` | `AppColors.warning` |
| Error | Red | `#DC2626` | `AppColors.error` |

---

## 🛠️ Implementation Notes

### Flutter Integration

```dart
// Example usage throughout the codebase

// Container colors
Container(color: AppColors.brandPrimary),       // #647FA3
Container(color: AppColors.brandPrimaryDark),   // #526D91
Container(color: AppColors.brandPrimaryLight),  // #EAF0F7
Container(color: AppColors.background),         // #FFFFFF
Container(color: AppColors.surfaceLight),       // #F1F4F8

// Text colors
TextStyle(color: AppColors.textPrimary),       // #1A1A2E
TextStyle(color: AppColors.textSecondary),     // #64748B
TextStyle(color: AppColors.divider),           // #D9E0E8

// Widget decorations
BoxDecoration(
  color: AppColors.surfaceLight,               // #F1F4F8
  border: Border.all(color: AppColors.divider), // #D9E0E8
  borderRadius: BorderRadius.circular(AppDimens.radiusMd),
)

// Eleveted Button
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.brandPrimaryDark, // #526D91
    foregroundColor: Colors.white,
  ),
)

// Outlined Button
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.brandPrimary), // #647FA3
    foregroundColor: AppColors.brandPrimary,
  ),
)
```

### Color Consistency Checklist

- [ ] All `Color()` literals replaced with `AppColors` constants
- [ ] Bottom navigation uses correct selected/unselected colors
- [ ] Filter chips use Light Blue selected, Gray unselected
- [ ] Cards have appropriate borders and radii
- [ ] Disclaimers use appropriate text color
- [ ] No hardcoded hex values in widget code
- [ ] Gradients use brand gradient definitions
- [ ] Bottom navigation "Used" remains selected on Used page

---
*This design system ensures visual consistency across all pages of the Ethiopian Car Sales application while maintaining the professional Muted Blue brand identity.*