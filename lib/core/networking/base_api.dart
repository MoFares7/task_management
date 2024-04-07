import 'package:http/http.dart' as http;
import 'package:task_management_fares/core/storage/storage.dart';

class BaseApi {
  // main client
  final http.Client client = http.Client();
  String? baseUrl;

  final LocalStorage _localStorage = LocalStorage.instance;

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = _localStorage.getToken();
    return client.get(
      Uri.parse('$baseUrl$path'),
      headers: {
        'token': token ?? '',
        ..._defaultHeaders,
        ...?headers,
      },
    );
  }

  Future<http.Response> post(
    String path, {
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    final token = _localStorage.getToken();
    return client.post(
      Uri.parse('$baseUrl$path'),
      body: body,
      headers: {
        'token': token ?? '',
        ..._defaultHeaders,
        ...?headers,
      },
    );
  }
}
