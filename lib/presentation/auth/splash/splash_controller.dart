import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/main.dart';

import '../../../core/static/static_vars.dart';
import '/core/app_export.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      if(userLoginStatus == true ){
        Get.offNamed(AppRoutes.bottomBarScreen);

        SharedPreferences prefs= await SharedPreferences.getInstance();
        StaticVars.userName=prefs.getString('userName').toString();
        StaticVars.id =prefs.getString('userId').toString();
        StaticVars.email=prefs.getString('userEmail').toString();

      }else{
        Get.offNamed(AppRoutes.introductionscreen);

      }
    });
    super.onInit();
  }
}
