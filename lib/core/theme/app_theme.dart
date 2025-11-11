import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() {
    const primary = Color(0xFF339CFF);
    const surface = Color(0xFF0F131A);
    const card = Color(0xFF161B22);
    const text = Color(0xFFEDEDED);

    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: surface,
      colorScheme: base.colorScheme.copyWith(
        primary: primary,
        secondary: const Color(0xFF00BFA5),
        surface: surface,
        onSurface: text,
      ),
      cardTheme: const CardTheme(
        color: card,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      textTheme: base.textTheme.copyWith(
        headlineLarge: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: text),
        headlineMedium: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: text),
        titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: text),
        bodyMedium: const TextStyle(fontSize: 14, color: Color(0xFFBAC4D1)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
