import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/presentation/auth/login/login_screen.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_screen.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';

import 'watch_details_controller.dart';

class WatchDetailScreen extends StatelessWidget {
  int watchId;

  WatchDetailScreen(this.watchId);

  @override
  Widget build(BuildContext context) {
    final WatchDetailController _con = Get.put(WatchDetailController(watchId));

    BottomBarController barController=Get.find();
    final  cartController=Get.put(ShoppingCartController());

    return Scaffold(
      appBar: appBar(
        text: "",
        back: true,
        actionIcon: true,
        action: ImageConstant.bag,
      ),
      body: Obx(() => _con.loading.value? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
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
                        child: Image.network(
                          _con.watchDetailsM.value.images![0].src.toString() ,
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
                            info(_con.watchDetailsM.value.tags![0].name.toString()),
                            hSizedBox36,
                            details(AppString.color),
                            info(_con.watchDetailsM.value.attributes![1].options![0]),
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
                    flex: 1,
                    child: Text(
                      _con.watchDetailsM.value.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
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
                            text: '${_con.watchDetailsM.value.price}',
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
                _con.watchDetailsM.value.description??"No Description Available".toString(),
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
                  Obx(
                        ()=> !cartController.loading.value? Expanded(
                      child: AppButton(
                        text: AppString.addtocart,
                        onPressed: () async {
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
                          }else{
                            // await cartController.addToCart(watchId.toString());
                            // if(cartController.cartModel.value.status == 'success'){
                            //   barController.pageIndex.value=1;
                            //   cartController.viewCart();
                            //   Get.back();
                            //   Get.back();
                            // }else{
                            //   showDialog(
                            //       context: context,
                            //       builder: (_) => AlertDialogWidget(
                            //         onPositiveClick: () {
                            //           Get.back();
                            //         },
                            //         title: "Error",
                            //         subTitle: "Failed adding to cart",
                            //       ));
                            // }
                          }
                        },
                      ),
                    ):CircularProgressIndicator(),
                  ),
                ],
              ),
              hSizedBox10,
            ],
          ),
        ),
      )),
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
