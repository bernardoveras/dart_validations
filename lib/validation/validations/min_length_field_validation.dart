import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar se os campos possuem um tamanho mínimo.
class MinLengthFieldValidation extends Equatable implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  /// Tamanho mínimo da String.
  final int size;

  late final MinLengthValidator _minLengthValidator;

  @override
  List<Object> get props => [fieldName];

  MinLengthFieldValidation({
    required this.fieldName,
    required this.size,
  }) {
    _minLengthValidator = MinLengthValidator(size: size);
  }

  /// Método que valida se o valor do campo especificado é nulo, vazio ou menor do que o tamanho mínimo.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate(Map input) {
    final bool isValid = _minLengthValidator.validate(input[fieldName]);

    // Retorna a mensagem de erro se o e-mail for inválido, ou null se for válido.
    return isValid ? null : ValidationError.invalidField;
  }
}
