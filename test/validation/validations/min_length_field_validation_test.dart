import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:dart_validations/validation/protocols/protocols.dart';
import 'package:dart_validations/validation/validations/validations.dart';

void main() {
  late MinLengthFieldValidation sut;
  late int minSize;

  setUp(() {
    minSize = 7;
    sut = MinLengthFieldValidation(fieldName: 'any_field', size: minSize);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.invalidField);
  });

  test('Should return error if value is less than min size', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(minSize - 1, min: 1)}), ValidationError.invalidField);
  });

  test('Should return null if value is equal than min size', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(minSize, min: minSize)}), null);
  });

  test('Should return null if value is bigger than min size', () {
    expect(sut.validate({'any_field': faker.randomGenerator.string(10, min: 6)}), null);
  });
}
