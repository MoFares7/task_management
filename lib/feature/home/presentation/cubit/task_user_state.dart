part of 'task_user_cubit.dart';

sealed class TaskUserState extends Equatable {
  const TaskUserState();

  @override
  List<Object> get props => [];
}

final class TaskUserInitial extends TaskUserState {}


class GetTaskUserLoading extends TaskUserState {}

class GetTaskUserSuccess extends TaskUserState {
  final List<UserData> users; 

  const GetTaskUserSuccess(this.users);

  @override
  List<Object> get props => [users];
}


class GetTaskUserError extends TaskUserState {
  final dynamic error;

  const GetTaskUserError(this.error);

  @override
  List<Object> get props => [error];
}

