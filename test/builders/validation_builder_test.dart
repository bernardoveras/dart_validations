import 'package:dart_validations/builders/builders.dart';
import 'package:test/test.dart';

void main() {
  test('Should be returns null if email is valid', () {
    final builder = ValidationBuilder.field('field').email().build();
    expect(builder.first.validate({'field': 'example@mail.com'}), isNull);
  });

  test('Should be returns null if contains text', () {
    final builder = ValidationBuilder.field('field').required().build();
    expect(builder.first.validate({'field': 'text'}), isNull);
  });
}
