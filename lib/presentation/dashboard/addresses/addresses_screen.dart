import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/get_checkout_info.dart';

import 'addresses_controller.dart';

class AddressesScreen extends StatelessWidget {
  AddressesScreen({Key? key}) : super(key: key);
  final AddressesController _con = Get.find();
  final cInfo = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    cInfo.getCountriesList();
    return Scaffold(
      appBar: appBar(
        text: AppString.addAddress,
        back: true,
        actionIcon: true,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: AppButton(
      //   width: Get.width / 2,
      //   text: AppString.payment,
      //   onPressed: () {
      //     Get.toNamed(
      //       AppRoutes.paymentScreen,
      //     );
      //   },
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSizedBox10,
              Text(
                AppString.selectdeliveryaddress,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox10,
              GestureDetector(
                onTap: () {
                  Get.to(GetCheckoutInfoScreen());
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xffD2D2D2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConstant.addnewaddress,
                        height: 25,
                        width: 25,
                      ),
                      wSizedBox10,
                      Text(
                        AppString.addNewAddress,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => ListView.builder(
                  itemCount: _con.addressModel.addressList!.value.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    int selectedIndex = _con.addressModel.addressList!
                        .indexWhere(
                            (element) => element.isSelected!.value == true);

                    if (selectedIndex != -1) {
                      _con.isSelectAdd.value = selectedIndex;
                    }
                    // return Text("${_con.addressModel.addressList![index].address}");
                    return Obx(
                      () => Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _con.isSelectAdd.value = index;
                              _con.addOrUpdateAddress(
                                  _con.addressModel.addressList![index],
                                  index: index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    spreadRadius: .5,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    ImageConstant.office,
                                    height: 35,
                                    width: 35,
                                  ),
                                  wSizedBox20,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Home",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        hSizedBox4,
                                        Text(
                                          _con.addressModel.addressList![index]
                                                  .firstName!.value
                                                  .toString() +
                                              " " +
                                              _con.addressModel
                                                  .addressList![index].lastName
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        hSizedBox4,
                                        Text(
                                          _con.addressModel.addressList![index]
                                              .phoneNumber!.value
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        hSizedBox4,
                                        Text(
                                          _con.addressModel.addressList![index]
                                              .address!.value
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff707070),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Radio(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: AppColors.yellowColor,
                                    value: _con.isSelectAdd.value,
                                    groupValue: index,
                                    onChanged: (val) {
                                      _con.isSelectAdd.value = index;
                                      _con.addOrUpdateAddress(
                                          _con.addressModel.addressList![index],
                                          index: index);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_con.isSelectAdd.value == index)
                            Positioned(
                              bottom: 66,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.grey.shade300.withOpacity(0.6),
                                      blurRadius: 10.0,
                                      spreadRadius: .5,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  AppString.defaulttext,
                                  style: TextStyle(
                                      color: AppColors.yellowColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          Positioned(
                            right: 10,
                            bottom: 30,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap:(){
                                      cInfo.firstNameInitVal.value=_con.addressModel.addressList![index].firstName.toString();
                                      cInfo.lastNameInitVal.value=_con.addressModel.addressList![index].lastName.toString();
                                      cInfo.emailInitVal.value=_con.addressModel.addressList![index].email.toString();
                                      cInfo.phoneNoInitVal.value=_con.addressModel.addressList![index].phoneNumber.toString();
                                      cInfo.addressInitVal.value=_con.addressModel.addressList![index].address.toString();
                                      cInfo.postCodeInitVal.value=_con.addressModel.addressList![index].postalCode.toString();
                                      cInfo.countryDropDownValue.value=_con.addressModel.addressList![index].country.toString();
                                      cInfo.statesDropdownvalue.value=_con.addressModel.addressList![index].state.toString();


                                      cInfo.firstNameCtr.text=_con.addressModel.addressList![index].firstName.toString();
                                      cInfo.lastNameCtr.text=_con.addressModel.addressList![index].lastName.toString();
                                      cInfo.emailCtr.text=_con.addressModel.addressList![index].email.toString();
                                      cInfo.phoneNoCtr.text=_con.addressModel.addressList![index].phoneNumber.toString();
                                      cInfo.addressCtr.text=_con.addressModel.addressList![index].address.toString();
                                      cInfo.postCodeCtr.text=_con.addressModel.addressList![index].postalCode.toString();
                                      // cInfo.countryDropDownValue.value=_con.addressModel.addressList![index].country.toString();
                                      // cInfo.statesDropdownvalue.value=_con.addressModel.addressList![index].state.toString();



                                      Get.to(GetCheckoutInfoScreen(fromUpdate: true,));
                                    },
                                    child: Image.asset('assets/images/editing.png',height: 20,width: 20,)),
                                SizedBox(width: 7,),



                                GestureDetector(

                                    onTap:(){
                                      showDialog(
                                        barrierColor: const Color.fromRGBO(0, 0, 0, 0.76),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            title: Text(
                                              "Delete Address",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            content: Text("Are you Sure to Delete Address"),
                                            actions: [
                                              InkWell(
                                                onTap: () => Navigator.pop(context),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(2.0),
                                                  ),
                                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                                  padding:
                                                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                                  child: Text(
                                                    AppString.cancel,
                                                    style: TextStyle(
                                                      color: Colors.blue.shade600,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  _con.removeAddress(index);
                                                  Get.back();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(2.0),
                                                  ),
                                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                                  padding:
                                                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                                                  child: Text(
                                                    "Remove",
                                                    style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset('assets/images/garbage.png',height: 20,width: 20,))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              hSizedBox16,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF3F3F3),
                  border: Border.all(
                    color: const Color(0xffD2D2D2),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstant.info,
                      height: 30,
                      width: 30,
                    ),
                    wSizedBox12,
                    Expanded(
                      child: Text(
                        AppString.info,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              hSizedBox36,
            ],
          ),
        ),
      ),
    );
  }
}
