import 'package:flutter/material.dart';

import '../shared/widgets/placeholder_screen.dart';
import '../core/utils/auth_status.dart';
import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

/// Root shell hosting bottom navigation + drawer (Phase 7.4, 7.5).
/// PageView + NavigationBar stay linked: swipe left/right slides between
/// tabs, tapping a tab glides to it. No routes are pushed on tab switches.
class NavigationShell extends StatefulWidget {
  const NavigationShell({
    super.key,
    required this.auth,
    required this.router,
  });

  final AuthStatus auth;
  final Map<String, WidgetBuilder> router;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static const List<String> _tabTitles = ['New Cars', 'Used Cars', 'Compare', 'News', 'Alerts'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.paddingOf(context).top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(topInset + kToolbarHeight + 6),
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Text(_tabTitles[_selectedIndex]),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        children: [
          for (final route in BottomNavBar.tabRoutes)
            PlaceholderContent(
              title: _tabTitles[BottomNavBar.tabRoutes.indexOf(route)],
              subtitle: '${_tabTitles[BottomNavBar.tabRoutes.indexOf(route)]} Screen',
            ),
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