import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens for the site.
///
/// The palette and type system are deliberately themed around a CI/CD
/// pipeline — deep "terminal" ink, a signal-green accent (a nod to Android),
/// and an amber accent for secondary highlights. Change these values to
/// restyle the whole template without touching layout code.
class AppColors {
  AppColors._();

  static const ink = Color(0xFF0E1512); // page background
  static const surface = Color(0xFF16221C); // card surface
  static const surfaceAlt = Color(0xFF1C2B23); // raised / hovered surface
  static const line = Color(0xFF2A3B31); // hairline borders
  static const accent = Color(0xFF5EE1A0); // primary — "passing" green
  static const accentAmber = Color(0xFFFFB454); // secondary — signal amber
  static const danger = Color(0xFFFF6B6B); // reserved for errors/failed state
  static const textPrimary = Color(0xFFEAF3EE);
  static const textMuted = Color(0xFF93A69B);
  static const textFaint = Color(0xFF5E7267);
}

class AppText {
  AppText._();

  static TextTheme textTheme(BuildContext context) {
    final display = GoogleFonts.spaceGrotesk();
    final body = GoogleFonts.inter();
    return TextTheme(
      displayLarge: display.copyWith(
        fontSize: 60,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.04,
        letterSpacing: -1.2,
      ),
      displayMedium: display.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.08,
        letterSpacing: -0.8,
      ),
      headlineMedium: display.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.2,
      ),
      titleLarge: display.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleMedium: body.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: body.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.6,
      ),
      bodyMedium: body.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.65,
      ),
      labelLarge: body.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
    );
  }

  /// Monospace, used narrowly for terminal lines, job ids and tech-stack
  /// pills — the "code voice" of the page, never for paragraph text.
  static TextStyle mono(
    BuildContext context, {
    double size = 13,
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      color: color ?? AppColors.accent,
      fontWeight: weight,
      height: 1.5,
    );
  }
}

ThemeData buildAppTheme(BuildContext context) {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.ink,
    colorScheme: base.colorScheme.copyWith(
      surface: AppColors.ink,
      primary: AppColors.accent,
      secondary: AppColors.accentAmber,
      error: AppColors.danger,
    ),
    textTheme: AppText.textTheme(context),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    dividerColor: AppColors.line,
  );
}

/// Breakpoints used across the layout.
class Breakpoints {
  Breakpoints._();
  static const rail = 980.0; // below this, the side rail collapses
  static const compact = 640.0; // below this, type scale shrinks further
}
