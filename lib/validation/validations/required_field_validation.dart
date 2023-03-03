import '../protocols/protocols.dart';
import '../validators/validators.dart';

/// Classe responsável por validar se um campo não é nulo e nem vazio.
class RequiredFieldValidation implements FieldValidation {
  /// Nome do campo a ser validado.
  @override
  final String fieldName;

  final RequiredValidator _requiredValidator = RequiredValidator();

  RequiredFieldValidation(this.fieldName);

  /// Método que valida se o valor do campo especificado não é nulo e nem vazio.
  ///
  /// Retorna `null` se o campo for válido ou uma `mensagem de erro` caso contrário.
  @override
  String? validate(String? value) {
    final errorText = 'Campo obrigatório';

    // Verifica se o valor do campo é nulo ou vazio
    final bool isValid = _requiredValidator.validate(value);    

    // Retorna null se o campo for válido
    return isValid ? null : errorText;
  }
}
