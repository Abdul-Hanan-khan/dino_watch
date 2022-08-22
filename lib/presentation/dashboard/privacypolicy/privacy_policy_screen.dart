import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';

import '../../../core/app_export.dart';
import 'privacy_policy_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);
  final PrivacyPolicyController _con = Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.privacypolicy,
        actionIcon: true,
        back: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              hSizedBox20,
              Text(
                AppString.dataprivacy,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              hSizedBox20,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        _con.onFav(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.appColor)),
                                child: _con.isagree.contains(index)
                                    ? Icon(
                                        Icons.done,
                                        size: 20,
                                        color: AppColors.appColor,
                                      )
                                    : null),
                            wSizedBox16,
                            const Expanded(
                              child: Text(
                                "All data entered is synced is to our server in The US. It is encrypted as it travels between Your device and our services.",
                                style: TextStyle(
                                    color: Color(0xff4A4A4A),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.email + ":",
                      style: const TextStyle(
                        color: Color(0xff4B4B4B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: "williamrouse51@gmail.com",
                      style: TextStyle(
                        color: AppColors.appColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              hSizedBox20,
              const Divider(
                color: Color(0xffDDDDDD),
              ),
              hSizedBox20,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppString.analytics,
                      style: const TextStyle(
                        color: Color(0xff4B4B4B),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Obx(
                    () => FlutterSwitch(
                      height: 24,
                      width: 45,
                      padding: 2,
                      toggleSize: 20,
                      activeTextColor: Colors.white,
                      activeTextFontWeight: FontWeight.w600,
                      value: _con.save.value,
                      toggleColor: Colors.white,
                      activeToggleColor: Colors.white,
                      activeColor: AppColors.appColor,
                      inactiveColor: const Color(0xffCACACA),
                      onToggle: (val) {
                        _con.save.value = val;
                      },
                    ),
                  ),
                ],
              ),
              hSizedBox20,
              Text(
                AppString.loremipsum,
                style: const TextStyle(
                    color: Color(0xff4A4A4A),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              hSizedBox20,
            ],
          ),
        ),
      ),
    );
  }
}
