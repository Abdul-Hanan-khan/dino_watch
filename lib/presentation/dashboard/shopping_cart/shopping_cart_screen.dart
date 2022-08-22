import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

import 'shopping_cart_controller.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);
  final ShoppingCartController _con = Get.put(ShoppingCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return checkoutList(index);
              },
            ),
            hSizedBox20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  cartOption(
                    ontap: () {
                      _con.barController.pageIndex.value = 0;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            "\$${_con.subTotal().toString()}",
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
            AppButton(
              text: AppString.checkout,
              width: Get.width / 2,
              onPressed: () {
                Get.toNamed(AppRoutes.checkoutScreen);
              },
            ),
            hSizedBox20,
          ],
        ),
      ),
    );
  }

  checkoutList(index) {
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
          Image.asset(
            _con.cartList[index].wimage,
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
                  _con.cartList[index].wname,
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
                        "\$${_con.cartList[index].quantity * _con.cartList[index].price}",
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
                              _con.cartList[index].quantity.value == 1
                                  ? null
                                  : _con.cartList[index].quantity.value >= 1
                                      ? _con.cartList[index].quantity.value--
                                      : null;
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
                                _con.cartList[index].quantity.value
                                    .toString()
                                    .padLeft(2, "0"),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          GestureDetector(
                            onTap: () {
                              _con.cartList[index].quantity.value < 15
                                  ? _con.cartList[index].quantity.value++
                                  : null;
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
