import 'protocols/protocols.dart';
import 'validators/validators.dart';

/// Classe utilizada para construir validações de campos a partir de um [fieldName]
///
/// Como usar:
///
/// ```dart
/// final loginValidations = [
///   ...ValidationBuilder.field('email').required().email().build(),
///   ...ValidationBuilder.field('password').required().build(),
/// ];
/// ```
class ValidationBuilder {
  static late final ValidationBuilder _instance;

  /// Armazena o nome do campo a ser validado.
  final String _fieldName;

  /// Lista de validações de campo construídas.
  final List<FieldValidation> _validations = [];

  ValidationBuilder._(String fieldName) : _fieldName = fieldName;

  /// Retorna uma instância de [ValidationBuilder] com o nome do campo a ser validado.
  factory ValidationBuilder.field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance;
  }

  /// Adiciona uma validação de campo obrigatório à lista de validações.
  ValidationBuilder required() {
    _validations.add(RequiredFieldValidation(_fieldName));
    return this;
  }

  /// Adiciona uma validação de campo de e-mail à lista de validações.
  ValidationBuilder email() {
    _validations.add(EmailValidation(_fieldName));
    return this;
  }

  /// Retorna a lista de validações de campo construídas.
  List<FieldValidation> build() => _validations;
}
