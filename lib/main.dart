import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management_fares/core/app_theme.dart';
import 'package:task_management_fares/core/ioc/app_injector.dart';
import 'package:task_management_fares/core/storage/storage.dart';
import 'package:task_management_fares/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:task_management_fares/feature/auth/presentation/pages/login_screen.dart';
import 'package:task_management_fares/feature/home/presentation/pages/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

final AppInjector appInjector = AppInjector();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // make the notification bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // initialize injector
  await GetStorage.init();
  await appInjector.init();

  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final LocalStorage localStorage = LocalStorage.instance;
 

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => appInjector.inject<AuthCubit>(),
          ),
        BlocProvider<TaskCubit>(
          create: (context) => appInjector.inject<TaskCubit>(),
        ),
      ],
      child: MaterialApp(
          title: 'Tasks Management',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                ],
              ),
          home: localStorage.getToken() == null ?
           LoginScreen() : HomeScreen()),
    );
  }
}
