# CAR SALES APPLICATION
# COMPREHENSIVE MASTER DOCUMENTATION

**Version:** 1.0  
**Project Type:** Car Buying & Selling Marketplace  
**Primary Platforms:** Android / Flutter  
**Languages:** English + Amharic  
**Frontend:** Flutter / Dart  
**Backend:** Python / FastAPI  
**Database:** PostgreSQL  
**Object Storage:** S3-compatible storage / MinIO  
**Development:** Git + Docker where appropriate

---

## DOCUMENT PURPOSE

This comprehensive document combines:
1. **Master Project Phase Plan** - The execution roadmap showing what to build and when
2. **Phase Documentation Requirements** - What information must be documented for each phase

The document serves as:
- A complete execution guide from project start to launch
- Documentation requirements for every phase
- A dependency map showing what depends on what
- Completion criteria for each phase

---

## HOW TO USE THIS DOCUMENT

### For Execution:
1. Follow phases in the order shown
2. DO NOT randomly skip between phases
3. Complete all requirements in a phase before moving to the next
4. Document decisions as you go

### For Documentation:
Every phase must answer these universal questions:
1. **What is this phase?**
2. **Why is it needed?**
3. **What features belong to it?**
4. **How should those features work?**
5. **What rules apply?**
6. **What data is required?**
7. **What users are involved?**
8. **What English/Amharic requirements exist?**
9. **What errors or edge cases must be handled?**
10. **What must be tested?**
11. **What dependencies does this phase have?**
12. **What later phases depend on it?**
13. **What decisions were made?**
14. **What does completion mean?**
15. **What known limitations remain?**

### Development Cycle for Every Phase:
```
PLAN → IMPLEMENT → TEST → FIX → VERIFY → DOCUMENT → NEXT TASK
```

---

## MASTER DEPENDENCY MAP

```
PROJECT DEFINITION (Phase 0)
        ↓
REQUIREMENTS (Phase 1)
        ↓
UI/UX PLANNING (Phase 2)
        ↓
═══════════════════════════════════════════════════════════════
                    FLUTTER DEVELOPMENT BLOCK
═══════════════════════════════════════════════════════════════
        ↓
FLUTTER PROJECT FOUNDATION (Phase 3)
        ↓
FLUTTER ARCHITECTURE (Phase 4)
        ↓
FLUTTER FOLDERS AND FILES (Phase 5)
        ↓
FLUTTER DESIGN SYSTEM (Phase 6)
        ↓
FLUTTER NAVIGATION (Phase 7)
        ↓
SHARED FLUTTER COMPONENTS (Phase 8)
        ↓
HOME (Phase 9)
        ↓
NEW CARS (Phase 10)
        ↓
USED CARS (Phase 11)
        ↓
SEARCH AND FILTERS (Phase 12)
        ↓
COMPARE (Phase 13)
        ↓
FAVORITES (Phase 14)
        ↓
SELL CAR (Phase 15)
        ↓
MESSAGES (Phase 16)
        ↓
NEWS (Phase 17)
        ↓
ALERTS (Phase 18)
        ↓
NOTIFICATIONS (Phase 19)
        ↓
AUTHENTICATION (Phase 20)
        ↓
PROFILE (Phase 21)
        ↓
SETTINGS (Phase 22)
        ↓
CAR LOAN (Phase 23)
        ↓
EMI CALCULATOR (Phase 24)
        ↓
LOCAL STORAGE (Phase 25)
        ↓
COMPLETE FLUTTER STATES (Phase 26)
        ↓
FLUTTER TESTING (Phase 27)
        ↓
FLUTTER STABILIZATION (Phase 28)
        ↓
═══════════════════════════════════════════════════════════════
                    BACKEND DEVELOPMENT BLOCK
═══════════════════════════════════════════════════════════════
        ↓
BACKEND ARCHITECTURE (Phase 29)
        ↓
POSTGRESQL DATABASE DESIGN (Phase 30)
        ↓
DATABASE IMPLEMENTATION (Phase 31)
        ↓
FASTAPI FOUNDATION (Phase 32)
        ↓
AUTHENTICATION API (Phase 33)
        ↓
CAR CATALOG API (Phase 34)
        ↓
USED CAR MARKETPLACE API (Phase 35)
        ↓
SEARCH API (Phase 36)
        ↓
FAVORITES AND COMPARE API (Phase 37)
        ↓
SELL CAR API (Phase 38)
        ↓
MESSAGING API (Phase 39)
        ↓
NEWS API (Phase 40)
        ↓
ALERTS API (Phase 41)
        ↓
NOTIFICATIONS API (Phase 42)
        ↓
ADMIN API (Phase 43)
        ↓
IMAGE AND FILE STORAGE (Phase 44)
        ↓
BACKGROUND PROCESSING (Phase 45)
        ↓
═══════════════════════════════════════════════════════════════
                    INTEGRATION BLOCK
═══════════════════════════════════════════════════════════════
        ↓
FLUTTER ↔ FASTAPI FOUNDATION (Phase 46)
        ↓
AUTHENTICATION INTEGRATION (Phase 47)
        ↓
NEW CARS INTEGRATION (Phase 48)
        ↓
USED CARS INTEGRATION (Phase 49)
        ↓
SEARCH / COMPARE / FAVORITES INTEGRATION (Phase 50)
        ↓
SELL CAR / MESSAGES INTEGRATION (Phase 51)
        ↓
NEWS / ALERTS / NOTIFICATIONS INTEGRATION (Phase 52)
        ↓
PROFILE / SETTINGS INTEGRATION (Phase 53)
        ↓
END-TO-END TESTING (Phase 54)
        ↓
═══════════════════════════════════════════════════════════════
                    PRODUCTION BLOCK
═══════════════════════════════════════════════════════════════
        ↓
SECURITY (Phase 55)
        ↓
PERFORMANCE (Phase 56)
        ↓
OBSERVABILITY (Phase 57)
        ↓
PRODUCTION INFRASTRUCTURE (Phase 58)
        ↓
BACKUP AND DISASTER RECOVERY (Phase 59)
        ↓
BETA TESTING (Phase 60)
        ↓
RELEASE PREPARATION (Phase 61)
        ↓
PLAY STORE RELEASE (Phase 62)
        ↓
POST-LAUNCH (Phase 63)
        ↓
VERSION 2 / FUTURE DEVELOPMENT (Phase 64)
```

---

# PHASE 0 — PROJECT DEFINITION

## Purpose
Define exactly what the Car Sales application is before development starts.

## What This Phase Is About
This is the foundational phase where the entire project scope is defined and documented. No code is written. This phase establishes what we're building and why.

## Why It Is Needed
Without clear project definition, development becomes directionless. This ensures all stakeholders agree on what the application will do, who it serves, and what is in/out of scope.

## Features and Behavior

### 0.1 Define the Product
The application is a car marketplace that allows users to:
- Discover new cars
- Discover used cars
- Search and filter cars
- Compare cars
- Save favorite cars
- Sell cars
- Contact sellers
- Read automotive news and reviews
- Create car alerts
- Receive notifications
- Calculate EMI
- Access car-loan information
- Manage their profile

### 0.2 Define Target Users

**Primary user roles:**
- Guest
- Buyer
- Seller
- Dealer
- Administrator

### 0.3 Define Main Navigation

**Bottom navigation:**
- New
- Used
- Compare
- News
- Alerts

### 0.4 Define Application Drawer

The drawer should provide access to:
- Home
- New Cars
- Used Cars
- Sell Cars
- Car Loan
- EMI Calculator
- Favourites
- Others
- Rate Us
- Settings

### 0.5 Define Notification System

**IMPORTANT:** The notification bell is separate from the Alerts feature.

**Notifications (System-Generated):**
- Messages from the system
- Listing approval/rejection
- New matching cars
- Price changes
- Other system events

**Alerts (User-Created):**
- Conditions created by the user
- Example: notify me when an SUV below a certain price appears

### 0.6 Define Supported Languages

The application must support:
- English
- Amharic

**Language support is a core requirement, not a future feature.**

### 0.7 Freeze the Initial Product Scope
Do not continuously add unrelated features during MVP development.

## Rules and Decisions
- No code is written in this phase
- Scope must be documented and approved before proceeding
- Amharic support is mandatory from the start, not an afterthought
- Alerts and Notifications are separate features with different purposes

## Users Involved
- Project stakeholders
- Product owners
- Development team

## English/Amharic Requirements
- Document all features in both languages where applicable
- Define how language switching will work
- Establish that all user-facing text must support both languages

## Errors and Edge Cases
- N/A for this phase

## Testing
- N/A for this phase

## Dependencies
- None

## Later Phases Depending on This
- All phases depend on this definition

## Completion Condition
Product scope is documented and approved.

## Known Limitations
- Product scope may evolve, but MVP scope must remain frozen for this phase

---

# PHASE 1 — REQUIREMENTS

## Purpose
Document exactly what the system must do.

## What This Phase Is About
Creating the comprehensive requirements document (`requirements.md`) that defines every functional and non-functional requirement of the system.

## Why It Is Needed
Requirements provide the specification that all development follows. Without clear requirements, teams build the wrong things or miss critical functionality.

## Features and Behavior

### 1.1 Functional Requirements
Document behavior for:
- Authentication
- New Cars
- Used Cars
- Search
- Filters
- Compare
- Favorites
- Sell Car
- Messages
- News
- Alerts
- Notifications
- Profile
- Settings
- Car Loan
- EMI Calculator
- Admin

### 1.2 Non-Functional Requirements
Define:
- Security
- Performance
- Reliability
- Scalability
- Accessibility
- Maintainability
- Usability
- Availability

### 1.3 User Stories
Example: "As a buyer, I want to search for a used SUV within my budget so that I can find a suitable car."

### 1.4 Acceptance Criteria
Define what "finished" means for every feature.

### 1.5 Business Rules
Define:
- Who can sell?
- Who can edit a listing?
- Who can delete a listing?
- Who can publish news?
- Who can approve listings?
- Who can send messages?
- Who can create alerts?
- What can guests access?

### 1.6 Language Requirements
All user-facing text must support:
- English
- Amharic

This includes:
- Menus, Navigation, Buttons
- Forms, Validation messages, Errors
- Notifications, Alerts
- News categories, Settings
- Authentication messages

User-generated content must support Unicode and Amharic text correctly.

## Rules and Decisions
- Requirements must be complete before any UI work
- Acceptance criteria must be measurable and testable
- Both languages must be considered in every requirement
- User stories must follow the "As a [role], I want [action] so that [benefit]" format

## Data Required
- List of features
- User roles and permissions
- Business rules
- Acceptance criteria for each feature

## Users Involved
- All user roles documented in Phase 0

## English/Amharic Requirements
- All requirements must specify English and Amharic behavior
- UI text requirements must include both languages
- Search behavior must support both languages

## Errors and Edge Cases
- Validation requirements define error handling
- Network failure scenarios
- Permission errors

## Testing
- Acceptance criteria define test conditions
- Each requirement should be testable

## Dependencies
- Phase 0 (Project Definition)

## Later Phases Depending on This
- All subsequent phases depend on requirements

## Completion Condition
`requirements.md` is complete and approved.

## Known Limitations
- Requirements may be refined during development, but major changes should be documented

---

# PHASE 2 — UI/UX PLANNING

## Purpose
Determine what the user will see and how the user will move through the application.

## What This Phase Is About
Designing the complete user experience before implementation. This includes screens, navigation flows, wireframes, and design systems.

## Why It Is Needed
UX planning prevents costly redesigns during development. It ensures the application is intuitive and meets user needs.

## Features and Behavior

### 2.1 Create Screen Inventory
Document every screen and its purpose.

### 2.2 Define Navigation Flows
Example: Home → Search → Car Results → Car Details → Favorite/Compare/Contact

### 2.3 Design Bottom Navigation
- New
- Used
- Compare
- News
- Alerts

### 2.4 Design Drawer
- Home
- New Cars
- Used Cars
- Sell Cars
- Car Loan
- EMI
- Favorites
- Others
- Rate Us
- Settings

### 2.5 Create Wireframes
Design every major screen before implementation.

### 2.6 Define Screen States
Every important network-driven screen must support:
- Initial
- Loading
- Success
- Empty
- Error
- Retry

### 2.7 Define English and Amharic Behavior
Design screens for both languages. Verify:
- Text does not overflow
- Buttons remain usable
- Labels fit correctly
- Fonts support Ethiopic characters
- Text direction is handled correctly where necessary

### 2.8 Define Design System
Decide:
- Colors
- Fonts
- Typography
- Spacing
- Icons
- Card style
- Button style
- Input style
- Image style
- Border radius
- Shadows
- Dark mode

## Rules and Decisions
- All screens must be designed before coding begins
- English and Amharic versions must be designed simultaneously
- Screen states must be planned for every data-driven screen
- Design must accommodate both languages without overflow

## Data Required
- Screen flow diagrams
- Wireframes
- Design specifications

## Users Involved
- All user roles

## English/Amharic Requirements
- Wireframes must show both language versions
- Amharic text rendering must be verified in design phase
- Font selection must support Ethiopic characters

## Errors and Edge Cases
- Empty states for no data
- Error states for failures
- Loading states for data fetching

## Testing
- Usability testing of wireframes
- Language testing for both English and Amharic

## Dependencies
- Phase 1 (Requirements)

## Later Phases Depending on This
- All Flutter development phases

## Completion Condition
Every important screen and user flow has been designed.

## Known Limitations
- Minor UI adjustments may occur during implementation

---

# PHASE 3 — FLUTTER PROJECT FOUNDATION

## Purpose
Prepare the existing Flutter project for development.

## What This Phase Is About
Inspecting, cleaning, and preparing the existing Flutter project. The project already exists, so this phase focuses on understanding and organizing the codebase.

## Why It Is Needed
Starting with a clean, understood project prevents technical debt and ensures a solid foundation.

## Features and Behavior

### 3.1 Inspect Current Project
Check:
- Flutter version
- Dart version
- pubspec.yaml
- Android configuration
- Existing lib/
- Existing assets/
- Existing tests

### 3.2 Review Existing Code
Identify:
- Reusable code
- Obsolete code
- Duplicated code
- Hard-coded UI
- Very large files

### 3.3 Clean Obsolete Code
Remove only code that is no longer needed.

### 3.4 Verify Project Runs
Run the application before major restructuring.

## Rules and Decisions
- Do not create an unnecessary second Flutter project
- Keep reusable code, remove only what's obsolete
- Understand existing code before making changes

## Data Required
- Project inspection report
- Code cleanup plan

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Project compilation errors
- Dependency conflicts
- Platform configuration issues

## Testing
- Verify project runs successfully
- Verify no compilation errors after cleanup

## Dependencies
- Phase 2 (UI/UX Planning)

## Later Phases Depending on This
- All Flutter development phases

## Completion Condition
Existing Flutter project is clean, understood, and runnable.

## Known Limitations
- Some obsolete code may remain if it's potentially useful

---

# PHASE 4 — FLUTTER ARCHITECTURE

## Purpose
Define how Flutter code will be organized.

## What This Phase Is About
Establishing the architectural pattern and layer separation for the Flutter application.

## Why It Is Needed
Architecture defines how code is organized, ensuring maintainability, testability, and scalability.

## Features and Behavior

### 4.1 Presentation Layer
Responsible for:
- Screens
- Widgets
- State
- User interaction

### 4.2 Domain Layer
Responsible for:
- Entities
- Business rules
- Use cases
- Repository contracts

### 4.3 Data Layer
Responsible for:
- Data sources
- Models
- Repository implementations
- API/local data access

### 4.4 Define Dependency Direction
**Preferred direction:**
```
Presentation → Domain → Data
```

**Important:** Do not allow UI code to directly access PostgreSQL. The mobile application communicates with the backend API.

## Rules and Decisions
- Feature-based architecture + layered separation
- Each major feature uses: data, domain, presentation
- Presentation depends on Domain
- Domain depends on Data
- Data depends on repositories
- No direct database access from UI
- API communication must go through the Data layer

## Data Required
- Architectural design document

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- N/A for this phase

## Testing
- Architecture must be testable by design

## Dependencies
- Phase 3 (Flutter Project Foundation)

## Later Phases Depending on This
- All Flutter development phases

## Completion Condition
Flutter architecture is documented and agreed upon.

## Known Limitations
- Architecture may evolve as complexity increases

---

# PHASE 5 — FLUTTER FOLDERS AND FILES

## Purpose
Create the physical project structure.

## What This Phase Is About
Organizing the codebase into folders and files according to the architecture.

## Why It Is Needed
Consistent folder structure makes code navigable and maintainable.

## Features and Behavior

### Main Structure
```
lib/
├── app/
├── core/
├── navigation/
├── features/
└── shared/
```

### Features
- home/
- new_cars/
- used_cars/
- compare/
- news/
- alerts/
- notifications/
- search/
- favorites/
- sell_car/
- car_loan/
- emi_calculator/
- authentication/
- messages/
- profile/
- settings/
- rate_us/
- others/

### Feature Structure
Each major feature should contain:
```
feature_name/
├── data/
├── domain/
└── presentation/
```

## Rules and Decisions
- Do not put the entire application in main.dart
- Features must be independent and self-contained
- Shared code goes in shared/ folder
- Core code (utilities, constants) goes in core/ folder

## Data Required
- Folder structure document

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- N/A for this phase

## Testing
- N/A for this phase

## Dependencies
- Phase 4 (Flutter Architecture)

## Later Phases Depending on This
- All Flutter development phases

## Completion Condition
Flutter project has the final structure.

## Known Limitations
- Minor adjustments may occur as features are implemented

---

# PHASE 6 — FLUTTER DESIGN SYSTEM

## Purpose
Create the visual foundation used throughout the app.

## What This Phase Is About
Establishing consistent colors, typography, spacing, and component styles.

## Why It Is Needed
Design system ensures visual consistency across all screens and features.

## Features and Behavior

### 6.1 Theme
Create the main theme.

### 6.2 Colors
Define centralized colors.

### 6.3 Typography
Define centralized text styles.

### 6.4 Dimensions
Define common:
- Padding
- Margin
- Radius
- Icon sizes
- Component heights

### 6.5 Icons
Centralize application-specific icon choices.

### 6.6 Dark Mode
Prepare light and dark themes.

### 6.7 Localization-Ready Typography
Verify English and Amharic rendering.

## Rules and Decisions
- All colors must be defined centrally
- All text styles must be defined centrally
- Both light and dark themes must be supported
- Amharic font must be properly configured

## Data Required
- Design system document
- Color palette
- Typography specifications

## Users Involved
- UI/UX designers
- Development team

## English/Amharic Requirements
- Fonts must support English and Amharic
- Text styles must work for both languages
- Amharic text must render correctly

## Errors and Edge Cases
- Text overflow in Amharic
- Font rendering issues

## Testing
- Test both themes
- Test both languages
- Test on different screen sizes

## Dependencies
- Phase 2 (UI/UX Planning)
- Phase 5 (Flutter Folders and Files)

## Later Phases Depending on This
- All Flutter UI development phases

## Completion Condition
All screens can use a consistent visual design system.

## Known Limitations
- Some components may need custom styling

---

# PHASE 7 — FLUTTER NAVIGATION

## Purpose
Make the application navigable before building detailed features.

## What This Phase Is About
Implementing routing, bottom navigation, and drawer navigation.

## Why It Is Needed
Navigation provides the skeleton for the application, allowing access to all features.

## Features and Behavior

### 7.1 Routing
Implement route definitions.

### 7.2 Route Names
Centralize route names.

### 7.3 Protected Routes
Prepare routes that require authentication.

### 7.4 Bottom Navigation
Implement:
- New
- Used
- Compare
- News
- Alerts

### 7.5 Drawer Navigation
Implement:
- Home
- New Cars
- Used Cars
- Sell Cars
- Car Loan
- EMI Calculator
- Favourites
- Others
- Rate Us
- Settings
- company phone number
- connect with us facebook,tiktok etc

### 7.6 Notification Navigation
The top notification bell should navigate to Notifications. It must remain separate from Alerts.

## Rules and Decisions
- All routes must be defined centrally
- Protected routes must check authentication
- Bottom navigation and drawer must be synchronized
- Notifications navigation is separate from Alerts

## Data Required
- Route definitions
- Navigation flow diagrams

## Users Involved
- All user roles

## English/Amharic Requirements
- Navigation labels must support both languages
- Bottom nav labels in both languages
- Drawer labels in both languages

## Errors and Edge Cases
- Broken routes
- Route not found
- Authentication required for protected routes

## Testing
- Test all navigation routes
- Test protected route behavior
- Test bottom nav switching
- Test drawer navigation

## Dependencies
- Phase 6 (Flutter Design System)
- Phase 5 (Flutter Folders and Files)

## Later Phases Depending on This
- All feature implementation phases

## Completion Condition
Users can navigate through the application without broken routes.

## Known Limitations
- Some routes may have empty content initially

---

# PHASE 8 — SHARED FLUTTER COMPONENTS

## Purpose
Prevent unnecessary duplication.

## What This Phase Is About
Creating reusable UI components used across multiple features.

## Why It Is Needed
Shared components ensure consistency and reduce code duplication.

## Features and Behavior

### Components to Create
- App button
- Text field
- Search bar
- Car card
- Car image
- Favorite button
- Filter chip
- Location selector
- Loading state
- Error state
- Empty state
- Notification bell
- Pagination
- Shimmer loading

## Rules and Decisions
- All components must be documented
- Components must support both languages
- Components must support dark mode
- Components must handle different states

## Data Required
- Component documentation
- Component specifications

## Users Involved
- All user roles

## English/Amharic Requirements
- Components must display text in both languages
- Text direction considerations for Amharic

## Errors and Edge Cases
- Empty states
- Loading states
- Error states
- Long text in Amharic

## Testing
- Test all component states
- Test both languages
- Test dark mode

## Dependencies
- Phase 6 (Flutter Design System)
- Phase 7 (Flutter Navigation)

## Later Phases Depending on This
- All feature implementation phases

## Completion Condition
Common UI can be reused across features.

## Known Limitations
- Some components may need customization for specific features

---

# PHASE 9 — HOME

## Purpose
Build the main application showroom.

## What This Phase Is About
Implementing the home screen with all its sections and features.

## Why It Is Needed
Home is the primary entry point for users and sets the tone for the application.

## Features and Behavior

### 9.1 Home Header
Include appropriate:
- Menu
- App identity
- Location
- Favorites
- Notification bell where required

### 9.2 Search
Create the primary car search entry.

### 9.3 Quick Filters
Include:
- Budget
- Body Type
- Fuel Type
- Transmission

### 9.4 Hero/Banner
Display important promotional or informational content.

### 9.5 Recently Viewed
Show cars previously opened by the user.

### 9.6 Continue Your Journey
Show relevant previous actions.

### 9.7 Popular Cars
Display popular vehicles.

### 9.8 Popular Brands
Display major brands.

## Rules and Decisions
- Use shared components where possible
- Implement all states (loading, success, empty, error)
- Support both languages
- Support dark mode

## Data Required
- Home screen design
- Content specifications

## Users Involved
- All user roles

## English/Amharic Requirements
- All labels in both languages
- Search supports both languages
- Content may vary by language

## Errors and Edge Cases
- Empty states for sections with no data
- Network errors
- Loading states

## Testing
- Test all sections
- Test both languages
- Test dark mode
- Test network conditions

## Dependencies
- Phase 8 (Shared Components)
- Phase 7 (Navigation)

## Later Phases Depending on This
- Search feature (Phase 12)

## Completion Condition
Home is fully designed and functional with local/mock data.

## Known Limitations
- Data is mock until API integration

---

# PHASE 10 — NEW CARS

## Purpose
Build the new-car discovery system.

## What This Phase Is About
Implementing browsing, searching, and viewing new cars.

## Why It Is Needed
New cars are a primary feature of the marketplace.

## Features and Behavior

### 10.1 New Cars Home
Main entry point for new car browsing.

### 10.2 Search
Search within new cars.

### 10.3 Filters
- Budget
- Body type
- Fuel type
- Transmission

### 10.4 Brands
Browse brands.

### 10.5 Models
Browse models belonging to brands.

### 10.6 Variants
Browse variants.

### 10.7 Car Details
Display:
- Images
- Price
- Specifications
- Features
- Variants
- Other relevant information

### 10.8 Favorite
Allow saving.

### 10.9 Compare
Allow adding to comparison.

## Rules and Decisions
- All states must be handled
- Use shared components
- Support both languages
- Support dark mode

## Data Required
- Car catalog data (brands, models, variants, specifications)
- Car images

## Users Involved
- Buyers (primary)
- Guests
- Sellers (viewing only)

## English/Amharic Requirements
- Car names in both languages
- Specifications in both languages
- UI labels in both languages

## Errors and Edge Cases
- No search results
- Network errors
- Loading states
- Missing data

## Testing
- Test browsing
- Test search
- Test filters
- Test details
- Test favorite
- Test compare

## Dependencies
- Phase 8 (Shared Components)
- Phase 9 (Home)

## Later Phases Depending on This
- Search integration (Phase 50)
- Compare (Phase 13)

## Completion Condition
Complete New Cars flow works using local/mock data.

## Known Limitations
- Data is mock until API integration

---

# PHASE 11 — USED CARS

## Purpose
Build the used-car marketplace.

## What This Phase Is About
Implementing browsing, searching, and viewing used cars.

## Why It Is Needed
Used cars are a primary feature of the marketplace.

## Features and Behavior

### 11.1 Used Cars Screen
Main entry point for used car browsing.

### 11.2 Listing Cards
Show:
- Image
- Car name
- Year
- Mileage
- Price
- Location

### 11.3 Filters
Support:
- Brand
- Model
- Price
- Year
- Mileage
- Fuel
- Transmission
- Body type
- Location

### 11.4 Used Car Details
Show complete listing.

### 11.5 Seller Information
Show seller details according to product rules.

### 11.6 Contact Seller
Prepare contact/chat flow.

## Rules and Decisions
- All states must be handled
- Use shared components
- Support both languages
- Support dark mode
- Seller contact requires authentication

## Data Required
- Listing data
- Seller data
- Location data
- Images

## Users Involved
- Buyers (primary)
- Guests
- Sellers

## English/Amharic Requirements
- Listing details in both languages
- Seller info in both languages
- UI labels in both languages

## Errors and Edge Cases
- No listings
- Network errors
- Loading states
- Missing seller info

## Testing
- Test browsing
- Test filters
- Test details
- Test contact
- Test favorite

## Dependencies
- Phase 8 (Shared Components)
- Phase 9 (Home)

## Later Phases Depending on This
- Search integration (Phase 50)
- Messages (Phase 16)

## Completion Condition
Complete used-car browsing and detail flow works locally.

## Known Limitations
- Data is mock until API integration

---

# PHASE 12 — SEARCH AND FILTERS

## Purpose
Provide a centralized search experience.

## What This Phase Is About
Implementing comprehensive search and filtering across the marketplace.

## Why It Is Needed
Search is how users find cars they want to buy.

## Features and Behavior

### 12.1 Keyword Search
Search by keywords.

### 12.2 Brand Filtering
Filter by brand.

### 12.3 Model Filtering
Filter by model.

### 12.4 Variant Filtering
Filter by variant.

### 12.5 Price Filtering
Filter by price range.

### 12.6 Year Filtering
Filter by year range.

### 12.7 Fuel Filtering
Filter by fuel type.

### 12.8 Transmission Filtering
Filter by transmission type.

### 12.9 Body Type Filtering
Filter by body type.

### 12.10 Location Filtering
Filter by location.

### 12.11 Sorting
Examples:
- Price low to high
- Price high to low
- Newest
- Relevance

### 12.12 Recent Searches
Save recent search terms.

### 12.13 English and Amharic Search Readiness
Search design must allow both languages.

## Rules and Decisions
- All filters must work together
- Pagination for results
- Recent searches stored locally
- Support both languages in search

## Data Required
- Searchable car data
- Filter options

## Users Involved
- All users

## English/Amharic Requirements
- Search terms in both languages
- Filter labels in both languages
- Results in both languages

## Errors and Edge Cases
- No results
- Network errors
- Loading states
- Invalid filters

## Testing
- Test all filter combinations
- Test search terms
- Test pagination
- Test sorting

## Dependencies
- Phase 10 (New Cars)
- Phase 11 (Used Cars)

## Later Phases Depending on This
- Search integration (Phase 50)

## Completion Condition
Search and filter experience works with local/mock data.

## Known Limitations
- Search is local/mock until API integration

---

# PHASE 13 — COMPARE

## Purpose
Allow users to compare vehicles.

## What This Phase Is About
Implementing side-by-side car comparison.

## Why It Is Needed
Comparison helps users make informed purchasing decisions.

## Features and Behavior

### 13.1 Select Car
Allow selecting cars to compare.

### 13.2 Add Car
Add cars to comparison list.

### 13.3 Remove Car
Remove cars from comparison list.

### 13.4 Show Selected Cars
Display selected cars.

### 13.5 Compare Action
Perform comparison.

### 13.6 Comparison Result
Compare:
- Price
- Engine
- Fuel
- Transmission
- Mileage
- Dimensions
- Performance
- Safety
- Features

### 13.7 Popular Comparisons
Provide predefined popular comparisons if required.

## Rules and Decisions
- Maximum number of cars to compare (document this decision)
- Must handle empty comparison state
- Use shared components

## Data Required
- Car specifications
- Comparison data

## Users Involved
- Buyers
- Guests

## English/Amharic Requirements
- Comparison labels in both languages
- Car attributes in both languages

## Errors and Edge Cases
- Empty comparison
- Too many cars
- Network errors

## Testing
- Test adding cars
- Test removing cars
- Test comparison display
- Test empty state

## Dependencies
- Phase 10 (New Cars)
- Phase 11 (Used Cars)

## Later Phases Depending on This
- Compare integration (Phase 50)

## Completion Condition
Car comparison works using local/mock data.

## Known Limitations
- Data is mock until API integration

---

# PHASE 14 — FAVORITES

## Purpose
Allow users to save important content.

## What This Phase Is About
Implementing the favorites system for cars and news.

## Why It Is Needed
Favorites allow users to save items for later consideration.

## Features and Behavior

### What Can Be Favorited
- New cars
- Used cars
- News articles

### Operations
- Add
- Remove
- View favorites
- Favorite state

## Rules and Decisions
- Favorites persist across sessions (local storage)
- Favorite state visible on cards and details
- Authentication may be required for favorites
- Support both languages

## Data Required
- Favorite items
- User identification

## Users Involved
- Buyers
- Sellers
- Guests (may not persist)

## English/Amharic Requirements
- UI labels in both languages
- Favorite item details in both languages

## Errors and Edge Cases
- Empty favorites
- Network errors for sync
- Duplicate favorites

## Testing
- Test add
- Test remove
- Test viewing favorites
- Test persistence

## Dependencies
- Phase 10 (New Cars)
- Phase 11 (Used Cars)
- Phase 17 (News)

## Later Phases Depending on This
- Favorites integration (Phase 50)

## Completion Condition
Favorites work locally.

## Known Limitations
- Favorites are local/mock until API integration

---

# PHASE 15 — SELL CAR

## Purpose
Build the seller workflow.

## What This Phase Is About
Implementing the complete process for sellers to list a car.

## Why It Is Needed
Selling cars is a core marketplace function.

## Features and Behavior

### Workflow Flow
```
Sell Car
→ Vehicle Information
→ Brand
→ Model
→ Variant
→ Year
→ Mileage
→ Condition
→ Price
→ Location
→ Photos
→ Description
→ Preview
→ Submit
```

### 15.1 Form Validation
Validate all important fields.

### 15.2 Photo Selection
Allow multiple photos.

### 15.3 Preview
Show exactly what will be submitted.

### 15.4 Draft Listing
Allow temporary local drafts where appropriate.

## Rules and Decisions
- All required fields must be validated
- Photos must have requirements (size, count)
- Drafts are local until submission
- Support both languages

## Data Required
- Form fields
- Validation rules
- Photo requirements

## Users Involved
- Sellers (authenticated)

## English/Amharic Requirements
- Form labels in both languages
- Validation messages in both languages
- Description supports Amharic text

## Errors and Edge Cases
- Invalid fields
- Missing required fields
- Photo upload errors
- Submission errors

## Testing
- Test form validation
- Test photo selection
- Test preview
- Test submission
- Test draft behavior

## Dependencies
- Phase 8 (Shared Components)
- Phase 20 (Authentication)

## Later Phases Depending on This
- Sell car integration (Phase 51)

## Completion Condition
Seller can complete the full local listing flow.

## Known Limitations
- Submission is local/mock until API integration

---

# PHASE 16 — MESSAGES

## Purpose
Prepare buyer/seller communication.

## What This Phase Is About
Implementing the messaging system UI.

## Why It Is Needed
Messages enable communication between buyers and sellers.

## Features and Behavior

### Implement
- Chat list
- Conversation
- Message list
- Message input
- Unread state
- Message history

## Rules and Decisions
- Messages require authentication
- Support both languages
- Show unread indicators

## Data Required
- Message data
- Conversation data
- User data

## Users Involved
- Buyers
- Sellers

## English/Amharic Requirements
- Messages support both languages
- UI labels in both languages

## Errors and Edge Cases
- Empty conversations
- Network errors
- Sending errors

## Testing
- Test chat list
- Test conversation view
- Test sending messages
- Test unread state

## Dependencies
- Phase 20 (Authentication)
- Phase 11 (Used Cars)

## Later Phases Depending on This
- Messages integration (Phase 51)

## Completion Condition
Messaging UI works with local/mock data.

## Known Limitations
- Messages are local/mock until API integration

---

# PHASE 17 — NEWS

## Purpose
Build the automotive content system.

## What This Phase Is About
Implementing the news and reviews section.

## Why It Is Needed
News content provides value and keeps users engaged.

## Features and Behavior

### Main Sections
- News & Reviews
- Images & Videos

### Categories
- All
- Reviews
- Special Reports

### Features
- News list
- News card
- News details
- Author
- Publication date
- Views
- Favorite article
- Search news
- Images
- Videos

## Rules and Decisions
- Support both languages
- Support dark mode
- Use shared components

## Data Required
- Articles
- Authors
- Images
- Videos

## Users Involved
- All users

## English/Amharic Requirements
- Articles in both languages
- Categories in both languages
- Author info in both languages

## Errors and Edge Cases
- Empty news
- Network errors
- Loading states

## Testing
- Test news list
- Test categories
- Test article details
- Test favorite
- Test search

## Dependencies
- Phase 8 (Shared Components)

## Later Phases Depending on This
- News integration (Phase 52)

## Completion Condition
News browsing works with local/mock data.

## Known Limitations
- News is local/mock until API integration

---

# PHASE 18 — ALERTS

## Purpose
Allow users to define conditions they want the system to monitor.

## What This Phase Is About
Implementing the user-created alert system.

## Why It Is Needed
Alerts notify users when cars matching their criteria appear.

## Features and Behavior

### Alert Example
```
Brand = Toyota
Vehicle type = SUV
Price = below selected amount
Location = selected location
```

### Operations
- Create alert
- View alerts
- Edit alert
- Delete alert
- Enable alert
- Disable alert

## Rules and Decisions
- Alerts require authentication
- Alerts are separate from Notifications
- Support both languages
- Conditions must be saved locally

## Data Required
- Alert criteria
- User identification

## Users Involved
- Buyers (authenticated)

## English/Amharic Requirements
- Alert labels in both languages
- Alert conditions in both languages

## Errors and Edge Cases
- Empty alerts
- Invalid conditions
- Network errors

## Testing
- Test create alert
- Test edit alert
- Test delete alert
- Test enable/disable
- Test empty state

## Dependencies
- Phase 20 (Authentication)

## Later Phases Depending on This
- Alerts integration (Phase 52)

## Completion Condition
Users can manage alerts locally.

## Known Limitations
- Alerts are local/mock until API integration

---

# PHASE 19 — NOTIFICATIONS

## Purpose
Provide the notification center.

## What This Phase Is About
Implementing the system-generated notification center.

## Why It Is Needed
Notifications inform users about important events.

## Features and Behavior

### Notification Types
- New matching car
- Price change
- New message
- Listing approved
- Listing rejected
- System message

### Features
- Notification bell
- Unread badge
- Notification list
- Read/unread state
- Notification details
- Empty state

## Rules and Decisions
- Notifications are separate from Alerts
- Must show unread count
- Support both languages
- Click to navigate to relevant content

## Data Required
- Notification data
- User identification

## Users Involved
- All authenticated users

## English/Amharic Requirements
- Notification messages in both languages
- Notification types in both languages

## Errors and Edge Cases
- Empty notifications
- Network errors
- Loading states

## Testing
- Test notification bell
- Test unread badge
- Test notification list
- Test read/unread
- Test navigation

## Dependencies
- Phase 7 (Navigation)
- Phase 20 (Authentication)

## Later Phases Depending on This
- Notifications integration (Phase 52)

## Completion Condition
Notification UI works with local/mock data.

## Known Limitations
- Notifications are local/mock until API integration

---

# PHASE 20 — AUTHENTICATION

## Purpose
Build the user identity system.

## What This Phase Is About
Implementing registration, login, and authentication management.

## Why It Is Needed
Authentication enables user-specific features and secure access.

## Features and Behavior

### Screens
- Login
- Register
- Forgot Password
- Verification
- Logout

### Features
- Registration
- Login
- Logout
- Forgot password
- Verification
- Session behavior
- Authentication states
- Authentication errors
- Password rules
- Token requirements
- Protected screens
- Guest access
- Account recovery

### Language Support
- English messages
- Amharic messages

## Rules and Decisions
- Do not hard-code credentials
- Secure token storage
- Session management
- Support both languages
- Guest access for public features

## Data Required
- User credentials
- Session tokens
- User profile data

## Users Involved
- All users (registered and guests)

## English/Amharic Requirements
- Authentication messages in both languages
- Form labels in both languages
- Validation messages in both languages

## Errors and Edge Cases
- Invalid credentials
- Network errors
- Session expiration
- Token refresh

## Testing
- Test registration
- Test login
- Test logout
- Test password reset
- Test session persistence
- Test protected routes

## Dependencies
- Phase 8 (Shared Components)

## Later Phases Depending on This
- All authenticated features

## Completion Condition
Authentication UI and client-side session structure are complete.

## Known Limitations
- Authentication is local/mock until API integration

---

# PHASE 21 — PROFILE

## Purpose
Allow users to manage their account.

## What This Phase Is About
Implementing the user profile and account management.

## Why It Is Needed
Profile enables users to manage their information and activity.

## Features and Behavior

### Features
- Profile
- Edit profile
- My listings
- My favorites
- My alerts
- Account information

## Rules and Decisions
- Authentication required
- Support both languages
- Edit profile with validation

## Data Required
- User profile data
- User listings
- User favorites
- User alerts

## Users Involved
- All authenticated users

## English/Amharic Requirements
- Profile labels in both languages
- Edit form in both languages
- User data supports both languages

## Errors and Edge Cases
- Edit validation errors
- Network errors
- Loading states

## Testing
- Test profile view
- Test edit profile
- Test my listings
- Test my favorites
- Test my alerts

## Dependencies
- Phase 20 (Authentication)

## Later Phases Depending on This
- Profile integration (Phase 53)

## Completion Condition
Profile system works locally.

## Known Limitations
- Data is local/mock until API integration

---

# PHASE 22 — SETTINGS

## Purpose
Allow users to configure application preferences.

## What This Phase Is About
Implementing application settings.

## Why It Is Needed
Settings enable users to personalize their experience.

## Features and Behavior

### Settings
- Language settings
- English selection
- Amharic selection
- Dark mode
- Notification preferences
- Privacy
- Terms
- Account settings
- Logout

### Persistence
- Settings persistence
- Default settings

## Rules and Decisions
- Settings must persist locally
- Language selection updates entire app
- Dark mode updates entire app
- Notification preferences respected

## Data Required
- User preferences
- App configuration

## Users Involved
- All users

## English/Amharic Requirements
- Settings labels in both languages
- Language selector prominently displayed
- All settings support both languages

## Errors and Edge Cases
- Settings save errors
- Invalid preference values

## Testing
- Test language switching
- Test dark mode
- Test notification preferences
- Test logout
- Test persistence

## Dependencies
- Phase 20 (Authentication)

## Later Phases Depending on This
- Settings integration (Phase 53)

## Completion Condition
Settings work locally.

## Known Limitations
- Settings are local until API integration

---

# PHASE 23 — CAR LOAN

## Purpose
Provide car loan information.

## What This Phase Is About
Implementing the car loan information feature.

## Why It Is Needed
Loan information helps users understand financing options.

## Features and Behavior

### Features
- Loan information
- Loan amount
- Interest rate
- Duration
- Eligibility

## Rules and Decisions
- Information only (not financial advice)
- Support both languages
- Use shared components

## Data Required
- Loan calculations
- Loan rules

## Users Involved
- Buyers

## English/Amharic Requirements
- All labels in both languages
- Calculations in both languages

## Errors and Edge Cases
- Invalid inputs
- Calculation errors

## Testing
- Test loan display
- Test loan calculations

## Dependencies
- Phase 8 (Shared Components)

## Later Phases Depending on This
- None

## Completion Condition
Loan feature works locally with documented rules.

## Known Limitations
- Calculations are informational only

---

# PHASE 24 — EMI CALCULATOR

## Purpose
Allow users to calculate EMI.

## What This Phase Is About
Implementing the EMI calculator feature.

## Why It Is Needed
EMI calculator helps users understand monthly payments.

## Features and Behavior

### Inputs
- Car price
- Down payment
- Interest rate
- Loan duration

### Outputs
- Monthly EMI
- Total payment
- Total interest

### Formula
EMI formula implementation.

### Rules
- Input validation
- Calculation rules
- Edge cases
- Currency rules

## Rules and Decisions
- Calculations must be accurate
- Support both languages
- Show step-by-step breakdown if needed

## Data Required
- EMI formula
- Validation rules

## Users Involved
- Buyers

## English/Amharic Requirements
- All labels in both languages
- Results in both languages

## Errors and Edge Cases
- Zero price
- Zero down payment
- Zero interest
- Extreme values

## Testing
- Test all calculations
- Test edge cases
- Test validation

## Dependencies
- Phase 8 (Shared Components)

## Later Phases Depending on This
- None

## Completion Condition
Calculations are tested and correct.

## Known Limitations
- Calculations are approximate and for reference only

---

# PHASE 25 — LOCAL STORAGE

## Purpose
Store appropriate local information.

## What This Phase Is About
Implementing local storage for app data.

## Why It Is Needed
Local storage improves performance and offline experience.

## Features and Behavior

### What Is Stored
- Theme preference
- Language preference
- Recent searches
- Recently viewed cars
- Favorite cache
- Draft listing
- Session information where appropriate

### Security
Sensitive information must use secure storage.

### Rules
- Expiration rules for cached data
- Delete rules
- Clear-data behavior

## Rules and Decisions
- Use appropriate storage technology
- Secure storage for tokens
- Cache expiration strategy
- Clear data on logout

## Data Required
- Storage keys
- Storage format

## Users Involved
- All users

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Storage full
- Corrupted data
- Access errors

## Testing
- Test storage/retrieval
- Test expiration
- Test clear data
- Test secure storage

## Dependencies
- Phase 20 (Authentication)

## Later Phases Depending on This
- All features requiring persistence

## Completion Condition
Required local persistence works reliably.

## Known Limitations
- Storage is local only, not synced

---

# PHASE 26 — COMPLETE FLUTTER STATES

## Purpose
Ensure every screen handles all states.

## What This Phase Is About
Reviewing and implementing complete state handling across all screens.

## Why It Is Needed
Proper state handling provides a polished user experience.

## Features and Behavior

### States Required
- Initial state
- Loading state
- Success state
- Empty state
- Error state
- Retry behavior

### Conditions
- Network failure behavior
- Timeout behavior
- Offline behavior
- State transitions

## Rules and Decisions
- Every data-driven screen must support all states
- No important screen left without proper state handling
- User actions for each state must be clear

## Data Required
- State definitions
- Transition rules

## Users Involved
- All users

## English/Amharic Requirements
- Error messages in both languages
- Empty state messages in both languages
- Retry labels in both languages

## Errors and Edge Cases
- All error conditions must be tested
- Network errors
- Timeouts
- Offline mode

## Testing
- Test all states for each screen
- Test poor network conditions
- Test offline behavior

## Dependencies
- All feature phases

## Later Phases Depending on This
- Flutter Testing (Phase 27)

## Completion Condition
No important screen is left without proper state handling.

## Known Limitations
- Some states may need refinement after API integration

---

# PHASE 27 — FLUTTER TESTING

## Purpose
Test the Flutter application.

## What This Phase Is About
Comprehensive testing of the Flutter application.

## Why It Is Needed
Testing ensures the application works correctly.

## Features and Behavior

### Tests
- Navigation tests
- Widget tests
- Form tests
- Validation tests
- State changes
- Search tests
- Filter tests
- Compare tests
- Favorite tests
- EMI calculations

### Language Testing
- English tests
- Amharic tests

### UI Testing
- Dark-mode tests
- Device tests
- Text overflow
- Font rendering
- Layout behavior

## Rules and Decisions
- Test all features
- Test both languages
- Test both themes
- Test multiple device sizes
- Expected results documented

## Data Required
- Test cases
- Expected results
- Test data

## Users Involved
- Development team
- QA team

## English/Amharic Requirements
- Test both languages thoroughly
- Verify Amharic text rendering

## Errors and Edge Cases
- Test all error states
- Test edge cases
- Test boundary conditions

## Testing
- This phase IS testing

## Dependencies
- Phase 26 (Complete Flutter States)

## Later Phases Depending on This
- Flutter Stabilization (Phase 28)

## Completion Condition
Flutter client passes planned tests.

## Known Limitations
- Some tests may be updated after API integration

---

# PHASE 28 — FLUTTER STABILIZATION

## Purpose
Stabilize the Flutter application.

## What This Phase Is About
Fixing bugs, improving performance, and verifying the complete Flutter application.

## Why It Is Needed
Stabilization ensures the application is production-ready.

## Features and Behavior

### Bug Fixes
- Major UI bugs
- Navigation bugs
- Performance problems
- Memory problems

### Verification
- Device compatibility
- Screen-size testing
- Dark-mode verification
- English verification
- Amharic verification

### Code Quality
- Remove duplication
- Run flutter analyze
- Improve performance

## Rules and Decisions
- Fix before moving to backend
- All important features work with mock data
- Flutter application stable

## Data Required
- Bug list
- Performance metrics
- Test results

## Users Involved
- Development team
- QA team

## English/Amharic Requirements
- Verify both languages thoroughly
- No text overflow in either language

## Errors and Edge Cases
- All known bugs fixed
- No critical bugs remaining
- Edge cases handled

## Testing
- Re-test all features after fixes
- Performance testing
- Memory testing

## Dependencies
- Phase 27 (Flutter Testing)

## Later Phases Depending on This
- Backend development (Phase 29+)
- Integration (Phase 46+)

## Completion Condition
- Flutter application is stable with mock data
- flutter analyze passes
- All important features work
- English and Amharic verified

## Known Limitations
- Some issues may be discovered during API integration

---

# PHASE 29 — BACKEND ARCHITECTURE

## Purpose
Design the real backend.

## What This Phase Is About
Designing the complete backend architecture before implementation.

## Why It Is Needed
Proper architecture ensures the backend is scalable, maintainable, and secure.

## Features and Behavior

### Technology Stack
- Python
- FastAPI
- PostgreSQL
- Object storage
- Background processing where required

### Architecture Flow
```
Flutter → HTTPS → FastAPI → Business logic/data layer → PostgreSQL
```

### Modules
- Authentication
- Users
- Cars
- Listings
- Search
- Favorites
- Compare
- Sell
- Messages
- News
- Alerts
- Notifications
- Admin

## Rules and Decisions
- API-first design
- Module separation
- Clear dependency direction
- Security by design
- Performance considered

## Data Required
- Module definitions
- API specifications
- Data flow diagrams

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- N/A for this phase

## Testing
- Architecture must be testable

## Dependencies
- Phase 28 (Flutter Stabilization)

## Later Phases Depending on This
- All backend phases

## Completion Condition
Backend architecture is documented.

## Known Limitations
- Architecture may evolve during implementation

---

# PHASE 30 — POSTGRESQL DATABASE DESIGN

## Purpose
Design the database before implementation.

## What This Phase Is About
Creating the complete database schema.

## Why It Is Needed
Good database design is critical for performance and data integrity.

## Features and Behavior

### Core Entities
- users
- profiles
- roles
- brands
- models
- variants
- specifications
- cars
- listings
- listing_images
- locations
- favorites
- comparisons
- news_articles
- news_media
- alerts
- notifications
- conversations
- messages

### Design Elements
- Primary keys
- Foreign keys
- Relationships
- Constraints
- Indexes
- Timestamps
- Status fields
- Search fields

### Relationships
Example:
```
Brand → Model → Variant → Vehicle information
User → Listing → Listing images
User → Conversation → Messages
```

## Rules and Decisions
- Normalize appropriately
- Index for performance
- Use appropriate data types
- Document all relationships

## Data Required
- Entity definitions
- Relationship definitions
- Data type specifications

## Users Involved
- Development team
- Database administrator

## English/Amharic Requirements
- Text fields must support both languages
- Unicode support for Amharic

## Errors and Edge Cases
- N/A for this phase

## Testing
- Schema must be reviewed and approved

## Dependencies
- Phase 29 (Backend Architecture)

## Later Phases Depending on This
- Database Implementation (Phase 31)

## Completion Condition
Final database schema is approved.

## Known Limitations
- Schema may evolve during implementation

---

# PHASE 31 — DATABASE IMPLEMENTATION

## Purpose
Implement the database.

## What This Phase Is About
Creating the actual database from the design.

## Why It Is Needed
The database must exist before backend implementation.

## Features and Behavior

### Implementation
- Database setup
- Tables creation
- Relationships
- Constraints
- Indexes
- Timestamps
- Status fields

### Migrations
- Migration strategy
- Migration files

### Data
- Seed data
- Initial data
- Vehicle catalog data

### Environments
- Development database
- Testing database
- Production database

## Rules and Decisions
- Use migrations for schema changes
- Version control migrations
- Seed data for testing
- Production data separate

## Data Required
- Database schema
- Migration plan
- Seed data

## Users Involved
- Development team
- Database administrator

## English/Amharic Requirements
- Unicode support for Amharic
- Text columns support both languages

## Errors and Edge Cases
- Migration failures
- Data integrity issues
- Performance issues

## Testing
- Test database creation from scratch
- Test migrations
- Test seed data

## Dependencies
- Phase 30 (PostgreSQL Database Design)

## Later Phases Depending on This
- FastAPI Foundation (Phase 32)
- All backend API phases

## Completion Condition
PostgreSQL database can be created from a clean environment.

## Known Limitations
- Schema changes require new migrations

---

# PHASE 32 — FASTAPI FOUNDATION

## Purpose
Create the FastAPI project foundation.

## What This Phase Is About
Setting up the FastAPI project with configuration and infrastructure.

## Why It Is Needed
Foundation is needed before building features.

## Features and Behavior

### Foundation
- FastAPI project structure
- Configuration
- Environment variables
- Database connection
- API versioning
- Health endpoint
- Error handling
- Logging
- Dependencies
- Startup behavior
- Shutdown behavior

## Rules and Decisions
- Use environment variables for configuration
- Version APIs
- Health check endpoint required
- Structured logging
- Proper error handling

## Data Required
- Project structure
- Configuration variables
- Logging configuration

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Startup errors
- Connection errors

## Testing
- Test API runs
- Test database connection
- Test health endpoint

## Dependencies
- Phase 31 (Database Implementation)

## Later Phases Depending on This
- All backend API phases

## Completion Condition
FastAPI runs and connects to PostgreSQL.

## Known Limitations
- No business logic implemented yet

---

# PHASE 33 — AUTHENTICATION API

## Purpose
Implement secure authentication.

## What This Phase Is About
Building the authentication API with JWT.

## Why It Is Needed
Authentication is required for most features.

## Features and Behavior

### Endpoints
- Registration
- Login
- Logout
- Password reset
- Verification

### Security
- Password hashing
- Access tokens
- Refresh tokens
- Token expiration

### Authorization
- User roles
- Permissions
- Authorization rules

### Language Support
- English messages
- Amharic messages

## Rules and Decisions
- JWT for authentication
- Secure password hashing
- Token rotation
- Role-based access control

## Data Required
- User model
- Role/permission definitions

## Users Involved
- All users

## English/Amharic Requirements
- Auth messages in both languages

## Errors and Edge Cases
- Invalid credentials
- Token expiration
- Invalid roles
- Rate limiting

## Testing
- Test registration
- Test login
- Test token refresh
- Test password reset

## Dependencies
- Phase 32 (FastAPI Foundation)

## Later Phases Depending on This
- All authenticated API phases
- Authentication Integration (Phase 47)

## Completion Condition
Secure authentication API works.

## Known Limitations
- Tokens must be securely stored on client

---

# PHASE 34 — CAR CATALOG API

## Purpose
Implement car catalog APIs.

## What This Phase Is About
Building APIs for brands, models, variants, and specifications.

## Why It Is Needed
Catalog data is needed for new cars browsing.

## Features and Behavior

### Endpoints
- Brand API
- Model API
- Variant API
- Specification API
- Price API
- Vehicle details

### Features
- Image references
- Searchable fields
- API request format
- API response format
- Validation
- Errors
- Pagination

## Rules and Decisions
- RESTful API design
- Proper validation
- Pagination for lists
- Support both languages for text fields

## Data Required
- Catalog schema
- Image storage references

## Users Involved
- Buyers
- Guests

## English/Amharic Requirements
- Brand/model/variant names in both languages
- Specifications in both languages

## Errors and Edge Cases
- Not found
- Invalid parameters
- Empty results

## Testing
- Test all endpoints
- Test pagination
- Test search

## Dependencies
- Phase 33 (Authentication API)

## Later Phases Depending on This
- New Cars Integration (Phase 48)

## Completion Condition
New Cars data can be retrieved through API endpoints.

## Known Limitations
- Data must be seeded in database

---

# PHASE 35 — USED CAR MARKETPLACE API

## Purpose
Implement used car marketplace APIs.

## What This Phase Is About
Building APIs for listing management.

## Why It Is Needed
Used cars are a core marketplace function.

## Features and Behavior

### Endpoints
- Create listing
- Read listing
- Update listing
- Delete listing
- Publish listing
- Unpublish listing

### Features
- Seller details
- Location
- Images
- Listing status
- Seller ownership
- Authorization
- Error handling
- Listing lifecycle

## Rules and Decisions
- Ownership checks required
- Listing status management
- Proper validation
- Authorization for updates/deletes

## Data Required
- Listing schema
- User relationships
- Image references

## Users Involved
- Sellers
- Buyers (view only)
- Admin (moderate)

## English/Amharic Requirements
- Listing text in both languages
- Validation messages in both languages

## Errors and Edge Cases
- Unauthorized access
- Invalid listing data
- Image errors

## Testing
- Test all CRUD operations
- Test authorization
- Test listing lifecycle

## Dependencies
- Phase 33 (Authentication API)
- Phase 31 (Database Implementation)

## Later Phases Depending on This
- Used Cars Integration (Phase 49)

## Completion Condition
Used-car marketplace API works.

## Known Limitations
- Approvals may be required before publishing

---

# PHASE 36 — SEARCH API

## Purpose
Implement search and filtering APIs.

## What This Phase Is About
Building APIs for searching and filtering cars.

## Why It Is Needed
Search is how users find cars.

## Features and Behavior

### Search Features
- Keyword search
- Brand filter
- Model filter
- Price filter
- Year filter
- Fuel filter
- Transmission filter
- Body type filter
- Location filter

### Results
- Sorting
- Pagination
- Search performance

### Language Support
- English search
- Amharic search

## Rules and Decisions
- Index for performance
- Support both languages
- Pagination for large results
- Sorting options

## Data Required
- Searchable fields
- Index configuration

## Users Involved
- All users

## English/Amharic Requirements
- Support both languages in search
- Search results in both languages

## Errors and Edge Cases
- No results
- Invalid filters
- Timeout

## Testing
- Test all filter combinations
- Test search terms
- Test pagination
- Test sorting

## Dependencies
- Phase 34 (Car Catalog API)
- Phase 35 (Used Car Marketplace API)

## Later Phases Depending on This
- Search Integration (Phase 50)

## Completion Condition
Search API returns correct results efficiently.

## Known Limitations
- Search performance depends on database indexing

---

# PHASE 37 — FAVORITES AND COMPARE API

## Purpose
Implement favorites and compare APIs.

## What This Phase Is About
Building APIs for managing favorites and comparisons.

## Why It Is Needed
Favorites and compare are user engagement features.

## Features and Behavior

### Favorites
- Add
- Remove
- List
- Authentication
- Ownership
- Duplicate handling

### Compare
- Select
- Add
- Remove
- Compare
- Comparison data
- Validation
- Limits

## Rules and Decisions
- User-specific favorites
- Authentication required
- Duplicate prevention
- Comparison limits

## Data Required
- Favorite data
- Comparison data
- User relationships

## Users Involved
- Authenticated users

## English/Amharic Requirements
- UI labels in both languages

## Errors and Edge Cases
- Duplicate favorites
- Empty comparison
- Too many comparisons

## Testing
- Test favorites CRUD
- Test compare operations
- Test limits

## Dependencies
- Phase 33 (Authentication API)

## Later Phases Depending on This
- Favorites/Compare Integration (Phase 50)

## Completion Condition
Favorites and comparisons persist correctly.

## Known Limitations
- Comparison limits must be enforced

---

# PHASE 38 — SELL CAR API

## Purpose
Implement car selling APIs.

## What This Phase Is About
Building APIs for listing submission and management.

## Why It Is Needed
Selling cars is a core marketplace function.

## Features and Behavior

### Features
- Listing submission
- Listing creation
- Listing update
- Draft state
- Validation
- Seller ownership
- Listing lifecycle
- Approval requirements
- Image references
- Error handling

## Rules and Decisions
- Seller must be authenticated
- Drafts allowed
- Approval workflow
- Ownership checks

## Data Required
- Listing schema
- Image references
- User authentication

## Users Involved
- Sellers
- Admin

## English/Amharic Requirements
- Validation messages in both languages
- Listing text supports both languages

## Errors and Edge Cases
- Missing required fields
- Invalid images
- Unauthorized access

## Testing
- Test listing creation
- Test draft behavior
- Test approval flow
- Test ownership checks

## Dependencies
- Phase 33 (Authentication API)
- Phase 35 (Used Car Marketplace API)

## Later Phases Depending on This
- Sell Car Integration (Phase 51)

## Completion Condition
Seller submissions can be created and managed through API.

## Known Limitations
- Approval may be required before publishing

---

# PHASE 39 — MESSAGING API

## Purpose
Implement messaging APIs.

## What This Phase Is About
Building APIs for buyer-seller communication.

## Why It Is Needed
Messages enable communication between buyers and sellers.

## Features and Behavior

### Features
- Conversation creation
- Conversation list
- Message creation
- Message retrieval
- Read status
- Unread count
- Message history

### Communication
- Choose WebSocket or polling approach
- Authorization
- Error handling
- Security rules

## Rules and Decisions
- Authentication required
- Users can only see their conversations
- Real-time or near-real-time communication
- Security for message content

## Data Required
- Conversation data
- Message data
- User relationships

## Users Involved
- Buyers
- Sellers

## English/Amharic Requirements
- Messages support both languages
- No language restrictions on content

## Errors and Edge Cases
- Empty conversations
- Invalid recipients
- Message send errors

## Testing
- Test conversation creation
- Test message sending
- Test message retrieval
- Test read/unread

## Dependencies
- Phase 33 (Authentication API)

## Later Phases Depending on This
- Messages Integration (Phase 51)

## Completion Condition
Buyer and seller can communicate securely.

## Known Limitations
- Communication method must be appropriate for scale

---

# PHASE 40 — NEWS API

## Purpose
Implement news content APIs.

## What This Phase Is About
Building APIs for news articles and content.

## Why It Is Needed
News provides content and engagement.

## Features and Behavior

### Features
- Categories
- Articles
- Reviews
- Special reports
- Authors
- Publication dates
- Images
- Videos
- Search
- Favorite articles
- Publishing status

### Language Support
- English content
- Amharic content

## Rules and Decisions
- Admin-only publishing
- Categories for organization
- Support both languages
- Media management

## Data Required
- Article schema
- Category definitions
- Media references
- Author info

## Users Involved
- All users (reading)
- Admin (creating/publishing)

## English/Amharic Requirements
- Articles in both languages
- Categories in both languages
- Search supports both languages

## Errors and Edge Cases
- Not found
- Unpublished content
- Empty results

## Testing
- Test article retrieval
- Test categories
- Test search
- Test favorite

## Dependencies
- Phase 33 (Authentication API)

## Later Phases Depending on This
- News Integration (Phase 52)

## Completion Condition
News API provides structured content.

## Known Limitations
- Content quality depends on editorial team

---

# PHASE 41 — ALERTS API

## Purpose
Implement user alert APIs.

## What This Phase Is About
Building APIs for user-created alerts.

## Why It Is Needed
Alerts notify users about matching cars.

## Features and Behavior

### Features
- Alert creation
- Alert retrieval
- Alert update
- Alert deletion
- Enable
- Disable
- Alert conditions
- Matching rules
- User ownership

### Processing
- Matching process
- Notification relationship

## Rules and Decisions
- Alerts require authentication
- Conditions must be valid
- Alerts trigger notifications
- User can enable/disable

## Data Required
- Alert criteria
- User relationships
- Matching logic

## Users Involved
- Authenticated users

## English/Amharic Requirements
- Alert labels in both languages
- Conditions in both languages

## Errors and Edge Cases
- Invalid conditions
- Duplicate alerts
- Missing data

## Testing
- Test alert creation
- Test update/delete
- Test enable/disable
- Test matching

## Dependencies
- Phase 33 (Authentication API)
- Phase 42 (Notifications API)

## Later Phases Depending on This
- Alerts Integration (Phase 52)

## Completion Condition
Saved user alerts are stored and evaluated correctly.

## Known Limitations
- Matching performance depends on database indexing

---

# PHASE 42 — NOTIFICATIONS API

## Purpose
Implement system notification APIs.

## What This Phase Is About
Building APIs for system-generated notifications.

## Why It Is Needed
Notifications inform users about important events.

## Features and Behavior

### Features
- Notification creation
- Notification types
- Notification list
- Unread count
- Mark read
- Mark all read
- Notification payload
- User ownership
- Notification generation
- Notification status
- Error handling

## Rules and Decisions
- Notifications are system-generated
- Separate from Alerts
- Authentication required
- Unread tracking

## Data Required
- Notification schema
- User relationships
- Notification types

## Users Involved
- Authenticated users
- System/Admin

## English/Amharic Requirements
- Notification messages in both languages
- Notification types in both languages

## Errors and Edge Cases
- Empty notifications
- Failed notification generation

## Testing
- Test notification list
- Test unread count
- Test mark read
- Test navigation

## Dependencies
- Phase 33 (Authentication API)

## Later Phases Depending on This
- Notifications Integration (Phase 52)

## Completion Condition
Notification data can be generated and retrieved.

## Known Limitations
- Notifications may require background processing

---

# PHASE 43 — ADMIN API

## Purpose
Implement administrative APIs.

## What This Phase Is About
Building APIs for administrative control.

## Why It Is Needed
Admin functions are required for content moderation and management.

## Features and Behavior

### Admin Features
- User management
- Brand management
- Model management
- Vehicle management
- Listing management
- News management
- Reports
- Moderation
- Notifications
- Audit requirements

### Security
- Administrator role
- Administrator permissions
- Authorization rules

## Rules and Decisions
- Admin role required
- Proper authorization
- Audit logging
- Separate permissions

## Data Required
- Admin permissions
- Audit logs

## Users Involved
- Administrator only

## English/Amharic Requirements
- Admin UI labels in both languages

## Errors and Edge Cases
- Unauthorized access
- Invalid operations

## Testing
- Test all admin operations
- Test authorization
- Test audit logging

## Dependencies
- Phase 33 (Authentication API)
- All other API phases

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
Admin operations are protected and functional.

## Known Limitations
- Admin UI is separate from API

---

# PHASE 44 — IMAGE AND FILE STORAGE

## Purpose
Implement file storage.

## What This Phase Is About
Setting up object storage for images and files.

## Why It Is Needed
File storage is required for car photos, profile images, and news media.

## Features and Behavior

### Storage
- Storage technology (S3/MinIO)
- Bucket/container structure
- File types
- File size limits
- File naming
- Upload process
- File validation
- Image compression
- Image resizing
- Thumbnail generation
- Retrieval
- Deletion
- Access control

### Media Types
- Car photos
- Profile photos
- News media
- Video/media rules

## Rules and Decisions
- Use S3-compatible storage
- Validate file types
- Limit file sizes
- Generate thumbnails
- Secure URLs

## Data Required
- Storage configuration
- Validation rules
- Image size specifications

## Users Involved
- All users (upload/view)
- System

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Invalid file types
- File too large
- Upload errors
- Retrieval errors

## Testing
- Test upload
- Test retrieval
- Test deletion
- Test validation
- Test thumbnail generation

## Dependencies
- Phase 31 (Database Implementation)

## Later Phases Depending on This
- All phases requiring image storage

## Completion Condition
Media can be safely uploaded and retrieved.

## Known Limitations
- Storage costs must be monitored

---

# PHASE 45 — BACKGROUND PROCESSING

## Purpose
Move heavy tasks away from normal API requests.

## What This Phase Is About
Implementing background job processing.

## Why It Is Needed
Heavy tasks should not block API responses.

## Features and Behavior

### Job Types
- Image resizing
- Thumbnail generation
- Notification processing
- Email/SMS tasks
- Long-running tasks

### Features
- Job triggers
- Processing flow
- Retry rules
- Failure handling
- Job status
- Logging
- Monitoring

## Rules and Decisions
- Use queue system if needed
- Idempotent jobs
- Proper error handling
- Retry with backoff

## Data Required
- Job definitions
- Queue configuration

## Users Involved
- System

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Job failures
- Retry behavior
- Queue overflow

## Testing
- Test job execution
- Test retry behavior
- Test failure handling

## Dependencies
- Phase 44 (Image and File Storage)

## Later Phases Depending on This
- All phases requiring background processing

## Completion Condition
Background tasks execute reliably without blocking normal API requests.

## Known Limitations
- Queue system may require monitoring

---

# PHASE 46 — FLUTTER ↔ FASTAPI FOUNDATION

## Purpose
Connect Flutter to FastAPI.

## What This Phase Is About
Setting up API communication between Flutter and the backend.

## Why It Is Needed
The app must communicate with the real backend.

## Features and Behavior

### Communication
- API communication architecture
- API client
- Base URL
- HTTP methods
- Headers
- Request format
- Response format
- Authentication headers
- Error format
- Timeout
- Retry
- Pagination
- File upload
- Network failure handling

## Rules and Decisions
- Use Dio or similar HTTP client
- Error handling
- Authentication headers
- Timeout configuration
- Retry strategy

## Data Required
- API specifications
- Base URL configuration

## Users Involved
- All users

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Network errors
- Timeout
- Authentication errors

## Testing
- Test API calls
- Test error handling
- Test retry behavior

## Dependencies
- Phase 32 (FastAPI Foundation)
- Flutter phases

## Later Phases Depending on This
- All integration phases

## Completion Condition
Flutter can communicate with the real API.

## Known Limitations
- API endpoints must exist before testing

---

# PHASE 47 — AUTHENTICATION INTEGRATION

## Purpose
Connect authentication between Flutter and FastAPI.

## What This Phase Is About
Integrating real authentication with the Flutter app.

## Why It Is Needed
Real authentication replaces mock authentication.

## Features and Behavior

### Features
- Register flow
- Login flow
- Token storage
- Token refresh
- Logout
- Session expiration
- Protected requests
- Unauthorized responses
- Session restoration
- Secure storage
- Authentication errors

## Rules and Decisions
- Secure token storage
- Automatic token refresh
- Session persistence
- Error handling

## Data Required
- API authentication specifications
- Token format

## Users Involved
- All users

## English/Amharic Requirements
- Auth messages in both languages

## Errors and Edge Cases
- Invalid credentials
- Token expiration
- Network errors

## Testing
- Test registration
- Test login
- Test token refresh
- Test logout
- Test session restoration

## Dependencies
- Phase 33 (Authentication API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- All subsequent integration phases

## Completion Condition
Real user authentication works from Flutter to FastAPI.

## Known Limitations
- Tokens must be securely stored

---

# PHASE 48 — NEW CARS INTEGRATION

## Purpose
Connect new cars to the real API.

## What This Phase Is About
Replacing mock new cars data with real API data.

## Why It Is Needed
Real data provides actual car listings.

## Features and Behavior

### Integration
- Brand API integration
- Model API integration
- Variant API integration
- Specifications
- Prices
- Images
- Car details

### States
- Loading state
- Empty state
- Error state

### Data Mapping
- API mapping
- English data
- Amharic data

## Rules and Decisions
- Replace mock data gradually
- Handle loading states
- Handle errors
- Map API responses to models

## Data Required
- API response format
- Data mapping specifications

## Users Involved
- Buyers
- Guests

## English/Amharic Requirements
- Car data in both languages
- UI labels in both languages

## Errors and Edge Cases
- API errors
- Empty responses
- Loading states
- Display errors

## Testing
- Test all new cars features with real API
- Test error handling
- Test empty states

## Dependencies
- Phase 34 (Car Catalog API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
New Cars uses live backend data.

## Known Limitations
- API must be stable for testing

---

# PHASE 49 — USED CARS INTEGRATION

## Purpose
Connect used cars to the real API.

## What This Phase Is About
Replacing mock used cars data with real API data.

## Why It Is Needed
Real data provides actual used car listings.

## Features and Behavior

### Integration
- Listings
- Search
- Filters
- Details
- Seller
- Location
- Images
- Contact

### States
- Loading
- Empty state
- Error state

## Rules and Decisions
- Replace mock data gradually
- Handle all states
- Map API responses

## Data Required
- API response format
- Data mapping specifications

## Users Involved
- Buyers
- Sellers

## English/Amharic Requirements
- Listing details in both languages
- UI labels in both languages

## Errors and Edge Cases
- API errors
- Empty listings
- Seller information missing

## Testing
- Test all used cars features with real API
- Test error handling
- Test empty states

## Dependencies
- Phase 35 (Used Car Marketplace API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
Used Cars uses real backend data.

## Known Limitations
- API must be stable for testing

---

# PHASE 50 — SEARCH / COMPARE / FAVORITES INTEGRATION

## Purpose
Connect search, compare, and favorites to the API.

## What This Phase Is About
Replacing mock data with real API data for these features.

## Why It Is Needed
Real data enables actual search and comparison.

## Features and Behavior

### Integration
- Search integration
- Filter integration
- Compare integration
- Favorite integration

### Features
- API endpoints
- Request formats
- Response formats
- State handling
- Authentication
- Error handling
- Offline behavior
- Loading behavior
- Empty behavior

## Rules and Decisions
- Use real API endpoints
- Handle authentication for favorites
- State management for search
- Data mapping

## Data Required
- API specifications
- Data mapping

## Users Involved
- All users

## English/Amharic Requirements
- Search supports both languages
- UI labels in both languages

## Errors and Edge Cases
- API errors
- No results
- Authentication errors
- Network errors

## Testing
- Test all features with real API
- Test authentication requirements
- Test error states

## Dependencies
- Phase 36 (Search API)
- Phase 37 (Favorites and Compare API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
These features work end-to-end.

## Known Limitations
- API must be stable for testing

---

# PHASE 51 — SELL CAR / MESSAGES INTEGRATION

## Purpose
Connect sell car and messages to the API.

## What This Phase Is About
Integrating real selling and messaging features.

## Why It Is Needed
Real functionality enables actual selling and communication.

## Features and Behavior

### Sell Car Integration
- Listing creation flow
- Image upload flow
- Draft behavior
- Submission
- Seller ownership
- Listing status

### Messages Integration
- Chat integration
- Message sending
- Message retrieval
- Read/unread state

### Features
- Authentication
- Error handling

## Rules and Decisions
- Image upload to object storage
- Real conversation creation
- Real message sending

## Data Required
- API specifications
- Upload specifications

## Users Involved
- Sellers
- Buyers

## English/Amharic Requirements
- Form labels in both languages
- Validation messages in both languages
- Message content supports both languages

## Errors and Edge Cases
- Upload errors
- API errors
- Validation errors

## Testing
- Test listing creation with real API
- Test image upload
- Test conversation creation
- Test message sending

## Dependencies
- Phase 38 (Sell Car API)
- Phase 39 (Messaging API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
A seller can create a real listing and a buyer can communicate with the seller.

## Known Limitations
- Approval may be required before listing appears

---

# PHASE 52 — NEWS / ALERTS / NOTIFICATIONS INTEGRATION

## Purpose
Connect news, alerts, and notifications to the API.

## What This Phase Is About
Integrating real content and notification features.

## Why It Is Needed
Real content and notifications improve user engagement.

## Features and Behavior

### Integration
- News integration
- Article integration
- Media integration
- Alert integration
- Alert matching
- Notification integration
- Notification bell
- Unread count
- Read/unread state

### Separation
- Alert/notification separation

### States
- Loading
- Empty
- Error behavior

## Rules and Decisions
- News articles from API
- Alerts saved to API
- Notifications from API
- Alerts and Notifications remain separate

## Data Required
- API specifications
- Content formats

## Users Involved
- All users

## English/Amharic Requirements
- News in both languages
- Alert labels in both languages
- Notification messages in both languages

## Errors and Edge Cases
- API errors
- Empty news
- No alerts
- No notifications

## Testing
- Test news with real API
- Test alert management
- Test notification display
- Test alert/notification separation

## Dependencies
- Phase 40 (News API)
- Phase 41 (Alerts API)
- Phase 42 (Notifications API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
Information and notification systems work end-to-end.

## Known Limitations
- Notification generation may depend on background jobs

---

# PHASE 53 — PROFILE / SETTINGS INTEGRATION

## Purpose
Connect profile and settings to the API.

## What This Phase Is About
Integrating real user profile and settings features.

## Why It Is Needed
Real user data is required for personalization.

## Features and Behavior

### Integration
- Profile API
- Edit profile
- User listings
- Favorites
- Alerts
- Language preference
- Notification preferences
- Account settings

### Features
- Data persistence
- Authentication
- Error handling

## Rules and Decisions
- Profile data from API
- Settings sync with API where needed
- Local persistence for preferences

## Data Required
- API specifications
- Profile schema

## Users Involved
- Authenticated users

## English/Amharic Requirements
- Profile data in both languages
- Settings labels in both languages

## Errors and Edge Cases
- API errors
- Edit validation errors
- Save errors

## Testing
- Test profile with real API
- Test edit profile
- Test settings persistence
- Test language switching

## Dependencies
- Phase 43 (Admin API)
- Phase 46 (Flutter ↔ FastAPI Foundation)

## Later Phases Depending on This
- End-to-End Testing (Phase 54)

## Completion Condition
User account data persists correctly.

## Known Limitations
- Some settings may be local only

---

# PHASE 54 — END-TO-END TESTING

## Purpose
Test complete user journeys.

## What This Phase Is About
Comprehensive testing of all user journeys.

## Why It Is Needed
End-to-end testing ensures the system works as a whole.

## Features and Behavior

### Buyer Journey
```
Register → Login → Search → Filter → Open car → Favorite → Compare → Contact seller
```

### Seller Journey
```
Login → Sell car → Enter information → Upload photos → Submit → Admin review → Listing published
```

### Alert Journey
```
Create alert → Matching car appears → Notification generated → User receives notification
```

### News Journey
```
Open News → Select category → Open article → View media → Favorite article
```

### Other Journeys
- Authentication journey
- Search journey
- Compare journey
- Favorite journey
- Messaging journey

### Results
- Expected results
- Actual results
- Test status
- Bugs discovered
- Bugs fixed
- Remaining issues

## Rules and Decisions
- Test all important user journeys
- Document all results
- Fix critical bugs

## Data Required
- Test cases
- Expected results

## Users Involved
- All user roles

## English/Amharic Requirements
- Test both languages throughout

## Errors and Edge Cases
- All error conditions across journeys

## Testing
- This phase IS testing

## Dependencies
- All integration phases (46-53)

## Later Phases Depending on This
- Security (Phase 55)
- Performance (Phase 56)

## Completion Condition
All important user journeys work from mobile app to database.

## Known Limitations
- Some edge cases may be discovered in beta

---

# PHASE 55 — SECURITY

## Purpose
Review and improve security.

## What This Phase Is About
Comprehensive security review and implementation.

## Why It Is Needed
Security is critical for a production application.

## Features and Behavior

### Security Areas
- Authentication security
- Authorization
- Password security
- Token security
- HTTPS
- API validation
- Rate limiting
- File validation
- Database permissions
- Admin protection
- Secret management
- Environment variables
- Privacy
- Logging
- Security testing
- Known security risks
- Security fixes

## Rules and Decisions
- Never store secrets in source code
- Use environment variables
- HTTPS for all communication
- Proper input validation
- Rate limiting for APIs
- Secure password storage

## Data Required
- Security requirements
- Secret management plan

## Users Involved
- Development team
- Security team (if available)

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- All security risks must be addressed

## Testing
- Security testing
- Penetration testing if available

## Dependencies
- Phase 54 (End-to-End Testing)

## Later Phases Depending on This
- Performance (Phase 56)
- Production Infrastructure (Phase 58)

## Completion Condition
Security review completed and major risks addressed.

## Known Limitations
- Security is an ongoing process

---

# PHASE 56 — PERFORMANCE

## Purpose
Optimize application performance.

## What This Phase Is About
Performance testing and optimization.

## Why It Is Needed
Performance impacts user experience and engagement.

## Features and Behavior

### Performance Areas
- Performance requirements
- Flutter performance
- Widget rebuilds
- Image optimization
- API performance
- Database performance
- Query optimization
- Indexes
- Pagination
- Caching
- Memory usage
- Network usage
- Large-dataset testing
- Performance measurements

## Rules and Decisions
- Measure before optimizing
- Optimize critical paths first
- Cache appropriately
- Use pagination
- Optimize images

## Data Required
- Performance metrics
- Performance requirements

## Users Involved
- Development team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Performance under load
- Large datasets
- Slow networks

## Testing
- Performance testing
- Load testing
- Memory testing

## Dependencies
- Phase 55 (Security)

## Later Phases Depending on This
- Production Infrastructure (Phase 58)

## Completion Condition
Performance meets defined requirements.

## Known Limitations
- Performance monitoring should continue post-launch

---

# PHASE 57 — OBSERVABILITY

## Purpose
Implement monitoring and logging.

## What This Phase Is About
Setting up observability for the production system.

## Why It Is Needed
Observability enables detection and investigation of problems.

## Features and Behavior

### Observability Areas
- Application logs
- Backend logs
- Error tracking
- Health checks
- Performance monitoring
- Database monitoring
- Server monitoring
- Important metrics
- Alerts
- Troubleshooting flow
- Incident investigation process

## Rules and Decisions
- Structured logging
- Error tracking
- Health checks required
- Metrics collection
- Alerting for problems

## Data Required
- Logging configuration
- Metrics requirements

## Users Involved
- Development team
- Operations team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Monitoring failures
- Alert fatigue

## Testing
- Test monitoring setup
- Test alerts

## Dependencies
- Phase 58 (Production Infrastructure)

## Later Phases Depending on This
- Post-Launch (Phase 63)

## Completion Condition
Production problems can be detected and investigated.

## Known Limitations
- Monitoring should be refined over time

---

# PHASE 58 — PRODUCTION INFRASTRUCTURE

## Purpose
Prepare production infrastructure.

## What This Phase Is About
Setting up servers, deployment, and configuration.

## Why It Is Needed
Infrastructure is required for production deployment.

## Features and Behavior

### Infrastructure
- Production environment
- Server
- FastAPI deployment
- PostgreSQL deployment
- Object storage
- Docker
- Containers
- Volumes
- Networks
- Reverse proxy
- HTTPS
- Domain
- Environment variables
- Firewall
- Production configuration
- Deployment process
- Rollback process

## Rules and Decisions
- Use Docker for containerization
- HTTPS required
- Proper environment variables
- Deployment automation
- Rollback capability

## Data Required
- Infrastructure specifications
- Deployment plan

## Users Involved
- Development team
- DevOps team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Deployment failures
- Configuration errors

## Testing
- Test deployment process
- Test rollback process

## Dependencies
- Phase 56 (Performance)
- Phase 57 (Observability)

## Later Phases Depending on This
- Beta Testing (Phase 60)
- Release (Phase 62)

## Completion Condition
Production environment is ready.

## Known Limitations
- Infrastructure requires ongoing maintenance

---

# PHASE 59 — BACKUP AND DISASTER RECOVERY

## Purpose
Implement backup and recovery.

## What This Phase Is About
Setting up backups and disaster recovery procedures.

## Why It Is Needed
Backups protect against data loss.

## Features and Behavior

### Backup
- Database backup
- Media backup
- Backup frequency
- Backup location
- Retention
- Encryption

### Recovery
- Restore process
- Restore testing
- Disaster scenarios
- Recovery procedure
- Recovery verification
- Recovery responsibilities

## Rules and Decisions
- Regular automated backups
- Test restore process
- Encrypted backups
- Document recovery procedures

## Data Required
- Backup schedule
- Recovery plan

## Users Involved
- Development team
- DevOps team

## English/Amharic Requirements
- N/A for this phase

## Errors and Edge Cases
- Backup failures
- Corrupted backups
- Restore failures

## Testing
- Test backup
- Test restore
- Test disaster recovery

## Dependencies
- Phase 58 (Production Infrastructure)

## Later Phases Depending on This
- Post-Launch (Phase 63)

## Completion Condition
The system can recover from realistic failures.

## Known Limitations
- Recovery time should be documented

---

# PHASE 60 — BETA TESTING

## Purpose
Release to a controlled group.

## What This Phase Is About
Testing the complete application with real users.

## Why It Is Needed
Beta testing reveals issues not found in internal testing.

## Features and Behavior

### Features to Test
- Installation
- Registration
- Login
- New Cars
- Used Cars
- Search
- Compare
- Favorites
- Sell
- Messages
- News
- Alerts
- Notifications
- Profile

### Feedback Collection
- Bugs
- Crashes
- UI problems
- Slow operations
- Incorrect data
- Confusing workflows

### Process
- Fix → retest → repeat

## Rules and Decisions
- Controlled beta group
- Feedback collection system
- Bug tracking
- Prioritize critical fixes

## Data Required
- Beta user list
- Feedback forms

## Users Involved
- Beta testers
- Development team

## English/Amharic Requirements
- Test both languages in beta

## Errors and Edge Cases
- All real-world issues

## Testing
- This phase IS testing

## Dependencies
- Phase 58 (Production Infrastructure)
- Phase 59 (Backup and Disaster Recovery)

## Later Phases Depending on This
- Release Preparation (Phase 61)

## Completion Condition
Critical beta problems are resolved.

## Known Limitations
- Some issues may remain for post-launch

---

# PHASE 61 — RELEASE PREPARATION

## Purpose
Prepare for production release.

## What This Phase Is About
Final preparation for Play Store release.

## Why It Is Needed
Preparation ensures a smooth release.

## Features and Behavior

### Release Items
- Application name
- Application ID
- Package ID
- Version
- Build number
- Signing
- Production API
- Permissions
- Privacy policy
- Terms
- Support information
- Store assets

### Verification
- English verification
- Amharic verification
- Release checklist

## Rules and Decisions
- All release items prepared
- Privacy policy in place
- Terms available
- Store assets ready

## Data Required
- Release specifications
- Store assets

## Users Involved
- Development team
- Product team

## English/Amharic Requirements
- Verify both languages in release

## Errors and Edge Cases
- Release blockers must be fixed

## Testing
- Final verification
- Release checklist review

## Dependencies
- Phase 60 (Beta Testing)

## Later Phases Depending on This
- Play Store Release (Phase 62)

## Completion Condition
Production build is ready.

## Known Limitations
- Store review may require changes

---

# PHASE 62 — PLAY STORE RELEASE

## Purpose
Release to Google Play Store.

## What This Phase Is About
Publishing the application to the Play Store.

## Why It Is Needed
The application must be available to users.

## Features and Behavior

### Testing Tracks
- Internal testing
- Closed testing
- Production release

### Release Assets
- Android App Bundle
- Signing
- Store listing
- App description
- Screenshots
- Icon
- Permissions
- Privacy information

### Release Information
- Release version
- Release notes
- Submission status

## Rules and Decisions
- Follow recommended track order
- Proper signing
- Complete store listing
- Clear release notes

## Data Required
- Release assets
- Store credentials

## Users Involved
- Development team
- Store account owner

## English/Amharic Requirements
- Store listing in both languages

## Errors and Edge Cases
- Submission errors
- Review rejection
- Store issues

## Testing
- Test internal build
- Test production build

## Dependencies
- Phase 61 (Release Preparation)

## Later Phases Depending on This
- Post-Launch (Phase 63)

## Completion Condition
Application is successfully published.

## Known Limitations
- Store review may take time

---

# PHASE 63 — POST-LAUNCH

## Purpose
Monitor and maintain the application.

## What This Phase Is About
Ongoing monitoring and maintenance.

## Why It Is Needed
Post-launch monitoring ensures continued operation.

## Features and Behavior

### Monitoring
- Production version
- Release date
- Crash monitoring
- API monitoring
- Database monitoring
- Storage monitoring
- Performance monitoring

### Feedback
- User feedback
- Security issues
- Known problems

### Maintenance
- Bug fixes
- Version history
- Maintenance process

## Rules and Decisions
- Monitor all systems
- Respond to issues
- Regular maintenance
- Versioned releases

## Data Required
- Monitoring data
- Issue reports

## Users Involved
- Development team
- Operations team

## English/Amharic Requirements
- Support both languages in updates

## Errors and Edge Cases
- Production issues must be fixed

## Testing
- Regression testing for fixes

## Dependencies
- Phase 62 (Play Store Release)

## Later Phases Depending on This
- Version 2 / Future Development (Phase 64)

## Completion Condition
The production application is actively monitored and maintained.

## Known Limitations
- Ongoing maintenance required

---

# PHASE 64 — VERSION 2 / FUTURE DEVELOPMENT

## Purpose
Plan future features.

## What This Phase Is About
Planning and prioritizing future features.

## Why It Is Needed
The application should evolve to meet user needs.

## Features and Behavior

### Future Feature Considerations
- Proposed feature
- Feature purpose
- Problem solved
- User benefit
- Requirements
- Dependencies
- Architecture impact
- Database impact
- API impact
- Flutter impact
- Security impact
- Performance impact
- Priority
- Risks
- Estimated complexity
- Planned version
- Approval status

### Possible Future Features
- Dealer accounts
- Advanced car valuation
- Financing integrations
- Premium listings
- Advanced recommendations
- AI assistance
- Advanced moderation
- More powerful search
- Web application
- Additional markets

## Rules and Decisions
- Only after core system is stable
- Same process for every feature
- Requirements → Design → Architecture → Implementation → Testing → Integration → Release

## Data Required
- Feature proposals
- Impact analysis

## Users Involved
- Product team
- Development team
- Stakeholders

## English/Amharic Requirements
- Future features must support both languages

## Errors and Edge Cases
- N/A for planning phase

## Testing
- N/A for planning phase

## Dependencies
- Phase 63 (Post-Launch)

## Later Phases Depending on This
- New phases as features are developed

## Completion Condition
Future feature plans are documented.

## Known Limitations
- Priorities may change

---

## MASTER RULES

### Rule 1 — No Random Development
Always follow the phase order. DO NOT randomly skip between phases.

### Rule 2 — Do Not Mix Responsibilities
- Flutter must communicate with FastAPI
- Flutter must NOT directly connect to PostgreSQL
- Clear separation between frontend and backend

### Rule 3 — Keep Alerts and Notifications Separate
- **Alerts** = conditions created by users
- **Notifications** = information delivered by the system

### Rule 4 — English and Amharic Are Required from the Beginning
- Do not build in English and translate at the end
- Both languages are core requirements from Phase 0

### Rule 5 — Do Not Put Everything into main.dart
- Application logic belongs in appropriate feature and layer
- Keep main.dart minimal

### Rule 6 — Reuse Components
- Do not create multiple implementations of the same component
- Use shared components from Phase 8

### Rule 7 — Every Feature Must Handle States
- Loading
- Success
- Empty
- Error

### Rule 8 — Test Every Phase
- Do not wait until the final week to test
- Each phase has its own testing requirements

### Rule 9 — Protect Secrets
- Never commit:
  - Passwords
  - Database credentials
  - JWT secrets
  - Private keys
  - Production secrets

### Rule 10 — Document Important Decisions
- When architecture or business decisions change, update documentation

---

## PROJECT COMPLETION DEFINITION

The Car Sales application is considered **complete** when:

- ✅ Flutter application is stable
- ✅ English and Amharic work correctly
- ✅ Navigation works
- ✅ New Cars works
- ✅ Used Cars works
- ✅ Search works
- ✅ Compare works
- ✅ Favorites works
- ✅ Sell Car works
- ✅ Messages work
- ✅ News works
- ✅ Alerts work
- ✅ Notifications work
- ✅ Authentication works
- ✅ Profile works
- ✅ Settings work
- ✅ Car Loan works
- ✅ EMI Calculator works
- ✅ Backend APIs work
- ✅ PostgreSQL works
- ✅ Image storage works
- ✅ Admin system works
- ✅ Flutter and backend communicate securely
- ✅ Tests pass
- ✅ Security review is complete
- ✅ Performance is acceptable
- ✅ Backups work
- ✅ Production infrastructure works
- ✅ Beta testing is completed
- ✅ Android production release is completed
- ✅ Monitoring and maintenance are in place

---

**END OF COMPREHENSIVE MASTER DOCUMENTATION**

---

## APPENDIX: QUICK REFERENCE

### Phase Categories

| Category | Phases |
|----------|--------|
| **Definition** | Phase 0-1 |
| **Design** | Phase 2 |
| **Flutter Core** | Phase 3-8 |
| **Flutter Features** | Phase 9-25 |
| **Flutter Quality** | Phase 26-28 |
| **Backend Core** | Phase 29-32 |
| **Backend Features** | Phase 33-45 |
| **Integration** | Phase 46-53 |
| **Quality** | Phase 54-57 |
| **Production** | Phase 58-62 |
| **Maintenance** | Phase 63-64 |

### Key Decisions to Document

| Decision Area | Where to Document |
|---------------|-------------------|
| Architecture | Phase 4, 29 |
| Navigation | Phase 7 |
| Design System | Phase 6, 30 |
| API Design | Phase 34-45 |
| Security | Phase 55 |
| Performance | Phase 56 |
| Infrastructure | Phase 58 |

### Success Criteria by Phase

| Phase | Success Criteria |
|-------|------------------|
| 0-2 | Scope approved, requirements documented, designs complete |
| 3-8 | Project runs, structure established, navigation works |
| 9-28 | All features work with mock data, tests pass |
| 29-45 | APIs work, database works, storage works |
| 46-53 | Integration works, data flows correctly |
| 54-57 | End-to-end testing passes, security and performance good |
| 58-62 | Infrastructure ready, beta complete, release published |
| 63-64 | Monitoring active, future plans documented |

---

**END OF DOCUMENT**