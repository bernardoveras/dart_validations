import 'package:dart_validations/builders/builders.dart';
import 'package:test/test.dart';

void main() {
  test('Should be returns null if email is valid', () {
    final builder = ValidationBuilder.field('field').email().build();
    expect(builder.first.validate({'field': 'example@mail.com'}), isNull);
  });

  test('Should be returns null if contains text', () {
    final builder = ValidationBuilder.field('field').required().build();
    expect(builder.validate({'field': 'text'}), isNull);
  });

  test('Should be returns ValidationError list if email is invalid', () {
    final builder = ValidationBuilder.field('field').email().min(20).build();
    expect(builder.validate({'field': 'text@mail.com'})?.isEmpty, false);
  });
}
