import '../errors/errors.dart';

abstract class Validation {
  ValidationError? validate({
    required String fieldName,
    required Map input,
  });
}
