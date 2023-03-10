import 'package:dart_validations/protocols/protocols.dart';
import 'package:dart_validations/validations/validations.dart';
import 'package:test/test.dart';

void main() {
  late RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if value is not empty', () {
    expect(sut.validate({'any_field': 'example'}), isNull);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.requiredField);
  });

  test('Should return error if value is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.requiredField);
  });
}
