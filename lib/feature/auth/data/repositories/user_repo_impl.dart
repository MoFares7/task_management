import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/feature/auth/data/datasources/auth_api.dart';
import 'package:task_management_fares/feature/auth/data/models/user_moddel.dart';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';
import 'package:task_management_fares/feature/auth/domain/repositories/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
  Future<Either<ApiException, Map<String, dynamic>>> loginUser(
   User user
  ) async {
    return await userApi.loginUser(user as UserModel);
  }

}
