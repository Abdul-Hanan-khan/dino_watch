import 'package:watch_app/core/app_export.dart';

class MyOrderController extends GetxController {
  RxList<MyOrder> myorderList = RxList([
    MyOrder(
      price: 250,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    MyOrder(
      price: 350,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
    ),
    MyOrder(
      price: 299,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    MyOrder(
      price: 455,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
    )
  ]);

  double subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < myorderList.length; i++) {
      total.value += myorderList[i].price * myorderList[i].quantity.value;
    }
    return total.value;
  }
}

class MyOrder {
  String wimage;
  String wname;
  int price;
  RxInt quantity;

  MyOrder({
    required this.price,
    required this.quantity,
    required this.wimage,
    required this.wname,
  });
}
