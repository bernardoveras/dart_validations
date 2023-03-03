abstract class Validator<Type> {
  bool validate(Type? value);
}

abstract class LengthValidator<Type> extends Validator<Type> {
  int get length;
}
