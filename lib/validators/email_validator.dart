import '../regex/regex.dart';
import 'validators.dart';

/// Class responsible for validating if a String is a valid email address.
///
/// Uses a regular expression to check if the email format is valid.
///
/// Example:
/// ```dart
/// final emailValidator = EmailValidator();
/// final email = 'example@mail.com';
/// final isValid = emailValidator.validate(email); // true
/// ```
class EmailValidator implements Validator<String> {
  /// Validates if a String is a valid email.
  ///
  /// Returns true if the value is null or empty or
  /// if it is a valid email address.
  ///
  /// Otherwise, it returns false.
  @override
  bool validate(String? value) {
    final isValid =
        value == null || value.isEmpty || emailRegex.hasMatch(value);
    return isValid;
  }
}
