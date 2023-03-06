import 'package:dart_validations/regex/regex.dart';
import 'package:test/test.dart';

void main() {
  test('Should be return string without special chars', () {
    const expectedString = 'value123';
    const value = r'()!@#$%¨&*()_-+=[]´`^~{};/:><.,|value123';

    final result = value.replaceAll(specialCharactersRegex, '');

    expect(result, expectedString);
  });

  test(
    'Should be return CPF only numbers',
    () {
      const formattedCpf = '000.000.000-00';
      const expectedString = '00000000000';

      final result = formattedCpf.replaceAll(specialCharactersRegex, '');

      expect(result, expectedString);
    },
  );

  test(
    'Should be return CNPJ only numbers',
    () {
      const formattedCnpj = '00.000.000/0000-00';
      const expectedString = '00000000000000';

      final result = formattedCnpj.replaceAll(specialCharactersRegex, '');

      expect(result, expectedString);
    },
  );

  test(
    'Should be return phone number only numbers',
    () {
      const formattedPhoneNumber = '+00 (00) 00000-0000';
      const expectedString = '0000000000000';

      final result =
          formattedPhoneNumber.replaceAll(specialCharactersRegex, '');

      expect(result, expectedString);
    },
  );
}
