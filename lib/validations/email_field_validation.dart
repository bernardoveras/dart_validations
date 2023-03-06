import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Class responsible for validating email fields.
class EmailFieldValidation extends Equatable implements FieldValidation {
  /// Field name to be validated.
  @override
  final String fieldName;

  final _emailValidator = EmailValidator();

  @override
  List<Object> get props => [fieldName];

  EmailFieldValidation(this.fieldName);

  /// Method that validates that the specified field value is a valid email.
  ///
  /// Returns `null` if the field is valid, or an `error message` otherwise.
  @override
  ValidationError? validate(Map input) {
    final isValid = _emailValidator.validate(input[fieldName]);

    // Returns an error message if the value is invalid, or null if valid.
    return isValid ? null : ValidationError.invalidField;
  }
}
