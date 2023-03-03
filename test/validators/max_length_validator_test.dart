import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:dart_validations/validators/validators.dart';

void main() {
  late MaxLengthValidator sut;
  late int maxLength;

  setUp(() {
    maxLength = 5;
    sut = MaxLengthValidator(length: maxLength);
  });

  test('Should return true if value is empty', () {
    expect(sut.validate(''), true);
  });

  test('Should return true if value is null', () {
    expect(sut.validate(null), true);
  });

  test('Should return true if value is equal than max length', () {
    expect(sut.validate(faker.randomGenerator.string(maxLength, min: maxLength)), true);
  });

  test('Should return false if value is bigger than max length', () {
    expect(sut.validate(faker.randomGenerator.string(maxLength + 1, min: maxLength + 1)), false);
  });
}
