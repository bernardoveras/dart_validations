import 'package:dart_validations/compounds/compounds.dart';
import 'package:dart_validations/protocols/protocols.dart';
import 'package:test/test.dart';

import '../mocks/compounds/compounds.mocks.dart';

void main() {
  late ValidationCompound sut;
  late FieldValidationMock validation1;
  late FieldValidationMock validation2;
  late FieldValidationMock validation3;

  setUp(() {
    validation1 = FieldValidationMock();
    validation2 = FieldValidationMock();
    validation3 = FieldValidationMock()..mockFieldName('other_field');
    sut = ValidationCompound([validation1, validation2, validation3]);
  });

  test('Should return null if all validations returns null or empty', () {
    final error =
        sut.validate(fieldName: 'any_field', input: {'any_field': 'any_value'});

    expect(error, null);
  });

  test('Should return the first error', () {
    validation1.mockValidationError(ValidationError.invalidField);
    validation2.mockValidationError(ValidationError.invalidField);
    validation3.mockValidationError(ValidationError.requiredField);

    final error =
        sut.validate(fieldName: 'any_field', input: {'any_field': 'any_value'});

    expect(error, ValidationError.invalidField);
  });
}
