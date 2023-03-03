import 'protocols/protocols.dart';
import 'validators/validators.dart';

/// Example:
/// ```dart
/// final loginValidations = [
///   ...ValidationBuilder.field('email').required().email().build(),
///   ...ValidationBuilder.field('password').required().build(),
/// ];
/// ```
class ValidationBuilder {
  ValidationBuilder._(this.fieldName);

  static late final ValidationBuilder _instance;
  final String fieldName;
  List<FieldValidation> validations = [];

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  List<FieldValidation> build() => validations;
}
