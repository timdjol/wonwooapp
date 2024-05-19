class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле $fieldName обязательно';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите Email';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Неверный Email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пароль';
    }

    if (value.length < 6) {
      return 'Пароль должен состоять минимум из 6 символов';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать хотя бы одну заглавную букву';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Пароль должен содержать хотя бы одну цифру';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Пароль должен содержать хотя бы один символ';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Номер телефон обязателен';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Неверный номер';
    }

    return null;
  }
}
