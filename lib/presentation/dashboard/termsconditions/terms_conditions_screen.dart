import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

import '../../../core/app_export.dart';

import '../../commamn/app_bar.dart';
import 'terms_conditions_controller.dart';

class TermsConditionsScreen extends StatelessWidget {
  TermsConditionsScreen({Key? key}) : super(key: key);
  final TermsConditionsController _con = Get.put(TermsConditionsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar(
            text: "Terms And Conditions".tr, actionIcon: true, back: true),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                hSizedBox20,
                SizedBox(
                  height: 210,
                  width: Get.width,
                  child: Image.asset(ImageConstant.tcbg),
                ),
                hSizedBox20,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _con.termsConditionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (termsConditionItem(index));
                    }),
                Column(
                  children: [
                    checkBox(
                      func: () {
                        _con.isTC.value = !_con.isTC.value;
                      },
                      name: AppString.termsandcondiition,
                      icon: _con.isTC.value
                          ? Icon(
                              Icons.done,
                              size: 12,
                              color: AppColors.appColor,
                            )
                          : null,
                    ),
                    hSizedBox10,
                    checkBox(
                      func: () {
                        _con.ispolicy.value = !_con.ispolicy.value;
                      },
                      name: AppString.privacypolicy,
                      icon: _con.ispolicy.value
                          ? Icon(
                              Icons.done,
                              size: 12,
                              color: AppColors.appColor,
                            )
                          : null,
                    ),
                  ],
                ),
                hSizedBox30,
                hSizedBox10,
                AppButton(
                  onPressed: _con.ispolicy.value && _con.isTC.value
                      ? () {
                          Get.back();
                        }
                      : () {},
                  width: 250,
                  color: _con.ispolicy.value && _con.isTC.value
                      ? AppColors.appColor
                      : Colors.grey.shade400,
                  text: AppString.agree,
                  textColor: _con.ispolicy.value && _con.isTC.value
                      ? Colors.white
                      : Colors.black26,
                ),
                hSizedBox30,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row checkBox({Function()? func, String? name, Icon? icon}) {
    return Row(
      children: [
        hSizedBox30,
        hSizedBox20,
        GestureDetector(
          onTap: func,
          child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.appColor)),
              child: icon),
        ),
        wSizedBox10,
        Text(AppString.iagreewiththe,
            style: const TextStyle(fontSize: 15, color: Color(0xff91919D))),
        wSizedBox4,
        Text(
          name!,
          style: TextStyle(
            color: AppColors.appColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  termsConditionItem(index) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_con.termsConditionList[index]['subTitle'] != '')
              Text(
                _con.termsConditionList[index]['subTitle'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color:
                      Get.isDarkMode ? Colors.white : const Color(0xff02190C),
                  fontSize: 16.0,
                ),
              ),
            if (_con.termsConditionList[index]['subTitle'] != '') hSizedBox10,
            if (_con.termsConditionList[index]['description'] != '')
              Text(
                _con.termsConditionList[index]['description'],
                style: TextStyle(
                  color:
                      Get.isDarkMode ? Colors.white60 : const Color(0xff91919D),
                  fontSize: 15,
                  height: 1.7,
                ),
              ),
          ],
        ),
      );
}
