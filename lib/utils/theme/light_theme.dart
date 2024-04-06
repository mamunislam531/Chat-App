 import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';

class LightThemes {
  static ThemeData light = ThemeData(

      /// Appbar Theme Data
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bg1LightColor,
          iconTheme: IconThemeData(color: Colors.white),
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle:
              TextStyle(color: AppColors.primaryLightColor, fontSize: 23)),

      /// App Text Theme Data
      textTheme: const TextTheme().copyWith(
        displayLarge: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.redAccent),
        displaySmall: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.redAccent),
        displayMedium: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.redAccent),
        bodyLarge: const TextStyle(fontSize: 15, color: AppColors.textLightColor),  // TextField Text
        bodySmall: const TextStyle(fontSize: 15, color: Colors.green),
        bodyMedium: const TextStyle(fontSize: 15, color: AppColors.textLightColor),  // Normal text
        labelSmall: const TextStyle(fontSize: 8, color: Colors.pink),
        labelMedium: const TextStyle(fontSize: 8, color: Colors.pink),
        labelLarge: const TextStyle(fontSize: 8, color: Colors.pink),
        titleMedium: const TextStyle(fontSize: 12, color: AppColors.textLightColor), // TextField Hint Text
        titleSmall: const TextStyle(fontSize: 2, color: Colors.grey),
        titleLarge: const TextStyle(fontSize: 2, color: Color(0xffFFFFFF)),
        headlineSmall: const TextStyle(fontSize: 8, color: Colors.pink),
        headlineMedium: const TextStyle(fontSize: 8, color: Colors.pink),
        headlineLarge: const TextStyle(fontSize: 8, color: Colors.pink),


      ),

      /// App  Others Theme Data
      primaryColor: Colors.yellow,
      canvasColor: Colors.redAccent,
      scaffoldBackgroundColor: AppColors.bgLightColor,
      cardColor: const Color(0xFF6DD0B4),
      cardTheme: const CardTheme(color: Color(0xFF6DD0B4),),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.secondaryLightColor,
      ));
}
