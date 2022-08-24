import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import '../../../core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginScreenController _con = Get.put(LoginScreenController());

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
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            AppString.login,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          hSizedBox10,
                          Text(
                            AppString.loginDetails,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          hSizedBox30,
                          AppTextField(
                            hintText: AppString.userName,
                            prefixIcon: ImageConstant.userIcon,
                            onChange: (val) {
                              _con.username.value = val;
                              _con.userNameError.value = '';
                            },
                            errorMessage: _con.userNameError,
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
                                    color: _con.obsure.value == true
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              ),
                              hintText: AppString.password,
                              prefixIcon: ImageConstant.password,
                              onChange: (val) {
                                _con.password.value = val;
                                _con.passwordError.value = '';
                              },
                              errorMessage: _con.passwordError,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                Get.toNamed(AppRoutes.forgotPasswordScreen);
                              },
                              child: Text(
                                AppString.forgotPassword,
                                style: const TextStyle(
                                  color: Color(0xff1EB8AC),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.07),
                          Obx(() => _con.loading.value
                              ? CircularProgressIndicator()
                              : AppButton(
                                  text: AppString.login,
                                  width: Get.width / 2,
                                  onPressed: () {
                                    _con.onLogin(context);
                                  },
                                )),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                Get.toNamed(AppRoutes.bottomBarScreen);
                              },
                              child: Text(
                                AppString.skip,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.dontHaveanAccount,
                            style: const TextStyle(
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(AppRoutes.signupScreen);
                            },
                            child: Text(
                              AppString.register,
                              style: TextStyle(
                                  color: AppColors.appColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14),
                            ),
                          )
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
}
