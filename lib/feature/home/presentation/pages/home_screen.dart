import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/feature/home/presentation/widgets/head_card_idintifation.dart';
import 'package:task_management_fares/feature/home/presentation/widgets/main_task_box.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Hi every one',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              const Gap(16),
              const HeadCardIdentifation(),
              const Gap(16),
              Text(
                'Task Type',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MainTaskBox(
                        titleType: "Work",
                        color: AppColors.primaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TasksScreen(taskType: 'Work')),
                          );
                        },
                      );
                    }
                    if (index == 1) {
                      return MainTaskBox(
                        titleType: "Education",
                        color: AppColors.secondaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TasksScreen(taskType: 'Education')),
                          );
                        },
                      );
                    }
                    if (index == 2) {
                      return MainTaskBox(
                        titleType: "Healthy",
                        color: AppColors.skyColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TasksScreen(taskType: 'Healthy')),
                          );
                        },
                      );
                    }
                    if (index == 3) {
                      return MainTaskBox(
                        titleType: "Various",
                        color: AppColors.cardColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TasksScreen(taskType: 'Various')),
                          );
                        },
                      );
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}