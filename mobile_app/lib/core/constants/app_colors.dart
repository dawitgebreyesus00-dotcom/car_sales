import 'package:flutter/material.dart';

/// Centralized color system - Modern Ethiopian Car Marketplace with Muted Blue Brand Identity
/// Professional, clean, trustworthy design with consistent muted blue accent throughout
class AppColors {
  AppColors._();

  // ==================== BRAND COLORS ====================
  /// Primary brand color - Muted Blue for modern Ethiopian marketplace identity
  static const Color brandPrimary = Color(0xFF647FA3);
  /// Darker muted blue for primary buttons and important actions
  static const Color brandPrimaryDark = Color(0xFF526D91);
  /// Light muted blue for selected states, filters, subtle highlights
  static const Color brandPrimaryLight = Color(0xFFEAF0F7);
  /// Deep navy for headings, important text, strong visual emphasis
  static const Color brandDeepNavy = Color(0xFF34465E);

  // Legacy aliases (for backward compatibility - Ethiopian flag green)
  static const Color brandAccent = Color(0xFF1B5E20);
  static const Color brandAccentLight = Color(0xFF2E7D32);
  static const Color brandAccentDark = Color(0xFF104414);
  static const Color teal = Color(0xFF0F8F83); // Legacy premium teal

  // ==================== BRAND IDENTITY ====================
  /// Muted blue used for navigation selection, active states
  static const Color brandMutedBlue = Color(0xFF647FA3);
  /// Muted blue for disabled/less prominent elements
  static const Color brandMutedBlueSecondary = Color(0xFF8E9EBA);

  // ==================== SEMANTIC COLORS ====================
  static const Color success = Color(0xFF16A34A); // Green for successful actions
  static const Color warning = Color(0xFFD97706); // Orange/amber for warnings
  static const Color error = Color(0xFFDC2626); // Red for errors/destructive actions
  static const Color info = brandPrimary; // Muted blue for info states

  // Price/Action accent - preserved from original
  static const Color priceAccent = Color(0xFFE65100); // Amber for prices

  // ==================== LIGHT THEME NEUTRALS ====================
  /// Main background color - dominant white
  static const Color background = Colors.white;
  /// Secondary surfaces and input backgrounds
  static const Color coolGray = Color(0xFF1F1F1F); // Using cool gray variant
  /// Light neutral surfaces - #F1F4F8 equivalent
  static const Color surfaceLight = Color(0xFFF1F4F8);
  /// Card background
  static const Color cardBackground = Colors.white;
  /// Primary text color
  static const Color textPrimary = Color(0xFF1A1A2E);
  /// Secondary text color - descriptions, subtitles
  static const Color textSecondary = Color(0xFF64748B);
  /// Muted text for less important information
  static const Color textMuted = Color(0xFF6B7280);
  /// Disabled text state
  static const Color textDisabled = Color(0xFFBDBDBD);
  /// Dividers and subtle borders
  static const Color divider = Color(0xFFD9E0E8);
  /// Stronger divider for cards/sections
  static const Color dividerStrong = Color(0xFFCBD5E1);
  /// Icon color default
  static const Color iconColor = Color(0xFF4A4A4A);
  /// Muted icon color
  static const Color iconColorMuted = Color(0xFF9CA3AF);
  /// Disabled state color
  static const Color disabled = Color(0xFFBDBDBD);
  /// Red color for labels, accents
  static const Color red = Color(0xFFEF4444);
  /// Accent color for category badges
  static const Color accent = Color(0xFF3B82F6);
  /// Primary color for theming
  static const Color primary = Color(0xFF3B82F6);
  /// Light primary color for selected states
  static const Color primaryLight = Color(0xFFE0F2FE);
  /// Surface color for cards, backgrounds
  static const Color surface = Color(0xFFFFFFFF);

  // ==================== DARK THEME NEUTRALS ====================
  static const Color darkBackground = Color(0xFF18181B);
  static const Color darkSurface = Color(0xFF1F2937);
  static const Color darkCardBackground = Color(0xFF1F2937);
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFA3A3A3);
  static const Color darkTextMuted = Color(0xFF6B7280);
  static const Color darkDivider = Color(0xFF374151);
  static const Color darkDividerStrong = Color(0xFF4B5563);
  static const Color darkIconColor = Color(0xFF6B7280);
  static const Color darkIconColorMuted = Color(0xFF9CA3AF);

  // ==================== BRAND ACCENT (Legacy - Ethiopian Green) ====================
  static const Color premiumPrimary = Color(0xFF0F8F83);
  static const Color premiumPrimaryDark = Color(0xFF08756B);
  static const Color premiumBackground = Color(0xFFF7F8F8);
  static const Color premiumTextPrimary = Color(0xFF101828);
  static const Color premiumTextSecondary = Color(0xFF6B7280);
  static const Color premiumBorder = Color(0xFFE2E8F0);
  static const Color premiumSelectedBackground = Color(0xFFE2F9FF);

  // ==================== NOTIFICATION & ACTION COLORS ====================
  /// Green for successful actions (preserved from original)
  static const Color greenSuccess = Color(0xFF22C55E);
  /// Red for errors or destructive actions (preserved from original)
  static const Color redError = Color(0xFFEF4444);
  /// Orange/amber for relevant warnings (preserved from original)
  static const Color orangeWarning = Color(0xFFf97316);
  /// Gray for unselected navigation states
  static const Color navigationInactive = Color(0xFF6B7280);
  /// Light blue for selected filter chips and highlights
  static const Color selectedFilterLight = Color(0xFFEAF0F7);
  /// Muted blue for navigation inactive
  static const Color navMutedBlueInactive = Color(0xFF9CA3AF);

  // ==================== UTILITY ====================
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  // ==================== GRADIENT HELPERS ====================
  /// Primary brand gradient from muted blue to light blue
  static const LinearGradient brandGradient = LinearGradient(
    colors: [Color(0xFF647FA3), Color(0xFFEAF0F7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Primary brand gradient dark version
  static const LinearGradient brandGradientDark = LinearGradient(
    colors: [Color(0xFF526D91), Color(0xFF647FA3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Subtle gradient for cards and surfaces
  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF1F4F8)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

/// Extension for easier color access
extension AppColorsExtension on BuildContext {
  // Brand colors - use AppColors directly since ColorScheme doesn't have brand getters
  Color get brandPrimary => AppColors.brandPrimary;
  Color get brandPrimaryDark => AppColors.brandPrimaryDark;
  Color get brandPrimaryLight => AppColors.brandPrimaryLight;
  Color get brandDeepNavy => AppColors.brandDeepNavy;
  Color get brandMutedBlue => AppColors.brandMutedBlue;
  Color get brandMutedBlueSecondary => AppColors.brandMutedBlueSecondary;

  // Semantic colors
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get error => AppColors.error;

  // Neutrals
  Color get background => AppColors.background;
  Color get coolGray => AppColors.coolGray;
  Color get surfaceLight => AppColors.surfaceLight;
  Color get textPrimary => AppColors.textPrimary;
  Color get textSecondary => AppColors.textSecondary;
  Color get textMuted => AppColors.textMuted;
  Color get textDisabled => AppColors.textDisabled;
  Color get divider => AppColors.divider;
  Color get dividerStrong => AppColors.dividerStrong;
  Color get iconColor => AppColors.iconColor;
  Color get iconColorMuted => AppColors.iconColorMuted;

  // Brand accent (legacy - Ethiopian green)
  Color get brandAccent => AppColors.brandAccent;
  Color get brandAccentLight => AppColors.brandAccentLight;
  Color get teal => AppColors.teal;

  // Action colors
  Color get successGreen => AppColors.greenSuccess;
  Color get redError => AppColors.redError;
  Color get orangeWarning => AppColors.orangeWarning;

  // Navigation and selection
  Color get selectedFilterLight => AppColors.selectedFilterLight;
  Color get navMutedBlueInactive => AppColors.navMutedBlueInactive;
}