import '../protocols/protocols.dart';
import '../validations/validations.dart';

/// Class used to build field validations based on a `fieldName`.
///
/// Example:
///
/// ```dart
/// final loginValidations = [
///   ...ValidationBuilder.field('title').min(5).build(),
///   ...ValidationBuilder.field('title').max(255).build(),
///   ...ValidationBuilder.field('email').required().email().build(),
///   ...ValidationBuilder.field('password').required().build(),
/// ];
/// ```
class ValidationBuilder {
  /// Name of the field to be validated.
  final String _fieldName;

  /// List of field validations.
  final List<FieldValidation> _validations = [];

  ValidationBuilder._(String fieldName) : _fieldName = fieldName;

  /// Returns an instance of [ValidationBuilder] with the name of the
  /// field to be validated.
  factory ValidationBuilder.field(String fieldName) {
    return ValidationBuilder._(fieldName);
  }

  /// Adds a required field validation to the validations list.
  ValidationBuilder required() {
    return this.._validations.add(RequiredFieldValidation(_fieldName));
  }

  /// Adds an email field validation to the validations list.
  ValidationBuilder email() {
    return this.._validations.add(EmailFieldValidation(_fieldName));
  }

  /// Adds a minimum length field validation to the validations list.
  ValidationBuilder min(int length) {
    assert(length > 0, 'length must be greater than zero');

    return this
      .._validations
          .add(MinLengthFieldValidation(fieldName: _fieldName, length: length));
  }

  /// Adds a maximum length field validation to the validations list.
  ValidationBuilder max(int length) {
    assert(length > 0, 'length must be greater than zero');

    return this
      .._validations
          .add(MaxLengthFieldValidation(fieldName: _fieldName, length: length));
  }

  /// Returns the list of field validations.
  List<FieldValidation> build() => _validations;
}
