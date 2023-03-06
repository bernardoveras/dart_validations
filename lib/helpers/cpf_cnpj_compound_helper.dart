import 'helpers.dart';

class CpfCnpjCompoundHelper extends LegalDocumentHelper {
  static final CpfHelper _cpfHelper = CpfHelper();
  static final CnpjHelper _cnpjHelper = CnpjHelper();

  @override
  final List<String> blackList = [
    ..._cpfHelper.blackList,
    ..._cnpjHelper.blackList,
  ];

  /// Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  int verifierDigit(String document) {
    final isValidCpf = _cpfHelper.validate(document);

    if (isValidCpf) {
      return _cpfHelper.verifierDigit(document);
    }

    final isValidCnpj = _cnpjHelper.validate(document);

    if (isValidCnpj) {
      return _cnpjHelper.verifierDigit(document);
    }

    return -1;
  }

  @override
  @Deprecated(
    'To use the generator, use the `generateCpf` or `generateCnpj` method',
  )
  String generate({bool format = false}) {
    throw AssertionError(
      'To use the generator, use the `generateCpf` or `generateCnpj` method',
    );
  }

  /// Generates a valid CPF.
  String generateCpf({bool format = false}) {
    return _cpfHelper.generate(format: format);
  }

  /// Generates a valid CNPJ.
  String generateCnpj({bool format = false}) {
    return _cnpjHelper.generate(format: format);
  }

  /// Validates if [document] is null or empty and also checks
  /// if it complies with the Verifier Digit.
  ///
  /// You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  @override
  bool validate(String? document) {
    final isValidCpf = _cpfHelper.validate(document);

    if (isValidCpf == true) {
      return true;
    }

    final isValidCnpj = _cnpjHelper.validate(document);

    return isValidCnpj;
  }
}
