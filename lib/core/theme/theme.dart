import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme{
  static ThemeData light({required double surfaceOpacity}){
    final surfaceColor = const Color(0xFFFFE8BD).withValues(alpha: surfaceOpacity);
    final scaffoldColor = surfaceOpacity == 1.0 
        ? const Color(0xFFFFF2D8) 
        : const Color(0xFFFFF2D8).withValues(alpha: surfaceOpacity);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: "Exo2",
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: const Color(0xFF2B2B2B)
      ),
      cardColor: scaffoldColor,
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xFF2B2B2B),
        displayColor: const Color(0xFF2B2B2B),
        fontFamily: "Exo2"
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFFE8BD),
        brightness: Brightness.light,
        surface: surfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFFFF4B3E)
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xFFFFE8BD),
        focusColor: Color(0xFFFFE8BD),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFFFFE8BD),
            width: 0,
            style: BorderStyle.none
          )
        ),
        outlineBorder: BorderSide(
          color: Color(0xFFFFE8BD),
          width: 0,
          style: BorderStyle.none
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFFFFE8BD),
            width: 0,
            style: BorderStyle.none
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFFFFE8BD),
            width: 0,
            style: BorderStyle.none
          )
        ),
        suffixIconColor: const Color(0xFFFFE8BD),
      )
    );
  }
  static ThemeData dark({required double surfaceOpacity}){
    final surfaceColor = const Color(0xFF2A2A2A).withValues(alpha: surfaceOpacity);
    final scaffoldColor = surfaceOpacity == 1.0 
        ? const Color(0xFF1E1E1E) 
        : const Color(0xFF1E1E1E).withValues(alpha: surfaceOpacity);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: "Exo2",
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: const Color(0xFFF2ECE2)
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xFFF2ECE2),
        displayColor: const Color(0xFFF2ECE2),
        fontFamily: "Exo2"
      ),
      cardColor: scaffoldColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2A2A2A),
        brightness: Brightness.dark,
        surface: surfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFFFF6A56)
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xFF2A2A2A),
        focusColor: Color(0xFF2A2A2A),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF2A2A2A),
            width: 0,
            style: BorderStyle.none
          )
        ),
        outlineBorder: BorderSide(
          color: Color(0xFF2A2A2A),
          width: 0,
          style: BorderStyle.none
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF2A2A2A),
            width: 0,
            style: BorderStyle.none
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF2A2A2A),
            width: 0,
            style: BorderStyle.none
          )
        ),
        suffixIconColor: const Color(0xFFF2ECE2),
      ),
    );
  }

  
}