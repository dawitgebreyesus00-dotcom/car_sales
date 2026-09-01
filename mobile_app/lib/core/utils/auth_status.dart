import 'package:flutter/foundation.dart';

/// Holds authentication state. Real authentication (later feature) will drive
/// [isAuthenticated]. Meanwhile it defaults to authenticated so navigation
/// works during Phase 7 scaffolding.
class AuthStatus extends ChangeNotifier {
  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  void setAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}