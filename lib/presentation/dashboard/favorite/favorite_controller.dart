import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';

class FavoriteController extends GetxController {
  ShoppingCartController cartController=Get.find();
  HomeController homeController=Get.find();

  RxBool loading =false.obs;


  //
  // RxList favList = [
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Alchemy Delux",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Luxury Chair",
  //     "price": "\$300",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Alchemy Delux",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Cantilever chair",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Alchemy Delux",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Alchemy Delux",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Alchemy Delux",
  //     "price": "\$200",
  //   },
  //   {
  //     "image": ImageConstant.intro3,
  //     "name": "Cantilever chair",
  //     "price": "\$200",
  //   }
  // ].obs;
}
