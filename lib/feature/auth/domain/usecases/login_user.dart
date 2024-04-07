import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';
import 'package:task_management_fares/feature/auth/domain/repositories/user_repo.dart';

class LoginUser {
  final UserRepository userRepository;

  LoginUser(this.userRepository);

  Future<Either<ApiException, Map<String, dynamic>>> call(
      User user) async {
    return await userRepository.loginUser(user);
  }
}
