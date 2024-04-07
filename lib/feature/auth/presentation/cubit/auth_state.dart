part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// Initial State
class AuthInitial extends AuthState {}

// Loading State
class AuthLoading extends AuthState {}

// Login Success State
class UserLoggedIn extends AuthState {}

// Login Error State
class UserLoginError extends AuthState {
  final String errorMessage;

  const UserLoginError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
