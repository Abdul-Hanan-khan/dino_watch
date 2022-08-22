import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(color: AppColors.secondaryColor),
          child: Column(
            children: [
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.bottomBarScreen);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Image.asset(
                ImageConstant.successfully,
                width: Get.width * 0.6,
                height: Get.height * 0.5,
              ),
              Text(
                AppString.successfully,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              hSizedBox18,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.congratulation,
                      style: const TextStyle(
                          color: Color(0xff777777),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.5),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: "#4584553",
                      style: TextStyle(
                        color: AppColors.appColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              hSizedBox36,
              AppButton(
                text: AppString.continueshopping,
                width: Get.width / 1.7,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.bottomBarScreen);
                },
              ),
              hSizedBox10,
              AppButton(
                border: true,
                color: Colors.white,
                text: AppString.trackorder,
                textColor: AppColors.appColor,
                width: Get.width / 1.7,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.trackOrderScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
