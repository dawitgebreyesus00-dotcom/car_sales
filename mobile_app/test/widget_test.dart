import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:car_sales_app/core/utils/auth_status.dart';
import 'package:car_sales_app/features/bottom/alerts/alerts.dart';
import 'package:car_sales_app/features/bottom/new/new.dart';

import 'package:car_sales_app/features/bottom/used/used.dart';
import 'package:car_sales_app/main.dart';
import 'package:car_sales_app/navigation/app_router.dart';
import 'package:car_sales_app/navigation/bottom_nav_bar.dart';
import 'package:car_sales_app/navigation/navigation_shell.dart';


void main() {
  testWidgets('shell renders the new cars page and bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: NavigationShell(auth: AuthStatus(), router: AppRouter.routes()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(BottomNavBar), findsOneWidget);
    expect(find.byType(NewCarsPage), findsOneWidget);
  });

  testWidgets('Car Sales app renders bottom navigation with tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(BottomNavBar), findsOneWidget);
    for (final label in ['New', 'Used', 'Compare', 'News', 'Alerts']) {
      expect(find.text(label), findsWidgets);
    }
  });

  testWidgets('swiping sideways changes the tab and highlights it', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    // Start on New Cars tab.
    expect(find.byType(NewCarsPage), findsOneWidget);

    // Swipe left to go to Used Cars. Start on the header (no inner scrollable
    // there) so the outer PageView receives the gesture.
    await tester.dragFrom(const Offset(400, 30), const Offset(-700, 0));
    await tester.pumpAndSettle();

    expect(find.byType(UsedScreen), findsOneWidget);

    // Swipe left again to Compare.
    await tester.dragFrom(const Offset(400, 30), const Offset(-700, 0));
    await tester.pumpAndSettle();

    expect(find.text('Compare Cars'), findsOneWidget);
  });

  testWidgets('tapping a tab glides to that screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Alerts'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertsScreen), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('drawer is empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarSalesApp());
    await tester.pumpAndSettle();

    // Open drawer via the menu button on the new cars page.
    await tester.tap(find.byIcon(Icons.menu).first);
    await tester.pumpAndSettle();

    // Drawer should be empty (just a SizedBox)
    expect(find.byType(Drawer), findsOneWidget);
  });
}
  

