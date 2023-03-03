import '../protocols/protocols.dart';

/// Class responsible for composing a list of field validations and checking if all validations are valid.
class ValidationComposite implements Validation {
  /// List of field validations to check.
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  /// Method that checks that all field validations are valid for the specified field.
  ///
  /// Returns `null` if all validations are valid, or an `error message` otherwise.
  @override
  ValidationError? validate({
    required String fieldName,
    required Map input,
  }) {
    ValidationError? error;

    // Iterates over the field validations that apply to the specified field.
    for (final validation in validations.where((v) => v.fieldName == fieldName)) {
      error = validation.validate(input);

      if (error != null) {
        return error;
      }
    }

    // Returns null if all validations are successful.
    return null;
  }
}
