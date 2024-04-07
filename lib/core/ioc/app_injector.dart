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


//     //! repositories
//     // _injector.registerLazySingleton<UserRepository>(
//     //       () => UserRepositoryImpl(_injector()),
//     // );

//     //! apis
//     // _injector.registerLazySingleton(() => UserApi());
//   }
// }

import 'package:get_it/get_it.dart';
import 'package:task_management_fares/feature/auth/data/datasources/auth_api.dart';
import 'package:task_management_fares/feature/auth/data/repositories/user_repo_impl.dart';
import 'package:task_management_fares/feature/auth/domain/repositories/user_repo.dart';
import 'package:task_management_fares/feature/auth/domain/usecases/login_user.dart';
import 'package:task_management_fares/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

class AppInjector {
  final _injector = GetIt.instance;

  GetIt get inject => _injector;

  init() async {
    //! Login TaskCubit
    _injector.registerLazySingleton<AuthCubit>(() => AuthCubit(
          _injector(),
        ));
    _injector.registerLazySingleton<TaskCubit>(() => TaskCubit());

    //! repositories
    _injector.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(_injector()),
    );

    //     //! use cases
    _injector.registerLazySingleton(() => LoginUser(_injector()));
    
    //! apis
    _injector.registerLazySingleton(() => UserApi());
  }
}
