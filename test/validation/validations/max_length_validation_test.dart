import 'package:dart_validations/validation/protocols/protocols.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:dart_validations/validation/validations/validations.dart';

void main() {
  late MaxLengthValidation sut;
  late int maxSize;

  setUp(() {
    maxSize = 7;
    sut = MaxLengthValidation(fieldName: 'any_field', size: maxSize);
  });

  test('Should return null if value is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Should return null if value is null', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if value is equal than max size', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(maxSize, min: maxSize)}), null);
  });

  test('Should return error if value is bigger than max size', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(maxSize + 1, min: maxSize + 1)}), ValidationError.invalidField);
  });
}
