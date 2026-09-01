import 'package:flutter/material.dart';

import '../core/utils/auth_status.dart';
import 'app_routes.dart';

/// Guards routes that require authentication (Phase 7.3).
/// If the user is not authenticated, redirects to the Login route.
class ProtectedRoute extends StatelessWidget {
  const ProtectedRoute({
    super.key,
    required this.auth,
    required this.child,
  });

  final AuthStatus auth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!auth.isAuthenticated) {
      // Redirect to login when not authenticated.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      });
      return const SizedBox.shrink();
    }
    return child;
  }
}