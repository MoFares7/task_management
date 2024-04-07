import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/feature/home/data/datasources/task_user_api.dart';

import '../../domain/repositories/task_user_repo.dart';

class TaskUserRepositoryImpl implements GetTaskUserRepository {
  final TaskUserApi taskUserApi;

  TaskUserRepositoryImpl(this.taskUserApi);

  @override
  Future<Either<ApiException, Map<String, dynamic>>> getTaskUser() async {
    return await taskUserApi.getTaskUser();
  }
}
