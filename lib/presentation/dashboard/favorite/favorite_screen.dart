import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/presentation/dashboard/favorite/favorite_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/dashboard/watch_details/watch_details_screen.dart';

import '../../../model/product_by_cat_model.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final FavoriteController _con = Get.put(FavoriteController());
  HomeController homeController=Get.find();
  ShoppingCartController cartController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.favouriteList.isEmpty
          ? Column(
              children: [
                Image.asset(ImageConstant.noFav),
                const Text("No favorite yet")
              ],
            )
          : GridView.builder(
            shrinkWrap: true,
              itemCount: homeController.favouriteList.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: Get.size.width / (Get.size.height * 0.70),
              ),
              itemBuilder: (BuildContext context, int index) {
                return productCardView(homeController.favouriteList.value[index] ,index);
              },
            ),
    );
  }

  productCardView(Products product, index) {
    return GestureDetector(
      onTap: () {
        Get.to(WatchDetailScreen(product.productId!));
        // Get.toNamed(AppRoutes.watchDetailScreen);
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: Get.width / 2 - 20,
        // height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: .5,
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: '${product.productImg}',
                    height: 115,
                    width: Get.width,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const SizedBox(
                      height: 150,
                      child: CupertinoActivityIndicator(),
                    ),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 150,
                      child: Icon(Icons.error),
                    ),
                  ),
                  hSizedBox10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ${product.regularPrice}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff939393),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          wSizedBox10,
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4d18cc),
                                fontStyle: FontStyle.italic),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(ImageConstant.buy),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -11,
              right: 0,
              child: Obx(
                    () => GestureDetector(
                  onTap: () {
                    if (!product.isFavourite!.value == true) {
                      homeController.addToFav(product.productId!);
                      product.isFavourite!.value = true;
                      // print("current product like status ${product.isFavourite!.value}" );
                    } else {
                      product.isFavourite!.value = false;
                      homeController.removeFav(product.productId!);
                      // print("current product like status ${product.isFavourite!.value}" );
                    }
                    // _con.onFavtrending(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                        color: AppColors.backgroundColor.withOpacity(0.3), shape: BoxShape.circle),
                    child: Icon(
                      product.isFavourite!.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: product.isFavourite!.value
                          ? AppColors.backgroundColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
