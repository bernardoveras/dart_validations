import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Class responsible for validating if the fields have a minimum size.
class MinLengthFieldValidation extends Equatable implements FieldLengthValidation {
  /// Field name to be validated.
  @override
  final String fieldName;

  /// Minimum length.
  @override
  final int length;

  late final MinLengthValidator _minLengthValidator;

  @override
  List<Object> get props => [fieldName, length];

  MinLengthFieldValidation({
    required this.fieldName,
    required this.length,
  }) {
    _minLengthValidator = MinLengthValidator(length: length);
  }

  /// Method that validates whether the specified field value is null, empty, or less than the minimum size.
  ///
  /// Returns `null` if the field is valid, or an `error message` otherwise.
  @override
  ValidationError? validate(Map input) {
    final bool isValid = _minLengthValidator.validate(input[fieldName]);

    // Returns an error message if the value is invalid, or null if valid.
    return isValid ? null : ValidationError.invalidField;
  }
}
