import 'validators.dart';

/// Class that checks if the String exceeds the maximum length.
///
/// Example:
/// ```dart
/// final validator = MaxLengthValidator(7);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MaxLengthValidator implements LengthValidator<String> {
  /// Maximum length.
  @override
  final int length;

  MaxLengthValidator({required this.length});

  /// Returns `true` if [value] has a length less than [length].
  ///
  /// Otherwise, it returns `false`.
  @override
  bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }

    if (value.length > length) {
      return false;
    }

    return true;
  }
}
