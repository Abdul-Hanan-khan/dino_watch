import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';

class SignUpController extends GetxController {
  HomeController homeController =Get.put(HomeController());

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

    if (firstName.value.isEmpty) {
      firstNameErro.value = "First Name";
      isValid.value = false;
    }    if (lastName.value.isEmpty) {
      lastNameError.value = "Last Name";
      isValid.value = false;
    }

    if(!Helper.isEmail(email.toString())){
      emailError.value = "Enter valid email";
      isValid.value = false;

    }else if(email.isEmpty){
      emailError.value = "please email";
      isValid.value = false;

    }

    if(password.value.length >6){
      passwordError.value = "please enter max 6 character";
      isValid.value = false;
    }else if(password.isEmpty || password.value.length <=0){
      passwordError.value = "please enter password";
      isValid.value = false;
    }
    if(userName.isEmpty || userName == ""){
      userNameError.value = "please enter userName";
      isValid.value = false;

    }
    @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      homeController.getCategories();

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

    if (phNo.value.isEmpty) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phNo.value)) {
      phNoError.value = "Please Enter Valid Mobile Number";
      isValid.value = false;
    }
    return isValid.value;
  }

  onSignup(BuildContext context) async {
    if (validate())  {
      loading.value=true;
     AuthModel ?response=  await HttpService.uesrSignUp(firstName.toString(), lastName.toString(), email.toString(), userName.toString(), password.toString());
      loading.value=false;
      if(response!.status == 'success'){
        Get.offAllNamed(AppRoutes.bottomBarScreen);
      }else{
        showDialog(
            context: context,
            builder: (_) => AlertDialogWidget(onPositiveClick: (){},title: "Error",subTitle: "User name or password is Wrong",)
        );

      }
    }
  }
}
