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
  final OrderDetailsController orderDetailsController = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
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
                  : SingleChildScrollView(child: showOrderList()),
        ),
      ),
    );
  }

  Widget showOrderList() {
    return Container(
      width: Get.width,
      height: Get.height * 0.9,
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: _con.allOrders.value.orderlist!.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                orderDetailsController.loadOrderDetails(_con.allOrders.value.orderlist![index].orderId.toString());
                Get.to(OrderDetailsScreen());
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
                      color:  Color(0xff4d18cc).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Order Id :",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 20,),
                          Text("${_con.allOrders.value.orderlist![index].orderId}"),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Created At"),
                          // SizedBox(width: 10,),
                          Text("${_con.allOrders.value.orderlist![index].orderDate}"),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Amount"),

                          Text("\$${_con.allOrders.value.orderlist![index].orderAmount}"),
                        ],
                      ),
                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Status"),
                          SizedBox(width: 10,),
                          Text("${_con.allOrders.value.orderlist![index].orderStatus}"),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            );
          }),
    );
  }
}
