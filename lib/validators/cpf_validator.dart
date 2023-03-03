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
    final cpf = _cpfHelper.strip(value);

    final hasValue = _requiredValidator.validate(cpf);
    if (!hasValue) {
      return false;
    }

    // CPF must have 11 chars
    if (cpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (_cpfHelper.blackList.contains(cpf)) {
      return false;
    }

    var numbers = cpf.substring(0, 9);
    numbers += _cpfHelper.verifierDigit(numbers).toString();
    numbers += _cpfHelper.verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) == cpf.substring(cpf.length - 2);
  }
}
