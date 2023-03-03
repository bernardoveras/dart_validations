import 'validators.dart';

/// Classe que verifica se a String ultrapassa um tamanho máximo.
///
/// Como usar:
/// ```dart
/// final validator = MaxLengthValidator(7);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MaxLengthValidator implements LengthValidator<String> {
  /// Tamanho máximo da String.
  @override
  final int length;

  MaxLengthValidator({required this.length});

  /// Retorna `true` se [value] possuir um tamanho menor que [length].
  ///
  /// Caso contrário, retorna `false`.
  @override
  bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }

    if (value.length > length) {
      return false;
    }

    return true;
  }
}
