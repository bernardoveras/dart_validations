import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar se os campos ultrapassam um tamanho máximo.
class MaxLengthFieldValidation extends Equatable implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  /// Tamanho máximo da String.
  final int size;

  late final MaxLengthValidator _maxLengthValidator;

  @override
  List<Object> get props => [fieldName];

  MaxLengthFieldValidation({
    required this.fieldName,
    required this.size,
  }) {
    _maxLengthValidator = MaxLengthValidator(size: size);
  }

  /// Método que valida se o valor do campo especificado é maior do que o tamanho máximo.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate(Map input) {
    final bool isValid = _maxLengthValidator.validate(input[fieldName]);

    // Retorna a mensagem de erro se o e-mail for inválido, ou null se for válido.
    return isValid ? null : ValidationError.invalidField;
  }
}
