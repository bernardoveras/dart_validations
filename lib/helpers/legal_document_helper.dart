import '../regex/regex.dart';

abstract class LegalDocumentHelper {
  List<String> get blackList => [];
  RegExp get formatRegex;

  bool validate(String? document);

  /// Remove all special characteres.
  String? strip(String? document) {
    return document?.replaceAll(stripRegex, '');
  }

  int verifierDigit(String document);

  String format(String document);

  String generate({bool format = false});
}
