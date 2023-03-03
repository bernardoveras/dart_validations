import 'dart:math';

import 'helpers.dart';

class CpfHelper extends LegalDocumentHelper {
  @override
  final List<String> blackList = [
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

  /// Uses regular expression to format the CPF.
  ///
  /// The [string] must only contain numbers.
  ///
  /// ```dart
  /// final cpf = '86492661699';
  /// final formattedCpf = cpf.replaceAllMapped(formatRegex, (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}'); // 864.926.616-99
  /// ```
  @override
  final RegExp formatRegex = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

  /// Replaces the values according to the `formatRegex` regex.
  ///
  /// The [value] must only contain numbers.
  String _replaceFormatRegex(String value) {
    return value.replaceAllMapped(formatRegex, (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');
  }

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  int verifierDigit(String document) {
    var numbers = document.split('').map((number) => int.parse(number, radix: 10)).toList();

    final modulus = numbers.length + 1;

    final multiplied = <int>[];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    final mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  /// Formats the [document] in the pattern: XXX.XXX.XXX-XX
  ///
  /// If [document] is invalid, it will return the same.
  @override
  String format(String document) {
    // Return the same CPF if it is not a valid CPF.
    if (!validate(document)) {
      return document;
    }

    return _replaceFormatRegex(strip(document)!);
  }

  /// Generates a valid CPF.
  ///
  /// If [format] is true, it returns the formatted CPF, otherwise, it returns only the numbers.
  @override
  String generate({bool format = false}) {
    var numbers = '';

    for (var i = 0; i < 9; i += 1) {
      numbers += Random().nextInt(9).toString();
    }

    numbers += verifierDigit(numbers).toString();
    numbers += verifierDigit(numbers).toString();

    return (format ? this.format(numbers) : numbers);
  }

  /// Validates if [document] is null or empty and also checks if it complies with the Verifier Digit (or 'Digit Verifier (DV)' in PT-BR).
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  bool validate(String? document) {
    final cpf = strip(document);

    // CPF must be defined
    if (cpf == null || cpf.isEmpty) {
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
    numbers += verifierDigit(numbers).toString();
    numbers += verifierDigit(numbers).toString();

    if (numbers.contains('-1')) {
      return false;
    }

    return numbers.substring(numbers.length - 2) == cpf.substring(cpf.length - 2);
  }
}
