import 'package:dart_validations/helpers/helpers.dart';
import 'package:test/test.dart';

void main() {
  late final CpfCnpjCompoundHelper sut;

  setUpAll(() {
    sut = CpfCnpjCompoundHelper();
  });

  group('CPF Validator', () {
    test('Should return valid CPF on generate', () {
      final generatedCpf = sut.generateCpf();
      expect(sut.validate(generatedCpf), true);
    });

    test('Should return valid formatted CPF on generate', () {
      final generatedCpf = sut.generateCpf(format: true);
      expect(sut.validate(generatedCpf), true);
    });
    test('Should return true if stripped CPF is valid', () {
      // Disclaimer: This CPF was generated through the website "https://www.geradordecpf.org/", we are not responsible for misuse.
      expect(sut.validate('86492661699'), true);
    });

    test('Should return true if formatted CPF is valid', () {
      // Disclaimer: This CPF was generated through the website "https://www.geradordecpf.org/", we are not responsible for misuse.
      expect(sut.validate('864.926.616-99'), true);
    });

    test('Should return false if stripped random CPF is invalid', () {
      const randomInvalidCpf = '02057227842';
      expect(sut.validate(randomInvalidCpf), false);
    });

    test('Should return false if formatted random CPF is invalid', () {
      const randomInvalidCpf = '268.973.295-36';
      expect(sut.validate(randomInvalidCpf), false);
    });

    test('Should return false if stripped CPF is blacklisted', () {
      const cpfBlacklisted = '00000000000';
      expect(sut.validate(cpfBlacklisted), false);
    });

    test('Should return false if formatted CPF is blacklisted', () {
      const cpfBlacklisted = '000.000.000-00';
      expect(sut.validate(cpfBlacklisted), false);
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
  });

  group('CNPJ Validator', () {
    test('Should return valid CNPJ on generate', () {
      final generatedCnpj = sut.generateCnpj();
      expect(sut.validate(generatedCnpj), true);
    });

    test('Should return valid formatted CNPJ on generate', () {
      final generatedCnpj = sut.generateCnpj(format: true);
      expect(sut.validate(generatedCnpj), true);
    });
    test('Should return true if stripped CNPJ is valid', () {
      // Disclaimer: This CNPJ was generated through the website "https://geradordecnpj.org/", we are not responsible for misuse.
      expect(sut.validate('34684744000194'), true);
    });

    test('Should return true if formatted CNPJ is valid', () {
      // Disclaimer: This CNPJ was generated through the website "https://geradordecnpj.org/", we are not responsible for misuse.
      expect(sut.validate('34.684.744/0001-94'), true);
    });

    test('Should return false if stripped random CNPJ is invalid', () {
      const randomInvalidCnpj = '23474170000173';
      expect(sut.validate(randomInvalidCnpj), false);
    });

    test('Should return false if formatted random CNPJ is invalid', () {
      const randomInvalidCnpj = '23.474.170/0001-73';
      expect(sut.validate(randomInvalidCnpj), false);
    });

    test('Should return false if stripped CNPJ is blacklisted', () {
      const cnpjBlacklisted = '00000000000000';
      expect(sut.validate(cnpjBlacklisted), false);
    });

    test('Should return false if formatted CNPJ is blacklisted', () {
      const cnpjBlacklisted = '00.000.000/0000-00';
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
  });
}
