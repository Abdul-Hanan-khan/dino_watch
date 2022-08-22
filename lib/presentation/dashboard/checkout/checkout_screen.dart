import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final CheckoutController _con = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
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
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return checkoutList(index);
                },
              ),
              hSizedBox12,
              Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.appColor),
                ),
                child: Row(
                  children: [
                    wSizedBox16,
                    Text(
                      AppString.couponCode,
                      style: const TextStyle(
                        color: Color(0xff686868),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Text(
                            AppString.applyCoupon,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          wSizedBox10,
                          const Icon(
                            Icons.east,
                            size: 18,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.subtotal,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            "\$${_con.subTotal().toStringAsFixed(2)}",
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
                              fontWeight: FontWeight.w500,
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
                            "\$${_con.delivery.value}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
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
                              fontWeight: FontWeight.w500,
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
                            "\$${_con.grandTotal()}",
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
                child: AppButton(
                  text: AppString.orderSummary,
                  width: Get.width / 1.6,
                  onPressed: () {
                    Get.toNamed(AppRoutes.orderSummaryScreen);
                  },
                ),
              ),
              hSizedBox20,
            ],
          ),
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
            _con.checkoutList[index].wimage,
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
                  _con.checkoutList[index].wname,
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
                        "\$${_con.checkoutList[index].quantity * _con.checkoutList[index].price}",
                        style: TextStyle(
                            color: AppColors.appColor,
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
                              _con.checkoutList[index].quantity.value == 1
                                  ? null
                                  : _con.checkoutList[index].quantity.value >= 1
                                      ? _con
                                          .checkoutList[index].quantity.value--
                                      : null;
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFF2DD),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  ImageConstant.remove,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            child: Text(
                                _con.checkoutList[index].quantity.value
                                    .toString()
                                    .padLeft(2, "0"),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          GestureDetector(
                            onTap: () {
                              _con.checkoutList[index].quantity.value < 15
                                  ? _con.checkoutList[index].quantity.value++
                                  : null;
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFF2DD),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(ImageConstant.add),
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
}
