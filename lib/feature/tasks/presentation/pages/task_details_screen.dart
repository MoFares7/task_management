import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskName;
  final String taskDescription;

  const TaskDetailsScreen({
    Key? key,
    required this.taskName,
    required this.taskDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $taskName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Description: $taskDescription',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
