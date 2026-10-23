import 'package:flutter/material.dart';

import '../features/bottom/alerts/alerts.dart';
import '../features/bottom/compare/compare.dart';
import '../features/bottom/new/new.dart';
import '../features/bottom/news/screens/news.dart';
import '../features/bottom/used/used.dart';
import '../shared/common/location/location.dart';
import '../shared/common/search/search.dart';
import '../shared/widgets/placeholder_screen.dart';
import 'app_routes.dart';

/// Central route table (Phase 7.1). Maps route names to their real feature
/// screens; only company/support and auth routes still use placeholders.
class AppRouter {
  AppRouter._();

  static Map<String, WidgetBuilder> routes() => {
    AppRoutes.home: (_) => const NewCarsPage(),
    AppRoutes.newCars: (_) => const NewCarsPage(),
    AppRoutes.usedCars: (_) => const UsedScreen(),
    AppRoutes.compare: (_) => const CompareScreen(),
    AppRoutes.news: (_) => NewsScreen(),
    AppRoutes.alerts: (_) => AlertsScreen(),
    AppRoutes.favourites: (_) => const PlaceholderScreen(
      title: 'Favourites',
      subtitle: 'Favourites Screen',
    ),
    AppRoutes.sellCars: (_) => const PlaceholderScreen(
      title: 'Sell Cars',
      subtitle: 'Sell Cars Screen',
    ),
    AppRoutes.sellCar: (_) => const PlaceholderScreen(
      title: 'Sell Car',
      subtitle: 'Sell Car Screen',
    ),
    AppRoutes.myCars: (_) => const PlaceholderScreen(
      title: 'My Cars',
      subtitle: 'My Cars Screen',
    ),
    AppRoutes.sellEasyPackages: (_) => const PlaceholderScreen(
      title: 'Sell Easy Packages',
      subtitle: 'Sell Easy Packages Screen',
    ),
    AppRoutes.carLoan: (_) => const PlaceholderScreen(
      title: 'Car Loan',
      subtitle: 'Car Loan Screen',
    ),
    AppRoutes.emiCalculator: (_) => const PlaceholderScreen(
      title: 'EMI Calculator',
      subtitle: 'EMI Calculator Screen',
    ),
    AppRoutes.searchCars: (_) => const CarSearchScreen(),
    AppRoutes.location: (_) => const CarLocationScreen(),
    AppRoutes.exploreUsedCars: (_) => const PlaceholderScreen(
      title: 'Explore Used Cars',
      subtitle: 'Explore Used Cars Screen',
    ),
    AppRoutes.carwaleAssured: (_) => const PlaceholderScreen(
      title: 'CarWale Assured',
      subtitle: 'CarWale Assured Screen',
    ),
    AppRoutes.checkCarValuation: (_) => const PlaceholderScreen(
      title: 'Check Car Valuation',
      subtitle: 'Check Car Valuation Screen',
    ),
    AppRoutes.popularCities: (_) => const PlaceholderScreen(
      title: 'Popular Cities',
      subtitle: 'Popular Cities Screen',
    ),
    AppRoutes.myListings: (_) => const PlaceholderScreen(
      title: 'My Listings',
      subtitle: 'My Listings Screen',
    ),
    AppRoutes.findDealers: (_) => const PlaceholderScreen(
      title: 'Find Dealers',
      subtitle: 'Find Dealers Screen',
    ),
    AppRoutes.settings: (_) => const PlaceholderScreen(
      title: 'Settings',
      subtitle: 'Settings Screen',
    ),
    AppRoutes.language: (_) => const PlaceholderScreen(
      title: 'Language',
      subtitle: 'Language Screen',
    ),
    AppRoutes.darkMode: (_) => const PlaceholderScreen(
      title: 'Dark Mode',
      subtitle: 'Dark Mode Screen',
    ),
    AppRoutes.aboutUs: (_) => const PlaceholderScreen(
      title: 'About Us',
      subtitle: 'About Us Screen',
    ),
    AppRoutes.appVersion: (_) => const PlaceholderScreen(
      title: 'App Version',
      subtitle: 'App Version Screen',
    ),
    AppRoutes.rateUs: (_) => const PlaceholderScreen(
      title: 'Rate Us',
      subtitle: 'Rate Us Screen',
    ),
    AppRoutes.others: (_) => const PlaceholderScreen(
      title: 'Others',
      subtitle: 'Others Screen',
    ),
    AppRoutes.visitorAgreement: (_) => const PlaceholderScreen(
      title: 'Visitor Agreement',
      subtitle: 'Visitor Agreement Screen',
    ),
    AppRoutes.privacyPolicy: (_) => const PlaceholderScreen(
      title: 'Privacy Policy',
      subtitle: 'Privacy Policy Screen',
    ),
    AppRoutes.companyPhone: (_) => const PlaceholderScreen(
      title: 'Company Phone Number',
      subtitle: 'Company Phone Screen',
    ),
    AppRoutes.connectWithUs: (_) => const PlaceholderScreen(
      title: 'Connect With Us',
      subtitle: 'Connect With Us Screen',
    ),
    AppRoutes.notifications: (_) => const PlaceholderScreen(
      title: 'Notifications',
      subtitle: 'Notifications Screen',
    ),
    // Protected routes currently redirect to placeholder until auth exists.
    AppRoutes.login: (_) =>
        const PlaceholderScreen(title: 'Login', subtitle: 'Login Screen'),
    AppRoutes.loginRequired: (_) => const PlaceholderScreen(
      title: 'Login Required',
      subtitle: 'Log in to continue',
    ),
  };
}


