import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';

import '../../../core/app_export.dart';

import 'payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final PaymentController _con = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.payment,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSizedBox10,
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.addNewCardScreen);
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xffD2D2D2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConstant.addnewcard,
                        height: 25,
                        width: 25,
                      ),
                      wSizedBox10,
                      Text(
                        AppString.addNewCard,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              hSizedBox18,
              Text(
                AppString.paymentMethod,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox18,
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _con.paymentmethodScreen
                      .asMap()
                      .map((index, item) => MapEntry(
                          index,
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    spreadRadius: .5,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item,
                                    height: 20,
                                    width: 20,
                                  ),
                                  wSizedBox6,
                                  Text(AppString.pay)
                                ],
                              ),
                            ),
                          )))
                      .values
                      .toList()),
              hSizedBox18,
              Text(
                AppString.cardno,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hSizedBox8,
              AppTextField(
                shadow: true,
                hintText: "Card No",
                errorMessage: _con.cardnoError,
                radius: 30,
                border: true,
                onChange: (val) {
                  _con.cardno.value = val;
                },
              ),
              hSizedBox18,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.expirydate,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        hSizedBox8,
                        AppTextField(
                          shadow: true,
                          hintText: "MM/YYYY",
                          errorMessage: _con.cardnoError,
                          radius: 30,
                          border: true,
                          onChange: (val) {
                            _con.cardno.value = val;
                          },
                        ),
                      ],
                    ),
                  ),
                  wSizedBox10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.cvv,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        hSizedBox8,
                        AppTextField(
                          shadow: true,
                          hintText: "CVV",
                          errorMessage: _con.cardnoError,
                          radius: 30,
                          border: true,
                          onChange: (val) {
                            _con.cardno.value = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              hSizedBox18,
              Text(
                AppString.cardholdername,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hSizedBox8,
              AppTextField(
                shadow: true,
                hintText: "Card holder name",
                errorMessage: _con.cardnoError,
                radius: 30,
                border: true,
                onChange: (val) {
                  _con.cardno.value = val;
                },
              ),
              hSizedBox18,
              Row(
                children: [
                  Text(
                    AppString.savecardinformation,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const Spacer(),
                  Obx(
                    () => FlutterSwitch(
                      height: 30,
                      width: 60,
                      padding: 4,
                      toggleSize: 20,
                      activeText: AppString.save,
                      activeTextColor: Colors.white,
                      activeTextFontWeight: FontWeight.w600,
                      activeIcon: Icon(
                        Icons.done,
                        color: AppColors.appColor,
                      ),
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
              hSizedBox10,
              const Divider(
                color: Color(0xff707070),
                thickness: 2,
              ),
              hSizedBox10,
              Row(
                children: [
                  Text(
                    AppString.total,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Text(
                      _con.controller.grandTotal().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              hSizedBox20,
              Center(
                child: AppButton(
                  text: AppString.payNow,
                  width: Get.width / 2,
                  onPressed: () {
                    Get.toNamed(AppRoutes.successfullyScreen);
                  },
                ),
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }
}
