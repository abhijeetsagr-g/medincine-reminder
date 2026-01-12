import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryTeal = Colors.teal;
  static const Color accentOrange = Colors.orange;

  static ThemeData theme = ThemeData(
    primaryColor: primaryTeal,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryTeal,
      primary: primaryTeal,
      secondary: accentOrange,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accentOrange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: accentOrange),
    ),
  );
}
