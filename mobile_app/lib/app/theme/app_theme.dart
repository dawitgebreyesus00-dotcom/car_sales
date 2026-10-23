import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_dimens.dart';

/// Modern Ethiopian Car Marketplace Theme
/// Uses Inter (body) + Poppins (headings) via Google Fonts
/// Clean white background, dark gray icons, single accent color
class AppTheme {
  AppTheme._();

  /// Base font: Inter (via Google Fonts)
  static const String kBaseFont = 'Inter';

  /// Heading font: Poppins (via Google Fonts)
  static const String kHeadingFont = 'Poppins';

  /// Amharic fallback
  static const List<String> kAmharicFontFallback = ['NotoSansEthiopic'];

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    // Modern color palette - Ethiopian car marketplace
    const Color brandAccent = Color(0xFF1B5E20); // Deep green - Ethiopian flag inspired
    const Color brandAccentLight = Color(0xFF2E7D32);

    final Color scaffoldBackground = isDark
        ? const Color(0xFF121212)
        : Colors.white;
    final Color surfaceColor = isDark
        ? const Color(0xFF1E1E1E)
        : const Color(0xFFFAFAFA);
    final Color cardColor = isDark
        ? const Color(0xFF242424)
        : Colors.white;
    final Color textPrimary = isDark
        ? Colors.white
        : const Color(0xFF1A1A2E);
    final Color textSecondary = isDark
        ? const Color(0xFFB0B0B0)
        : const Color(0xFF6B6B6B);
    final Color textMuted = isDark
        ? const Color(0xFF808080)
        : const Color(0xFF9E9E9E);
    final Color dividerColor = isDark
        ? const Color(0xFF333333)
        : const Color(0xFFE0E0E0);
    final Color iconColor = isDark
        ? const Color(0xFFB0B0B0)
        : const Color(0xFF4A4A4A);

    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: brandAccent,
      onPrimary: Colors.white,
      primaryContainer: brandAccentLight,
      onPrimaryContainer: Colors.white,
      secondary: brandAccentLight,
      onSecondary: Colors.white,
      secondaryContainer: brandAccent,
      onSecondaryContainer: Colors.white,
      tertiary: const Color(0xFFE65100), // Amber for warnings/prices
      onTertiary: Colors.white,
      error: const Color(0xFFC62828),
      onError: Colors.white,
      surface: surfaceColor,
      onSurface: textPrimary,
      surfaceContainerHighest: cardColor,
      outline: dividerColor,
      outlineVariant: dividerColor,
      shadow: isDark ? Colors.black87 : Colors.black26,
      scrim: isDark ? Colors.black87 : Colors.black54,
      inverseSurface: isDark ? Colors.white : const Color(0xFF1A1A2E),
      onInverseSurface: isDark ? const Color(0xFF1A1A2E) : Colors.white,
      inversePrimary: brandAccentLight,
    );

    // Build text theme with Google Fonts
    final TextTheme textTheme = _buildTextTheme(textPrimary, textSecondary, textMuted, isDark);

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
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        iconTheme: IconThemeData(color: iconColor, size: 24),
        actionsIconTheme: IconThemeData(color: iconColor, size: 24),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shadowColor: isDark ? Colors.black87 : Colors.black12,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          side: BorderSide(color: dividerColor, width: 1),
        ),
        margin: const EdgeInsets.all(AppDimens.sm),
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
          borderSide: BorderSide(color: dividerColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: BorderSide(color: dividerColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: const BorderSide(color: brandAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: const BorderSide(color: Color(0xFFC62828), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          borderSide: const BorderSide(color: Color(0xFFC62828), width: 2),
        ),
        labelStyle: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: GoogleFonts.inter(
          color: textMuted,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: GoogleFonts.poppins(
          color: brandAccent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: iconColor,
        suffixIconColor: iconColor,
      ),

      // Bottom navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: brandAccent,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: brandAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(AppDimens.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.xl,
            vertical: AppDimens.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: brandAccent,
          minimumSize: const Size.fromHeight(AppDimens.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.xl,
            vertical: AppDimens.md,
          ),
          side: const BorderSide(color: brandAccent, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: brandAccent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.md,
            vertical: AppDimens.sm,
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor: surfaceColor,
        selectedColor: brandAccent.withValues(alpha: 0.12),
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: brandAccent,
        ),
        side: BorderSide(color: dividerColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.md,
          vertical: AppDimens.xs,
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: AppDimens.md,
      ),

      // List tiles
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.lg,
          vertical: AppDimens.xs,
        ),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        subtitleTextStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
        leadingAndTrailingTextStyle: GoogleFonts.inter(
          fontSize: 13,
          color: textSecondary,
        ),
        iconColor: iconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
      ),

      // Dialogs
      dialogTheme: DialogThemeData(
        backgroundColor: surfaceColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        contentTextStyle: GoogleFonts.inter(
          fontSize: 15,
          color: textSecondary,
        ),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textPrimary,
        contentTextStyle: GoogleFonts.inter(
          fontSize: 14,
          color: scaffoldBackground,
        ),
        actionTextColor: brandAccentLight,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
        elevation: 4,
      ),

      // Progress indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: brandAccent,
        linearTrackColor: dividerColor,
        circularTrackColor: dividerColor,
      ),

      // Slider
      sliderTheme: SliderThemeData(
        activeTrackColor: brandAccent,
        inactiveTrackColor: dividerColor,
        thumbColor: brandAccent,
        overlayColor: brandAccent.withValues(alpha: 0.12),
        valueIndicatorColor: brandAccent,
        valueIndicatorTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Tab bar
      tabBarTheme: TabBarThemeData(
        labelColor: brandAccent,
        unselectedLabelColor: textSecondary,
        indicatorColor: brandAccent,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        dividerColor: Colors.transparent,
      ),

      // Tooltips
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: textPrimary,
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
        ),
        textStyle: GoogleFonts.inter(
          color: scaffoldBackground,
          fontSize: 12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.md,
          vertical: AppDimens.sm,
        ),
      ),

      // Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(textMuted),
        trackColor: WidgetStateProperty.all(Colors.transparent),
        thickness: WidgetStateProperty.all(6),
        radius: const Radius.circular(3),
      ),
    );
  }

  static TextTheme _buildTextTheme(
    Color textPrimary,
    Color textSecondary,
    Color textMuted,
    bool isDark,
  ) {
    return TextTheme(
      // Display styles - Poppins for large headings
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.22,
      ),

      // Headline styles - Poppins
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.33,
      ),

      // Title styles - Poppins for section titles
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.15,
        height: 1.33,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.38,
      ),

      // Body styles - Inter for readable body text
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: 0.15,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // Label styles - Poppins for buttons, chips, labels
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.29,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    ).apply(
      bodyColor: textPrimary,
      displayColor: textPrimary,
      fontFamily: kBaseFont,
      fontFamilyFallback: kAmharicFontFallback,
    );
  }
}