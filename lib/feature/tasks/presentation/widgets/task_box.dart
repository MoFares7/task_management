import 'package:flutter/material.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/task_details_screen.dart';

class TaskBox extends StatelessWidget {
  final int taskID;
  final String taskName;
  final String taskDescription;
  final String taskType;
  final Color cardColor;
  final VoidCallback onDelete;

  const TaskBox({
    Key? key,
    required this.taskID,
    required this.taskName,
    required this.taskDescription,
    required this.taskType,
    required this.cardColor,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
                taskID: taskID,
                taskName: taskName,
                taskDescription: taskDescription,
                taskType: taskType),
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
                Icons.delete,
                color: AppColors.lightGreyColor,
              ),
              onPressed: () {
                // Show options dialog
                _showOptionsDialog(context);
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

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("are you sure to delete this task?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      onDelete();
                      Navigator.pop(context);
                    },
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
