import 'package:carousel_slider/carousel_controller.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';

class IntroController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  onTap(index) {
    currentCarouselIndex.value = index;
  }

  RxList<Introduction> introductionList = RxList(
    [
      Introduction(
        title: AppString.intro1,
        subTitle: AppString.introdetails1,
        image: ImageConstant.intro1,
      ),
      Introduction(
        title: AppString.intro2,
        subTitle: AppString.introdetails2,
        image: ImageConstant.intro2,
      ),
      Introduction(
        title: AppString.intro3,
        subTitle: AppString.introdetails3,
        image: ImageConstant.intro3,
      ),
    ],
  );
}

class Introduction {
  String title;
  String subTitle;
  String image;

  Introduction({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
