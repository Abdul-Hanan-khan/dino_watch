import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/address_model.dart';
import 'package:watch_app/model/place_order_model.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/dashboard/addresses/addresses_controller.dart';
import 'package:watch_app/presentation/dashboard/addresses/addresses_screen.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../model/watch_details_model.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  // CheckoutController _con = Get.find();
  ShoppingCartController cartController = Get.find();
  final CheckoutController _con = Get.put(CheckoutController());
  AddressesController osController = Get.find();
  BottomBarController bottomController = Get.find();
  LoginScreenController loginCon=Get.find();

  @override
  Widget build(BuildContext context) {
    int addressIndex = osController.addressModel.addressList!
        .indexWhere((element) => element.isSelected!.value == true);

    return Scaffold(
      appBar: appBar(
        text: AppString.checkout,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.productsList,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox12,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartController.cart.products!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return checkoutList(
                      cartController.cart.products![index], index);
                },
              ),
              hSizedBox12,
              // Container(
              //   height: 50,
              //   width: Get.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     border: Border.all(color: AppColors.appColor),
              //   ),
              //   child: Row(
              //     children: [
              //       wSizedBox16,
              //       Text(
              //         AppString.couponCode,
              //         style: const TextStyle(
              //           color: Color(0xff686868),
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //       const Spacer(),
              //       Container(
              //         alignment: Alignment.center,
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         height: 50,
              //         decoration: BoxDecoration(
              //           color: AppColors.appColor,
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //         child: Row(
              //           children: [
              //             Text(
              //               AppString.applyCoupon,
              //               style: const TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             ),
              //             wSizedBox10,
              //             const Icon(
              //               Icons.east,
              //               size: 18,
              //               color: Colors.white,
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              hSizedBox12,
              Text(
                AppString.carttotals,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox12,
              Container(
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
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Shipping Address :',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                      // hSizedBox6,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child:
                                osController.addressModel.addressList!.length <
                                        1
                                    ? RaisedButton(
                                        onPressed: () {
                                          Get.off(AddressesScreen());
                                        },
                                  color: const Color(0xff4d18cc),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                        child: const Text(
                                          "Add Address",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : Container(
                                  width: MediaQuery.of(context).size.width * 0.8,

                                      child: Text(
                                          osController.addressModel
                                              .addressList![addressIndex].address
                                              .toString(),
                                          maxLines: 5,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            // color: Color(0xff707070),
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                    ),
                          ),
                        ],
                      ),
                      hSizedBox6,
                      Divider(
                        color: Colors.black.withOpacity(.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.subtotal,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            "\$${cartController.subTotal()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
                      hSizedBox6,
                      Row(
                        children: [
                          Text(
                            AppString.shipping,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            "(${AppString.delivery})",
                            style: const TextStyle(
                              color: Color(0xff707070),
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "\$0",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Shipping Address :',
                      //       style: const TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 14,
                      //         color: Color(0xff707070),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // // hSizedBox6,
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 15),
                      //       child: Text(
                      //         osController.addressModel.addressList![addressIndex].address.toString(),
                      //         style: const TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 14,
                      //           color: Color(0xff707070),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      hSizedBox6,
                      Divider(
                        color: Colors.black.withOpacity(.5),
                      ),
                      hSizedBox6,
                      Row(
                        children: [
                          Text(
                            AppString.total,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            "(${AppString.includingTax})",
                            style: const TextStyle(
                              color: Color(0xff707070),
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "\$${cartController.subTotal()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              hSizedBox20,
              Center(
                child: Obx(
                  () => _con.placeOrderLoading.value
                      ? CircularProgressIndicator()
                      : AppButton(
                          text: AppString.placeOrder,
                          width: Get.width / 1.6,
                          onPressed: () {
                            // Get.toNamed(AppRoutes.orderSummaryScreen);
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialogWidget(
                                      title: "Message",
                                      subTitle: "Are you Sure to Place Order",
                                      onPositiveClick: () async {
                                        _con.placeOrderLoading.value = true;
                                        int index = osController
                                            .addressModel.addressList!
                                            .indexWhere((element) =>
                                                element.isSelected!.value ==
                                                true);

                                        Addresses data = osController
                                            .addressModel.addressList![index];
                                        Get.back();
                                        PlaceOrderModel? response =
                                            await HttpService.placeOrder(
                                                userid: loginCon.user.value.userId.toString(),
                                                firstName:
                                                    data.firstName.toString(),
                                                lastName:
                                                    data.lastName.toString(),
                                                email: data.email.toString(),
                                                phone:
                                                    data.phoneNumber.toString(),
                                                address:
                                                    data.address.toString(),
                                                country:
                                                    data.country.toString(),
                                                state: data.state.toString(),
                                                postCode:
                                                    data.postalCode.toString(),
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
                                                    subTitle:
                                                        "Something Went Wrong",
                                                  ));
                                        } else {
                                          cartController.clearCart();
                                          StaticVars.customLauncher(Uri.parse(
                                              response.paymentLink.toString()));
                                          Future.delayed(Duration(seconds: 5),
                                              () {
                                            Get.back();
                                            // Get.back();
                                            bottomController.pageIndex.value =
                                                0;
                                          });
                                        }
                                      },
                                    ));
                          },
                        ),
                ),
              ),
              hSizedBox20,
            ],
          ),
        ),
      ),
    );
  }

  checkoutList(WatchDetailsModel product, index) {
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
            product.images![0].src.toString(),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          wSizedBox8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name.toString(),
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
                        "\$${product.productQuantity!.value * int.parse(product.price.toString())}",
                        style: TextStyle(
                            color: AppColors.appColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    // Obx(
                    //   () => Row(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           _con.checkoutList[index].quantity.value == 1
                    //               ? null
                    //               : _con.checkoutList[index].quantity.value >= 1
                    //                   ? _con
                    //                       .checkoutList[index].quantity.value--
                    //                   : null;
                    //         },
                    //         child: Container(
                    //           height: 30,
                    //           width: 30,
                    //           decoration: const BoxDecoration(
                    //             shape: BoxShape.circle,
                    //             color: Color(0xffFFF2DD),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(10),
                    //             child: Image.asset(
                    //               ImageConstant.remove,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.center,
                    //         height: 30,
                    //         width: 30,
                    //         child: Text(
                    //             _con.checkoutList[index].quantity.value
                    //                 .toString()
                    //                 .padLeft(2, "0"),
                    //             style: const TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500)),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {
                    //           _con.checkoutList[index].quantity.value < 15
                    //               ? _con.checkoutList[index].quantity.value++
                    //               : null;
                    //         },
                    //         child: Container(
                    //           height: 30,
                    //           width: 30,
                    //           decoration: const BoxDecoration(
                    //             shape: BoxShape.circle,
                    //             color: Color(0xffFFF2DD),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(10),
                    //             child: Image.asset(ImageConstant.add),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
}
