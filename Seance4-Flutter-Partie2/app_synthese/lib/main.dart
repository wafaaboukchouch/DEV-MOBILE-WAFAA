import 'package:flutter/material.dart';
import 'package:app_synthese/global/global_parameters.dart';

// Point d'entrée — Application de Synthèse Flutter
// @author Wafaa Boukchouch - MII BDCC ENSET
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Synthèse — Wafaa',
      debugShowCheckedModeBanner: false,
      routes: GlobalParameters.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006B5E)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006B5E),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF006B5E),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
