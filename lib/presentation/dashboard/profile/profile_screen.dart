import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';

import '../../../core/app_export.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final BottomBarController _barController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
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
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImageConstant.intro3),
                          ),
                        ),
                      ),
                    ),
                    hSizedBox10,
                    Text(
                      AppString.pname,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    hSizedBox6,
                    Text(
                      AppString.pemail,
                      style: const TextStyle(
                        color: Color(0xffF2CAD0),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            hSizedBox20,
            profileList(
              icon: ImageConstant.buy,
              name: AppString.myCart,
              ontap: () {
                _barController.pageIndex.value = 1;
              },
            ),
            profileList(
              icon: ImageConstant.myOrders,
              name: AppString.myOrders,
              ontap: () {
                Get.toNamed(AppRoutes.myOrdersScreen);
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
}
