import 'package:ca_flutter_test/core/utils/string_extensions.dart';

class AuthValidators {
  static bool validateEmail(String? value) {
    if (value == null) return true;

    return value.isValidEmail();
  }

  static bool validatePassword(String? value) {
    if (value == null) return true;

    return value.isNotEmpty;
  }
}
