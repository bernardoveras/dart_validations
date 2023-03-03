import 'package:test/test.dart';

import 'package:dart_validations/validators/validators.dart';

void main() {
  late EmailValidator sut;

  setUp(() {
    sut = EmailValidator();
  });

  test('Should return true if email is empty', () {
    final error = sut.validate('');
    expect(error, true);
  });

  test('Should return true if email is null', () {
    final error = sut.validate(null);
    expect(error, true);
  });

  test('Should return true if email is valid', () {
    final error = sut.validate('example@mail.com');
    expect(error, true);
  });

  test('Should return false if email is invalid', () {
    final error = sut.validate('incorrect_email');
    expect(error, false);
  });
}
