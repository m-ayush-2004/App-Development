import 'package:expenses_app/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:adaptive_theme/adaptive_theme.dart';

var themeBrightOne =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0));

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: themeBrightOne,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: themeBrightOne.onPrimaryContainer,
          foregroundColor: themeBrightOne.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: themeBrightOne.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: themeBrightOne.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: themeBrightOne.onPrimaryContainer,
              ),
            ),
        
      ),
      home: const Expenses(),
    ),
  );
}
