import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/presentation/dashboard/all_brands/all_brands_screen.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/dashboard/watch_details/watch_details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _con = Get.find();
  var controller = Get.put(CheckoutController());

  ScrollController scrollControllerNested = ScrollController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print("user id is ---------------------- " + StaticVars.id);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Get.to(AllBrandsScreen());
              },
              child: Container(
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
                        reverse: true,
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
                                        catId: _con.categoriesList![index].id
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
                                          ? const Color(0xff4d18cc)
                                          : null,
                                    ),
                                    child: Text(
                                      _con.categoriesList![index].name
                                          .toString(),
                                      style: TextStyle(
                                        color: _con.isSelected.value == index
                                            ? Colors.white
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
              text: AppString.products,
              showSeeMore: false,
              ontap: () {
                Get.toNamed(
                  AppRoutes.seeMoreScreen,
                  arguments: AppString.discountOffer,
                );
              },
            ),
            hSizedBox12,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(() => !_con.loadingProducts.value
                      ? Column(
                          children: [
                            GridView.builder(
                              controller: _con.scrollController,
                              shrinkWrap: true,
                              itemCount: _con.productChunks.length,

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
                                    _con.productChunks[index], index);
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextButton(
                                onPressed: () {
                                  _con.loadMoreProducts();
                                },
                                child: Text(
                                  "see more",
                                  style: TextStyle(
                                      color: AppColors.backgroundColor),
                                )),
                          ],
                        )
                      : Center(child: const CupertinoActivityIndicator())),
                ),
              ],
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
                        color: Color(0xff939393), shape: BoxShape.circle),
                    child: Icon(
                      _con.isFavtrending.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: _con.isFavtrending.contains(index)
                          ? const Color(0xffFF4848)
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

  Padding header(
      {required String text, required Function() ontap, bool? showSeeMore}) {
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
          showSeeMore == false
              ? Container()
              : GestureDetector(
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
