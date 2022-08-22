import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

import '../../../core/app_export.dart';
import 'verify_your_email_controller.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  VerifyYourEmailScreen({Key? key}) : super(key: key);
  final VerifyYourEmailController _con = Get.put(VerifyYourEmailController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: appBar(
          back: true,
          text: AppString.verifyYourEmail,
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
                      Image.asset(
                        ImageConstant.verifyyouremailbg,
                        height: 260,
                        width: 260,
                      ),
                      hSizedBox20,
                      Text(
                        AppString.verifyYourEmailDetails,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                      hSizedBox30,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            activeColor: AppColors.appColor,
                            inactiveColor:
                                const Color(0xff8D8D8D).withOpacity(.4),
                            fieldOuterPadding: const EdgeInsets.all(8),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            selectedColor: AppColors.appIconColor,
                            selectedFillColor: Colors.white,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          onCompleted: (v) {},
                          onChanged: (value) {
                            _con.pin.value = value;
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                          appContext: context,
                        ),
                      ),
                      Obx(
                        () => (_con.pinError.value.isEmpty)
                            ? const SizedBox(
                                height: 10,
                              )
                            : Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _con.pinError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                      ),
                      Text(
                        AppString.resendCode,
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      hSizedBox36,
                      AppButton(
                        text: AppString.verify,
                        width: Get.width / 2,
                        onPressed: () {
                          _con.onVerify();
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
