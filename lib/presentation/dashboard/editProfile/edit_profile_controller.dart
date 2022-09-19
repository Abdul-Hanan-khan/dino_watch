import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as path;
import 'package:watch_app/core/static/static_vars.dart';
import 'dart:io';

import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../model/edit_profile_model.dart';

class ProfileEditController extends GetxController {
  RxString firstName = "".obs;
  RxString firstNameError = "".obs;
  RxString lastName = "".obs;
  RxString lastNameError = "".obs;

  List userNameSplit=StaticVars.userName.split(" ");
  @override
  void onInit() async {
   firstName.value=userNameSplit[0];
   lastName.value=userNameSplit[2];

   print(firstName);
   print(lastName);

    super.onInit();
  }



  RxBool loading=false.obs;
  Rx<EditProfileModel> editModel=EditProfileModel().obs;

  Rx<File> profileImage = File("").obs;
  final ImagePicker picker = ImagePicker();
  dio.MultipartFile? multipartFile;
  RxString profileUrl =
      StaticVars.avatar
          .obs;

  bool validate() {
    RxBool isValid = true.obs;
    if (firstName.value.isEmpty) {
      firstNameError.value = "Please Enter First Name";
      isValid.value = false;
    }else{
      firstNameError.value = "";
      isValid.value=true;
    }
    if (lastName.value.isEmpty) {
      lastNameError.value = "Please Enter Last Name";
      isValid.value = false;
    }else{
      lastNameError.value = "";
      isValid.value = true;
    }


    return isValid.value;
  }


  void pickProfileFile(context) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // hSizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 15,
                    width: 15,
                  ),
                  Text(
                    AppString.selecetimage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      ImageConstant.close,
                      height: 15,
                      width: 15,
                    ),
                  )
                ],
              ),
              hSizedBox10,
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.appColor,
                      width: 1.3,
                    ),
                  ),
                  child: Image.asset(
                    ImageConstant.cam,
                    color: AppColors.appColor,
                  ),
                ),
                title: Text(
                  AppString.takeaphoto,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () async {
                  Get.back();
                  await picImage(false);
                },
              ),
              hSizedBox6,
              Divider(
                thickness: 1,
                color: const Color(0xff707070).withOpacity(.3),
              ),
              hSizedBox6,
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.appColor,
                      width: 1.3,
                    ),
                  ),
                  child: Image.asset(
                    ImageConstant.gallery,
                    color: AppColors.appColor,
                  ),
                ),
                title: Text(
                  AppString.gallery,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () async {
                  Get.back();
                  await picImage(true);
                },
              ),
              hSizedBox10,
            ],
          ),
        );
      },
    );
  }

  Future picImage(bool fromGallery) async {
    XFile? pickedFile;
    try {
      pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 500,
        maxWidth: 500,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    profileImage.value = File(pickedFile!.path);

  }



  Future updateProfile()async{
    if (validate()) {
      loading.value= true;

      editModel.value=(await HttpService.editProfile(userId: StaticVars.id,firstName: firstName.value,lastName: lastName.value,image: profileImage.value.path ))!;


      loading.value= false;
    }
    return editModel;
  }
}
