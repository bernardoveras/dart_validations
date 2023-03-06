import '../helpers/helpers.dart';
import 'validators.dart';

/// Class responsible for validating if a String is a valid CPF.
///
/// Example:
/// ```dart
/// final cpfValidator = CpfValidator();
/// final cpf = '864.926.616-99';
/// final isValid = CpfValidator.validate(cpf); // true
/// ```
class CpfValidator implements Validator<String> {
  final _cpfHelper = CpfHelper();

  /// Validates if a String is a valid CPF.
  ///
  /// Returns true if the value is null or empty or if it is a valid CPF.
  @override
  bool validate(String? value) {
    final isValid = _cpfHelper.validate(value);

    return isValid;
  }
}
