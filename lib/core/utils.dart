class Utils {
  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Email";
    }
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
      r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:"
      r"[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+.*$",
      caseSensitive: false,
      multiLine: false,
    );
    if (!regExp.hasMatch(value)) {
      return 'Invalid email';
    }

    return null;
  }
}
