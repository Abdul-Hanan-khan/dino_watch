import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/presentation/auth/login/login_screen.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';

import 'watch_details_controller.dart';

class WatchDetailScreen extends StatelessWidget {
  int watchId;

  WatchDetailScreen(this.watchId);

  @override
  Widget build(BuildContext context) {
    final WatchDetailController _con = Get.put(WatchDetailController(watchId));

    return Scaffold(
      appBar: appBar(
        text: "",
        back: true,
        actionIcon: true,
        action: ImageConstant.bag,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
                height: 300,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Black Watch",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFE7C1)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 300,
                        // color: Colors.amberAccent,
                        child: Image.asset(
                          ImageConstant.intro3,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hSizedBox36,
                            details(AppString.brand),
                            info(AppString.arnold),
                            hSizedBox36,
                            details(AppString.color),
                            info(AppString.gold),
                            hSizedBox36,
                            details(AppString.warranty),
                            info(AppString.years),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              hSizedBox20,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      AppString.keroenBlackWatch,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                  wSizedBox10,
                  RichText(
                    text: TextSpan(
                      text: '\$',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: AppColors.appColor,
                      ),
                      children: [
                        TextSpan(
                            text: '78',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 34,
                              color: AppColors.appColor,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              hSizedBox20,
              Text(
                AppString.review,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              hSizedBox8,
              const StarRating(
                rating: 4,
              ),
              hSizedBox8,
              Text(
                AppString.loremipsum,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(.4),
                  fontSize: 15,
                ),
              ),
              hSizedBox20,
              Row(
                children: [
                  ...List.generate(
                    _con.colorList.length,
                    (index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            _con.isSelectColor.value = index;
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            height: _con.isSelectColor.value == index ? 35 : 24,
                            width: _con.isSelectColor.value == index ? 35 : 24,
                            decoration: BoxDecoration(
                              color: _con.colorList[index],
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  spreadRadius: .5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  wSizedBox30,
                  Expanded(
                    child: AppButton(
                      text: AppString.addtocart,
                      onPressed: () {
                        if (!userLoginStatus!) {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialogWidget(
                                    onPositiveClick: () {
                                      Get.off(LoginScreen());
                                    },
                                    title: "Warning",
                                    subTitle: "Please login first",
                                  ));
                        }
                      },
                    ),
                  ),
                ],
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }

  Text info(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.appColor,
      ),
    );
  }

  Text details(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
