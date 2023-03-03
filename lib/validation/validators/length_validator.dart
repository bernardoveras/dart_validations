import 'validators.dart';

abstract class LengthValidator<Type> extends Validator<Type> {
  int get length;
}
