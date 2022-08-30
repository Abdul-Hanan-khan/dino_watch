import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/services/http_service.dart';

class ShoppingCartController extends GetxController {
  final BottomBarController barController = Get.find();
  @override
  void onInit() {
   viewCart();
    super.onInit();

  }


  Rx<AddToCart> cartModel = AddToCart().obs;
  Rx<ViewCartModel> viewCartModel = ViewCartModel().obs;
  RxBool loading = false.obs;
  RxBool loadingCart = false.obs;

  Future<dynamic>? addToCart(String productId) async {
    loading.value = true;

    cartModel.value = (await HttpService.addToCart(productID: productId))!;
    loading.value = false;
    return null;
  }

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

  Future<dynamic>? viewCart() async {
    loadingCart.value = true;
    viewCartModel.value = (await HttpService.viewCart())!;
    loadingCart.value = false;
    return null;
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
