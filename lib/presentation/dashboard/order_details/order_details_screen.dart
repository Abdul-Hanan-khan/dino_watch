import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/dashboard/order_details/order_details_controller.dart';

import '../../commamn/app_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  String? orderId;
  OrderDetailsController _con = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        text: AppString.orderDetails,
        back: true,
        // actionIcon: true,
      ),
      body: Obx(() => _con.loading.value
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Fetching Order Details"),
                ],
              ),
            )
          : Column(
            children: [
              // orderStatusBar(size),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff4d18cc).withOpacity(0.02),
                      border: Border.all(color: Color(0xff4d18cc)),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Order Id :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("${_con.orderDetailsModel.order!.id}"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Order Status :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("${_con.orderDetailsModel.order!.status}"),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ordered By :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                              "${_con.orderDetailsModel.order!.customer!.firstName} ${_con.orderDetailsModel.order!.customer!.lastName}"),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Delivery Address :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                              width: Get.width,
                              child: Text(
                                  "${_con.orderDetailsModel.order!.shippingAddress!.address1} ")),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Payment Method :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                              "${_con.orderDetailsModel.order!.paymentDetails!.methodId}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Accepted :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                              "${_con.orderDetailsModel.order!.paymentDetails!.methodTitle}"),
                        ],
                      ),

                      /// section 2
                      SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 2,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Items :"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                              "${_con.orderDetailsModel.order!.totalLineItemsQuantity}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tax :"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("\$${_con.orderDetailsModel.order!.totalTax}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Shipping:"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("\$${_con.orderDetailsModel.order!.totalShipping}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Discount:"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("\$${_con.orderDetailsModel.order!.totalDiscount}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${_con.orderDetailsModel.order!.total}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
            ],
          )),
    );
  }

  Widget orderStatusBar(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //pending completed approved
      children: [
        RaisedButton(
          onPressed: () {},
          child: const Text('Pending',style: TextStyle(color: Colors.white),),
          color:  const Color(0xff4d18cc),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: const Text('Approved',style: TextStyle(color: Colors.black),),
          color:  Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: const Text('Completed',style: TextStyle(color: Colors.black),),
          color:  Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
