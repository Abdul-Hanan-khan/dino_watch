import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';
import 'package:watch_app/presentation/dashboard/editProfile/edit_profile_controller.dart';

import '../../../core/app_export.dart';
import '../../commamn/app_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController _con = Get.put(EditProfileController());
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
                                        ? const AssetImage(ImageConstant.intro3)
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
                  titleText(AppString.email),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Email",
                    errorMessage: _con.emailError,
                    onChange: (val) {
                      _con.email.value = val;
                    },
                  ),
                  hSizedBox4,
                  titleText(AppString.name),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "User Name",
                    errorMessage: _con.nameError,
                    radius: 30,
                    border: true,
                    onChange: (val) {
                      _con.name.value = val;
                    },
                  ),
                  hSizedBox4,
                  titleText(AppString.dob),
                  hSizedBox6,
                  GestureDetector(
                    onTap: () {
                      _con.selectDate(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Obx(
                        () => Row(
                          children: [
                            _con.selectedDate.value == DateTime(0, 0, 0)
                                ? Text(
                                    "DD/MM/YY",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColors.appIconColor,
                                    ),
                                  )
                                : Text(
                                    "${_con.selectedDate.value.day}/${_con.selectedDate.value.month.toString().padLeft(2, "0")}/${_con.selectedDate.value.year}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xff707070),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  hSizedBox12,
                  titleText(AppString.gender),
                  hSizedBox8,
                  Row(
                    children: List.generate(
                      2,
                      (index) {
                        return Obx(
                          () => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _con.isSelectGender.value = index;
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 0 : 6,
                                    right: index == 0 ? 6 : 0),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      spreadRadius: .5,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 50,
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColors.yellowColor,
                                      value: _con.isSelectGender.value,
                                      groupValue: index,
                                      onChanged: (val) {
                                        _con.isSelectGender.value = index;
                                      },
                                    ),
                                    Text(_con.genderList[index])
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  hSizedBox12,
                  titleText(AppString.aboutme),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    maxLines: 2,
                    hintText: "write something..",
                    errorMessage: _con.bioError,
                    radius: 100,
                    border: true,
                    onChange: (val) {
                      _con.bio.value = val;
                    },
                  ),
                  hSizedBox18,
                  Center(
                    child: AppButton(
                      text: AppString.save,
                      width: Get.width / 2,
                      onPressed: () {
                        _con.edit();
                      },
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
