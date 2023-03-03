import 'package:dart_validations/validation/protocols/field_validation.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  EmailValidation(this.field);

  @override
  String field;

  @override
  String? validate(String? value) {
    return null;
  }
}

void main() {
  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    final error = sut.validate('');
    expect(error, isNull);
  });

  test('Should return null if email is null', () {
    final error = sut.validate(null);
    expect(error, isNull);
  });
}
