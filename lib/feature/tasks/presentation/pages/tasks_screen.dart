// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_fares/common/failur_card.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/app_utils.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/task_add_screen.dart';
import 'package:task_management_fares/feature/tasks/presentation/widgets/task_box.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key, required this.taskType});

  final String taskType;
  AppUtils appUtils = AppUtils();


  @override
  Widget build(BuildContext context) {
    context.read<TaskCubit>().fetchTasks(taskType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUtils.colorController(taskType),
        centerTitle: true,
        title: Text(
          'Task Management',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.lightGreyColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.lightGreyColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskAddScreen(
                    taskType: taskType,
                    color: AppUtils.colorController(taskType),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is GetTasksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetTasksError) {
            return Center(
              child: FailureCard(
                isNoDataView: false,
                colorButton: AppUtils.colorController(taskType),
                onRetry: () {},
              ),
            );
          } else if (state is GetTasksSuccess) {
            final tasks = state.tasks;
            if (tasks.isEmpty) {
              return Center(
                child: FailureCard(
                  isNoDataView: true,
                  colorButton: AppUtils.colorController(taskType),
                  onRetry: () {},
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          final taskID = task['id'];
                          final taskName = task['name'] ?? 'No Name';
                          final taskDescription =
                              task['description'] ?? 'No Description';
                          final taskType = task['type'];
                          return TaskBox(
                            taskID: taskID,
                            taskName: taskName,
                            taskDescription: taskDescription,
                            taskType: taskType,
                            cardColor:
                                AppUtils.colorController(taskType),
                            onDelete: () {
                              // Delete task
                              context
                                  .read<TaskCubit>()
                                  .deleteTask(taskID, taskType);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
