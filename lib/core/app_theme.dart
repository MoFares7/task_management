import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_fares/core/app_colors.dart';

class AppTheme {
  static light() {
    return ThemeData(
      textTheme: GoogleFonts.tajawalTextTheme().copyWith(
        labelSmall: GoogleFonts.tajawal(
          fontWeight: FontWeight.w100, // Thin
        ),
        labelMedium: GoogleFonts.tajawal(
          fontWeight: FontWeight.w300, // Light
        ),
        labelLarge: GoogleFonts.tajawal(
          fontWeight: FontWeight.w500, // Medium
        ),
        bodySmall: GoogleFonts.tajawal(
          fontWeight: FontWeight.w300, // Light
          color: AppColors.lightGreyColor,
          fontSize: 12,
        ),
        bodyMedium: GoogleFonts.tajawal(
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.lightGreyColor,
        ),
        bodyLarge: GoogleFonts.tajawal(
          fontWeight: FontWeight.w700, // Bold
          color: AppColors.lightGreyColor,
        ),
        titleSmall: GoogleFonts.tajawal(
          fontWeight: FontWeight.w500, // Medium
        ),
        titleMedium: GoogleFonts.tajawal(
          fontWeight: FontWeight.w700, // Bold
        ),
        titleLarge: GoogleFonts.tajawal(
          fontWeight: FontWeight.w700, // Black
        ),
        headlineSmall: GoogleFonts.tajawal(
          fontWeight: FontWeight.w500, // Medium
        ),
        headlineMedium: GoogleFonts.tajawal(
          fontWeight: FontWeight.w500, // Bold
          fontSize: 30,
        ),
        headlineLarge: GoogleFonts.tajawal(
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
