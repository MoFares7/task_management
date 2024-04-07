import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';

abstract class GetTaskUserRepository {
  Future<Either<ApiException, Map<String, dynamic>>> getTaskUser();
}
