import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import '../../../core/app_export.dart';
import 'signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController _con = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
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
                    children: [
                      SizedBox(height: Get.height * 0.14),
                      Column(
                        children: [
                          Text(
                            AppString.signup,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          hSizedBox10,
                          Text(
                            AppString.signupDetails,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          hSizedBox30,
                          AppTextField(
                            hintText: AppString.fullName,
                            prefixIcon: ImageConstant.userIcon,
                            onChange: (val) {
                              _con.name.value = val;
                            },
                            errorMessage: _con.nameError,
                          ),
                          hSizedBox4,
                          AppTextField(
                            hintText: AppString.phNo,
                            prefixIcon: ImageConstant.call,
                            onChange: (val) {
                              _con.phNo.value = val;
                            },
                            errorMessage: _con.phNoError,
                          ),
                          hSizedBox4,
                          AppTextField(
                            hintText: AppString.email,
                            prefixIcon: ImageConstant.email,
                            onChange: (val) {
                              _con.email.value = val;
                            },
                            errorMessage: _con.emailError,
                          ),
                          hSizedBox4,
                          Obx(
                            () => AppTextField(
                              obsecureText: _con.obsure.value,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _con.obsure.toggle();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Image.asset(
                                    ImageConstant.secure,
                                    height: 20,
                                    width: 20,
                                    color: _con.obsure.value == false
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              ),
                              hintText: AppString.password,
                              prefixIcon: ImageConstant.password,
                              onChange: (val) {
                                _con.password.value = val;
                              },
                              errorMessage: _con.passwordError,
                            ),
                          ),
                          SizedBox(height: Get.height * 0.07),
                          AppButton(
                            text: AppString.signup,
                            width: Get.width / 2,
                            onPressed: () {
                              _con.onSignup();
                            },
                          ),
                          hSizedBox10,
                          Text(
                            AppString.or,
                            style: const TextStyle(
                              color: Color(0xff8E8E8E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          hSizedBox10,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                socialLoginButton(
                                    image: ImageConstant.google, onTap: () {}),
                                socialLoginButton(
                                    image: ImageConstant.facebook,
                                    onTap: () {}),
                                socialLoginButton(
                                    image: ImageConstant.apple, onTap: () {}),
                              ])
                        ],
                      ),
                      hSizedBox24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppString.alreadyHaveanAccount,
                            style: const TextStyle(
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.loginScreen);
                              },
                              child: Text(
                                AppString.login,
                                style: TextStyle(
                                    color: AppColors.appColor,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14),
                              )),
                        ],
                      ),
                      hSizedBox10,
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

  socialLoginButton({image, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(6),
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: const Color(0xffD4D4D4)),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
