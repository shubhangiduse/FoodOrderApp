class Validator {
  static String? validatePasswordLength(value) {
    if (value.toString().length < 6) {
      return 'Enter minimum 6 digits';
    }
    return null;
  }

  static String? validateUserNameLength(value) {
    if (value.toString().length < 3) {
      return 'Enter minimum 3 digits';
    }
    return null;
  }

  static String? validateEmailId(value) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return null;
    } else {
      return 'Enter correct email id';
    }
  }
}
