import 'package:task_management_fares/core/exceptions/api.exception.dart';

class ErrorParser {
  static List<ApiException> parseErrors(List<dynamic> errors) {
    List<ApiException> apiExceptions = [];
    for (final err in errors) {
      // extract the error code
      final errorCode = int.parse(err['error']['code'].toString());
      switch (errorCode) {
        case 1001:
          apiExceptions.add(ApiException.usernameDuplicated);
          break;
        case 1002:
          apiExceptions.add(ApiException.emailDuplicated);
          break;
      }
    }
    return apiExceptions;
  }
}
