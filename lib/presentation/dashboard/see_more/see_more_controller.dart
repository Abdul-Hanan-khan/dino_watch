import 'package:watch_app/core/app_export.dart';

class SeeMoreController extends GetxController {
  RxList isFav = [].obs;

  onFav(int index) {
    if (isFav.contains(index)) {
      isFav.remove(index);
    } else {
      isFav.add(index);
    }
  }

  List popularProductList = [
    {
      "image": ImageConstant.intro3,
      "name": "Alchemy Delux",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Luxury Chair",
      "price": "\$300",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Alchemy Delux",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Cantilever chair",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Alchemy Delux",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Alchemy Delux",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Alchemy Delux",
      "price": "\$200",
    },
    {
      "image": ImageConstant.intro3,
      "name": "Cantilever chair",
      "price": "\$200",
    }
  ];
}
