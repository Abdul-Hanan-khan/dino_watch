import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import '../../../core/app_export.dart';
import 'create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);
  final CreateNewPasswordController _con =
      Get.put(CreateNewPasswordController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: appBar(
          back: true,
          text: AppString.createNewPassword,
          backgroundColor: Colors.transparent,
          actionIcon: false,
          actionPressed: () {},
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.authbg,
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hSizedBox30,
                      Image.asset(
                        ImageConstant.createnewpasswordbg,
                        height: 240,
                        width: 300,
                      ),
                      hSizedBox20,
                      Text(
                        AppString.createNewPasswordDetails,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                      hSizedBox30,
                      Obx(
                        () => AppTextField(
                          obsecureText: _con.obsurepass.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _con.obsurepass.toggle();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Image.asset(
                                ImageConstant.secure,
                                height: 20,
                                width: 20,
                                color: _con.obsurepass.value == true
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                          hintText: AppString.newPassword,
                          prefixIcon: ImageConstant.password,
                          onChange: (val) {
                            _con.password.value = val;
                          },
                          errorMessage: _con.passwordError,
                        ),
                      ),
                      hSizedBox8,
                      Obx(
                        () => AppTextField(
                          obsecureText: _con.obsureconpass.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _con.obsureconpass.toggle();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Image.asset(
                                ImageConstant.secure,
                                height: 20,
                                width: 20,
                                color: _con.obsureconpass.value == true
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                          hintText: AppString.conformPassword,
                          prefixIcon: ImageConstant.password,
                          onChange: (val) {
                            _con.conpass.value = val;
                          },
                          errorMessage: _con.conpassError,
                        ),
                      ),
                      hSizedBox20,
                      AppButton(
                        text: AppString.send,
                        width: Get.width / 2,
                        onPressed: () {
                          _con.onnewPass();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
