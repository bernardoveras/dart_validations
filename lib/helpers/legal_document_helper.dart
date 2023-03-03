import '../regex/regex.dart';

abstract class LegalDocumentHelper {
  List<String> get blackList => [];

  /// Remove all special characteres.
  String strip(String? document) {
    document = document ?? '';

    return document.replaceAll(stripRegex, '');
  }

  int verifierDigit(String document);

  String format(String document);
}
