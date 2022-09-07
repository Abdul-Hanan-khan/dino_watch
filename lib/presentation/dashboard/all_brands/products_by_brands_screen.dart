import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/dashboard/all_brands/all_brands_controller.dart';
import 'package:watch_app/presentation/dashboard/watch_details/watch_details_screen.dart';

import '../../../model/products_by_brand.dart';
import '../../commamn/app_bar.dart';

class ProductsByBrandScreen extends StatelessWidget {
  ProductsByBrandScreen({Key? key}) : super(key: key);
  AllBrandsController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: appBar(
        text: AppString.products,
        back: true,
        actionIcon: true,
      ),
      body: Obx(
        () => con.loadingProductByBrand.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    color: Colors.white,
                    child: GridView.builder(
                      // controller: _con.scrollController ,
                      shrinkWrap: true,
                      itemCount: con.prodByBrandM.value.products!.length,

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
                            con.prodByBrandM.value.products![index], index);
                      },
                    ),
                  ),
                ),
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
                    con.onFavtrending(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: const Color(0xff939393), shape: BoxShape.circle),
                    child: Icon(
                      con.isFavtrending.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: con.isFavtrending.contains(index)
                          ? const Color(0xffFF4848)
                          : const Color(0xffE5F0FF),
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
