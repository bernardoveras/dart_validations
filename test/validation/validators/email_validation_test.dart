import 'package:dart_validations/validation/protocols/field_validation.dart';
import 'package:test/test.dart';

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

void main() {
  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    final error = sut.validate('');
    expect(error, isNull);
  });

  test('Should return null if email is null', () {
    final error = sut.validate(null);
    expect(error, isNull);
  });

  test('Should return null if email is valid', () {
    final error = sut.validate('valid@email.com');
    expect(error, isNull);
  });

  test('Should return null if email is invalid', () {
    final error = sut.validate('incorrect_email');
    expect(error, 'Campo inválido');
  });
}
