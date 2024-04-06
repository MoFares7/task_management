// task_add_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/common/primary_btn.dart';
import 'package:task_management_fares/common/textbox_main.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/storage/database.dart';

class TaskAddScreen extends StatelessWidget {
  TaskAddScreen({Key? key, required this.taskType});

  final _formKey = GlobalKey<FormBuilderState>();
  final String taskType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add New Task",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.lightGreyColor),
                      ),
                      const Gap(16),
                      Text(
                        "Let's be Productive ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.lightGreyColor),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
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
                      const Gap(64),
                      PrimaryButton(
                        label: 'Add Task',
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate()) {
                            final task = {
                              'name': _formKey
                                  .currentState!.fields['taskName']!.value,
                              'description': _formKey.currentState!
                                  .fields['taskDescription']!.value,
                            };
                            await DatabaseHelper().insertTask(task, taskType);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
