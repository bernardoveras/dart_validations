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
  /// The string must only contain numbers.
  @override
  final RegExp formatRegex = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$');

  /// Replaces the values according to the `formatRegex` regex.
  ///
  /// The [value] must only contain numbers.
  String _replaceFormatRegex(String value) {
    return value.replaceAllMapped(
      formatRegex,
      (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}',
    );
  }

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  int verifierDigit(String document) {
    var index = 2;

    final reverse =
        document.split('').map(int.parse).toList().reversed.toList();

    var sum = 0;

    for (final number in reverse) {
      sum += number * index;
      index = index == 9 ? 2 : index + 1;
    }

    final mod = sum % 11;

    return mod < 2 ? 0 : 11 - mod;
  }

  /// Formats the [document] in the pattern: XX.XXX.XXX/XXXX-XX
  ///
  /// If [document] is invalid, it will return the same.
  @override
  String format(String document) {
    // Return the same CNPJ if it is not a valid CNPJ.
    if (!validate(document)) {
      return document;
    }

    return _replaceFormatRegex(strip(document)!);
  }

  /// Generates a valid CNPJ.
  ///
  /// If [format] is true, it returns the formatted CNPJ, otherwise,
  /// it returns only the numbers.
  @override
  String generate({bool format = false}) {
    final buffer = StringBuffer();

    for (var i = 0; i < 12; i += 1) {
      final nextNumber = Random().nextInt(9);
      buffer.write(nextNumber);
    }

    var numbers = buffer.toString();

    numbers += verifierDigit(numbers).toString();
    numbers += verifierDigit(numbers).toString();

    return format ? this.format(numbers) : numbers;
  }

  /// Validates if [document] is null or empty
  /// and also checks if it complies with the Verifier Digit.
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
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

    if (numbers.contains('-1')) {
      return false;
    }

    return numbers.substring(numbers.length - 2) ==
        cnpj.substring(cnpj.length - 2);
  }
}
