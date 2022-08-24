import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/services/http_service.dart';

class HomeController extends GetxController {
  RxBool loadingCat = false.obs;
  RxInt isSelected = (-1).obs;
  RxList isFavdiscount = [].obs;
List<Categories>? categoriesList= <Categories>[];

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

  getCategories() async {
    loadingCat.value = true;
    categoriesList= await HttpService.getCategories();
    loadingCat.value = false;
  }

  // List categoriesList = [
  //   {"name": "Trending Now"},
  //   {"name": "Recent"},
  //   {"name": "Recomended"},
  //   {"name": "Woman"},
  //   {"name": "Man"},
  //   {"name": "Child"},
  // ];
}
