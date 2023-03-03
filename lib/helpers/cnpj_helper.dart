import 'dart:math';

import 'helpers.dart';

class CnpjHelper extends LegalDocumentHelper {
  @override
  final List<String> blackList = [
    '00000000000000',
    '11111111111111',
    '22222222222222',
    '33333333333333',
    '44444444444444',
    '55555555555555',
    '66666666666666',
    '77777777777777',
    '88888888888888',
    '99999999999999'
  ];

  /// Uses regular expression to format the CNPJ.
  ///
  /// The [string] must only contain numbers.
  ///
  /// ```dart
  /// final cnpj = '34684744000194';
  /// final formattedCnpj = cnpj.replaceAllMapped(formatRegex, (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}'); // 34.684.744/0001-94
  /// ```
  @override
  final RegExp formatRegex = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$');

  /// The [value] must only contain numbers.
  /// 
  /// Use the `strip` method to remove special characters.
  String _replaceFormatRegex(String value) {
    return value.replaceAllMapped(formatRegex, (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}');
  }

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  int verifierDigit(String document) {
    var index = 2;

    final reverse = document.split('').map((s) => int.parse(s)).toList().reversed.toList();

    var sum = 0;

    for (var number in reverse) {
      sum += number * index;
      index = (index == 9 ? 2 : index + 1);
    }

    final mod = sum % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  @override
  String format(String document) {
    // Return the same CNPJ if it is not a valid CNPJ.
    if (!validate(document)) {
      return document;
    }

    return _replaceFormatRegex(strip(document)!);
  }

  @override
  String generate({bool format = false}) {
    var numbers = '';

    for (var i = 0; i < 12; i += 1) {
      numbers += Random().nextInt(9).toString();
    }

    numbers += verifierDigit(numbers).toString();
    numbers += verifierDigit(numbers).toString();

    return (format ? this.format(numbers) : numbers);
  }

  @override
  bool validate(String? document) {
    final cnpj = strip(document);

    // CNPJ must be defined
    if (cnpj == null || cnpj.isEmpty) {
      return false;
    }

    // CNPJ must have 14 chars
    if (cnpj.length != 14) {
      return false;
    }

    // CNPJ can't be blacklisted
    if (blackList.contains(cnpj)) {
      return false;
    }

    var numbers = cnpj.substring(0, 12);
    numbers += verifierDigit(numbers).toString();
    numbers += verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) == cnpj.substring(cnpj.length - 2);
  }
}
