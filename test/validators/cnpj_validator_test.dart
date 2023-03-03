import 'package:dart_validations/helpers/cnpj_helper.dart';
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

  test('Should return false if value is blacklisted', () {
    final cnpjBlacklisted = CnpjHelper().blackList.first;
    expect(sut.validate(cnpjBlacklisted), false);
  });

  test('Should return false if value is empty', () {
    expect(sut.validate(''), false);
  });

  test('Should return false if value is empty string', () {
    expect(sut.validate('  '), false);
  });

  test('Should return false if value is null', () {
    expect(sut.validate(null), false);
  });
}
