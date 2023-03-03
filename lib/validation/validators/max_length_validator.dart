import 'validators.dart';

/// Classe que verifica se a String ultrapassa um tamanho máximo.
///
/// Como usar:
/// ```dart
/// final validator = MaxLengthValidator(7);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MaxLengthValidator implements Validator<String> {
  /// Tamanho mínimo da String.
  final int size;

  MaxLengthValidator({required this.size});

  /// Retorna `true` se [value] não for nulo, não for vazio e possuir um tamanho mínimo de [size].
  ///
  /// Caso contrário, retorna `false`.
  @override
  bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }

    if (value.length > size) {
      return false;
    }

    return true;
  }
}
