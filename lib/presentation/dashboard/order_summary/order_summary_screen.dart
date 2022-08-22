import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';

import 'order_summary_controller.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({Key? key}) : super(key: key);
  final OrderSummaryController _con = Get.put(OrderSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.orderSummary,
        back: true,
        actionIcon: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppButton(
        width: Get.width / 2,
        text: AppString.payment,
        onPressed: () {
          Get.toNamed(
            AppRoutes.paymentScreen,
          );
        },
      ),
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
              Container(
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
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _con.isSelectAdd.value = index;
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
                                      Text(
                                        AppString.office,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      hSizedBox4,
                                      const Text(
                                        "James A.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      hSizedBox4,
                                      const Text(
                                        "+781-343-1253",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      hSizedBox4,
                                      const Text(
                                        "717 Romani Street, Boston, Massachusetts 02110, USA",
                                        style: TextStyle(
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
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_con.isSelectAdd.value == index)
                          Positioned(
                            bottom: 30,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
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
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                },
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
