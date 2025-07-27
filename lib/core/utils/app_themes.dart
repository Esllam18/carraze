import 'package:flutter/material.dart';
import '../consts/app_colors.dart'; // Your centralized color palette

enum AppThemeType { modernBlue, modernTeal, pastel, neumorphic }

class AppTheme {
  static const String _fontFamily = 'Roboto';

  // Theme pairs (light/dark)
  static final ThemeData modernBlueLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    ),
    // ... More customizations
  );

  static final ThemeData modernBlueDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.white,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    ),
    // ... More customizations
  );

  static final ThemeData modernTealLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondary,
      brightness: Brightness.light,
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.white,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    ),
    // ... More customizations
  );

  static final ThemeData modernTealDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondary,
      brightness: Brightness.dark,
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryDark,
      foregroundColor: AppColors.white,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    ),
    // ... More customizations
  );

  // Add pastel and neumorphic (light/dark) similarly...

  // Centralized theme getter
  static ThemeData getTheme(AppThemeType type, {bool isDark = false}) {
    switch (type) {
      case AppThemeType.modernBlue:
        return isDark ? modernBlueDark : modernBlueLight;
      case AppThemeType.modernTeal:
        return isDark ? modernTealDark : modernTealLight;
      // Add pastel and neumorphic returns here...
      default:
        return isDark ? modernBlueDark : modernBlueLight;
    }
  }

  // Example: Adaptive theme using system brightness
  static ThemeData adaptiveTheme(BuildContext context, AppThemeType type) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return getTheme(type, isDark: brightness == Brightness.dark);
  }
}
