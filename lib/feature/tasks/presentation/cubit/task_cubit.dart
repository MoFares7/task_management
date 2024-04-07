// task_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management_fares/core/storage/database.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  Future<void> fetchTasks(String taskType) async {
    emit(GetTasksLoading());
    try {
      // Fetch tasks from the database
      final tasks = await DatabaseHelper().fetchTasksByType(taskType);

      emit(GetTasksSuccess(tasks));
    } catch (e) {
      emit(GetTasksError(e.toString()));
    }
  }

  Future<void> addTask(Map<String, dynamic> task, String taskType) async {
    emit(TaskAddLoading());
    try {
      // Insert task into the database
      await DatabaseHelper().insertTask(task, taskType);

      emit(TaskAddSuccess());
      fetchTasks(taskType);
    } catch (e) {
      emit(TaskAddError(e.toString()));
    }
  }

  Future<void> updateTask(
      int taskId, String taskType, Map<String, dynamic> updatedTask) async {
    emit(TaskUpdateLoading());
    try {
      await DatabaseHelper().updateTask(taskId, updatedTask);
      emit(TaskUpdateSuccess());
      fetchTasks(taskType);
    } catch (e) {
      emit(TaskUpdateError(e.toString()));
    }
  }

  Future<void> deleteTask(int taskId, String taskType) async {
    emit(TaskDeleteLoading());
    try {
      await DatabaseHelper().deleteTask(taskId);
      emit(TaskDeleteSuccess());
      fetchTasks(taskType);
    } catch (e) {
      emit(TaskDeleteError(e.toString()));
    }
  }
}
