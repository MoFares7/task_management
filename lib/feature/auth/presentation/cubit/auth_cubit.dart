import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/core/storage/storage.dart';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';
import 'package:task_management_fares/feature/auth/domain/usecases/login_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUser _loginUser;

  final LocalStorage _localStorage = LocalStorage.instance;

  AuthCubit(
    LoginUser loginUser,
  )   : _loginUser = loginUser,
        super(AuthInitial());
  void login(User user) async {
    emit(AuthLoading());

    try {
      final result = await _loginUser(user);

      result.fold(
        (exception) => emit(UserLoginError(exception.toString())),
        (json) async {
          // get the userToken
          final userToken = json['token'];
          final error = json['error'];

          // make sure userToken is not null
          if (userToken != null) {
            // store the userToken
            await _localStorage.saveToken(userToken);

            // emit success state
            emit(UserLoggedIn());
          } else {
            // Handle the case where userToken is not a String
            emit(const UserLoginError("Unknown error occurred"));
          }
        },
      );
    } catch (err) {
      if (kDebugMode) {
        print("Error: $err");
      }
      emit(const UserLoginError("Unknown error occurred"));
    }
  }
}
