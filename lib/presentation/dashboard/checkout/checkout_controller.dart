import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/country_list_model.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../core/utils/helper.dart';
import '../../../model/states_by_country_code.dart';

class CheckoutController extends GetxController {
  RxBool loadingCountry = false.obs;
  RxBool loadingStates = false.obs;
  RxBool placeOrderLoading = false.obs;
  RxBool fetchedStates = false.obs;
  RxList<CountryListModel> countryList = <CountryListModel>[].obs;
  Rx<StatesByCountryCodeModel> statesList = StatesByCountryCodeModel().obs;
  RxString statesDropdownvalue = ''.obs;
  RxString countryDropDownValue = ''.obs;

  var firstNameCtr = TextEditingController();
  var lastNameCtr = TextEditingController();
  var emailCtr = TextEditingController();
  var phoneNoCtr = TextEditingController();
  var addressCtr = TextEditingController();
  var postCodeCtr = TextEditingController();
  RxString firstNameError = ''.obs;
  RxString lastNameError = ''.obs;
  RxString emailError = ''.obs;
  RxString phoneNoError = ''.obs;
  RxString addressError = ''.obs;
  RxString postCodeError = ''.obs;


  RxString firstNameInitVal = ''.obs;
  RxString lastNameInitVal = ''.obs;
  RxString emailInitVal = ''.obs;
  RxString phoneNoInitVal = ''.obs;
  RxString addressInitVal = ''.obs;
  RxString postCodeInitVal = ''.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getCountriesList();
  }

  bool validate() {
    RxBool isValid = true.obs;

    if (firstNameCtr.text.isEmpty) {
      firstNameError.value = "First Name Required";
      isValid.value = false;
    } else {
      firstNameError.value = "";
      // isValid.value = true;
    }
    if (lastNameCtr.text.isEmpty) {
      lastNameError.value = "Last Name Required";
      isValid.value = false;
    } else {
      lastNameError.value = "";
      // isValid.value = true;
    }
    if (phoneNoCtr.text.isEmpty) {
      phoneNoError.value = "Phone No Number Required";
      isValid.value = true;
    } else {
      phoneNoError.value = "";
      // isValid.value = true;
    }
    if (!Helper.isEmail(emailCtr.text)) {
      emailError.value = "Invalid Email";
      isValid.value = false;
    } else {
      addressError.value = "";
      // isValid.value = true;
    }
    if (addressCtr.text.isEmpty) {
      addressError.value = "Address is Required";
      isValid.value = false;
    } else {
      addressError.value = "";
      // isValid.value = true;
    }
    if (postCodeCtr.text.isEmpty) {
      postCodeError.value = "Post Code is Required";
      isValid.value = false;
    } else {
      postCodeError.value = "";
      // isValid.value = true;
    }
    return isValid.value;
  }

  getCountriesList() async {
    loadingCountry.value = true;
    countryList.value = (await HttpService.getCountries())!;
    countryDropDownValue.value = countryList[0].name!;
    loadingCountry.value = false;
  }

  getStatesByCountryCode(String countryCode) async {
    loadingStates.value = true;
    fetchedStates.value = true;
    statesList.value = (await HttpService.getStatesByCountryCode(countryCode))!;
    loadingStates.value = false;
    statesDropdownvalue.value = statesList.value.states![0].name!;
  }

  RxDouble delivery = 200.00.obs;
  RxList<Checkout> checkoutList = RxList([
    Checkout(
      price: 250,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Checkout(
      price: 350,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
    ),
    Checkout(
      price: 299,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Checkout(
      price: 455,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
    )
  ]);

  RxDouble subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < checkoutList.length; i++) {
      total.value += checkoutList[i].price * checkoutList[i].quantity.value;
    }
    return total;
  }

  grandTotal() {
    RxDouble total = 0.0.obs;
    total.value = subTotal().value + delivery.value;
    return total.value;
  }
}

class Checkout {
  String wimage;
  String wname;
  int price;
  RxInt quantity;

  Checkout({
    required this.price,
    required this.quantity,
    required this.wimage,
    required this.wname,
  });
}
