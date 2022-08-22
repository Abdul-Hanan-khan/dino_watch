import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

import 'contact_us_controlller.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  final ContactUsController _con = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.contactus,
        actionIcon: true,
        back: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 217,
                width: Get.width,
                child: Image.asset(
                  ImageConstant.contactusbg,
                ),
              ),
              hSizedBox20,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: .5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstant.emailus,
                            color: AppColors.appColor,
                            height: 18,
                          ),
                          wSizedBox10,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.email,
                                  style: const TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Text(
                                  "ingo@info.com",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  wSizedBox14,
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: .5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstant.call,
                            color: AppColors.appColor,
                            height: 20,
                          ),
                          wSizedBox10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.phNo,
                                style: const TextStyle(
                                  color: Color(0xff707070),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                "+00 894 371 234",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              hSizedBox24,
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: .5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) {
                        _con.name.value = val;
                      },
                      decoration: InputDecoration(
                        hintText: AppString.name,
                        hintStyle: const TextStyle(
                          color: Color(0xffC6C6C6),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffC6C6C6),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffC6C6C6),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => (_con.nameError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  _con.nameError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox8,
                    ),
                    hSizedBox14,
                    TextFormField(
                      onChanged: (val) {
                        _con.email.value = val;
                      },
                      decoration: InputDecoration(
                        hintText: AppString.email,
                        hintStyle: const TextStyle(
                          color: Color(0xffC6C6C6),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffC6C6C6),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffC6C6C6),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => (_con.emailError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  _con.emailError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox8,
                    ),
                    hSizedBox14,
                    TextFormField(
                      maxLines: 4,
                      onChanged: (val) {
                        _con.mes.value = val;
                      },
                      decoration: InputDecoration(
                          hintText: AppString.mes,
                          hintStyle: const TextStyle(
                            color: Color(0xffC6C6C6),
                          ),
                          border: InputBorder.none),
                    ),
                    Obx(
                      () => (_con.mesError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  _con.mesError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox8,
                    ),
                  ],
                ),
              ),
              hSizedBox20,
              AppButton(
                height: 50,
                width: Get.width / 2,
                text: AppString.send,
                onPressed: () {
                  _con.onSend();
                },
              ),
              hSizedBox20,
            ],
          ),
        ),
      ),
    );
  }
}
