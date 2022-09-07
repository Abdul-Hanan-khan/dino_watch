import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/services/http_service.dart';

class HomeController extends GetxController {
  var scrollController = ScrollController();
  RxBool loadingCat = false.obs;
  RxBool loadingProducts = false.obs;
  RxInt isSelected = (0).obs;
  RxList isFavdiscount = [].obs;
  RxList<Categories>? categoriesList = <Categories>[].obs;
  Rx<ProductByCat> productsModal = ProductByCat().obs;

  RxList<Products> productChunks = <Products>[].obs;
  RxList<int> indexes = <int>[].obs;

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
    indexes.value=[
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
      19];
    loadingProducts.value = true;

    // List<ProductByCat>? data = await HttpService.getProductsByCategory(category: category);

    productsModal.value =
        (await HttpService.getProductsByCategory(catId: catId))!;

    // productsModal.value.products.forEach((element) { });
    // print(productsModal.value.products);
    // for (var element in data!) {
    //   productsList!.add(element);
    //   productsList!.refresh();
    // }
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
}
