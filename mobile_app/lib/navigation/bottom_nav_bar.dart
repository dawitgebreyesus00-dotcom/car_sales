import 'package:car_sales_app/navigation/app_routes.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_icons.dart';

/// Bottom navigation tabs (Phase 7.4): New, Used, Compare, News, Alerts.
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static const List<String> tabRoutes = [
    AppRoutes.newCars,
    AppRoutes.usedCars,
    AppRoutes.compare,
    AppRoutes.news,
    AppRoutes.alerts,
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(AppIcons.newCars),
          label: 'New',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.usedCars),
          label: 'Used',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.compare),
          label: 'Compare',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.news),
          label: 'News',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.alerts),
          label: 'Alerts',
        ),
      ],
    );
  }
}