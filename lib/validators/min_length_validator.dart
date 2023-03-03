import 'validators.dart';

/// Class that checks if the String has a minimum length.
///
/// Example:
/// ```dart
/// final validator = MinLengthValidator(5);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MinLengthValidator implements LengthValidator<String> {
  /// Minimum length.
  @override
  final int length;

  /// Validator that checks if the String is not null or empty.
  final _requiredValidator = RequiredValidator();

  MinLengthValidator({
    required this.length,
  }) : assert(length > 0, 'O tamanho mínimo deve ser maior que zero.');

  /// Returns `true` if [value] is not null, is not empty, and has a minimum length of [length].
  ///
  /// Otherwise, it returns `false`.
  @override
  bool validate(String? value) {
    final hasValue = _requiredValidator.validate(value);

    if (!hasValue) {
      return false;
    }

    if (value!.length < length) {
      return false;
    }

    return true;
  }
}
