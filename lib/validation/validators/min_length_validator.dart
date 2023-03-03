import 'validators.dart';

/// Classe que verifica se a String possui um tamanho mínimo.
///
/// Como usar:
/// ```dart
/// final validator = MinLengthValidator(5);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MinLengthValidator implements Validator<String> {
  /// Tamanho mínimo da String.
  final int size;

  /// Validador que verifica se a String não é nula ou vazia.
  final _requiredValidator = RequiredValidator();

  MinLengthValidator({required this.size});

  /// Retorna `true` se [value] não for nulo, não for vazio e possuir um tamanho mínimo de [size].
  ///
  /// Caso contrário, retorna `false`.
  @override
  bool validate(String? value) {
    final hasValue = _requiredValidator.validate(value);

    if (!hasValue) {
      return false;
    }

    if (value!.length < size) {
      return false;
    }

    return true;
  }
}
