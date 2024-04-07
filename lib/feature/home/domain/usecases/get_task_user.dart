import 'package:dartz/dartz.dart';
import 'package:task_management_fares/feature/home/domain/repositories/task_user_repo.dart';
import '../../../../core/exceptions/api.exception.dart';

class GetTaskUsers {
  final GetTaskUserRepository taskUserRepository;

  GetTaskUsers(this.taskUserRepository);

  Future<Either<ApiException, Map<String, dynamic>>> call() async {
    return await taskUserRepository.getTaskUser();
  }
}
