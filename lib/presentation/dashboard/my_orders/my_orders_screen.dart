import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';

import 'my_orders_controller.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  final MyOrderController _con = Get.put(MyOrderController());

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
                  : showOrderList(),
        ),
      ),
    );
  }

  Widget showOrderList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _con.allOrders.value.orderlist!.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                    _con.allOrders.value.orderlist![index].orderId.toString()),
                trailing: Text(_con
                    .allOrders.value.orderlist![index].orderStatus
                    .toString()),
              ),
            ),
          );
        });
  }
}
