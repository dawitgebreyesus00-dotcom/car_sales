import 'package:flutter/material.dart';

/// Centralized color system (Phase 6.2).
/// Light and dark variants are provided so every screen uses consistent colors.
class AppColors {
  AppColors._();

  // Brand / primary
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryDark = Color(0xFF0D47A1);
  static const Color primaryLight = Color(0xFF42A5F5);

  // Accent
  static const Color accent = Color(0xFFFF9800);

  // Semantic
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color error = Color(0xFFC62828);
  static const Color info = Color(0xFF0277BD);

  // Light theme neutrals
  static const Color background = Color(0xFFF5F6FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textDisabled = Color(0xFFB0B8C4);
  static const Color divider = Color(0xFFE5E7EB);

  // Dark theme neutrals
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFF5F6FA);
  static const Color darkTextSecondary = Color(0xFFB0B8C4);
}
