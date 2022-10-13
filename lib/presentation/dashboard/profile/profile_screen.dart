import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/auth/login/login_screen.dart';
import 'package:watch_app/presentation/auth/signup/signup_screen.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';
import 'package:watch_app/presentation/dashboard/editProfile/edit_profile_controller.dart';

import '../../../core/app_export.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LoginScreenController loginCtr = Get.find();
  // final BottomBarController _barController = Get.find();
  // final ProfileEditController _con = Get.find();

  @override
  Widget build(BuildContext context) {
    print(userLoginStatus);
    // setState(() {});
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child:
        Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: Get.width,
                  height: 256,
                  color: AppColors.appColor,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(userLoginStatus == false
                                  ? " "
                                  : loginCtr.user.value.profileImage!.value),
                            ),
                          ),
                        ),
                      ),
                      hSizedBox10,
                      userLoginStatus== false
                          ? Container()
                          : Obx(
                              () => Text(
                                loginCtr.user.value.firstName!.value +
                                    " " +
                                    loginCtr.user.value.lastName!.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                      hSizedBox6,
                      userLoginStatus== false
                          ?Container():   Obx(
                        ()=> Text(
                          loginCtr.user.value.userEmail!.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              userLoginStatus == false ?loggedOutContents(): loggedInContents()

            ],
          ),

      ),
    );
  }

  GestureDetector profileList({
    required String icon,
    required String name,
    required Function() ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10.0,
              spreadRadius: .5,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              color: AppColors.yellowColor,
              height: 20,
              width: 30,
            ),
            wSizedBox12,
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Image.asset(
              ImageConstant.forwordarrow,
              color: const Color(0xffB5B5B5),
              height: 16,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget loggedInContents() {
    return Column(
      children: [
        hSizedBox20,
        profileList(
          icon: ImageConstant.myOrders,
          name: AppString.myOrders,
          ontap: () {
            Get.toNamed(AppRoutes.myOrdersScreen);
          },
        ),
        profileList(
          icon: ImageConstant.myOrders,
          name: "Addresses",
          ontap: () {
            Get.toNamed(AppRoutes.orderSummaryScreen);
          },
        ),
        profileList(
          icon: ImageConstant.chooseLanguage,
          name: AppString.chooseLanguage,
          ontap: () {
            Get.toNamed(AppRoutes.chooseLanguageScreen);
          },
        ),
        profileList(
          icon: ImageConstant.privacyPolicy,
          name: AppString.privacyPolicy,
          ontap: () {
            Get.toNamed(AppRoutes.privacyPolicyScreen);
          },
        ),
        profileList(
          icon: ImageConstant.setting,
          name: AppString.settings,
          ontap: () {
            Get.toNamed(AppRoutes.settingScreen);
          },
        ),
        profileList(
          icon: ImageConstant.aboutUs,
          name: AppString.aboutUs,
          ontap: () {
            Get.toNamed(AppRoutes.contactUsScreen);
          },
        ),
        hSizedBox10
      ],
    );
  }

  Widget loggedOutContents() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width,
          height: 50,
        ),
        AppButton(
          text: "Login",
          height: 50,
          onPressed: () {
            Get.off(LoginScreen());
          },
          width: Get.width * 0.6,
        ),
        const SizedBox(
          height: 15,
        ),
        AppButton(
          text: "Sign Up",
          onPressed: () {
            Get.off(SignUpScreen());
          },
          height: 50,
          width: Get.width * 0.6,
          color: const Color(0xff4d18cc),
        )
      ],
    );
  }
}
