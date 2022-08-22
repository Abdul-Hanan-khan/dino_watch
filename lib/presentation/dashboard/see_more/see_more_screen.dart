import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/dashboard/see_more/see_more_controller.dart';

import '../../commamn/serach_box.dart';

class SeeMoreScreen extends StatelessWidget {
  SeeMoreScreen({Key? key}) : super(key: key);
  final SeeMoreController _con = Get.put(SeeMoreController());

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments;
    return Scaffold(
      appBar: appBar(
        text: title,
        actionIcon: true,
        back: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: searchBox(hint: AppString.search),
                ),
                wSizedBox10,
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.filterScreen);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffCCCCCC)),
                    ),
                    child: Image.asset(ImageConstant.filter),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _con.popularProductList.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: Get.size.width / (Get.size.height * 0.70),
              ),
              itemBuilder: (BuildContext context, int index) {
                return productCardView(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  productCardView(index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.watchDetailScreen);
      },
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.all(10),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.intro3,
                  height: 115,
                  width: Get.width,
                  fit: BoxFit.contain,
                ),
                hSizedBox10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Amazfit GTS2 Mini Smart Watch",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "\$200",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff939393),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        wSizedBox10,
                        const Text(
                          "\$200",
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
            Positioned(
              top: 0,
              right: 0,
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    _con.onFav(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Color(0xffE5F0FF), shape: BoxShape.circle),
                    child: Icon(
                      _con.isFav.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: _con.isFav.contains(index)
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
}
