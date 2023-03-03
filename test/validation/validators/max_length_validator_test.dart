import 'package:dart_validations/validation/validators/validators.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  late MaxLengthValidator sut;
  late int maxSize;

  setUp(() {
    maxSize = 7;
    sut = MaxLengthValidator(size: maxSize);
  });

  test('Should return true if value is empty', () {
    expect(sut.validate(''), true);
  });

  test('Should return true if value is null', () {
    expect(sut.validate(null), true);
  });

  test('Should return true if value is equal than max size', () {
    expect(sut.validate(faker.randomGenerator.string(maxSize, min: maxSize)), true);
  });

  test('Should return false if value is bigger than max size', () {
    expect(sut.validate(faker.randomGenerator.string(maxSize + 1, min: maxSize + 1)), false);
  });
}
