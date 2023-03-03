import 'package:mocktail/mocktail.dart';

import 'package:dart_validations/protocols/protocols.dart';

class FieldValidationMock extends Mock implements FieldValidation {
  FieldValidationMock(){
    mockValidation();
    mockFieldName('any_field');
  }

  When mockValidationCall() => when(() => validate(any()));
  void mockValidation() => mockValidationCall().thenReturn(null);
  void mockValidationError(ValidationError error) => mockValidationCall().thenReturn(error);

  void mockFieldName(String fieldName) => when(() => this.fieldName).thenReturn(fieldName);
}
