import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/model/place_order_model.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_screen_custom.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/constant_sizebox.dart';
import '../../../core/utils/image_constant.dart';
import '../../commamn/app_bar.dart';
import '../../commamn/app_text_field.dart';

class GetCheckoutInfoScreen extends StatefulWidget {
  GetCheckoutInfoScreen({Key? key}) : super(key: key);

  @override
  State<GetCheckoutInfoScreen> createState() => _GetCheckoutInfoScreenState();
}

class _GetCheckoutInfoScreenState extends State<GetCheckoutInfoScreen> {
  final _con = Get.put(CheckoutController());
  ShoppingCartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    // String dropdownvalue = '${_con.countryList[0].name}';

    return Scaffold(
      appBar: appBar(
        text: "Confirmation",
        back: true,
        actionIcon: true,
        action: ImageConstant.bag,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  ),
                  titleText("Last Name"),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter Last Name",
                    // errorMessage: _con.emailError,
                    errorMessage: _con.lastNameError,
                    onChange: (val) {
                      _con.lastNameCtr.text = val;
                    },
                  ),
                  titleText("Email"),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter Your Email",
                    // errorMessage: _con.emailError,
                    errorMessage: _con.emailError,
                    onChange: (val) {
                      _con.emailCtr.text = val;
                    },
                  ),
                  titleText("Phone No"),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter Your Phone No",
                    // errorMessage: _con.emailError,
                    keyboardType: TextInputType.phone,
                    errorMessage: _con.phoneNoError,
                    onChange: (val) {
                      _con.phoneNoCtr.text = val;
                    },
                  ),
                  titleText("Address"),
                  hSizedBox6,
                  AppTextField(
                    shadow: true,
                    hintText: "Enter Your Address",
                    // errorMessage: _con.emailError,
                    errorMessage: _con.addressError,
                    onChange: (val) {
                      _con.addressCtr.text = val;
                    },
                  ),
                  titleText("Post Code"),
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
                  titleText("Select Country"),
                  hSizedBox6,
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Obx(
                      () => DropdownButton(
                        // Initial Value
                        value: _con.countryDropDownValue.value,

                        // Down Arrow Icon
                        // icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: _con.countryList.map((items) {
                          return DropdownMenuItem(
                            value: items.name,
                            child: SizedBox(
                                width: 200, child: Text(items.name.toString())),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          int index = _con.countryList
                              .indexWhere((item) => item.name == newValue);
                          _con.getStatesByCountryCode(
                              _con.countryList[index].code.toString());
                          _con.countryDropDownValue.value = newValue.toString();
                        },
                      ),
                    ),
                  ),
                  hSizedBox6,
                  Obx(
                    () => !_con.fetchedStates.value
                        ? Container()
                        : _con.loadingStates.value
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleText("Select State"),
                                  hSizedBox6,
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: DropdownButton(
                                      // Initial Value
                                      value: _con.statesDropdownvalue.value,

                                      // Down Arrow Icon
                                      // icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: _con.statesList.value.states!
                                          .map((items) {
                                        return DropdownMenuItem(
                                          value: items.name,
                                          child: SizedBox(
                                              width: 200,
                                              child:
                                                  Text(items.name.toString())),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _con.statesDropdownvalue.value =
                                              newValue.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Obx(
                    () => _con.placeOrderLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : AppButton(
                            text: AppString.placeOrder,
                            onPressed: () async {
                              if (_con.validate()) {
                                if (cartController.cart.products!.length < 1) {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialogWidget(
                                            onPositiveClick: () {
                                              Get.back();
                                            },
                                            title: "Warning",
                                            subTitle: "Your Cart is Empty",
                                          ));
                                } else if(_con.countryDropDownValue.value.isEmpty || _con.countryDropDownValue.value.isEmpty || _con.countryDropDownValue.value == "" || _con.countryDropDownValue.value == ""  ){
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialogWidget(
                                        onPositiveClick: () {
                                          Get.back();
                                        },
                                        title: "Warning",
                                        subTitle: "Country Name and State are Required",
                                      ));
                                }

                                else {
                                  _con.placeOrderLoading.value = true;
                                  PlaceOrderModel? response =
                                      await HttpService.placeOrder(
                                          userid: StaticVars.id,
                                          firstName:
                                              _con.firstNameCtr.text.toString(),
                                          lastName:
                                              _con.lastNameCtr.text.toString(),
                                          email: _con.emailCtr.text.toString(),
                                          phone:
                                              _con.phoneNoCtr.text.toString(),
                                          address:
                                              _con.addressCtr.text.toString(),
                                          country: _con
                                              .countryDropDownValue.value
                                              .toString(),
                                          state: _con.statesDropdownvalue.value
                                              .toString(),
                                          postCode:
                                              _con.postCodeCtr.text.toString(),
                                          items: cartController
                                              .cart.products!.value);
                                  _con.placeOrderLoading.value = false;

                                  if (response!.paymentLink.isNull) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialogWidget(
                                              onPositiveClick: () {
                                                Get.back();
                                              },
                                              title: "Error",
                                              subTitle: "Something Went Wrong",
                                            ));
                                  } else {
                                    cartController.clearCart();
                                    StaticVars.customLauncher(Uri.parse(
                                        response.paymentLink.toString()));
                                  }
                                }
                              }
                            },
                          ),
                  )
                ],
              ),
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
        color: Color(0xff707070),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
