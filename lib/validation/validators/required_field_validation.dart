import '../protocols/protocols.dart';

/// Classe responsável por validar se um campo não é nulo e nem vazio.
class RequiredFieldValidation implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String field;

  RequiredFieldValidation(this.field);

  /// Método que valida se o valor do campo especificado não é nulo e nem vazio.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  String? validate(String? value) {
    final errorText = 'Campo obrigatório';

    // Verifica se o valor do campo é nulo ou vazio
    if (value == null || value.isEmpty) {
      return errorText;
    }

    // Retorna null se o campo for válido

    return null;
  }
}
