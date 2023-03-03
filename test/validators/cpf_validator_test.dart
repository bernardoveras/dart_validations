import 'package:test/test.dart';

import 'package:dart_validations/validators/validators.dart';

void main() {
  late CpfValidator sut;

  setUp(() {
    sut = CpfValidator();
  });

  test('Should return true if stripped CPF is valid', () {
    // Disclaimer: This CPF was generated through the website "https://www.geradordecpf.org/", we are not responsible for misuse.
    expect(sut.validate('86492661699'), true);
  });

  test('Should return true if formatted CPF is valid', () {
    // Disclaimer: This CPF was generated through the website "https://www.geradordecpf.org/", we are not responsible for misuse.
    expect(sut.validate('864.926.616-99'), true);
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
