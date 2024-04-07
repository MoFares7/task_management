import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';

class Helper {
  Color getAppBarColor(String taskType) {
    switch (taskType) {
      case 'Various':
        return AppColors.cardColor;
      case 'Education':
        return AppColors.secondaryColor;
      case 'Healthy':
        return AppColors.skyColor;
      default:
        return AppColors.primaryColor;
    }
  }
}
