import 'package:cached_map/cached_map.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_screen.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';
import '../../../services/http_service.dart';

class LoginScreenController extends GetxController {

  RxString username = "".obs;
  RxString userNameError = "".obs;

  RxString userId="10".obs;

  RxBool loading = false.obs;
  RxString password = "".obs;
  RxString passwordError = "".obs;

  RxBool obsure = true.obs;
  Rx<AuthModel> user= AuthModel().obs;

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUser();
    // getAllBrands();
  }



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
    if (validate()) {
      loading.value = true;
     user.value = (await HttpService.userLogin(username.value.toString(), password.value.toString()))!;
      loading.value = false;


      if (user.value.status == "success") {
        Get.offAll(BottomBarScreen());
        userLoginStatus=true;
        saveUser(user.value);

      } else {
        showDialog(
            context: context,
            builder: (_) =>
                AlertDialogWidget(
                  onPositiveClick: () {
                    Get.back();
                  },
                  title: "Error",
                  subTitle: "User name or password is Wrong",
                ));
      }
    }
  }


   fetchUser() async {
    // loadingCart.value= true;
    try{
      Map<String, dynamic>? userJson =
      await Mapped.loadFileDirectly(cachedFileName: 'User');

      if (userJson == null)
      {
       user.value=AuthModel();
       userLoginStatus=false;
      // loadingCart.value=false;
      }
      else
      {
        // loadingCart.value=false;
        userLoginStatus=true;
        user.value = AuthModel.fromJson(userJson);
//        calculateTotalItems();
      }
    }
    catch(e){
      print(e);
      // loadingCart.value=false;
    }
  }



  saveUser(AuthModel user,) {
    try {
      Mapped.saveFileDirectly(file: user.toJson(), cachedFileName: 'User');
        print("User saved successfully",);
        userLoginStatus=true;
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
  deleteUser() {
    try {
      Mapped.deleteFileDirectly(cachedFileName: 'User');
        print("User Deleted",);
      userLoginStatus=false;

    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
