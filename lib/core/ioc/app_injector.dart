import 'package:get_it/get_it.dart';
import 'package:task_management_fares/feature/auth/data/datasources/auth_api.dart';
import 'package:task_management_fares/feature/auth/data/repositories/user_repo_impl.dart';
import 'package:task_management_fares/feature/auth/domain/repositories/user_repo.dart';
import 'package:task_management_fares/feature/auth/domain/usecases/login_user.dart';
import 'package:task_management_fares/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:task_management_fares/feature/home/data/datasources/task_user_api.dart';
import 'package:task_management_fares/feature/home/data/repositories/task_user_impl.dart';
import 'package:task_management_fares/feature/home/domain/repositories/task_user_repo.dart';
import 'package:task_management_fares/feature/home/domain/usecases/get_task_user.dart';
import 'package:task_management_fares/feature/home/presentation/cubit/task_user_cubit.dart';
import 'package:task_management_fares/feature/tasks/presentation/cubit/task_cubit.dart';

class AppInjector {
  final _injector = GetIt.instance;

  GetIt get inject => _injector;

  init() async {
    //! Cubit
    _injector.registerLazySingleton<AuthCubit>(() => AuthCubit(
          _injector(),
        ));
    _injector.registerLazySingleton<TaskCubit>(() => TaskCubit()); 
    _injector.registerLazySingleton<TaskUserCubit>(() => TaskUserCubit(
          _injector(),
        ));

    //! repositories
    _injector.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(_injector()),
    );  
    _injector.registerLazySingleton<GetTaskUserRepository>(
      () => TaskUserRepositoryImpl(_injector()),
    );

    //     //! use cases
    _injector.registerLazySingleton(() => LoginUser(_injector()));
    _injector.registerLazySingleton(() => GetTaskUsers(_injector()));
    
    //! apis
    _injector.registerLazySingleton(() => UserApi());
    _injector.registerLazySingleton(() => TaskUserApi());
  }
}
