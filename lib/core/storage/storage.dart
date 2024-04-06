import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static LocalStorage? _instance;
  final GetStorage storage = GetStorage();

  // Private constructor to prevent instantiation from outside
  LocalStorage._();

  // Singleton instance getter
  static LocalStorage get instance {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  Future<void> saveToken(String token) async {
    // delete double quotes from token
    token = token.replaceAll('"', '');

    await storage.write("USER_TOKEN", token);
  }

  String? getToken() {
    return storage.read("USER_TOKEN");
  }

  Future<void> clearCache() async {
    await storage.erase();
  }

}
