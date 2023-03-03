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

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  int verifierDigit(String document) {
    var numbers = document.split('').map((number) => int.parse(number, radix: 10)).toList();

    var modulus = numbers.length + 1;

    var multiplied = <int>[];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    var mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  @override
  String format(String document) {
    // TODO: implement format
    throw UnimplementedError();
  }

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

    return numbers.substring(numbers.length - 2) == cpf.substring(cpf.length - 2);
  }
}