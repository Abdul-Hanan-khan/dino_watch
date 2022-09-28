import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/address_model.dart';
import 'package:watch_app/model/place_order_model.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/dashboard/order_summary/order_summary_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/get_checkout_info.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import 'shopping_cart_controller.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);
  final ShoppingCartController _con = Get.find();
  OrderSummaryController osController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => !_con.loadingCart.value
            ? SingleChildScrollView(
                child: _con.cart.products!.length ==0
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: const [Text("Your cart is Empty")],
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _con.cart.products!.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return checkoutList(index);
                            },
                          ),
                          hSizedBox20,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                cartOption(
                                  ontap: () {
                                    _con.barController.pageIndex.value = 0;
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      wSizedBox10,
                                      const Icon(
                                        Icons.west,
                                        color: Color(0xff707070),
                                        size: 16,
                                      ),
                                      wSizedBox10,
                                      const Expanded(
                                        child: Text(
                                          "Continue Shopping",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                wSizedBox10,
                                cartOption(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        "Total -",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                      Obx(
                                        () => Text(
                                          "\$${_con.subTotal()}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          hSizedBox20,
                          Obx(
                            ()=> _con.isLoading.value?Center(child: CircularProgressIndicator(),): AppButton(
                              text: AppString.checkout,
                              width: Get.width / 2,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialogWidget(
                                          title: "Message",
                                          subTitle: "Are you Sure to Place Order",
                                          onPositiveClick: () async {

                                            _con.isLoading.value=true;
                                            int index= osController.addressModel.addressList!.indexWhere((element) => element.isSelected!.value == true);

                                            Addresses data= osController.addressModel.addressList![index];
                                            Get.back();
                                            PlaceOrderModel? response =
                                                await HttpService.placeOrder(
                                                    userid: StaticVars.id,
                                                    firstName: data.firstName.toString(),
                                                    lastName:data.lastName.toString(),
                                                    email: data.email.toString(),
                                                    phone:data.phoneNumber.toString(),
                                                    address: data.address.toString(),
                                                    country: data.country.toString(),
                                                    state: data.state.toString(),
                                                    postCode: data.postalCode.toString(),
                                                    items: _con
                                                        .cart.products!.value);

                                            _con.isLoading.value=false;

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
                                              _con.clearCart();
                                              StaticVars.customLauncher(Uri.parse(
                                                  response.paymentLink.toString()));
                                            }
                                          },

                                        ));
                                // Get.to(GetCheckoutInfoScreen());
                                // Get.toNamed(AppRoutes.checkoutScreen);
                              },
                            ),
                          ),
                          hSizedBox20,
                        ],
                      ))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  checkoutList(index) {
    RxInt cartIndex =1.obs;
    cartIndex.value = _con.cart.products!.indexWhere((element) => element.id == _con.cart.products![index].id);


    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 100,
      width: Get.width,
      padding: const EdgeInsets.all(10),
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
        children: [
          Image.network(
            _con.cart.products![index].images![0].src.toString(),
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          wSizedBox8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _con.cart.products![index].name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        "\$${_con.cart.products![index].productQuantity!.value * int.parse(_con.cart.products![index].price.toString())}",
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _con.removeItem(_con.cart.products![index], cartIndex.value);
                              // _con.cart.products![index].productQuantity!.value == 1
                              //     ? null
                              //     : _con.cart.products![index].productQuantity!.value >= 1
                              //         ? _con.cart.products![index].productQuantity!.value--
                              //         : null;
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE0E0E0),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            child: Text(
                                _con.cart.products![index].productQuantity!.value
                                    .toString()
                                    .padLeft(2, "0"),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          GestureDetector(
                            onTap: () {
                              _con.addItem(_con.cart.products![index], cartIndex.value);

                              // _con.cart.products![index].productQuantity!.value < 15
                              //     ? _con.cart.products![index].productQuantity!.value++
                              //     : null;
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE0E0E0),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          wSizedBox12
        ],
      ),
    );
  }

  Widget cartOption({required Widget child, Function()? ontap}) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
            height: 50,
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
            child: child),
      ),
    );
  }
}
