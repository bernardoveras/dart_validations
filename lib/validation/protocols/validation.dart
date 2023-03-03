enum ValidationError {
  requiredField('Campo obrigatório'),
  invalidField('Campo inválido');

  final String message;

  const ValidationError(this.message);
}

abstract class Validation {
  ValidationError? validate({
    required String fieldName,
    required Map input,
  });
}
