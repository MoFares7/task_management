import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';

class TypeTaskBox extends StatelessWidget {
  const TypeTaskBox(
      {super.key, required this.titleType, required this.color, this.onTap});

  final String titleType;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.lightGreyColor,
            ),
            const SizedBox(height: 8),
            Text(
              titleType,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.lightGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
