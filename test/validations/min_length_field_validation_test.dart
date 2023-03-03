import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:dart_validations/protocols/protocols.dart';
import 'package:dart_validations/validations/validations.dart';

void main() {
  late MinLengthFieldValidation sut;
  late int minLength;

  setUp(() {
    minLength = 5;
    sut = MinLengthFieldValidation(fieldName: 'any_field', length: minLength);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.invalidField);
  });

  test('Should return error if value is less than min length', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(minLength - 1, min: 1)}), ValidationError.invalidField);
  });

  test('Should return null if value is equal than min length', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(minLength, min: minLength)}), null);
  });

  test('Should return null if value is bigger than min length', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(10, min: minLength)}), null);
  });
}
