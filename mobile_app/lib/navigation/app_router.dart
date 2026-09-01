import 'package:flutter/material.dart';

import '../../shared/widgets/placeholder_screen.dart';
import 'app_routes.dart';

/// Central route table (Phase 7.1). Maps route names to screens.
/// Real feature screens replace the [PlaceholderScreen] as they are built.
class AppRouter {
  AppRouter._();

  static Map<String, WidgetBuilder> routes() => {
        AppRoutes.newCars: (_) =>
            const PlaceholderScreen(title: 'New Cars', subtitle: 'New Cars Screen'),
        AppRoutes.usedCars: (_) => const PlaceholderScreen(
            title: 'Used Cars', subtitle: 'Used Cars Screen'),
        AppRoutes.compare: (_) =>
            const PlaceholderScreen(title: 'Compare', subtitle: 'Compare Screen'),
        AppRoutes.news: (_) =>
            const PlaceholderScreen(title: 'News', subtitle: 'News Screen'),
        AppRoutes.alerts: (_) =>
            const PlaceholderScreen(title: 'Alerts', subtitle: 'Alerts Screen'),
        AppRoutes.home: (_) =>
            const PlaceholderScreen(title: 'Home', subtitle: 'Home Screen'),
        AppRoutes.sellCars: (_) => const PlaceholderScreen(
            title: 'Sell Your Car', subtitle: 'Sell Cars Screen'),
        AppRoutes.carLoan: (_) =>
            const PlaceholderScreen(title: 'Car Loan', subtitle: 'Car Loan Screen'),
        AppRoutes.emiCalculator: (_) => const PlaceholderScreen(
            title: 'EMI Calculator', subtitle: 'EMI Calculator Screen'),
        AppRoutes.favourites: (_) => const PlaceholderScreen(
            title: 'Favourites', subtitle: 'Favourites Screen'),
        AppRoutes.others: (_) =>
            const PlaceholderScreen(title: 'Others', subtitle: 'Others Screen'),
        AppRoutes.rateUs: (_) =>
            const PlaceholderScreen(title: 'Rate Us', subtitle: 'Rate Us Screen'),
        AppRoutes.settings: (_) =>
            const PlaceholderScreen(title: 'Settings', subtitle: 'Settings Screen'),
        AppRoutes.companyPhone: (_) => const PlaceholderScreen(
            title: 'Company Phone Number', subtitle: 'Company Phone Screen'),
        AppRoutes.connectWithUs: (_) => const PlaceholderScreen(
            title: 'Connect With Us', subtitle: 'Connect With Us Screen'),
        AppRoutes.notifications: (_) => const PlaceholderScreen(
            title: 'Notifications', subtitle: 'Notifications Screen'),
        // Protected routes currently redirect to placeholder until auth exists.
        AppRoutes.login: (_) =>
            const PlaceholderScreen(title: 'Login', subtitle: 'Login Screen'),
      };
}
