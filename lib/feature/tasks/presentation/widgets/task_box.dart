import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/task_details_screen.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final Color cardColor;

  const TaskCard({
    Key? key,
    required this.taskName,
    required this.taskDescription,
    required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
              taskName: taskName,
              taskDescription: taskDescription,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.lightGreyColor,
              ),
              onPressed: () {
                // Implement your logic for showing options dialog
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  taskName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.lightGreyColor,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
