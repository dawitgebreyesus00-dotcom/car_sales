import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'core/utils/auth_status.dart';
import 'navigation/app_router.dart';
import 'navigation/navigation_shell.dart';

void main() {
  runApp(const CarSalesApp());
}

class CarSalesApp extends StatefulWidget {
  const CarSalesApp({super.key});

  @override
  State<CarSalesApp> createState() => _CarSalesAppState();
}

class _CarSalesAppState extends State<CarSalesApp> {
  final AuthStatus _auth = AuthStatus();

  @override
  void dispose() {
    _auth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Sales',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routes: AppRouter.routes(),
      home: NavigationShell(
        auth: _auth,
        router: AppRouter.routes(),
      ),
    );
  }
}