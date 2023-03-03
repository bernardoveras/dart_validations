import 'validators.dart';

/// Classe responsável pela validação de campos obrigatórios.
///
/// Como usar:
/// ```dart
/// final validator = RequiredValidator();
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class RequiredValidator implements Validator<String> {
  /// Retorna `true` se a string não for nula e vazia.
  ///
  /// Caso contrário, retorna `false`.
  @override
  bool validate(String? value) {
    final bool isValid = value != null && value.isNotEmpty;
    return isValid;
  }
}
