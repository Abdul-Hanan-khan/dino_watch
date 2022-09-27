import 'dart:ui';

import 'package:cached_map/cached_map.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/address_model.dart';

class OrderSummaryController extends GetxController {
  RxInt isSelectAdd = 0.obs;
  AddressModel addressModel=AddressModel();

  @override
  void onInit() async {
  loadAddresses();
    super.onInit();
  }

  loadAddresses() async {
    try{
      Map<String, dynamic>? addressJson = await Mapped.loadFileDirectly(cachedFileName: 'addresses');
      if (addressJson == null)
      {  addressModel.addressList=<Addresses>[].obs;
      }
      else
      {
        addressModel = AddressModel.fromJson(addressJson);
      }
    }
    catch(e){
      print(e);
    }
  }


  addOrUpdateAddress(Addresses newAddress, {int? index}) {
    addressModel.addressList!.add(newAddress);
    Mapped.saveFileDirectly(file: addressModel.toJson(), cachedFileName: 'addresses');
      print("Address Added successfully",);
//      calculateTotalItems();
  }
  removeAddress(int index) {
    addressModel.addressList!.removeAt(index);
    Mapped.saveFileDirectly(file: addressModel.toJson(), cachedFileName: 'addresses');

      print("Address Removed successfully",);
//      calculateTotalItems();
  }




}
