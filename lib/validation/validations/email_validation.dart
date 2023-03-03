import '../protocols/protocols.dart';

/// Classe responsável por validar campos de e-mail.
class EmailValidation implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  String fieldName;

  EmailValidation(this.fieldName);

  /// Método que valida se o valor do campo especificado é um e-mail válido.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  String? validate(String? value) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    // Retorna true caso o valor for nulo ou vazio ou se for um e-mail válido.
    final bool isValid = value == null || value.isEmpty || regex.hasMatch(value);

    // Retorna a mensagem de erro 'Campo inválido' se o e-mail for inválido, ou null se for válido.
    return isValid ? null : 'Campo inválido';
  }
}
