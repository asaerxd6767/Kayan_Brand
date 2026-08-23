import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

class KayanTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: KayanColors.warmCream,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: KayanColors.primary,
        onPrimary: KayanColors.onPrimary,
        primaryContainer: KayanColors.primaryContainer,
        secondary: KayanColors.secondary,
        onSecondary: KayanColors.onPrimary,
        secondaryContainer: KayanColors.secondaryContainer,
        surface: KayanColors.surface,
        onSurface: KayanColors.onSurface,
        onSurfaceVariant: KayanColors.onSurfaceVariant,
        outline: KayanColors.outline,
        outlineVariant: KayanColors.outlineVariant,
        error: KayanColors.error,
        onError: KayanColors.onError,
      ),

      // Text Theme Configuration
      textTheme: const TextTheme(
        displayLarge: KayanTypography.displayLg,
        headlineLarge: KayanTypography.headlineLg,
        headlineMedium: KayanTypography.headlineMd,
        bodyLarge: KayanTypography.bodyLg,
        bodyMedium: KayanTypography.bodyMd,
        labelLarge: KayanTypography.labelCaps,
      ),

      // Elevated Buttons Theme Configuration
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KayanColors.warmGold,
          foregroundColor: KayanColors.deepOnyx,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: KayanRadius.borderLg),
          textStyle: KayanTypography.buttonText,
          padding: const EdgeInsets.symmetric(
            horizontal: KayanSpacing.md,
            vertical: KayanSpacing.sm,
          ),
        ),
      ),

      // Outlined Buttons Theme Configuration
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: KayanColors.deepOnyx,
          side: const BorderSide(color: KayanColors.deepOnyx, width: 1),
          shape: RoundedRectangleBorder(borderRadius: KayanRadius.borderLg),
          textStyle: KayanTypography.buttonText,
        ),
      ),

      // Bottom Sheet Theme Configuration
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: KayanColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(KayanRadius.xl)),
        ),
      ),
    );
  }
}