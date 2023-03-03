import '../protocols/protocols.dart';
import '../validations/validations.dart';

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
    _validations.add(EmailFieldValidation(_fieldName));
    return this;
  }

  /// Adiciona uma validação de campo de tamanho mínimo à lista de validações.
  ValidationBuilder min(int length) {
    _validations.add(MinLengthFieldValidation(fieldName: _fieldName, length: length));
    return this;
  }

  /// Adiciona uma validação de campo de tamanho máximo à lista de validações.
  ValidationBuilder max(int length) {
    _validations.add(MaxLengthFieldValidation(fieldName: _fieldName, length: length));
    return this;
  }

  /// Retorna a lista de validações de campo construídas.
  List<FieldValidation> build() => _validations;
}
