import 'validators.dart';

/// Class responsible for validating if a String is a valid email address.
///
/// Uses a regular expression to check if the email format is valid.
///
/// Example:
/// ```dart
/// final cpfValidator = CpfValidator();
/// final email = 'example@mail.com';
/// final isValid = CpfValidator.validate(email); // true
/// ```
class CpfValidator implements Validator<String> {
  /// Validator that checks if the String is not null or empty.
  final _requiredValidator = RequiredValidator();

  static const List<String> blackList = [
    '00000000000',
    '11111111111',
    '22222222222',
    '33333333333',
    '44444444444',
    '55555555555',
    '66666666666',
    '77777777777',
    '88888888888',
    '99999999999',
    '12345678909'
  ];

  static final stripRegex = RegExp(r'[^\d]');

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cpf) {
    var numbers = cpf.split('').map((number) => int.parse(number, radix: 10)).toList();

    var modulus = numbers.length + 1;

    var multiplied = <int>[];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    var mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  /// Remove all special characteres.
  String _strip(String? cpf) {
    cpf = cpf ?? '';

    return cpf.replaceAll(stripRegex, '');
  }

  /// Validates if a String is a valid CPF.
  ///
  /// Returns true if the value is null or empty or if it is a valid CPF.
  @override
  bool validate(String? value) {
    var cpf = _strip(value);

    final hasValue = _requiredValidator.validate(cpf);
    if (!hasValue) {
      return false;
    }

    // CPF must have 11 chars
    if (cpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (blackList.contains(cpf)) {
      return false;
    }

    var numbers = cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) == cpf.substring(cpf.length - 2);
  }
}
