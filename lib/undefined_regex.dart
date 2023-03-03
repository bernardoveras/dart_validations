class UndefinedRegex implements RegExp {
  @override
  Iterable<RegExpMatch> allMatches(String input, [int start = 0]) {
    throw UnimplementedError();
  }

  @override
  RegExpMatch? firstMatch(String input) {
    throw UnimplementedError();
  }

  @override
  bool hasMatch(String input) {
    throw UnimplementedError();
  }

  @override
  bool get isCaseSensitive => throw UnimplementedError();

  @override
  bool get isDotAll => throw UnimplementedError();

  @override
  bool get isMultiLine => throw UnimplementedError();

  @override
  bool get isUnicode => throw UnimplementedError();

  @override
  Match? matchAsPrefix(String string, [int start = 0]) {
    throw UnimplementedError();
  }

  @override
  String get pattern => throw UnimplementedError();

  @override
  String? stringMatch(String input) {
    throw UnimplementedError();
  }
}
