import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';

class LoginScreenController extends GetxController {
  RxString email = "kirtan@gmail.com".obs;
  RxString emailError = "".obs;

  RxString password = "Admin@123".obs;
  RxString passwordError = "".obs;

  RxBool obsure = true.obs;

  bool validate() {
    RxBool isValid = true.obs;
    if (email.value.isEmpty) {
      emailError.value = "Enter email";
      isValid.value = false;
    } else if (!email.value.isEmail) {
      emailError.value = "valid email";
    } else {
      emailError.value = "Enter valid email";
    }

    if (password.value.isEmpty) {
      passwordError.value = "Enter password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "please enter valid password";
      isValid.value = false;
    }
    return isValid.value;
  }

  onLogin() {
    if (validate()) {
      Get.offAllNamed(AppRoutes.bottomBarScreen);
    }
  }
}
