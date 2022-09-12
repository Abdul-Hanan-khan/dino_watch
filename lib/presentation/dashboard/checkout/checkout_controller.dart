import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/country_list_model.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../model/states_by_country_code.dart';


class CheckoutController extends GetxController {
  RxBool loadingCountry = false.obs;
  RxBool loadingStates = false.obs;
  RxList<CountryListModel> countryList =<CountryListModel>[].obs;
  Rx<StatesByCountryCodeModel> statesList =StatesByCountryCodeModel().obs;

  var firstNameCtr=TextEditingController();
  var lastNameCtr=TextEditingController();
  var emailCtr=TextEditingController();
  var addressCtr=TextEditingController();
  var postCodeCtr=TextEditingController();
  RxString firstNameError= ''.obs;
  RxString lastNameError= ''.obs;
  RxString emailError= ''.obs;
  RxString addressError= ''.obs;
  RxString postCodeError= ''.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCountriesList();

  }



  getCountriesList()async{
    loadingCountry.value=true;
    countryList.value=(await HttpService.getCountries())!;
    loadingCountry.value=false;
  }


  getStatesByCountryCode(String countryCode)async{
    loadingStates.value=true;
    statesList.value=(await HttpService.getStatesByCountryCode(countryCode))!;
    loadingStates.value=false;
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
