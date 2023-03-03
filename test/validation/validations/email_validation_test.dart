import 'package:test/test.dart';

import 'package:dart_validations/validation/protocols/protocols.dart';
import 'package:dart_validations/validation/validations/validations.dart';

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

  test('Should return error message if email is invalid', () {
    final error = sut.validate('incorrect_email');
    expect(error, ValidationError.invalidField);
  });
}
