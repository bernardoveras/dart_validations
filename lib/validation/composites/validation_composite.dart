import '../protocols/protocols.dart';

/// Classe responsável por compor uma lista de validações de campo e verificar se todas as validações são válidas.
class ValidationComposite implements Validation {
  /// Lista de validações de campo a serem verificadas.
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  /// Método que verifica se todas as validações de campo são válidas para o campo especificado.
  ///
  /// Retorna `null` se todas as validações forem válidas ou uma `mensagem de erro` caso contrário.
  @override
  ValidationError? validate({required String fieldName, required String? value}) {
    ValidationError? error;

    // Itera sobre as validações de campo que se aplicam ao campo especificado.
    for (final validation in validations.where((v) => v.fieldName == fieldName)) {
      error = validation.validate(value);

      if (error != null) {
        return error;
      }
    }

    // Retorna null se todas as validações foram bem sucedidas.
    return null;
  }
}
