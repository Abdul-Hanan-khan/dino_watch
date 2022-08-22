import 'package:flutter/material.dart';
// import 'package:month_year_picker/month_year_picker.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/helper.dart';

class AddNewCardController extends GetxController {
  RxBool save = false.obs;

  RxString cardno = "".obs;
  RxString cardnoError = "".obs;
  RxString date = "".obs;
  RxString dateError = "".obs;
  RxString scode = "".obs;
  RxString scodeError = "".obs;
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime(0, 0, 0));

  bool validate() {
    RxBool isValid = true.obs;
    if (cardno.value.isEmpty) {
      cardnoError.value = "Enter valid number";
      isValid.value = false;
    } else if (!Helper.isCardNumber(cardno.value)) {
      cardnoError.value = "The Card Number must contain at least 16 character";
      isValid.value = false;
    }

    if (selectedDate.value == DateTime(0, 0, 0)) {
      dateError.value = "Select Expire Date";
      isValid.value = false;
    }

    if (scode.value.isEmpty) {
      scodeError.value = "Enter Security Code";
      isValid.value = false;
    } else if (!Helper.iscvv(scode.value)) {
      scode.value = "The Security Code must contain at least 3 character";
      isValid.value = false;
    }

    return isValid.value;
  }

  selectDate(BuildContext context) async {
    // DateTime? selected = await showMonthYearPicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2010),
    //   lastDate: DateTime(2025),
    //   builder: (BuildContext context, Widget? child) {
    //     return Theme(
    //       data: ThemeData.light().copyWith(
    //         colorScheme: ColorScheme.light(
    //           primary: AppColors.appColor,
    //           onPrimary: Colors.white,
    //           surface: AppColors.appColor,
    //           onSurface: Colors.black,
    //         ),
    //         dialogBackgroundColor: AppColors.secondaryColor,
    //       ),
    //       child: child!,
    //     );
    //   },
    // );

    // if (selected != selectedDate.value) {
    //   selectedDate.value = selected!;
    // }
  }

  onAddCard() {
    if (validate()) {
    } else {}
  }
}
