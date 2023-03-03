import '../protocols/protocols.dart';
import '../validations/validations.dart';

/// Class used to build field validations based on a [fieldName].
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
  static late final ValidationBuilder _instance;

  /// Name of the field to be validated.
  final String _fieldName;

  /// List of field validations.
  final List<FieldValidation> _validations = [];

  ValidationBuilder._(String fieldName) : _fieldName = fieldName;

  /// Returns an instance of [ValidationBuilder] with the name of the field to be validated.
  factory ValidationBuilder.field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance;
  }

  /// Adds a required field validation to the validations list.
  ValidationBuilder required() {
    _validations.add(RequiredFieldValidation(_fieldName));
    return this;
  }

  /// Adds an email field validation to the validations list.
  ValidationBuilder email() {
    _validations.add(EmailFieldValidation(_fieldName));
    return this;
  }

  /// Adds a minimum length field validation to the validations list.
  ValidationBuilder min(int length) {
    _validations.add(MinLengthFieldValidation(fieldName: _fieldName, length: length));
    return this;
  }

  /// Adds a maximum length field validation to the validations list.
  ValidationBuilder max(int length) {
    _validations.add(MaxLengthFieldValidation(fieldName: _fieldName, length: length));
    return this;
  }

  /// Returns the list of field validations.
  List<FieldValidation> build() => _validations;
}
