import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Class responsible for validating if the fields exceed a maximum size.
class MaxLengthFieldValidation extends Equatable
    implements FieldLengthValidation {
  /// Name of the field to be validated.
  @override
  final String fieldName;

  /// Maximum length.
  @override
  final int length;

  late final MaxLengthValidator _maxLengthValidator;

  @override
  List<Object> get props => [fieldName, length];

  MaxLengthFieldValidation({
    required this.fieldName,
    required this.length,
  }) {
    _maxLengthValidator = MaxLengthValidator(length: length);
  }

  /// Method that validates whether the specified field value
  /// is greater than the maximum size.
  ///
  /// Returns `null` if the field is valid, or an `error message` otherwise.
  @override
  ValidationError? validate(Map input) {
    final isValid = _maxLengthValidator.validate(input[fieldName]);

    // Returns an error message if the value is invalid, or null if valid.
    return isValid ? null : ValidationError.invalidField;
  }
}
