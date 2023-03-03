enum ValidationError {
  requiredField('Required field'),
  invalidField('Invalid field');

  final String message;

  const ValidationError(this.message);
}