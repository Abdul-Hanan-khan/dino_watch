import 'package:cached_map/cached_map.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/services/http_service.dart';

class ShoppingCartController extends GetxController {
  final BottomBarController barController = Get.find();
  Cart cart = Cart(products: <WatchDetailsModel>[].obs);
  @override
  void onInit() {
   // viewCart();
    loadCart();
    super.onInit();

  }


  Rx<AddToCart> addToCartModel = AddToCart().obs;
  Rx<ViewCartModel> viewCartModel = ViewCartModel().obs;
  RxBool loading = false.obs;
  RxBool loadingCart = false.obs;

  // Future<dynamic>? addToCart(String productId) async {
  //   loading.value = true;
  //
  //   addToCartModel.value = (await HttpService.addToCart(productID: productId))!;
  //   loading.value = false;
  //   return null;
  // }
  Future<Cart?> loadCart() async {
    loadingCart.value= true;
    try{
      Map<String, dynamic>? cartJson =
      await Mapped.loadFileDirectly(cachedFileName: 'Cart');

      if (cartJson == null)
      {  cart.products!.value=<WatchDetailsModel>[].obs;
        loadingCart.value=false;
      }
      else
      {
        loadingCart.value=false;
        cart = Cart.fromJson(cartJson);
//        calculateTotalItems();
      }
    }
    catch(e){
      print(e);
      loadingCart.value=false;
    }
  }



  addItem(WatchDetailsModel product,int index) {
    if (index != -1) {
      cart.products![index].productQuantity!.value++;
    }
    else {
      product.productQuantity!.value = 1;
      cart.products!.add(product);
    }

    Mapped.saveFileDirectly(file: cart.toJson(), cachedFileName: 'Cart');
    if(index ==-1)
      print("Added to cart successfully",);
//      calculateTotalItems();
  }

  removeItem(WatchDetailsModel product,int index) {
    if(cart.products![index].productQuantity!.value>1) {
      cart.products![index].productQuantity!.value--;
    }
    else
    {
      cart.products!.removeAt(index);
      print("Item removed");
    }
    Mapped.saveFileDirectly(
        file: cart.toJson(), cachedFileName: 'Cart');
//    calculateTotalItems();
  }


  removeFullItem(WatchDetailsModel product,int index) {
    cart.products!.removeAt(index);
    print("Item removed");

    Mapped.saveFileDirectly(
        file: cart.toJson(), cachedFileName: 'Cart');
  }

  clearCart(){
    Mapped.deleteFileDirectly(cachedFileName: "Cart");
    cart.products!.clear();
//    calculateTotalItems();
  }




//
  // RxList<Cart> cartList = RxList([
  //   Cart(
  //     price: 250,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Amazfit GTS2 Mini gold Smart Watch ",
  //   ),
  //   Cart(
  //     price: 350,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
  //   ),
  //   Cart(
  //     price: 299,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Amazfit GTS2 Mini gold Smart Watch ",
  //   ),
  //   Cart(
  //     price: 455,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
  //   )
  // ]);

  // double subTotal() {
  //   RxDouble? total = 0.0.obs;
  //   for (int i = 0; i < cartList.length; i++) {
  //     total.value += cartList[i].price * cartList[i].quantity.value;
  //   }
  //   return total.value;
  // }

  // Future<dynamic>? viewCart() async {
  //   loadingCart.value = true;
  //   viewCartModel.value = (await HttpService.viewCart())!;
  //   loadingCart.value = false;
  //   return null;
  // }
}

// class Cart {
//   String wimage;
//   String wname;
//   int price;
//   RxInt quantity;
//
//   Cart({
//     required this.price,
//     required this.quantity,
//     required this.wimage,
//     required this.wname,
//   });
// }
