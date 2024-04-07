import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/storage/database.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_management_fares/utils/helper.dart';

class TaskDetailsScreen extends StatefulWidget {
  final int taskID;
  final String taskName;
  final String taskDescription;
  final String taskType;

  TaskDetailsScreen({
    Key? key,
    required this.taskID,
    required this.taskName,
    required this.taskDescription,
    required this.taskType,
  }) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late String _editedTaskName;
  late String _editedTaskDescription;

  @override
  void initState() {
    super.initState();
    _editedTaskName = widget.taskName;
    _editedTaskDescription = widget.taskDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Helper().getAppBarColor(widget.taskType),
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
              _showEditDialog(widget.taskID);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $_editedTaskName',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
            Divider(
              color: Colors.grey[800],
            ),
            const SizedBox(height: 16),
            Text(
              _editedTaskDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black.withOpacity(0.9)),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(int taskID) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: _editedTaskName,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Task Name'),
              onChanged: (value) {
                setState(() {
                  _editedTaskName = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _editedTaskDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Task Description'),
              onChanged: (value) {
                setState(() {
                  _editedTaskDescription = value;
                });
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
            onPressed: () async {
              final updatedTask = {
                'name': _editedTaskName,
                'description': _editedTaskDescription,
              };
              // Call the updateTask method from the TaskCubit
              context.read<TaskCubit>().updateTask(widget.taskID, updatedTask);
              Navigator.of(context).pop(); 
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Task updated successfully'),
                ),
              );
            },
            child: const Text('Save'),
          ),

        ],
      ),
    );
  }
}
