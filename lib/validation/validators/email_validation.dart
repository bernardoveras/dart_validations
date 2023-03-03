import '../protocols/protocols.dart';

class EmailValidation implements FieldValidation {
  EmailValidation(this.field);

  @override
  String field;

  @override
  String? validate(String? value) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final bool isValid = value == null || value.isEmpty || regex.hasMatch(value);
    return isValid ? null : 'Campo inválido';
  }
}