import 'package:test/test.dart';

import 'package:dart_validations/composites/composites.dart';
import 'package:dart_validations/protocols/protocols.dart';

import '../mocks/composites/composites.mocks.dart';

void main() {
  late ValidationComposite sut;
  late FieldValidationMock validation1;
  late FieldValidationMock validation2;
  late FieldValidationMock validation3;

  setUp(() {
    validation1 = FieldValidationMock();
    validation2 = FieldValidationMock();
    validation3 = FieldValidationMock();
    validation3.mockFieldName('other_field');
    sut = ValidationComposite([validation1, validation2, validation3]);
  });

  test('Should return null if all validations returns null or empty', () {
    final error = sut.validate(fieldName: 'any_field', input: {'any_field': 'any_value'});

    expect(error, null);
  });

  test('Should return the first error', () {
    validation1.mockValidationError(ValidationError.invalidField);
    validation2.mockValidationError(ValidationError.invalidField);
    validation3.mockValidationError(ValidationError.requiredField);

    final error = sut.validate(fieldName: 'any_field', input: {'any_field': 'any_value'});

    expect(error, ValidationError.invalidField);
  });
}
