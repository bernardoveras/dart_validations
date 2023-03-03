import '../helpers/helpers.dart';
import 'validators.dart';

/// Class responsible for validating if a String is a valid CNPJ.
///
/// Example:
/// ```dart
/// final cnpjValidator = CnpjValidator();
/// final email = 'example@mail.com';
/// final isValid = CnpjValidator.validate(email); // true
/// ```
class CnpjValidator implements Validator<String> {
  final _cnpjHelper = CnpjHelper();

  /// Validator that checks if the String is not null or empty.
  final _requiredValidator = RequiredValidator();

  /// Validates if a String is a valid CNPJ.
  ///
  /// Returns true if the value is null or empty or if it is a valid CNPJ.
  @override
  bool validate(String? value) {
    final cnpj = _cnpjHelper.strip(value);

    final hasValue = _requiredValidator.validate(cnpj);
    if (!hasValue) {
      return false;
    }

    // CNPJ must have 14 chars
    if (cnpj.length != 14) {
      return false;
    }

    // CNPJ can't be blacklisted
    if (_cnpjHelper.blackList.contains(cnpj)) {
      return false;
    }

    var numbers = cnpj.substring(0, 12);
    numbers += _cnpjHelper.verifierDigit(numbers).toString();
    numbers += _cnpjHelper.verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) == cnpj.substring(cnpj.length - 2);
  }
}
