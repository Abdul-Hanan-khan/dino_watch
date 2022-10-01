import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';
import 'package:watch_app/presentation/dashboard/editProfile/edit_profile_controller.dart';
import 'package:watch_app/presentation/dashboard/profile/profile_screen.dart';

import '../../../core/app_export.dart';
import '../../commamn/app_button.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileEditController _con = Get.find();
  final LoginScreenController userCon=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        actionPressed: () {
          Get.toNamed(AppRoutes.notificationScreen);
        },
        backgroundColor: AppColors.appColor,
        action: ImageConstant.notification,
        text: AppString.profile,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                width: Get.width,
                height: 170,
                color: AppColors.appColor,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Obx(
                          () => Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: _con.profileImage.value.path.isEmpty
                                    ? _con.profileUrl!.value != ""
                                        // ? NetworkImage(
                                        //     _con.profileUrl.value,
                                        //   )
                                        ?  NetworkImage(userCon.user.value.profileImage!.value)
                                        : const AssetImage(
                                            ImageConstant.cam,
                                          ) as ImageProvider
                                    : FileImage(
                                        _con.profileImage.value,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          child: GestureDetector(
                            onTap: () {
                              _con.pickProfileFile(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset(
                                ImageConstant.cam,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            hSizedBox20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSizedBox4,
                  titleText(AppString.firstName),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter First Name",
                    errorMessage: _con.firstNameError,
                    radius: 30,
                    border: true,
                    onChange: (val) {
                      _con.firstName.value = val;
                    },
                  ),
                  hSizedBox4,
                  titleText(AppString.lastName),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter Last Name",
                    errorMessage: _con.lastNameError,
                    radius: 30,
                    border: true,
                    onChange: (val) {
                      _con.lastName.value = val;
                    },
                  ),
                  hSizedBox18,
                  Obx(
                    () => _con.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: AppButton(
                              text: AppString.save,
                              width: Get.width / 2,
                              onPressed: () async {
                               await _con.updateProfile();
                               if(_con.editModel.value.status == 'success'){
                                 userCon.user.value.firstName!.value=_con.editModel.value.firstName!;
                                 userCon.user.value.lastName!.value=_con.editModel.value.lastName!;
                                 userCon.user.value.profileImage!.value=_con.editModel.value.profileImage!;

                                 userCon.saveUser(userCon.user.value);
                                 // now update user to local
                                 // _con.firstName.value=_con.editModel.value.firstName!;
                                 // _con.lastName.value=_con.editModel.value.lastName!;
                                 // _con.profileUrl.value=_con.editModel.value.profileImage!;
                                 //
                                 //   StaticVars.userName= _con.firstName.value + " " + _con.lastName.value;
                                 //   StaticVars.avatar= _con.editModel.value.profileImage!.toString();
                                 //   SharedPreferences prefs=await SharedPreferences.getInstance();
                                 //
                                 //   prefs.setString('userName', StaticVars.userName);
                                 //   // prefs.setString('userEmail', response.userEmail.toString());
                                 //   prefs.setString('avatar', StaticVars.avatar);


                                Get.back();

                               }
                              },
                            ),
                          ),
                  ),
                  hSizedBox18,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  titleText(inputTitle) {
    return Text(
      inputTitle,
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xff707070),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
