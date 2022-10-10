import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';

import '../../../core/static/static_vars.dart';
import '/core/app_export.dart';

class SplashController extends GetxController {
  LoginScreenController loginCon=Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      if(loginCon.user.value.status != null){
        Get.offNamed(AppRoutes.bottomBarScreen);
        userLoginStatus=true;
      }
      else{
        Get.offNamed(AppRoutes.introductionscreen);
        userLoginStatus=true;
      }
    });
    super.onInit();
  }
}
