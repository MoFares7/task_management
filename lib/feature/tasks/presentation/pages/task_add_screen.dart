import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/common/primary_btn.dart';
import 'package:task_management_fares/common/textbox_main.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

class TaskAddScreen extends StatelessWidget {
  TaskAddScreen({super.key, required this.taskType, required this.color});

  final _formKey = GlobalKey<FormBuilderState>();
  final String taskType;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color,
      body: SafeArea(
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is TaskAddSuccess) {
              Navigator.pop(context);
            } else if (state is TaskAddError) {}
          },
          builder: (context, state) {
            return FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add New Task",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: AppColors.lightGreyColor),
                          ),
                          const Gap(16),
                          Text(
                            "Let's be Productive in your life",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppColors.lightGreyColor),
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Gap(16),
                          TextBox(
                            fieldName: "taskName",
                            title: "Task Name",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: ('Name is required')),
                            ]),
                          ),
                          const Gap(8),
                          TextBox(
                            fieldName: "taskDescription",
                            title: "Task Description",
                            validator: FormBuilderValidators.required(
                                errorText: ('Description is required')),
                          ),
                          const Gap(32),
                          PrimaryButton(
                            backgroundColor: color,
                            label: 'Add Task',
                            onPressed: () async {
                              if (_formKey.currentState!.saveAndValidate()) {
                                final task = {
                                  'name': _formKey
                                      .currentState!.fields['taskName']!.value,
                                  'description': _formKey.currentState!
                                      .fields['taskDescription']!.value,
                                };
                                //? send dispatch to add task
                                context
                                    .read<TaskCubit>()
                                    .addTask(task, taskType);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
