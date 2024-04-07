import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/app_utils.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';
import 'package:toast/toast.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({
    Key? key,
    required this.taskID,
    required this.taskName,
    required this.taskDescription,
    required this.taskType,
  }) : super(key: key);

  final int taskID;
  final String taskName;
  final String taskDescription;
  final String taskType;

  final ValueNotifier<String> _editedTaskName = ValueNotifier<String>('');
  final ValueNotifier<String> _editedTaskDescription =
      ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    // Initialize the edited task name and description
    _editedTaskName.value = taskName;
    _editedTaskDescription.value = taskDescription;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppUtils.colorController(taskType),
        centerTitle: true,
        title: Text(
          'Task Details',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.lightGreyColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit_note_rounded,
              color: AppColors.lightGreyColor,
            ),
            onPressed: () {
              _showEditDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<String>(
              valueListenable: _editedTaskName,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title: ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      value,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black.withOpacity(0.8)),
                    ),
                  ],
                );
              },
            ),
            Divider(
              color: Colors.grey[800],
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<String>(
              valueListenable: _editedTaskDescription,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black.withOpacity(0.9)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: SingleChildScrollView(
          // Wrap the content in SingleChildScrollView
          child: Column(
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
                  _editedTaskName.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: taskDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
                decoration:
                    const InputDecoration(labelText: 'Task Description'),
                onChanged: (value) {
                  _editedTaskDescription.value = value;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final updatedTask = {
                'name': _editedTaskName.value,
                'description': _editedTaskDescription.value,
              };
              // Call the updateTask method from the TaskCubit
              context
                  .read<TaskCubit>()
                  .updateTask(taskID, taskType, updatedTask);
              Navigator.of(context).pop();

              ToastContext().init(context);
              Toast.show('Task updated successfully', duration: 3);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}



     // AppUtils.showEditDialog(
              //     context,
              //     taskName,
              //     (value) {
              //       _editedTaskName.value = value;
              //     },
              //     (value) {
              //       _editedTaskDescription.value = value;
              //     },
              //     taskDescription,
              //     () async {
              //       final updatedTask = {
              //         'name': _editedTaskName.value,
              //         'description': _editedTaskDescription.value,
              //       };
              //       // Call the updateTask method from the TaskCubit
              //       context.read<TaskCubit>().updateTask(taskID, updatedTask);
              //       Navigator.of(context).pop();

              //       ToastContext().init(context);
              //       Toast.show('Task updated successfully', duration: 3);
              //     });