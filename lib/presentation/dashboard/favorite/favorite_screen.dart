import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/presentation/dashboard/favorite/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final FavoriteController _con = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _con.favList.isEmpty
          ? Column(
              children: [
                Image.asset(ImageConstant.noFav),
                const Text("No favorite yet")
              ],
            )
          : GridView.builder(
              itemCount: _con.favList.length,
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
              child: GestureDetector(
                onTap: () {
                  _con.favList.removeAt(index);
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color(0xffE5F0FF), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.favorite,
                    size: 16,
                    color: Colors.grey,
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
