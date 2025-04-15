class TextFormValidations {
  static bool isValidEmail(String? email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email ?? '');
  static bool emptyField(String? value) => value == null || value.isEmpty;
  static bool isValidPhoneNumber(String? phone) =>
      RegExp(r'^\+?[\d\s\-]{9,13}$').hasMatch(phone ?? '');
}
