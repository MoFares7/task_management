import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_fares/core/app_colors.dart';

class AppTheme {
  static light() {
    return ThemeData(
      textTheme: GoogleFonts.cairoTextTheme().copyWith(
        labelSmall: GoogleFonts.cairo(
          fontWeight: FontWeight.w100, // Thin
        ),
        labelMedium: GoogleFonts.cairo(
          fontWeight: FontWeight.w300, // Light
        ),
        labelLarge: GoogleFonts.cairo(
          fontWeight: FontWeight.w500, // Medium
        ),
        bodySmall: GoogleFonts.cairo(
          fontWeight: FontWeight.w300, // Light
          color: AppColors.lightGreyColor,
          fontSize: 12,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.lightGreyColor,
        ),
        bodyLarge: GoogleFonts.cairo(
          fontWeight: FontWeight.w700, // Bold
          color: AppColors.lightGreyColor,
        ),
        titleSmall: GoogleFonts.cairo(
          fontWeight: FontWeight.w500, // Medium
        ),
        titleMedium: GoogleFonts.cairo(
          fontWeight: FontWeight.w700, // Bold
        ),
        titleLarge: GoogleFonts.cairo(
          fontWeight: FontWeight.w700, // Black
        ),
        headlineSmall: GoogleFonts.cairo(
          fontWeight: FontWeight.w500, // Medium
        ),
        headlineMedium: GoogleFonts.cairo(
          fontWeight: FontWeight.w500, // Bold
          fontSize: 30,
        ),
        headlineLarge: GoogleFonts.cairo(
          fontWeight: FontWeight.w900, // Black
        ),
      ),
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primaryColor,
        seedColor: AppColors.primaryColor,
      ),
    );
  }
}
