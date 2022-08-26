import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/watch_details/watch_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController _con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 170,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
                image: const DecorationImage(
                  image: AssetImage(
                    ImageConstant.poster,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            header(
              text: AppString.categories,
              ontap: () {},
            ),
            hSizedBox12,
            Obx(
              () => SizedBox(
                height: 60,
                child: _con.loadingCat.value
                    ? Center(child: CupertinoActivityIndicator())
                    : ListView.builder(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _con.categoriesList!.length,
                        itemBuilder: ((context, index) {
                          return Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _con.isSelected.value = index;
                                    _con.getProductByCat(
                                        category: _con
                                            .categoriesList![index].slug
                                            .toString());

                                    // _con.isSelected.value == 0
                                    //     ? Get.toNamed(AppRoutes.chairTabBar)
                                    //     : null;
                                  },
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: _con.isSelected.value == index
                                          ? 20
                                          : 8,
                                      vertical: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: _con.isSelected.value == index
                                          ? const Color(0xffFFE7C1)
                                          : null,
                                    ),
                                    child: Text(
                                      _con.categoriesList![index].name
                                          .toString(),
                                      style: TextStyle(
                                        color: _con.isSelected.value == index
                                            ? const Color(0xff363636)
                                            : Colors.black.withOpacity(.5),
                                        fontWeight:
                                            _con.isSelected.value == index
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                        fontSize: _con.isSelected.value == index
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
              ),
            ),
            hSizedBox4,
            header(
              text: AppString.discountOffer,
              ontap: () {
                Get.toNamed(
                  AppRoutes.seeMoreScreen,
                  arguments: AppString.discountOffer,
                );
              },
            ),
            hSizedBox12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(() => !_con.loadingProducts.value
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: _con.productsModal.value.products!.length > 10
                          ? 10
                          : _con.productsModal.value.products!.length,
                      // itemCount: _con.productsModal.value.products!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 2.8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return productCardView(
                            _con.productsModal.value.products![index], index);
                      },
                    )
                  : Center(child: const CupertinoActivityIndicator())),
            ),
            // hSizedBox20,
            // header(
            //   text: AppString.trendingProducts,
            //   ontap: () {
            //     Get.toNamed(
            //       AppRoutes.seeMoreScreen,
            //       arguments: AppString.trendingProducts,
            //     );
            //   },
            // ),
            // hSizedBox8,
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: List.generate(2, (index) {
            //       return productCardView(index);
            //     }),
            //   ),
            // ),
            hSizedBox10,
          ],
        ),
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
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ${product.regularPrice}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff939393),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          wSizedBox10,
                          Text(
                            "\$ ${product.price}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4d18cc),
                            ),
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
              top: 5,
              right: 5,
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    _con.onFavtrending(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Color(0xffE5F0FF), shape: BoxShape.circle),
                    child: Icon(
                      _con.isFavtrending.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: _con.isFavtrending.contains(index)
                          ? const Color(0xffFF4848)
                          : const Color(0xff939393),
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

  Padding header({required String text, required Function() ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              AppString.seemore,
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
