import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/serach_box.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/search/search_controller.dart';

import '../../../model/search_model.dart';
import '../watch_details/watch_details_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController _con = Get.put(SearchController());
  // HomeController homeController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.srch,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              searchBox(hint: AppString.search),
              hSizedBox10,
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.black.withOpacity(.4),
                        labelColor: Colors.black,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        controller: _con.tabController,
                        tabs: _con.tabbar,
                        indicatorWeight: 1.0,
                        isScrollable: false,
                      ),
                    ),
                    hSizedBox20,
                    Obx(
                      () => _con.loading.value
                          ? CupertinoActivityIndicator()
                          : _con.searchModel.value.products.isNull ||
                                  _con.searchModel.value.products!.length == 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    SizedBox(
                                      height: 250,
                                    ),
                                    Text(
                                      "Search for Different Product",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              :  Obx(
                        ()=> GridView.builder(
                        shrinkWrap: true,
                        itemCount: _con.searchList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: Get.size.width / (Get.size.height * 0.70),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return productCardView(_con.searchList.value[index] ,index);
                        },
                      ),
                              ),
                    ),
                    hSizedBox10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  productCardView(Products product,index) {
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
            //,
          ],
        ),
      ),
    );
  }
}
