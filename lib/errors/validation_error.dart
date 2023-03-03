enum ValidationError {
  requiredField('Campo obrigatório'),
  invalidField('Campo inválido');

  final String message;

  const ValidationError(this.message);
}