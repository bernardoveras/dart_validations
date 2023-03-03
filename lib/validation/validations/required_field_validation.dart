// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar se um campo não é nulo e nem vazio.
class RequiredFieldValidation extends Equatable implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  final RequiredValidator _requiredValidator = RequiredValidator();

  @override
  List<Object> get props => [fieldName];

  RequiredFieldValidation(this.fieldName);

  /// Método que valida se o valor do campo especificado não é nulo e nem vazio.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate(Map input) {
    // Verifica se o valor do campo é nulo ou vazio
    final bool isValid = _requiredValidator.validate(input[fieldName]);

    // Retorna null se o campo for válido
    return isValid ? null : ValidationError.requiredField;
  }
}
