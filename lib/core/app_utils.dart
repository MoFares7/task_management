import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';

class AppUtils {
  static Color colorController( String taskType) {
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

  // }  static void showToast(BuildContext context, String message) {
  //   ToastContext().init(context);
  //   Toast.show(
  //     message,
  //     gravity: Toast.bottom,
  //     duration: Toast.lengthLong,
  //   );
  // }

  // static void showLoadingDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     useRootNavigator: true,
  //     builder: (BuildContext context) {
  //       return const LoadingDialog();
  //     },
  //   );
  // }
}
