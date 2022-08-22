import '../../../core/app_export.dart';

class ForgotPasswordController extends GetxController {
  RxBool values = false.obs;
  RxString email = "".obs;
  RxString emailError = "".obs;

  bool validate() {
    RxBool isValid = true.obs;
    if (email.value.isEmpty) {
      emailError.value = "Enter email";
      isValid.value = false;
    } else if (!email.value.isEmail) {
      emailError.value = "valid email";
      isValid.value = false;
    }

    return isValid.value;
  }

  onForgot() {
    if (validate()) {
      Get.toNamed(AppRoutes.verifyYourEmailScreen);
    }
  }
}
