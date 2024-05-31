import 'package:flutter/material.dart';
import 'package:turtle/src/view/profile_screen/models/profile_data_model.dart';

import '../../../utils/base/resources/resources.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureTextPasswordSignup = true;
  bool obscureTextConfirmPasswordSignup = true;
  bool obscureTextPasswordLogin = true;

  togglePasswordSignup() {
    //           show/hide password
    obscureTextPasswordSignup = !obscureTextPasswordSignup;
    notifyListeners();
  }

  PageController auctionsListPageController=PageController();
  int currentPage = 0;

  toggleConfirmPasswordSignup() {
    //          show/hide confirm password
    obscureTextConfirmPasswordSignup = !obscureTextConfirmPasswordSignup;
    notifyListeners();
  }

  togglePasswordLogin() {
    //          show/hide confirm password
    obscureTextPasswordLogin = !obscureTextPasswordLogin;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? R.texts.enterValidEmail
        : null;
  }

  String? validatePhoneNumber(String? value) {
    String pattern =
        r'(^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty || !regExp.hasMatch(value)) {
      return R.texts.enterValidPhoneNumber;
    }
    return null;
  }

  String? validatePasswordStrength(String? value) {
    String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return R.texts.passwordCantBeEmpty;
    } else if (!regExp.hasMatch(value)) {
      return R.texts.enterStrongPassword;
    }
    return null;
  }

  String? validateMatchPassword(String? value, TextEditingController passwordController, TextEditingController confirmPasswordController) {
    confirmPasswordController.text = value!;
    if (passwordController.text == confirmPasswordController.text) {
      return null;
    }
    return R.texts.passwordNotMatch;
  }

  String? validateEmptyField(String? value) {
    if (value!.isEmpty) {
      return R.texts.fieldCantBeEmpty;
    }
    return null;
  }

  bool validateOtp(String otp) {
    // }
    if (otp == '1234') {
      return false;
    }
    return true;
  }

  void updateProfileDetails(String newName, String newPhone){
    if(newName.isNotEmpty) {
      demoProfileData.name = newName;
    }
    if(newPhone.isNotEmpty) {
      demoProfileData.phone = newPhone;
    }
  }

  update() {
    notifyListeners();
  }

  bool togglePassword(bool value){
    notifyListeners();
    return !value;
  }
}