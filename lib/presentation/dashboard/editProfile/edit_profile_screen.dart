import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';
import 'package:watch_app/presentation/dashboard/editProfile/edit_profile_controller.dart';

import '../../../core/app_export.dart';
import '../../commamn/app_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final ProfileEditController _con = Get.put(ProfileEditController());

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
                                    ? _con.profileUrl.value != ""
                                        // ? NetworkImage(
                                        //     _con.profileUrl.value,
                                        //   )
                                        ?  NetworkImage(StaticVars.avatar)
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
                              onPressed: () {
                                _con.updateProfile();
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
