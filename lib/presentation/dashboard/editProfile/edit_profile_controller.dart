import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as path;
import 'dart:io';

import 'package:watch_app/core/utils/app_string.dart';

class EditProfileController extends GetxController {
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString name = "".obs;
  RxString nameError = "".obs;
  RxString bio = "".obs;
  RxString bioError = "".obs;
  RxString date = "".obs;
  RxString dateError = "".obs;
  RxString gender = "".obs;
  RxString genderError = "".obs;

  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime(0, 0, 0));

  RxInt isSelectGender = 0.obs;
  List genderList = [AppString.male, AppString.female];

  Rx<File> profileImage = File("").obs;
  final ImagePicker picker = ImagePicker();
  dio.MultipartFile? multipartFile;

  RxString profileUrl =
      "https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg"
          .obs;

  bool validate() {
    RxBool isValid = true.obs;
    if (name.value.isEmpty) {
      nameError.value = "Enter valid name";
      isValid.value = false;
    }

    if (email.value.isEmpty) {
      emailError.value = "Enter email";
      isValid.value = false;
    } else if (!email.value.isEmail) {
      emailError.value = "valid email";
      isValid.value = false;
    }

    if (date.value.isEmpty) {
      dateError.value = "Enter Date";
      isValid.value = false;
    }

    if (bio.value.isEmpty) {
      bioError.value = "Write SomeThing your self";
      isValid.value = false;
    }

    return isValid.value;
  }

  selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.appColor,
              onPrimary: Colors.white,
              surface: AppColors.appColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: AppColors.secondaryColor,
          ),
          child: child!,
        );
      },
    );

    if (selected != selectedDate.value) {
      selectedDate.value = selected!;
      date.value =
          "${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}";
    }
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
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 300, ratioY: 300),
          compressQuality: 50,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edit',
              statusBarColor: AppColors.appColor,
              toolbarColor: AppColors.yellowColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              title: 'Edit',
            ),
          ]);
      if (croppedFile != null) {
        profileImage.value = File(croppedFile.path);
        if (kDebugMode) {
          print("===IMAGE SIZE==");
          print(profileImage.value.readAsBytesSync().lengthInBytes);
        }

        multipartFile = dio.MultipartFile.fromFileSync(
          File(croppedFile.path).path,
          filename: path.basename(File(croppedFile.path).path),
        );
        // edit();
      }
    } else {
      return;
    }
  }

  edit() {
    if (validate()) {
      Get.back();
    } else {}
  }
}
