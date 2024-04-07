import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/exceptions/api.exception.dart';
import '../../../../core/networking/base_api.dart';

class TaskUserApi extends BaseApi {
  TaskUserApi() {
    baseUrl = 'https://reqres.in/api';
  }

  Future<Either<ApiException, Map<String, dynamic>>> getTaskUser() async {
    final response = await get(
      '/users',
    );
    if (kDebugMode) {
      print("code coads :${response.statusCode}");
    }
    if (kDebugMode) {
      print("body coads :${response.body}");
    }

    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body));
    } else {
      return const Left(ApiException.serverError);
    }
  }
}
