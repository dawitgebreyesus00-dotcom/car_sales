import 'package:flutter/material.dart';

import '../features/bottom/alerts/alerts.dart';
import '../features/bottom/compare/compare.dart';
import '../features/bottom/new/new.dart';
import '../features/bottom/news/screens/news.dart';
import '../features/bottom/used/used.dart';
import '../core/utils/auth_status.dart';
import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

/// Root shell hosting bottom navigation + drawer (Phase 7.4, 7.5).
/// Each tab page provides its own top bar, and the shell wraps them in a
/// PageView so swiping left/right slides between tabs while tapping a tab
/// glides to it. No routes are pushed on tab switches.
class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.auth, required this.router});

  final AuthStatus auth;
  final Map<String, WidgetBuilder> router;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        children: [
          NewCarsPage(),
          UsedScreen(),
          CompareScreen(),
          NewsScreen(),
          AlertsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}