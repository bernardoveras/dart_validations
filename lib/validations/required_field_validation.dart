import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Class responsible for validating if a field is neither null nor empty.
class RequiredFieldValidation extends Equatable implements FieldValidation {
  /// Name of the field to be validated.
  @override
  final String fieldName;

  final RequiredValidator _requiredValidator = RequiredValidator();

  @override
  List<Object> get props => [fieldName];

  RequiredFieldValidation(this.fieldName);

  /// Method that validates that the value of the specified field
  /// is neither null nor empty.
  ///
  /// Returns `null` if the field is valid, or an `error message` otherwise.
  @override
  ValidationError? validate(Map input) {
    // Checks if the field value is null or empty.
    final isValid = _requiredValidator.validate(input[fieldName]);

    // Returns an error message if the value is invalid, or null if valid.
    return isValid ? null : ValidationError.requiredField;
  }
}
