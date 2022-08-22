import 'package:watch_app/core/app_export.dart';

class CheckoutController extends GetxController {
  RxDouble delivery = 200.00.obs;
  RxList<Checkout> checkoutList = RxList([
    Checkout(
      price: 250,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Checkout(
      price: 350,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
    ),
    Checkout(
      price: 299,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Checkout(
      price: 455,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
    )
  ]);

  RxDouble subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < checkoutList.length; i++) {
      total.value += checkoutList[i].price * checkoutList[i].quantity.value;
    }
    return total;
  }

  grandTotal() {
    RxDouble total = 0.0.obs;
    total.value = subTotal().value + delivery.value;
    return total.value;
  }
}

class Checkout {
  String wimage;
  String wname;
  int price;
  RxInt quantity;

  Checkout({
    required this.price,
    required this.quantity,
    required this.wimage,
    required this.wname,
  });
}
