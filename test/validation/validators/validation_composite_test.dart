import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart_validations/validation/protocols/protocols.dart';

class ValidationComposite implements Validation {
  ValidationComposite(this.validations);

  final List<FieldValidation> validations;

  @override
  String? validate({required String field, required String? value}) {
    return null;
  }
}

class FieldValidationMock extends Mock implements FieldValidation {
  FieldValidationMock(this.field);

  @override
  String field;
}

void main() {
  test('Should return null if all validations returns null or empty', () {
    final validation1 = FieldValidationMock('any_field');
    when(validation1.validate(any)).thenReturn(null);

    final validation2 = FieldValidationMock('any_field');
    when(validation2.validate(any)).thenReturn('');

    final sut = ValidationComposite([validation1, validation2]);

    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}
