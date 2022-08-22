import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class ChangePasswordController extends GetxController {
  RxString oldpassword = "".obs;
  RxString oldpasswordError = "".obs;
  RxString password = "".obs;
  RxString passwordError = "".obs;
  RxString conpass = "".obs;
  RxString conpassError = "".obs;

  bool validate() {
    RxBool isValid = true.obs;
    if (oldpassword.value.isEmpty) {
      oldpasswordError.value = "Enter password";
      isValid.value = false;
    } else if (oldpassword.value.length < 6) {
      oldpasswordError.value = "please enter max 6 character";
      isValid.value = false;
    }

    if (password.value.isEmpty) {
      passwordError.value = "Enter password";
      isValid.value = false;
    } else if (password.value.length < 6) {
      passwordError.value = "please enter max 6 character";
      isValid.value = false;
    }
    if (conpass.value != password.value) {
      conpassError.value = "Passwrd does not match";
      isValid.value = false;
    }

    return isValid.value;
  }

  onnewPass() {
    if (validate()) {
      debugPrint("Suceess");
    }
  }
}
