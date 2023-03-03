import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar se os campos possuem um tamanho mínimo.
class MinLengthFieldValidation extends Equatable implements FieldLengthValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  /// Tamanho mínimo da String.
  @override
  final int length;

  late final MinLengthValidator _minLengthValidator;

  @override
  List<Object> get props => [fieldName, length];

  MinLengthFieldValidation({
    required this.fieldName,
    required this.length,
  }) {
    _minLengthValidator = MinLengthValidator(size: length);
  }

  /// Método que valida se o valor do campo especificado é nulo, vazio ou menor do que o tamanho mínimo.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate(Map input) {
    final bool isValid = _minLengthValidator.validate(input[fieldName]);

    // Retorna a mensagem de erro se o valor for inválido, ou null se for válido.
    return isValid ? null : ValidationError.invalidField;
  }
}
