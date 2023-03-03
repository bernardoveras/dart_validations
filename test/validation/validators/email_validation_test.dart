import 'package:dart_validations/validation/protocols/field_validation.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  EmailValidation(this.field);

  @override
  String field;

  @override
  String? validate(String? value) {
    return null;
  }
}

void main() {
  test('Should return null if email is empty', () {
    final sut = EmailValidation('any_field');

    final error = sut.validate('');
    expect(error, isNull);
  });

  test('Should return null if email is null', () {
    final sut = EmailValidation('any_field');

    final error = sut.validate(null);
    expect(error, isNull);
  });
}
