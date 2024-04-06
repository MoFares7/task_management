import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/core/app_colors.dart';

class HeadCardIdentifation extends StatelessWidget {
  const HeadCardIdentifation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Task Managment App",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.lightGreyColor),
          ),
          const Gap(4),
          Text(
            "The app has been created to help you schedule and save your tasks and to make your life simpler and organized a happy experience",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.lightGreyColor),
          )
        ],
      ),
    );
  }
}
