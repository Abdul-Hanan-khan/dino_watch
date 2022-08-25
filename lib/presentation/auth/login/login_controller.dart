import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';
import '../../../services/http_service.dart';

class LoginScreenController extends GetxController {

  RxString username = "kirtan@gmail.com".obs;
  RxString userNameError = "".obs;

  RxBool loading = false.obs;
  RxString password = "Admin@123".obs;
  RxString passwordError = "".obs;

  RxBool obsure = true.obs;



  bool validate() {
    RxBool isValid = true.obs;
    if (username.value.isEmpty || username.value.length <= 0) {
      userNameError.value = "Enter userName";
      isValid.value = false;
    }

    if (password.value.isEmpty) {
      passwordError.value = "Enter password";
      isValid.value = false;
    }
    return isValid.value;
  }

  onLogin(BuildContext context) async {
    loading.value = true;
    AuthModel? response =
        await HttpService.userLogin(username.toString(), password.toString());
    loading.value = false;

    if (validate()) {
      if (response!.status == "success") {
        Get.offAllNamed(AppRoutes.bottomBarScreen);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('loginStatus', true);
        prefs.setString('userId', response.userId.toString());
        prefs.setString('userName', response.userName.toString());
        prefs.setString('userEmail', response.userEmail.toString());


      } else {
        showDialog(
            context: context,
            builder: (_) => AlertDialogWidget(
                  onPositiveClick: () {},
                  title: "Error",
                  subTitle: "User name or password is Wrong",
                ));
      }
    }
  }
}
