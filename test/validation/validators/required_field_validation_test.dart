import 'package:test/test.dart';

abstract class FieldValidation {
  String get field;
  String? validate(String? value);
}

class RequiredFieldValidation implements FieldValidation {
  @override
  final String field;

  RequiredFieldValidation(this.field);

  @override
  String? validate(String? value) {
    final errorText = 'Campo obrigatório';

    if (value == null || value.isEmpty) return errorText;

    return null;
  }
}

void main() {
  late RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if value is not empty', () {
    final error = sut.validate('any_value');

    expect(error, isNull);
  });

  test('Should return error if value is empty', () {
    final error = sut.validate('');

    expect(error, 'Campo obrigatório');
  });

  test('Should return error if value is null', () {
    final error = sut.validate(null);

    expect(error, 'Campo obrigatório');
  });
}
