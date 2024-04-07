import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:toast/toast.dart';

class AppUtils {
  static Color colorController(String taskType) {
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

  static void showToast(BuildContext context, String message) {
    ToastContext().init(context);
    Toast.show(
      message,
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  }

  static void showEditDialog(
      BuildContext context,
      String taskName,
      Function(String)? onChangedTitle,
      Function(String)? onChangedDescription,
      String taskDescription,
      Function()? onPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: taskName,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Task Name'),
              onChanged: (value) {
                onChangedTitle;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: taskDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Task Description'),
              onChanged: (value) {
                onChangedDescription;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void showOptionsDialog(
    BuildContext context,
    String title,
    Function()? onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      "Yes",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
