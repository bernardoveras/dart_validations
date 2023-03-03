import '../protocols/protocols.dart';

class RequiredFieldValidation implements FieldValidation {
  @override
  final String field;

  RequiredFieldValidation(this.field);

  @override
  String? validate(String? value) {
    final errorText = 'Campo obrigatório';

    if (value == null || value.isEmpty) return errorText;

    return null;
  }
}
