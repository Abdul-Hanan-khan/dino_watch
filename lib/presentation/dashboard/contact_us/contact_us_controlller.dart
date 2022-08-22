import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';

class ContactUsController extends GetxController {
  RxString name = "".obs;
  RxString nameError = "".obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString mes = "".obs;
  RxString mesError = "".obs;

  bool validate() {
    RxBool isValid = true.obs;
    emailError.value = '';
    mesError.value = '';
    nameError.value = '';

    if (name.value.isEmpty) {
      nameError.value = "Enter Name";
      isValid.value = false;
    }

    if (email.value.isEmpty) {
      emailError.value = "Enter email";
      isValid.value = false;
    } else if (!email.value.isEmail) {
      emailError.value = "valid email";
      isValid.value = false;
    }

    if (mes.value.isEmpty) {
      mesError.value = "Enter Message";
      isValid.value = false;
    }

    return isValid.value;
  }

  onSend() {
    if (validate()) {
      debugPrint("Sucees");
    }
  }
}
