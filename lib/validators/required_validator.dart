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
    // Remove todos os espaços em branco da string.
    final hydratedValue = value?.replaceAll(' ', '');

    final bool isValid = hydratedValue != null && hydratedValue.isNotEmpty;
    return isValid;
  }
}
