import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import '../../../core/app_export.dart';
import '../../widgets/alertDialog.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final ForgotPasswordController _con = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: appBar(
          back: true,
          text: AppString.forgotPwd,
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
                    children: [
                      const Spacer(),
                      Column(
                        children: [
                          hSizedBox30,
                          Image.asset(
                            ImageConstant.forgotPasswordbg,
                            height: 240,
                            width: 240,
                          ),
                          hSizedBox20,
                          Text(
                            AppString.forgotPasswordDetails,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          hSizedBox30,
                          AppTextField(
                            hintText: AppString.email,
                            prefixIcon: ImageConstant.email,
                            onChange: (val) {
                              _con.email.value = val;
                            },
                            errorMessage: _con.emailError,
                          ),
                          hSizedBox20,
                          Obx(
                            ()=>_con.loading.value?const Center(child: CircularProgressIndicator(),): AppButton(
                              text: AppString.send,
                              width: Get.width / 2,
                              onPressed: () async {
                               var response= await _con.onForgot();
                               _con.loading.value=false;
                               response['status'] == 'success' ?  showDialog(
                                   context: context,
                                   builder: (_) =>
                                       AlertDialogWidget(
                                         onPositiveClick: () {
                                           Get.back();
                                           Get.back();
                                         },
                                         title: "Message",
                                         subTitle: "A reset link is sent to your email. Try login After resetting credentials",
                                       )):showDialog(
                                   context: context,
                                   builder: (_) =>
                                       AlertDialogWidget(
                                         onPositiveClick: () {
                                           Get.back();
                                         },
                                         title: "Alert",
                                         subTitle: "Some went wrong. please try again later",
                                       ));



                              },
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.backto + " ",
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
