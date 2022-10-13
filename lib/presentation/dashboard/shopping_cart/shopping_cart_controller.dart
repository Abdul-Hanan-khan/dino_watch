

import 'package:cached_map/cached_map.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/model/favourites_model.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/dashboard/favorite/favorite_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../model/product_by_cat_model.dart';

class ShoppingCartController extends GetxController {
  // final HomeController homeController = Get.find();
  final BottomBarController barController = Get.find();
  Cart cart = Cart(products: <WatchDetailsModel>[].obs);
  RxBool isLoading=false.obs;
  LoginScreenController loginCtr=Get.find();
  // FavouritesModel favourites=FavouritesModel();
  // RxList<Products> favouriteList=<Products>[].obs;



  // Map<String,dynamic> favIdsList=({});
  //   var firstNameCtr=TextEditingController();


  @override
  void onInit() {
    loadCart();
    super.onInit();

  }

  Rx<AddToCart> addToCartModel = AddToCart().obs;
  // Rx<ViewCartModel> viewCartModel = ViewCartModel().obs;
  RxBool loading = false.obs;
  RxBool loadingCart = false.obs;

  Future<Cart?> loadCart() async {
    loadingCart.value= true;
    try{
      Map<String, dynamic>? cartJson =
      await Mapped.loadFileDirectly(cachedFileName: 'Cart-${loginCtr.user.value.userId}');

      if (cartJson == null)
      {
        cart.products!.value=<WatchDetailsModel>[].obs;
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

    Mapped.saveFileDirectly(file: cart.toJson(), cachedFileName: 'Cart-${loginCtr.user.value.userId}');
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
        file: cart.toJson(), cachedFileName: 'Cart-${loginCtr.user.value.userId}');
//    calculateTotalItems();
  }


  removeFullItem(WatchDetailsModel product,int index) {
    cart.products!.removeAt(index);
    print("Item removed");

    Mapped.saveFileDirectly(
        file: cart.toJson(), cachedFileName: 'Cart-${loginCtr.user.value.userId}');
  }

  clearCart(){
    // Mapped.deleteFileDirectly(cachedFileName: "Cart-${loginCtr.user.value.userId}");
    cart.products!.clear();
//    calculateTotalItems();
  }


  double subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < cart.products!.length; i++) {
      // total.value += cart.products![i].price * cart.products![i].quantity.value;
      total.value += int.parse(cart.products![i].price.toString()) * cart.products![i].productQuantity!.value;
    }
    return total.value;
  }
}
