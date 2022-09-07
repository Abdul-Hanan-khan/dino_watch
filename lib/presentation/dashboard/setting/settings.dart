import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';

import 'setting_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final SettingController _con = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: appBar(
        back: true,
        text: AppString.setting,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.account,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              hSizedBox4,
              settingList(
                  text: AppString.email,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.reviewsScreen,
                    );
                  }),
              settingList(
                text: AppString.notification,
              ),
              settingList(
                text: AppString.privacy,
              ),
              settingList(
                text: AppString.security,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffDCDCDC),
              ),
              settingList(
                text: AppString.displayMode,
              ),
              settingList(
                text: AppString.help,
                onTap: (){
                  StaticVars.customLauncher(Uri.parse('https://dannidion.com/frequently-asked-questions/'));

                }
              ),
              settingList(
                  text: AppString.aboutUs,
                  onTap: () {
                  StaticVars.customLauncher(Uri.parse('https://dannidion.com/about-us/'));
                  }),
              const Divider(
                thickness: 1,
                color: Color(0xffDCDCDC),
              ),
              settingList(
                text: AppString.contacts,
                onTap: (){
                  Get.toNamed(
                    AppRoutes.contactUsScreen,
                  );
                }
              ),
              settingList(
                  text: AppString.terms,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.termsConditionsScreen,
                    );
                  }),
              hSizedBox10,
              Text(
                AppString.social,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              hSizedBox4,
              // Obx(
              //   () => settingList(
              //     value: _con.fb.value,
              //     onToggle: (val) {
              //       _con.fb.value = val;
              //     },
              //     text: AppString.facebook,
              //     toggle: true,
              //   ),
              // ),
              Obx(
                () => settingList(
                  onTap: (){
                    StaticVars.customLauncher(Uri.parse('https://www.instagram.com/dannidionofficial/'));
                  },
                  // onToggle: (val) {
                  //   _con.insta.value = val;
                  // },
                  value: _con.insta.value,
                  text: AppString.insta,
                  // toggle: true,
                ),
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }

  Widget settingList({
    required String text,
    bool toggle = false,
    Function(bool)? onToggle,
    Function()? onTap,
    bool? value,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.only(right: 20, left: 20),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3.0,
              spreadRadius: .1,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
            toggle == false
                ? Image.asset(
                    ImageConstant.forwordarrow,
                    height: 14,
                    color: const Color(0xff244150),
                  )
                : FlutterSwitch(
                    height: 25,
                    width: 40,
                    padding: 2,
                    toggleSize: 20,
                    value: value!,
                    toggleColor: Colors.white,
                    activeToggleColor: Colors.white,
                    activeColor: AppColors.appColor,
                    inactiveColor: const Color(0xffE4EEFB),
                    onToggle: onToggle!,
                  ),
          ],
        ),
      ),
    );
  }
}
