import 'package:flutter/material.dart';

// Ocean Breeze Theme (Light Mode)
ThemeData oceanBreezeTheme = ThemeData(
  primaryColor: const Color(0xFF008CBA),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF00D1B2), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0xFFF0F4F8),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF333333)), // Replaces bodyText1
    bodyMedium: TextStyle(color: Color(0xFF333333)), // Replaces bodyText2
  ),
  iconTheme: const IconThemeData(color: Color(0xFF1E90FF)),
);

// Dark Mode Theme
ThemeData darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF212121),
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
    secondary: const Color(0xFFBB86FC), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF1E1E1E),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE0E0E0)), // Replaces bodyText1
    bodyMedium: TextStyle(color: Color(0xFFE0E0E0)), // Replaces bodyText2
  ),
  iconTheme: const IconThemeData(color: Color(0xFFBB86FC)),
);

// Lavender Dream Theme
ThemeData lavenderDreamTheme = ThemeData(
  primaryColor: const Color(0xFF9C27B0),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
    secondary: const Color(0xFFE1BEE7), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0xFFF3E5F5),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF6A1B9A)), // Replaces bodyText1
    bodyMedium: TextStyle(color: Color(0xFF6A1B9A)), // Replaces bodyText2
  ),
  iconTheme: const IconThemeData(color: Color(0xFFAB47BC)),
);

// Forest Green Theme
ThemeData forestGreenTheme = ThemeData(
  primaryColor: const Color(0xFF4CAF50),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
    secondary: const Color(0xFF8BC34A), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0xFFE8F5E9),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF2E7D32)), // Replaces bodyText1
    bodyMedium: TextStyle(color: Color(0xFF2E7D32)), // Replaces bodyText2
  ),
  iconTheme: const IconThemeData(color: Color(0xFF66BB6A)),
);

// Sunny Citrus Theme
ThemeData sunnyCitrusTheme = ThemeData(
  primaryColor: const Color(0xFFFFA726),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
    secondary: const Color(0xFFFFEB3B), // Replaces accentColor
  ),
  scaffoldBackgroundColor: const Color(0xFFFFF8E1),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF424242)), // Replaces bodyText1
    bodyMedium: TextStyle(color: Color(0xFF424242)), // Replaces bodyText2
  ),
  iconTheme: const IconThemeData(color: Color(0xFFFF9800)),
);
