import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import 'package:watch_app/presentation/dashboard/addnewcard/add_new_card_controller.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({Key? key}) : super(key: key);
  final AddNewCardController _con = Get.put(AddNewCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.addNewCard,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 195,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(ImageConstant.card), fit: BoxFit.cover),
                ),
              ),
              hSizedBox18,
              titleText(AppString.cardholderName),
              hSizedBox6,
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
              hSizedBox4,
              titleText(AppString.cardNumber),
              hSizedBox6,
              AppTextField(
                shadow: true,
                hintText: "1234 5678 9100 1112",
                errorMessage: _con.cardnoError,
                radius: 30,
                border: true,
                onChange: (val) {
                  _con.cardno.value = val;
                },
              ),
              hSizedBox4,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText(AppString.cvv),
                        hSizedBox6,
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
                  wSizedBox10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText(AppString.expirydate),
                        hSizedBox6,
                        GestureDetector(
                          onTap: () {
                            _con.selectDate(context);
                          },
                          child: Container(
                            alignment:
                                _con.selectedDate.value == DateTime(0, 0, 0)
                                    ? Alignment.centerLeft
                                    : Alignment.center,
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Obx(
                              () => _con.selectedDate.value == DateTime(0, 0, 0)
                                  ? const Text(
                                      "MM/YY",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : Text(
                                      "${_con.selectedDate.value.month.toString().padLeft(2, "0")}/${_con.selectedDate.value.year}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              hSizedBox4,
              titleText(AppString.securityCode),
              hSizedBox6,
              AppTextField(
                shadow: true,
                hintText: "123456",
                errorMessage: _con.cardnoError,
                radius: 30,
                border: true,
                onChange: (val) {
                  _con.cardno.value = val;
                },
              ),
              hSizedBox20,
              Center(
                child: AppButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.payNow,
                  width: Get.width / 2,
                ),
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }

  titleText(inputTitle) {
    return Text(
      inputTitle,
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xffA3A3A3),
      ),
    );
  }
}
