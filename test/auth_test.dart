import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';
import 'package:task_management_fares/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:task_management_fares/feature/auth/domain/usecases/login_user.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  group('AuthCubit', () {
    late AuthCubit authCubit;
    late MockLoginUser mockLoginUser;

    setUp(() {
      mockLoginUser = MockLoginUser();
      authCubit = AuthCubit(mockLoginUser);
    });

    tearDown(() {
      authCubit.close();
    });

    test('initial state is AuthInitial', () {
      expect(authCubit.state, equals(AuthInitial()));
    });

    blocTest<AuthCubit, AuthState>(
      'emits [AuthLoading, UserLoggedIn] when login is successful',
      build: () {
        when(mockLoginUser(User())).thenAnswer(
          (_) => Future.value(const Right({'token': 'token'})),
        );
        return authCubit;
      },
      act: (cubit) => cubit.login(User(email: 'email', password: 'password')),
      expect: () => [AuthLoading(), UserLoggedIn()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthLoading, UserLoginError] when login fails',
      build: () {
        when(mockLoginUser(User())).thenAnswer(
          (_) => Future.value(const Left(ApiException.serverError)),
        );
        return authCubit;
      },
      act: (cubit) => cubit.login(User(email: 'email', password: 'password')),
      expect: () => [AuthLoading(), isA<UserLoginError>()],
    );
  });
}
