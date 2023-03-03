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

  /// Validates if a String is a valid CNPJ.
  ///
  /// Returns true if the value is null or empty or if it is a valid CNPJ.
  @override
  bool validate(String? value) {
    final bool isValid = _cnpjHelper.validate(value);

    return isValid;
  }
}
