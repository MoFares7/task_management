import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/common/primary_btn.dart';
import 'package:task_management_fares/common/textbox_main.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/app_route.dart';
import 'package:task_management_fares/feature/auth/presentation/widgets/page_title.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // static route() {
  //   return MainRouteBuilder(
  //     destinationPage: LoginScreen(),
  //   );
  // }

  final _formKey = GlobalKey<FormBuilderState>();
  // UserModel _collectFormData() {
  //   return UserModel(
  //     email: _formKey.currentState!.fields['email']!.value,
  //     password: _formKey.currentState!.fields['password']!.value,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                // title
                const PageTitle(title: ('Login')),

                const SizedBox(height: 64),

                // email field
                TextBox(
                  fieldName: "Email",
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ('email is required')),
                    FormBuilderValidators.email(errorText: ('invalid_email'))
                  ]),
                ),
                const Gap(20),

                // password field
                TextBox(
                  fieldName: "Password",
                  title: 'Password',
                  isPasswordField: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ('Password is required')),
                  ]),
                ),
                const Gap(64),

                PrimaryButton(
                  backgroundColor: AppColors.primaryColor,
                  label: ('Login'),
                  hPadding: 72,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),

                const Gap(20),

                // Don't Have an Account Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ("don't have account"),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        // navigate back to signup page
                        Navigator.of(context)
                            .pushNamed(AppRouter.signupRoutePath);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        foregroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        ('create account'),
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
