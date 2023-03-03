import '../helpers/helpers.dart';
import 'validators.dart';

/// Class responsible for validating if a String is a valid email address.
///
/// Uses a regular expression to check if the email format is valid.
///
/// Example:
/// ```dart
/// final cpfValidator = CpfValidator();
/// final email = 'example@mail.com';
/// final isValid = CpfValidator.validate(email); // true
/// ```
class CpfValidator implements Validator<String> {
  final _cpfHelper = CpfHelper();

  /// Validator that checks if the String is not null or empty.
  final _requiredValidator = RequiredValidator();

  /// Validates if a String is a valid CPF.
  ///
  /// Returns true if the value is null or empty or if it is a valid CPF.
  @override
  bool validate(String? value) {
    final bool isValid = _cpfHelper.validate(value);

    return isValid;
  }
}
