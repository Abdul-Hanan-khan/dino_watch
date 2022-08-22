import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';

class SignUpController extends GetxController {
  RxBool values = false.obs;
  RxString email = "gautam.micrasolution@gmail.com".obs;
  RxString emailError = "".obs;
  RxString name = "".obs;
  RxString nameError = "".obs;
  RxString phNo = "".obs;
  RxString phNoError = "".obs;
  RxString password = "gautam".obs;
  RxString passwordError = "".obs;

  RxBool obsure = false.obs;

  bool validate() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    nameError.value = '';
    emailError.value = '';
    phNoError.value = "";

    if (name.value.isEmpty) {
      nameError.value = "Enter Name";
      isValid.value = false;
    }

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
      passwordError.value = "please enter max 6 character";
      isValid.value = false;
    }

    if (phNo.value.isEmpty) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phNo.value)) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    }
    return isValid.value;
  }

  onSignup() {
    if (validate()) {
      Get.offAllNamed(AppRoutes.bottomBarScreen);
    }
  }
}
