import 'dart:convert';
import 'package:task_management_fares/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      token: json['token'] ?? "",
      error: json['error'] ?? "",
    );
  }

  String toJson() {
    final map = {'email': email, 'password': password, 'token': token, 'error': error};

    return jsonEncode(map);
  }

  UserModel({
    super.email,
    super.password,
    super.token,
    super.error,
  });
}
