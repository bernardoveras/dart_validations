import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:dart_validations/validation/protocols/protocols.dart';
import 'package:dart_validations/validation/validations/validations.dart';

void main() {
  late MaxLengthFieldValidation sut;
  late int maxLength;

  setUp(() {
    maxLength = 5;
    sut = MaxLengthFieldValidation(fieldName: 'any_field', length: maxLength);
  });

  test('Should return null if value is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Should return null if value is null', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if value is equal than max length', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(maxLength, min: maxLength)}), null);
  });

  test('Should return error if value is bigger than max length', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(maxLength + 1, min: maxLength + 1)}), ValidationError.invalidField);
  });
}
