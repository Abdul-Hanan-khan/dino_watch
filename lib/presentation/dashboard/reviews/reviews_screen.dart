import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/app_text_field.dart';
import 'package:watch_app/presentation/commamn/clip_path.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';
import 'reviews_controller.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({Key? key}) : super(key: key);
  final ReviewController _con = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        backgroundColor: AppColors.appColor,
        text: AppString.reviews,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                width: Get.width,
                height: 256,
                color: AppColors.appColor,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(ImageConstant.intro3)),
                        ),
                      ),
                    ),
                    hSizedBox10,
                    Text(
                      AppString.pname,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    hSizedBox6,
                    Text(
                      AppString.pemail,
                      style: const TextStyle(
                        color: Color(0xffF2CAD0),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            hSizedBox20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: StarRating(
                          rating: 4,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  hSizedBox20,
                  Text(
                    AppString.howisyourtrip,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  hSizedBox10,
                  Text(
                    AppString.reviewdetails,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff8A8A8F),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  hSizedBox30,
                  AppTextField(
                    errorMessage: _con.reviewError,
                    hintText: AppString.additionalcomments,
                    maxLines: 5,
                    radius: 15,
                    bgcolor: const Color(0xffEFEFF2),
                  ),
                  hSizedBox20,
                  AppButton(
                    text: AppString.submitReview,
                    width: Get.width / 2,
                  ),
                  hSizedBox10,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
