import '../regex/regex.dart';
import '../undefined_regex.dart';

abstract class LegalDocumentHelper {
  List<String> get blackList => [];

  RegExp get formatRegex => UndefinedRegex();

  bool validate(String? document);

  /// Remove all special characteres.
  String? strip(String? document) {
    return document?.replaceAll(onlyNumbersRegex, '');
  }

  int verifierDigit(String document) {
    throw UnimplementedError();
  }

  String format(String document) {
    throw UnimplementedError();
  }

  String generate({bool format = false}) {
    throw UnimplementedError();
  }
}
