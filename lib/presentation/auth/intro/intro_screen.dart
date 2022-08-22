import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';

import '../../commamn/app_button.dart';
import 'intro_controller.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  final IntroController _con = Get.put(IntroController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Image.asset(
                ImageConstant.sliderbg,
                fit: BoxFit.fill,
              ),
            ),
            CarouselSlider(
              carouselController: _con.carouselController,
              options: CarouselOptions(
                height: Get.height * 0.4,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                pauseAutoPlayOnTouch: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  _con.selectedIndex.value = index;
                },
              ),
              items: List.generate(
                3,
                (index) => SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      _con.introductionList[index].image,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSizedBox36,
                  hSizedBox36,
                  Text(
                    _con.introductionList[_con.selectedIndex.value].title,
                    style: TextStyle(
                      color: AppColors.appColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  hSizedBox8,
                  Text(
                    _con.introductionList[_con.selectedIndex.value].subTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) =>
                            indicator(index, _con.currentCarouselIndex.value),
                      ),
                      const Spacer(),
                      AppButton(
                        width: 100,
                        text: _con.selectedIndex.value == 2
                            ? AppString.start
                            : AppString.next,
                        onPressed: () {
                          if (_con.selectedIndex.value == 2) {
                            Get.toNamed(AppRoutes.loginScreen);
                          } else {
                            _con.carouselController.nextPage();
                          }
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          AppString.skip,
                          style: TextStyle(
                            color: AppColors.appColor.withOpacity(.5),
                          ),
                        ),
                      ),
                      // Icon(
                      //   Icons.chevron_right,
                      //   color: AppColors.appColor.withOpacity(.5),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  indicator(
    int? index,
    int? value,
  ) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(5),
        height: 8,
        width: index == _con.selectedIndex.value ? 20 : 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.appColor.withOpacity(.5),
        ),
      ),
    );
  }
}
