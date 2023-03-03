import 'package:test/test.dart';

import 'package:dart_validations/validators/validators.dart';

void main() {
  late CnpjValidator sut;

  setUp(() {
    sut = CnpjValidator();
  });

  test('Should return true if stripped CNPJ is valid', () {
    // Disclaimer: This CNPJ was generated through the website "https://geradordecnpj.org/", we are not responsible for misuse.
    expect(sut.validate('34684744000194'), true);
  });

  test('Should return true if formatted CNPJ is valid', () {
    // Disclaimer: This CNPJ was generated through the website "https://geradordecnpj.org/", we are not responsible for misuse.
    expect(sut.validate('88.791.131/0001-85'), true);
  });

  test('Should return false if stripped CNPJ is blacklisted', () {
    final cnpjBlacklisted = '00000000000000';
    expect(sut.validate(cnpjBlacklisted), false);
  });

  test('Should return false if formatted CNPJ is blacklisted', () {
    final cnpjBlacklisted = '00.000.000/0000-00';
    expect(sut.validate(cnpjBlacklisted), false);
  });

  test('Should return false if CNPJ is empty', () {
    expect(sut.validate(''), false);
  });

  test('Should return false if CNPJ is empty string', () {
    expect(sut.validate('  '), false);
  });

  test('Should return false if CNPJ is null', () {
    expect(sut.validate(null), false);
  });
}
