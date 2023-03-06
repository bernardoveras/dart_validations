import 'package:dart_validations/validators/validators.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  late MinLengthValidator sut;
  late int minLength;

  setUp(() {
    minLength = 5;
    sut = MinLengthValidator(length: minLength);
  });

  test('Should return false if value is empty', () {
    expect(sut.validate(''), false);
  });

  test('Should return false if value is null', () {
    expect(sut.validate(null), false);
  });

  test('Should return false if value is less than min length', () {
    expect(sut.validate(faker.randomGenerator.string(minLength - 1)), false);
  });

  test('Should return true if value is equal than min length', () {
    expect(
      sut.validate(faker.randomGenerator.string(minLength, min: minLength)),
      true,
    );
  });

  test('Should return true if value is bigger than min length', () {
    expect(
      sut.validate(faker.randomGenerator.string(10, min: minLength)),
      true,
    );
  });

  test('Should throws AssertionError if length is less than or equal to zero',
      () {
    expect(() => MinLengthValidator(length: 0), throwsA(isA<AssertionError>()));
  });
}
