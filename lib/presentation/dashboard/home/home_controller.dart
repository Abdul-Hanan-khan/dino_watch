import 'package:cached_map/cached_map.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/favourites_model.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/presentation/dashboard/order_summary/order_summary_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/services/http_service.dart';

class HomeController extends GetxController {
  var scrollController = ScrollController();
  ShoppingCartController cartController = Get.find();
  RxBool loadingCat = false.obs;
  RxBool loadingProducts = false.obs;
  RxInt isSelected = (0).obs;
  RxList isFavdiscount = [].obs;
  RxList<Categories>? categoriesList = <Categories>[].obs;
  Rx<ProductByCat> productsModal = ProductByCat().obs;

  RxList<Products> productChunks = <Products>[].obs;
  RxList<int> indexes = <int>[].obs;

  FavouritesModel favourites = FavouritesModel();
  RxList<Products> favouriteList = <Products>[].obs;
  RxBool loadingFavs = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    getProductByCat(catId: '97'); // for ladies related products
  }

  onFavdiscount(int index) {
    if (isFavdiscount.contains(index)) {
      isFavdiscount.remove(index);
    } else {
      isFavdiscount.add(index);
    }
  }

  RxList isFavtrending = [].obs;

  onFavtrending(int index) {
    if (isFavtrending.contains(index)) {
      isFavtrending.remove(index);
    } else {
      isFavtrending.add(index);
    }
  }

  Future getCategories() async {
    loadingCat.value = true;
    categoriesList!.clear();
    List<Categories>? data = await HttpService.getCategories();
    for (var element in data!) {
      categoriesList!.add(element);
      categoriesList!.refresh();
    }
    loadingCat.value = false;
  }

  getProductByCat({required String catId}) async {
    indexes.clear();
    indexes.value = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19
    ];
    loadingProducts.value = true;

    // List<ProductByCat>? data = await HttpService.getProductsByCategory(category: category);

    productsModal.value =
        (await HttpService.getProductsByCategory(catId: catId))!;
    loadFav();

    // putting address controller here so that main operation should be executed successfully
    // final OrderSummaryController _con = Get.put(OrderSummaryController());

    loadMoreProducts();
    loadingProducts.value = false;
  }

  loadMoreProducts() {
    if (indexes.first == 0) {
      indexes.forEach((element) {
        productChunks.add(productsModal.value.products![element]);
      });
      indexes.first = 100000;
    } else {
      int lastIndex = indexes.last;
      indexes.clear();
      for (int i = 1; i <= 20; i++) {
        indexes.add(lastIndex + i);
      }
      indexes.forEach((element) {
        productChunks.add(productsModal.value.products![element]);
        print(productChunks[element].productId);
      });
    }

    // print(productChunks);
    print(productChunks.length);
  }

  addToFav(int productId) {
    favourites.productIds!.add(productId);
    Mapped.saveFileDirectly(
        file: favourites.toJson(), cachedFileName: "Favourites");

    int index2 = productsModal.value.products!
        .indexWhere((element) => element.productId == productId);
    if (index2 != -1) {
      productsModal.value.products![index2].isFavourite!.value = true;
      favouriteList.add(productsModal.value.products![index2]);
    }
    print("fav added");
  }

  removeFav(int productId) {
    int index = favourites.productIds!.indexWhere((element) => element == productId);
    // favourites.productIds!.removeWhere((element)=> element==productId);
    if (index != -1) {
      favourites.productIds!.value.removeAt(index);
      productsModal.value.products![index].isFavourite!.value = false;
      print(favourites.productIds!.value);

    }
    Mapped.saveFileDirectly(
        file: favourites.toJson(), cachedFileName: "Favourites");

    int index2 = productsModal.value.products!.indexWhere((element) => element.productId == productId);
    if (index2 != -1) {
      favouriteList.remove(productsModal.value.products![index2]);
    }
    print(favouriteList.value);
    print("fav removed");
  }

  loadFav() async {
    try {
      Map<String, dynamic>? favJson =
          await Mapped.loadFileDirectly(cachedFileName: 'Favourites');

      if (favJson == null) {
        favourites.productIds = <int>[].obs;
        loadingFavs.value = false;
      } else {
        loadingFavs.value = false;
        favourites = FavouritesModel.fromJson(favJson);
        for (var favElementId in favourites.productIds!.value) {
          int index;
          index = productsModal.value.products!.indexWhere((pElement) => pElement.productId == favElementId);
          if (index != -1) {
            productsModal.value.products![index].isFavourite!.value = true;
            favouriteList.add(productsModal.value.products![index]);
          }
        }
        print(favouriteList.value);
        loadingFavs.value = false;
        print("fav loaded");
      }
    } catch (e) {
      print(e);
      loadingFavs.value = false;
    }

    print(favourites);
  }

  clearFavs() {
    Mapped.deleteFileDirectly(cachedFileName: 'Favourites');
    // favouriteList.clear();
    print("fav cleared");
  }
}