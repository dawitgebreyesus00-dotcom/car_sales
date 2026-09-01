import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:car_sales_app/core/utils/auth_status.dart';
import 'package:car_sales_app/main.dart';
import 'package:car_sales_app/navigation/app_router.dart';
import 'package:car_sales_app/navigation/bottom_nav_bar.dart';
import 'package:car_sales_app/navigation/navigation_shell.dart';

void main() {
  testWidgets('shell renders children directly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: NavigationShell(
          auth: AuthStatus(),
          router: AppRouter.routes(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(BottomNavBar), findsOneWidget);
  });

  testWidgets('Car Sales app renders bottom navigation with tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(BottomNavBar), findsOneWidget);
  });

  testWidgets('swiping sideways changes the tab and highlights it',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    // Start on New Cars tab.
    expect(find.text('New Cars'), findsNWidgets(2));

    // Swipe left to go to Used Cars.
    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Used Cars'), findsNWidgets(2));

    // Swipe left again to Compare.
    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Compare'), findsWidgets);
  });

  testWidgets('tapping a tab glides to that screen', (WidgetTester tester) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Alerts'));
    await tester.pumpAndSettle();

    expect(find.text('Alerts Screen'), findsOneWidget);
  });

  testWidgets('drawer opens and navigates to a section', (WidgetTester tester) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    // Open drawer via the menu button.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Drawer items are visible.
    expect(find.text('Sell Your Car'), findsOneWidget);

    // Tap a drawer item -> pushes its screen.
    await tester.tap(find.text('Sell Your Car'));
    await tester.pumpAndSettle();

    expect(find.text('Sell Cars Screen'), findsOneWidget);
  });

  testWidgets('drawer includes phone and connect items', (WidgetTester tester) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Drawer), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(find.text('Company Phone Number'), findsOneWidget);
    expect(find.text('Connect With Us'), findsOneWidget);
  });
}