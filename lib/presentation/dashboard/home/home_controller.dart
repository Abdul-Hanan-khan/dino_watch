import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/services/http_service.dart';

class HomeController extends GetxController {
  RxBool loadingCat = false.obs;
  RxBool loadingProducts = false.obs;
  RxInt isSelected = (1).obs;
  RxList isFavdiscount = [].obs;
  RxList<Categories>? categoriesList = <Categories>[].obs;
  Rx<ProductByCat> productsModal = ProductByCat().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    getProductByCat(category: 'men');
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

  getProductByCat({required String category}) async {
    loadingProducts.value = true;


    // List<ProductByCat>? data = await HttpService.getProductsByCategory(category: category);

    productsModal.value=(await HttpService.getProductsByCategory(category: category))!;
    // print(productsModal.value.products);
    // for (var element in data!) {
    //   productsList!.add(element);
    //   productsList!.refresh();
    // }

    loadingProducts.value = false;
  }
}
