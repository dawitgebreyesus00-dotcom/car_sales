import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

/// Flutter design system theme (Phase 6.1, 6.6).
/// Provides light and dark [ThemeData] using the centralized color system.
class AppTheme {
  AppTheme._();

  /// Bundled base (English/Latin) font family.
  static const String kBaseFont = 'NotoSans';

  /// Bundled Amharic-capable font used as fallback for any non-Latin glyph
  /// (Phase 6.7). Allows English + Amharic in the same string.
  static const List<String> kAmharicFontFallback = ['NotoSansEthiopic'];

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    final Color scaffoldBackground =
        isDark ? AppColors.darkBackground : AppColors.background;
    final Color surfaceColor = isDark ? AppColors.darkSurface : AppColors.surface;
    final Color textPrimary =
        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final Color textSecondary =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );

    // TextTheme with base English font and Amharic fallback on every style.
    final TextTheme base = ThemeData.light().textTheme;
    TextStyle fallback(TextStyle? s) =>
        (s ?? const TextStyle()).copyWith(fontFamilyFallback: kAmharicFontFallback);

    final TextTheme textTheme = base.copyWith(
      displayLarge: fallback(base.displayLarge),
      displayMedium: fallback(base.displayMedium),
      displaySmall: fallback(base.displaySmall),
      headlineLarge: fallback(base.headlineLarge),
      headlineMedium: fallback(base.headlineMedium),
      headlineSmall: fallback(base.headlineSmall),
      titleLarge: fallback(base.titleLarge),
      titleMedium: fallback(base.titleMedium),
      titleSmall: fallback(base.titleSmall),
      bodyLarge: fallback(base.bodyLarge),
      bodyMedium: fallback(base.bodyMedium),
      bodySmall: fallback(base.bodySmall),
      labelLarge: fallback(base.labelLarge),
      labelMedium: fallback(base.labelMedium),
      labelSmall: fallback(base.labelSmall),
    ).apply(
      bodyColor: textPrimary,
      displayColor: textPrimary,
      fontFamily: kBaseFont,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      fontFamily: kBaseFont,
      textTheme: textTheme,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          fontFamily: kBaseFont,
          fontFamilyFallback: kAmharicFontFallback,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.lg,
          vertical: AppDimens.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),

      // Bottom navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
      ),

      // Buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(AppDimens.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
        ),
      ),
    );
  }
}
