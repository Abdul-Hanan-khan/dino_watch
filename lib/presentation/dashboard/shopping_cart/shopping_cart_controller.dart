import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';

class ShoppingCartController extends GetxController {
  final BottomBarController barController = Get.find();

  RxList<Cart> cartList = RxList([
    Cart(
      price: 250,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Cart(
      price: 350,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
    ),
    Cart(
      price: 299,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Amazfit GTS2 Mini gold Smart Watch ",
    ),
    Cart(
      price: 455,
      quantity: 1.obs,
      wimage: ImageConstant.intro3,
      wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
    )
  ]);

  double subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < cartList.length; i++) {
      total.value += cartList[i].price * cartList[i].quantity.value;
    }
    return total.value;
  }
}

class Cart {
  String wimage;
  String wname;
  int price;
  RxInt quantity;

  Cart({
    required this.price,
    required this.quantity,
    required this.wimage,
    required this.wname,
  });
}
