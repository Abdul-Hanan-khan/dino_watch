import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import '../../../core/app_export.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final ChangePasswordController _con = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        back: true,
        text: AppString.changepassword,
        backgroundColor: Colors.transparent,
        actionIcon: false,
        actionPressed: () {},
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (constraint.maxHeight -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).viewPadding.bottom),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.authbg),
                  ),
                ),
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      hSizedBox0,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hSizedBox36,
                          hSizedBox30,
                          Center(
                            child: SizedBox(
                              height: 240,
                              width: 300,
                              child: Image.asset(
                                ImageConstant.createnewpasswordbg,
                              ),
                            ),
                          ),
                          hSizedBox20,
                          Text(
                            AppString.oldPassword,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          hSizedBox8,
                          AppTextField(
                            hintText: AppString.oldPassword,
                            onChange: (val) {
                              _con.oldpassword.value = val;
                            },
                            errorMessage: _con.oldpasswordError,
                          ),
                          hSizedBox14,
                          Text(
                            AppString.newPassword,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          hSizedBox8,
                          AppTextField(
                            hintText: AppString.newPassword,
                            onChange: (val) {
                              _con.password.value = val;
                            },
                            errorMessage: _con.passwordError,
                          ),
                          hSizedBox14,
                          Text(
                            AppString.conformPassword,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          hSizedBox8,
                          AppTextField(
                            hintText: AppString.conformPassword,
                            onChange: (val) {
                              _con.conpass.value = val;
                            },
                            errorMessage: _con.conpassError,
                          ),
                          hSizedBox36,
                          Center(
                            child: AppButton(
                              text: AppString.done,
                              width: Get.width / 2,
                              onPressed: () {
                                _con.onnewPass();
                              },
                            ),
                          )
                        ],
                      ),
                      hSizedBox0
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
