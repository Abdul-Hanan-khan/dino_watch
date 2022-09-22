import 'package:watch_app/services/http_service.dart';

import '../../../core/app_export.dart';

class ForgotPasswordController extends GetxController {
  RxBool values = false.obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxBool loading=false.obs;


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

  Future<dynamic> onForgot() async {
    if (validate()) {
      loading.value=true;
     var response= await HttpService.forgotPassword(email.value);
      loading.value=true;
      // Get.toNamed(AppRoutes.verifyYourEmailScreen);
      return response;
    }
  }
}
