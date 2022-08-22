import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';

class CreateNewPasswordController extends GetxController {
  RxString password = "".obs;
  RxString passwordError = "".obs;
  RxString conpass = "".obs;
  RxString conpassError = "".obs;

  RxBool obsurepass = true.obs;
  RxBool obsureconpass = true.obs;

  bool validate() {
    RxBool isValid = true.obs;

    if (password.value.isEmpty) {
      passwordError.value = "Enter password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
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
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }
}
