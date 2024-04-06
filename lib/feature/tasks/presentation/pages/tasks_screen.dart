// tasks_screen.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/storage/database.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/task_add_screen.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/task_details_screen.dart';
import 'package:task_management_fares/feature/tasks/presentation/widgets/task_box.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key, required this.taskType}) : super(key: key);

  final String taskType;

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Future<List<Map<String, dynamic>>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _fetchTasks(widget.taskType);
  }

  Future<void> _fetchTasks(String taskType) async {
    setState(() {
      _tasksFuture = DatabaseHelper().fetchTasksByType(taskType);
    });
  }

  @override
  Widget build(BuildContext context) {
    late Color appBarColor;

    // Define switch case to set the color based on the task type
    switch (widget.taskType) {
      case 'Various':
        appBarColor = AppColors.cardColor;
        break;
      case 'Education':
        appBarColor = AppColors.secondaryColor;
        break;
      case 'Healthy':
        appBarColor = AppColors.skyColor;
        break;
      default:
        appBarColor = AppColors.primaryColor;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(
          'Task Management',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.lightGreyColor),
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
                    taskType: widget.taskType,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _tasksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No tasks available',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              );
            } else {
              return Column(
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
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final task = snapshot.data![index];
                        final taskName = task['name'] ?? 'No Name';
                        final taskDescription =
                            task['description'] ?? 'No Description';
                        return TaskCard(
                          taskName: taskName,
                          taskDescription: taskDescription,
                          cardColor: appBarColor
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

void _showOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Task Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Task'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete Task'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
