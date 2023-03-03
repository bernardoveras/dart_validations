import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar campos de e-mail.
class EmailValidation implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  final _emailValidator = EmailValidator();

  EmailValidation(this.fieldName);

  /// Método que valida se o valor do campo especificado é um e-mail válido.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  String? validate(String? value) {
    final errorText = 'Campo inválido';

    final bool isValid = _emailValidator.validate(value);

    // Retorna a mensagem de erro se o e-mail for inválido, ou null se for válido.
    return isValid ? null : errorText;
  }
}
