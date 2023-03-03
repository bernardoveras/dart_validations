// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar campos de e-mail.
class EmailValidation extends Equatable implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  final _emailValidator = EmailValidator();

  @override
  List<Object> get props => [fieldName];

  EmailValidation(this.fieldName);

  /// Método que valida se o valor do campo especificado é um e-mail válido.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate(Map input) {
    final bool isValid = _emailValidator.validate(input[fieldName]);

    // Retorna a mensagem de erro se o e-mail for inválido, ou null se for válido.
    return isValid ? null : ValidationError.invalidField;
  }
}
