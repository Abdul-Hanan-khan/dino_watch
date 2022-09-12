import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/constant_sizebox.dart';
import '../../../core/utils/image_constant.dart';
import '../../commamn/app_bar.dart';
import '../../commamn/app_text_field.dart';

class GetCheckoutInfoScreen extends StatelessWidget {
   GetCheckoutInfoScreen({Key? key}) : super(key: key);

   final _con= Get.put(CheckoutController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Confirmation",
        back: true,
        actionIcon: true,
        action: ImageConstant.bag,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
            ),
            const Text(
              'Please Provide us Following Information. Please make sure to provide the right information for order placement',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText("First Name"),
                hSizedBox6,
                AppTextField(
                  shadow: true,
                  hintText: "Enter First Name",
                  // errorMessage: _con.emailError,
                  errorMessage: _con.firstNameError,
                  onChange: (val) {
                    _con.firstNameCtr.text = val;
                  },
                ),titleText("Last Name"),
                hSizedBox6,
                AppTextField(
                  shadow: true,
                  hintText: "Enter Last Name",
                  // errorMessage: _con.emailError,
                  errorMessage: _con.lastNameError,
                  onChange: (val) {
                    _con.lastNameCtr.text = val;
                  },
                ),titleText("Email"),
                hSizedBox6,
                AppTextField(
                  shadow: true,
                  hintText: "Enter Your Email",
                  // errorMessage: _con.emailError,
                  errorMessage: _con.emailError,
                  onChange: (val) {
                    _con.emailCtr.text = val;
                  },
                ),titleText("Address"),
                hSizedBox6,
                AppTextField(
                  shadow: true,
                  hintText: "Enter Your Address",
                  // errorMessage: _con.emailError,
                  errorMessage: _con.addressError,
                  onChange: (val) {
                    _con.addressCtr.text = val;
                  },
                ),titleText("Post Code"),
                hSizedBox6,
                AppTextField(
                  shadow: true,
                  hintText: "Enter Your Area Post Code",
                  // errorMessage: _con.emailError,
                  errorMessage: _con.postCodeError,
                  onChange: (val) {
                    _con.postCodeCtr.text = val;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
   titleText(inputTitle) {
     return Text(
       inputTitle,
       style: const TextStyle(
         fontSize: 15,
         color: Color(0xff707070),
         fontWeight: FontWeight.w500,
       ),
     );
   }
}
