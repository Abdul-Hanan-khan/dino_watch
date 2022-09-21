

import 'package:cached_map/cached_map.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/cart_model.dart';
import 'package:watch_app/model/favourites_model.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/dashboard/favorite/favorite_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/services/http_service.dart';

import '../../../model/product_by_cat_model.dart';

class ShoppingCartController extends GetxController {
  // final HomeController homeController = Get.find();
  final BottomBarController barController = Get.find();
  Cart cart = Cart(products: <WatchDetailsModel>[].obs);
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
//   addToFav(int productId){
//     favourites.productIds!.add(productId);
//     Mapped.saveFileDirectly(file: favourites.toJson(), cachedFileName: "Favourites");
//
//
//
//
//     // int index2= homeController.productsModal.value.products!.indexWhere((element) => element.productId == productId);
//     // if(index2 != -1){
//     //   homeController.productsModal.value.products![index2].isFavourite!.value=true;
//     //   favouriteList.add(homeController.productsModal.value.products![index2]);
//     // }
//     print("fav added");
//
//   }
//   removeFav(int productId){
//     int index = favourites.productIds!.indexWhere((element) => element==productId);
//     // favourites.productIds!.removeWhere((element)=> element==productId);
//     if(index !=-1){
//       favourites.productIds!.remove(index);
//       // homeController.productsModal.value.products![index].isFavourite!.value=false;
//
//     }
//     Mapped.saveFileDirectly(file: favourites.toJson(), cachedFileName: "Favourites");
//
//     // int index2= homeController.productsModal.value.products!.indexWhere((element) => element.productId == productId);
//     // if(index2 != -1){
//       // favouriteList.remove(homeController.productsModal.value.products![index2]);
//     // }
//     print("fav removed");
//
//   }
//   loadFav() async {
//     try{
//       Map<String, dynamic>? favJson =
//       await Mapped.loadFileDirectly(cachedFileName: 'Favourites');
//
//       if (favJson == null) {
//         favourites.productIds=<int>[].obs;
//         loadingCart.value=false;
//       }
//       else {
//
//         loadingCart.value=false;
//         favourites = FavouritesModel.fromJson(favJson);
//         for (var favElementId in favourites.productIds!.value) {
//           int index;
//           // index= homeController.productsModal.value.products!.indexWhere((pElement) => pElement.productId==favElementId);
//           // if(index != -1){
//           //   homeController.productsModal.value.products![index].isFavourite!.value=true;
//           //   favouriteList.add(homeController.productsModal.value.products![index]);
//
//           // }
//         }
//         print(favouriteList.value);
//
//         loadingCart.value=false;
//
//         print("fav loaded");
// //        calculateTotalItems();
//       }
//     }
//
//     catch(e){
//       print(e);
//       loadingCart.value=false;
//     }
//
//     print(favourites);
//   }
//   clearFavs(){
//     Mapped.deleteFileDirectly(cachedFileName: 'Favourites');
//     // favouriteList.clear();
//     print("fav cleared");
//
//   }

  double subTotal() {
    RxDouble? total = 0.0.obs;
    for (int i = 0; i < cart.products!.length; i++) {
      // total.value += cart.products![i].price * cart.products![i].quantity.value;
      total.value += int.parse(cart.products![i].price.toString()) * cart.products![i].productQuantity!.value;
    }
    return total.value;
  }
}
