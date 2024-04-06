

import 'package:get_it/get_it.dart';

class AppInjector {
  final _injector = GetIt.instance;

  GetIt get inject => _injector;

  init() async {
    //! factories
    // _injector.registerLazySingleton(
    //   () => AuthCubit(
    //     _injector(),
    //     _injector(),
    //     _injector(),
    //   ),
    // );

    //! use cases
    // _injector.registerLazySingleton(() => SignUpUser(_injector()));


    //! repositories
    // _injector.registerLazySingleton<UserRepository>(
    //       () => UserRepositoryImpl(_injector()),
    // );


    //! apis
    // _injector.registerLazySingleton(() => UserApi());

  }
}
