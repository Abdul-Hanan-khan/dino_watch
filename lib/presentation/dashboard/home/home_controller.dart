import 'package:watch_app/core/app_export.dart';

class HomeController extends GetxController {
  RxInt isSelected = (-1).obs;

  RxList isFavdiscount = [].obs;

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

  List categoriesList = [
    {"name": "Trending Now"},
    {"name": "Recent"},
    {"name": "Recomended"},
    {"name": "Woman"},
    {"name": "Man"},
    {"name": "Child"},
  ];
}
