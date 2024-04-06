part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

//! get tasks bloc state
class GetTasksLoading extends TaskState {}

class GetTasksSuccess extends TaskState {
  final List<Map<String, dynamic>> tasks;

  const GetTasksSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class GetTasksError extends TaskState {
  final String error;

  const GetTasksError(this.error);

  @override
  List<Object> get props => [error];
}

//! add task bloc state
class TaskAddLoading extends TaskState{}

class TaskAddSuccess extends TaskState{}

class TaskAddError  extends TaskState{ 
   final String error;

  const TaskAddError(this.error);

  @override
  List<Object> get props => [error];
}

//! delete task bloc state
class TaskDeleteLoading extends TaskState {}

class TaskDeleteSuccess extends TaskState {}

class TaskDeleteError extends TaskState {
  final String error;

  const TaskDeleteError(this.error);

  @override
  List<Object> get props => [error];
}
