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
  late final ValidationComposite sut;
  late final FieldValidationMock validation1;
  late final FieldValidationMock validation2;
  late final FieldValidationMock validation3;

  void mockValidation1([String? error]) {
    when(validation1.validate(any)).thenReturn(error);
  }

  void mockValidation2([String? error]) {
    when(validation2.validate(any)).thenReturn(error);
  }

  void mockValidation3([String? error]) {
    when(validation3.validate(any)).thenReturn(error);
  }

  setUp(() {
    validation1 = FieldValidationMock('any_field');
    mockValidation1(null);

    validation2 = FieldValidationMock('any_field');
    mockValidation2('');

    validation3 = FieldValidationMock('other_field');
    mockValidation2('');

    sut = ValidationComposite([validation1, validation2, validation3]);
  });

  test('Should return null if all validations returns null or empty', () {
    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}
