import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<ApiException, Map<String, dynamic>>> loginUser(
      User user);

}
