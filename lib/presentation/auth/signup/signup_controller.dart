import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';

class SignUpController extends GetxController {
  // HomeController homeController =Get.put(HomeController());
  LoginScreenController loginController =Get.put(LoginScreenController());

  RxBool values = false.obs;
  RxBool loading=false.obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString firstNameErro = "".obs;
  RxString lastNameError = "".obs;
  RxString phNo = "".obs;
  RxString phNoError = "".obs;
  RxString password = "".obs;
  RxString passwordError = "".obs;

  RxString userName = "".obs;
  RxString userNameError = "".obs;

  RxBool obsure = false.obs;

  bool validate() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    firstNameErro.value = '';
    lastNameError.value = '';
    emailError.value = '';
    phNoError.value = "";
    userNameError.value = "";

    if (firstName.value.trim().isEmpty) {
      firstNameErro.value = "First Name";
      isValid.value = false;
    }    if (lastName.value.trim().isEmpty) {
      lastNameError.value = "Last Name";
      isValid.value = false;
    }

    if(!Helper.isEmail(email.trim().toString())){
      emailError.value = "Enter valid email";
      isValid.value = false;

    }else if(email.trim().isEmpty){
      emailError.value = "please email";
      isValid.value = false;

    }

    if(password.value.trim().length <6){
      passwordError.value = "Password Should be Greater than 6 Character";
      isValid.value = false;
    }else if(password.trim().isEmpty || password.value.length <=0){
      passwordError.value = "please enter password";
      isValid.value = false;
    }
    if(userName.trim().isEmpty || userName == ""){
      userNameError.value = "please enter userName";
      isValid.value = false;

    }

    // if (email.value.isEmpty) {
    //   emailError.value = "Enter email";
    //   isValid.value = false;
    // } else if (!email.value.isEmail) {
    //   emailError.value = "valid email";
    // } else {
    //   emailError.value = "Enter valid email";
    // }


    // if (password.value.isEmpty) {
    //   passwordError.value = "Enter password";
    //   isValid.value = false;
    // } else if (!Helper.isPassword(password.value)) {
    //   passwordError.value = "please enter max 6 character";
    //   isValid.value = false;
    // }

    if (phNo.value.trim().isEmpty) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phNo.value.trim())) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    }
    return isValid.value;
  }

  onSignup(BuildContext context) async {
    if (validate())  {
      loading.value=true;
     AuthModel ?response=  await HttpService.uesrSignUp(context, firstName.trim().toString(), lastName.trim().toString(), email.trim().toString(), userName.trim().toString(), password.trim().toString());
      loading.value=false;
      if(response!.status == 'success'){
        Get.offAllNamed(AppRoutes.bottomBarScreen);
        loginController.user.value=response;

        loginController.saveUser(response);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setBool('loginStatus', true);
        // prefs.setString('userId', response.userId.toString());
        // prefs.setString('userName', response.userName.toString());
        // prefs.setString('userEmail', response.userEmail.toString());
        // prefs.setString('avatar', response.profileImage.toString());
        // StaticVars.userName= response.userName.toString();
        // StaticVars.email= response.userEmail.toString();
        // StaticVars.avatar=response.profileImage.toString();
        userLoginStatus=true;
      }
    }
  }
}
