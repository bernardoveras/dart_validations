import 'validators.dart';

/// Classe responsável pela validação de campos obrigatórios.
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

  final _requiredValidator = RequiredValidator();

  MinLengthValidator({required this.size});

  /// Retorna `true` se a string não for nula e vazia.
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
