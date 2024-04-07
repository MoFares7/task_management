import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management_fares/feature/home/data/models/task_user_model.dart';
import 'package:task_management_fares/feature/home/domain/usecases/get_task_user.dart';

part 'task_user_state.dart';

class TaskUserCubit extends Cubit<TaskUserState> {
  final GetTaskUsers _getTaskUser;

  TaskUserCubit(this._getTaskUser) : super(TaskUserInitial());

  void getTaskUser() async {
    emit(GetTaskUserLoading());
    try {
      final result = await _getTaskUser();
      result.fold(
        (error) => emit(GetTaskUserError(error)),
        (data) {
          final List<UserData> users = (data['data'] as List)
              .map((userData) => UserData.fromJson(userData))
              .toList();
          emit(GetTaskUserSuccess(users));
        },
      );
    } catch (e) {
      emit(GetTaskUserError(e.toString()));
    }
  }
}
