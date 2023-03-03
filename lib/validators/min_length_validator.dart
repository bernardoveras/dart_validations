import 'validators.dart';

/// Classe que verifica se a String possui um tamanho mínimo.
///
/// Como usar:
/// ```dart
/// final validator = MinLengthValidator(5);
/// final text = 'example';
/// final isValid = validator.validate(text); // true
/// ```
class MinLengthValidator implements LengthValidator<String> {
  /// Tamanho mínimo da String.
  @override
  final int length;

  /// Validador que verifica se a String não é nula ou vazia.
  final _requiredValidator = RequiredValidator();

  MinLengthValidator({
    required this.length,
  }) : assert(length > 0, 'O tamanho mínimo deve ser maior que zero.');

  /// Retorna `true` se [value] não for nulo, não for vazio e possuir um tamanho mínimo de [length].
  ///
  /// Caso contrário, retorna `false`.
  @override
  bool validate(String? value) {
    final hasValue = _requiredValidator.validate(value);

    if (!hasValue) {
      return false;
    }

    if (value!.length < length) {
      return false;
    }

    return true;
  }
}
