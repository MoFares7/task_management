import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_fares/core/exceptions/api.exception.dart';
import 'package:task_management_fares/core/networking/base_api.dart';
import 'package:task_management_fares/core/storage/storage.dart';
import 'package:task_management_fares/feature/auth/data/models/user_moddel.dart';

class UserApi extends BaseApi {
  UserApi() {
    baseUrl = 'https://reqres.in/api';
  }
  final LocalStorage _localStorage = LocalStorage.instance;

  Future<Either<ApiException, Map<String, dynamic>>> loginUser(
    UserModel user,
  ) async {
    try {
      final response = await post('/login',
          headers: {'Content-Type': 'application/json'}, body: user.toJson());
      // Print response information
      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      }

      // server error status
      if (response.statusCode == 500) {
        return const Left(ApiException.serverError);
      }

      // validation error status
      if (response.statusCode == 400) {
        // decode validation errors
        return  Right(jsonDecode(response.body));
      }
      // UnExpected Result
      return const Left(ApiException.unknownError);
    } on SocketException {
      return const Left(ApiException.networkError);
    } catch (exception) {
      return const Left(ApiException.unknownError);
    }
  }
}
