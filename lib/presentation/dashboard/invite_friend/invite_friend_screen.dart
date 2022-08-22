import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import 'invite_friend_controller.dart';

class InviteFriendScreen extends StatelessWidget {
  InviteFriendScreen({Key? key}) : super(key: key);
  final InviteFriendController _con = Get.put(InviteFriendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.invite,
        actionIcon: true,
        back: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hSizedBox36,
              Text(
                AppString.friendship,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              hSizedBox18,
              Text(
                AppString.invitefriendship,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              hSizedBox30,
              AppTextField(
                border: true,
                radius: 50,
                hintText: "link".tr,
                obsecureText: true,
                onChange: (val) {
                  _con.link.value = val;
                },
                errorMessage: _con.linkError,
                prefixIcon: ImageConstant.link,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.yellowColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(ImageConstant.copy),
                      ),
                    ),
                  ],
                ),
              ),
              hSizedBox12,
              Image.asset(
                ImageConstant.invitefrdbg,
                height: 250,
                width: Get.width,
              ),
              hSizedBox30,
              AppButton(
                width: Get.width / 1.8,
                text: AppString.invite,
                height: 50,
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }
}
