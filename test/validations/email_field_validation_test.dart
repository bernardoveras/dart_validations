import 'package:dart_validations/protocols/protocols.dart';
import 'package:dart_validations/validations/validations.dart';
import 'package:test/test.dart';

void main() {
  late EmailFieldValidation sut;

  setUp(() {
    sut = EmailFieldValidation('any_field');
  });

  test('Should return null if email is empty', () {
    expect(sut.validate({'any_field': ''}), isNull);
  });

  test('Should return null if email is null', () {
    expect(sut.validate({}), null);
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate({'any_field': 'example@mail.com'}), isNull);
  });

  test('Should return error message if email is invalid', () {
    expect(
      sut.validate({'any_field': 'example'}),
      ValidationError.invalidField,
    );
  });
}
