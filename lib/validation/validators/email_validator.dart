import 'validators.dart';

/// Classe responsável por validar se uma String é um e-mail válido.
///
/// Utiliza uma expressão regular para verificar se o formato do e-mail é válido.
///
/// Como usar:
/// ```dart
/// final emailValidator = EmailValidator();
/// final email = 'example@mail.com';
/// final isValid = emailValidator.validate(email); // true
/// ```
class EmailValidator implements Validator<String> {
  final RegExp _emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  /// Valida se uma String é um e-mail válido.
  ///
  /// Retorna true caso o valor for nulo ou vazio ou se for um e-mail válido.
  /// Caso contrário, retorna false.
  @override
  bool validate(String? value) {
    final bool isValid = value == null || value.isEmpty || _emailRegex.hasMatch(value);
    return isValid;
  }
}
