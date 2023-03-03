import 'protocols.dart';

abstract class FieldValidation {
  String get fieldName;
  ValidationError? validate(Map input);
}
