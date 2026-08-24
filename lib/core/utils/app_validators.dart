/* 

It contains the needed validation I'll need for this project
notes I need to make sure I'll read on
- local variable shadow
*/

abstract class AppValidator {
  static const String _emailpattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String _namepattern = r"^[a-zA-Zآ-ي\s]+$";
  static const String _phonepattern = r'^[0-9]{11}$';

  static String? importantField(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return fieldName != null
          ? '$fieldName is required.'
          : 'this field is required.';
    }
    return null;
  }

  // ==========================
  // Name
  static String? validateName(String? value, {String fieldName = 'Name'}) {
    final requireMessage = importantField(value, fieldName: fieldName);
    if (requireMessage != null) return requireMessage;

    if (value!.trim().length < 2) {
      return '$fieldName must more than 2 characters.';
    }

    final nameRegExp = RegExp(_namepattern);
    if (!nameRegExp.hasMatch(value)) {
      return '$fieldName should contain letters only.';
    }

    return null;
  }

  // ==========================
  // email
  static String? validateEmail(String? value) {
    final requireMessage = importantField(value, fieldName: 'Email');
    if (requireMessage != null) return requireMessage;

    final regExp = RegExp(_emailpattern);
    if (!regExp.hasMatch(value!)) {
      return 'Please enter the email right.';
    }
    return null;
  }

  // ==========================
  // password
  static String? validatePassword(String? value) {
    final requireMessage = importantField(value, fieldName: 'Password');
    if (requireMessage != null) return requireMessage;

    if (value!.length < 8) {
      return 'The password cant be less than 8 characters';
    }
    return null;
  }

  // ==========================
  // Confirm password
  // Confirm Password Validation
  static String? validateConfirmPassword(
    String? confirmPassword,
    String? originalPassword,
  ) {
    final requireMessage = importantField(
      confirmPassword,
      fieldName: 'Confirm Password',
    );
    if (requireMessage != null) return requireMessage;

    if (confirmPassword != originalPassword) {
      return 'Passwords do not match.';
    }

    return null;
  }

  // ==========================
  // Phone
  static String? validatePhone(String? value) {
    final requireMessage = importantField(value, fieldName: 'Phone Number');
    if (requireMessage != null) return requireMessage;

    final phoneRegExp = RegExp(_phonepattern);
    if (!phoneRegExp.hasMatch(value!)) {
      return 'The Phone number cant be less than 11 characters';
    }
    return null;
  }
}
