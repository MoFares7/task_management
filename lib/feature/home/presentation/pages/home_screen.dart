import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/app_utils.dart';
import 'package:task_management_fares/core/storage/storage.dart';
import 'package:task_management_fares/feature/auth/presentation/pages/login_screen.dart';
import 'package:task_management_fares/feature/home/data/models/task_user_model.dart';
import 'package:task_management_fares/feature/home/presentation/cubit/task_user_cubit.dart';
import 'package:task_management_fares/feature/home/presentation/widgets/head_card_idintifation.dart';
import 'package:task_management_fares/feature/home/presentation/widgets/type_task_box.dart';
import 'package:task_management_fares/feature/tasks/presentation/pages/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final LocalStorage localStorage = LocalStorage.instance;

  @override
  Widget build(BuildContext context) {
    print(localStorage.getValue("email"));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
         automaticallyImplyLeading: false,
        title: BlocBuilder<TaskUserCubit, TaskUserState>(
          builder: (context, state) {
            if (state is GetTaskUserLoading) {
              return const Text("Loading...");
            }
            if (state is GetTaskUserSuccess) {
              final users = state.users;
              if (users.isNotEmpty) {
                final userEmail = localStorage.getValue("email");
                UserData? user;
                for (final userData in users) {
                  if (userData.email == userEmail) {
                    user = userData;
                    break;
                  }
                }
                if (user != null) {
                  final userName = user.firstName;
                  final userAvatar = user.avatar;
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(userAvatar),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Hi $userName',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  );
                } else {
                  return const Text("User not found");
                }
              } else {
                return const Text("No users found");
              }
            }
            return const Text("Error occuraed");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              AppUtils.showOptionsDialog(context, "are you sure to Logout?",
                  () {
                localStorage.clearCache();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(4),
              const HeadCardIdentifation(),
              const Gap(16),
              Text(
                'Task Type',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20),
              ),
              const Gap(16),
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
                      return TypeTaskBox(
                        titleType: "Work",
                        color: AppColors.primaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TasksScreen(taskType: 'Work')),
                          );
                        },
                      );
                    }
                    if (index == 1) {
                      return TypeTaskBox(
                        titleType: "Education",
                        color: AppColors.secondaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TasksScreen(taskType: 'Education')),
                          );
                        },
                      );
                    }
                    if (index == 2) {
                      return TypeTaskBox(
                        titleType: "Healthy",
                        color: AppColors.skyColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TasksScreen(taskType: 'Healthy')),
                          );
                        },
                      );
                    }
                    if (index == 3) {
                      return TypeTaskBox(
                        titleType: "Various",
                        color: AppColors.cardColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TasksScreen(taskType: 'Various')),
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
