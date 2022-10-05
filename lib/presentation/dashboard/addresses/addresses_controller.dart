import 'dart:ui';

import 'package:cached_map/cached_map.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/address_model.dart';

class AddressesController extends GetxController {
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
    if(index != null){
      addressModel.addressList!.forEach((element) {
        element.isSelected!.value=false;
      });
      addressModel.addressList!.value[index].isSelected!.value=true;
      print(addressModel);
      // int newIndex=addressModel.addressList!.indexWhere((element) => element.id == newAddress.id);
    }else{
      addressModel.addressList!.value.add(newAddress);
      addressModel.addressList!.forEach((element) {
        element.isSelected!.value=false;
      });
      int newIndex=addressModel.addressList!.indexWhere((element) => element.id == newAddress.id);

      addressModel.addressList!.value[newIndex].isSelected!.value=true;
    }

    Mapped.saveFileDirectly(file: addressModel.toJson(), cachedFileName: 'addresses');
      print("Address Added successfully",);
//      calculateTotalItems();
  }
  removeAddress(int index) {
    addressModel.addressList!.value.removeAt(index);
    Mapped.saveFileDirectly(file: addressModel.toJson(), cachedFileName: 'addresses');

      print("Address Removed successfully",);
//      calculateTotalItems();
  }

  updateAddress(AddressModel addressModel){
    // addressModel.addressList!.value[index]=newAddress;
    Mapped.saveFileDirectly(file: addressModel.toJson(), cachedFileName: 'addresses');
    print("Address updated");

  }




}
