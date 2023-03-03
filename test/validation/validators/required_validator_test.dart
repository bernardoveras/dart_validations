import 'package:test/test.dart';

import 'package:dart_validations/validation/validators/validators.dart';

void main() {
  late RequiredValidator sut;

  setUp(() {
    sut = RequiredValidator();
  });

  test('Should return true if value is not empty', () {
    final error = sut.validate('any_value');

    expect(error, true);
  });

  test('Should return false if value is empty', () {
    final error = sut.validate('');

    expect(error, false);
  });

  test('Should return false if value is empty string', () {
    final error = sut.validate('  ');

    expect(error, false);
  });

  test('Should return false if value is null', () {
    final error = sut.validate(null);

    expect(error, false);
  });
}
