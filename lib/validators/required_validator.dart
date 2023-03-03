import 'validators.dart';

/// Class responsible for validating mandatory fields.
///
/// Example:
/// ```dart
/// final validator = RequiredValidator();
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class RequiredValidator implements Validator<String> {
  /// Returns `true` if the string is not null and empty.
  ///
  /// Otherwise, it returns `false`.
  @override
  bool validate(String? value) {
    // Removes all whitespace from the string.
    final hydratedValue = value?.replaceAll(' ', '');

    final bool isValid = hydratedValue != null && hydratedValue.isNotEmpty;
    return isValid;
  }
}
