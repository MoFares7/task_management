import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/common/primary_btn.dart';
import 'package:task_management_fares/common/textbox_main.dart';
import 'package:task_management_fares/core/app_colors.dart';
import 'package:task_management_fares/core/app_utils.dart';
import 'package:task_management_fares/core/storage/storage.dart';
import 'package:task_management_fares/feature/auth/data/models/user_moddel.dart';
import 'package:task_management_fares/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:task_management_fares/feature/auth/presentation/widgets/page_title.dart';
import 'package:task_management_fares/feature/home/presentation/pages/home_screen.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final LocalStorage localStorage = LocalStorage.instance;

  UserModel _collectFormData() {
    return UserModel(
      email: _formKey.currentState!.fields['email']!.value,
      password: _formKey.currentState!.fields['password']!.value,
    );
  }

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

                const Gap(32),

                // email field
                TextBox(
                  fieldName: "email",
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ('email is required')),
                    FormBuilderValidators.email(errorText: ('invalid email'))
                  ]),
                ),
                const Gap(16),

                // password field
                TextBox(
                  fieldName: "password",
                  title: 'Password',
                  isPasswordField: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ('Password is required')),
                  ]),
                ),
                const Gap(32),

                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      AppUtils.showLoadingDialog(context);
                    }

                    if (state is UserLoggedIn) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }

                    // failure state
                    if (state is UserLoginError) {
                      Navigator.of(context).pop();
                      ToastContext().init(context);
                      Toast.show(state.errorMessage, duration: 3);
                    }
                  },
                  child: PrimaryButton(
                    backgroundColor: AppColors.primaryColor,
                    label: ('Login'),
                    hPadding: 72,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // gather data
                        UserModel user = _collectFormData();

                        // trigger the event
                        context.read<AuthCubit>().login(user);
                        // here save email for search on user name and image
                        localStorage.saveValue("email",
                            _formKey.currentState!.fields['email']!.value);
                      }
                    },
                  ),
                ),

                const Gap(16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ("don't have account"),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
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
