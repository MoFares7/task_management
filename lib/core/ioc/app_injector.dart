// import 'package:get_it/get_it.dart';
// import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

// class AppInjector {
//   final _injector = GetIt.instance;

//   GetIt get inject => _injector;

//   init() async {
//     //! factories
//     _injector.registerLazySingleton(
//       () => TaskCubit(),
//     );

//     //! use cases
//     // _injector.registerLazySingleton(() => SignUpUser(_injector()));
//     _injector.registerLazySingleton<TaskCubit>(() => TaskCubit());

//     //! repositories
//     // _injector.registerLazySingleton<UserRepository>(
//     //       () => UserRepositoryImpl(_injector()),
//     // );

//     //! apis
//     // _injector.registerLazySingleton(() => UserApi());
//   }
// }

import 'package:get_it/get_it.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

class AppInjector {
  final _injector = GetIt.instance;

  GetIt get inject => _injector;

  init() async {
    //! Register TaskCubit
    _injector.registerLazySingleton<TaskCubit>(() => TaskCubit());
  }
}
