import 'package:dart_validations/validation/validators/validators.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  late MinLengthValidator sut;
  late int minSize;

  setUp(() {
    minSize = 5;
    sut = MinLengthValidator(size: minSize);
  });

  test('Should return false if value is empty', () {
    expect(sut.validate(''), false);
  });

  test('Should return false if value is null', () {
    expect(sut.validate(null), false);
  });

  test('Should return false if value is less than min size', () {
    expect(sut.validate(faker.randomGenerator.string(minSize - 1, min: 1)), false);
  });

  test('Should return true if value is equal than min size', () {
    expect(sut.validate(faker.randomGenerator.string(minSize, min: minSize)), true);
  });

  test('Should return true if value is bigger than min size', () {
    expect(sut.validate(faker.randomGenerator.string(10, min: 6)), true);
  });
}
