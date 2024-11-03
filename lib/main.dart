import 'package:flutter/material.dart';
import 'package:flutter_note_app/screens/DashboardScreen.dart';
import 'themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Manager',
      debugShowCheckedModeBanner: false,
      theme: sunnyCitrusTheme,
      darkTheme: darkModeTheme,
      themeMode: ThemeMode.system,
      home: const DashboardScreen(),
    );
  }
}
