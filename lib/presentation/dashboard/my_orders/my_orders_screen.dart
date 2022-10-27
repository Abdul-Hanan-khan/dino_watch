import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/dashboard/order_details/order_details_controller.dart';
import 'package:watch_app/presentation/dashboard/order_details/order_details_screen.dart';

import 'my_orders_controller.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  final MyOrderController _con = Get.put(MyOrderController());
  final OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    _con.getAllOrder();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        text: AppString.myOrders,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => _con.loadingOrders.value
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                )
              : _con.allOrders.value.orderlist.isNull ||
                      _con.allOrders.value.orderlist!.length < 1
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Text("No Order Found"),
                      ),
                    )
                  : SingleChildScrollView(
                      child: RefreshIndicator(
                        onRefresh: ()async{
                          _con.getAllOrder();
                        },
                        child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            orderStatusBar(size),
                            showOrderList(),
                          ],
                        ),
                    ),
                      )),
        ),
      ),
    );
  }

  Widget showOrderList() {
    return Container(
      width: Get.width,
      height: Get.height * 0.8,
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: _con.allOrders.value.orderlist!.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                orderDetailsController.loadOrderDetails(
                    _con.allOrders.value.orderlist![index].orderId.toString());
                Get.to(OrderDetailsScreen(_con.allOrders.value.orderlist![index].orderId.toString()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff4d18cc),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff4d18cc).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Order Id :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                                "${_con.allOrders.value.orderlist![index].orderId}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Order Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Text(
                                "\$${_con.allOrders.value.orderlist![index].orderAmount}"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${_con.allOrders.value.orderlist![index].orderStatus}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 35,
                              width: 2,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Created At"),
                                // SizedBox(width: 10,),
                                Text(
                                  "${_con.allOrders.value.orderlist![index].orderDate}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }

  Widget orderStatusBar(Size size) {
    return Obx(
      () =>Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                  onTap: () {
                    _con.selectedStatus.value = "all";
                    _con.orderType.value = "all";

                    _con.getAllOrder();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'All',
                      style: TextStyle(
                          color: _con.selectedStatus.value == "all"
                              ? Colors.white
                              : Colors.black),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: _con.selectedStatus.value == "all"
                      ? Color(0xff4d18cc)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                  onTap: () {
                    _con.selectedStatus.value = "pending";
                    _con.orderType.value = "pending";

                    _con.getAllOrder();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Pending',
                      style: TextStyle(
                          color: _con.selectedStatus.value == "pending"
                              ? Colors.white
                              : Colors.black),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: _con.selectedStatus.value == "pending"
                      ? Color(0xff4d18cc)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                  onTap: () {
                    _con.selectedStatus.value = "processing";
                    _con.orderType.value = "processing";

                    _con.getAllOrder();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Processing',
                      style: TextStyle(
                          color: _con.selectedStatus.value == "processing"
                              ? Colors.white
                              : Colors.black),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: _con.selectedStatus.value == "processing"
                      ? Color(0xff4d18cc)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                  onTap: () {
                    _con.selectedStatus.value = "completed";
                    _con.orderType.value = "completed";

                    _con.getAllOrder();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                          color: _con.selectedStatus.value == "completed"
                              ? Colors.white
                              : Colors.black),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: _con.selectedStatus.value == "completed"
                      ? Color(0xff4d18cc)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      )
    );
  }
}
