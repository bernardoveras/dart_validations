import '../protocols/protocols.dart';

class ValidationComposite implements Validation {
  ValidationComposite(this.validations);

  final List<FieldValidation> validations;

  @override
  String? validate({required String field, required String? value}) {
    String? error;

    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(value);

      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return null;
  }
}