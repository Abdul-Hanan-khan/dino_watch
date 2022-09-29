import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/auth/login/login_screen.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_screen.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_screen.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';
import 'package:watch_app/services/http_service.dart';

import 'watch_details_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WatchDetailScreen extends StatelessWidget {
  int watchId;

  WatchDetailScreen(this.watchId);

  // WatchDetailController con=Get.find();
  var reviewController= TextEditingController();
  double ratingValue=0.2;
  @override
  Widget build(BuildContext context) {
    RxInt cartIndex = 1.obs;
    cartIndex.value = -1;
    final WatchDetailController _con = Get.put(WatchDetailController(watchId));
    BottomBarController barController = Get.find();
    ShoppingCartController cartController = Get.find();
    // RxBool loadingReview=false.obs;
    final _dialog = RatingDialog(
      initialRating: 1.0,
      starSize: 22,
      // your app's name?
      title: const Text(
        'Rate This Watch',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      // message: const Text(
      //   'Tap a star to set your rating. Add more description here if you want.',
      //   textAlign: TextAlign.center,
      //   style: TextStyle(fontSize: 15),
      // ),
      // your app's logo?
      // image: Image.asset("assets/images/watch_logo.png",scale: 5,),
      submitButtonText: 'Submit',
      commentHint: 'Tell us your experience',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async {
        print('rating: ${response.rating}, comment: ${response.comment}');
        // loadingReview.value=true;
        var apiResponse = await HttpService.addReview(
            userId: StaticVars.id,
            productId: watchId.toString(),
            rating: response.rating.round(),
            commentContent: response.comment);
        // loadingReview.value=false;
        if (apiResponse['status'] == "success") {
          Get.snackbar("Message",
              "Your Review is Recorded. Thanks for Reviewing Our Product",
              backgroundColor: Colors.white,
              boxShadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]);
          // Get.back();
        } else {
          Get.snackbar(
            "Message",
            "${apiResponse['status']}",
          );
        }

        // // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   // _rateAndReviewApp();
        // }
      },
    );


    return Scaffold(
      appBar: appBar(
        text: "",
        back: true,
        actionIcon: true,
        action: ImageConstant.bag,
      ),
      body: Obx(
        () => _con.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                        height: Get.width * 0.9,
                        child: ImageSlideshow(
                          width: MediaQuery.of(context).size.width * 0.6,

                          /// Height of the [ImageSlideshow].
                          height: 280,

                          /// The page to show when first creating the [ImageSlideshow].
                          initialPage: 0,

                          /// The color to paint the indicator.
                          indicatorColor: Colors.blue,

                          /// The color to paint behind th indicator.
                          indicatorBackgroundColor: Colors.grey,
// children: _con.watchDetailsM.value.images!
//     .map(
//       (e) => Image.network(
//         e.src.toString(),
//         fit: BoxFit.contain,
//       ),
//     )
//     .toList(),

                          children: _con.watchDetailsM.value.images!
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    showImageViewer(context,
                                        Image.network(e.src.toString()).image,
                                        swipeDismissible: false);
                                  },
                                  child: Image.network(
                                    e.src.toString(),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                              .toList(),

                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },

                          /// Auto scroll interval.
                          /// Do not auto scroll with null or 0.
                          autoPlayInterval: 10000,

                          /// Loops back to first slide.
// isLoop: true,
                        ),
                      ),
                      // hSizedBox20,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hSizedBox36,
                              _con.watchDetailsM.value.tags!.length == 0
                                  ? Container()
                                  : details(AppString.brand),
                              _con.watchDetailsM.value.tags!.length == 0
                                  ? Container()
                                  : info(_con.watchDetailsM.value.tags![0].name
                                      .toString()),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hSizedBox36,
                              _con.watchDetailsM.value.attributes!.length == 0
                                  ? Container()
                                  : details(AppString.color),
                              _con.watchDetailsM.value.attributes!.length == 0
                                  ? Container()
                                  : info(_con.watchDetailsM.value.attributes![1]
                                      .options![0]),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     hSizedBox36,
                          //     details(AppString.warranty),
                          //     // info( _con.watchDetailsM.value.),
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                              text: '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23,
                                  color: AppColors.purple,
                                  fontStyle: FontStyle.italic),
                              children: [
                                TextSpan(
                                    text: '\$${_con.watchDetailsM.value.price}',
                                    style: TextStyle(
                                        // decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 34,
                                        color: AppColors.purple,
                                        fontStyle: FontStyle.italic))
                              ],
                            ),
                          ),
                        ],
                      ),
                      hSizedBox20,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.review,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: AppButton(
                              text: "ADD REVIEW",
                              onPressed: () {
                                Get.bottomSheet(
                                  StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 4,
                                          width: Get.width * 0.2,
                                          decoration: const BoxDecoration(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "What is Your Rate",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RatingBar.builder(
                                          itemSize: 30,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            ratingValue=rating;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: Get.width * 0.8,
                                          child: const Text(
                                            "Please Share your Opinion About The Product",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          width: Get.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                            controller: reviewController,
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Your Review",
                                            ),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   mainAxisSize: MainAxisSize.max,
                                        //   children: [
                                        //     Container(
                                        //       margin: EdgeInsets.symmetric(
                                        //           horizontal: 20, vertical: 10),
                                        //       height: 110,
                                        //       width: 80,
                                        //       color: Colors.white70,
                                        //       child: Column(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.center,
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.center,
                                        //         mainAxisSize: MainAxisSize.max,
                                        //         children: [
                                        //           CircleAvatar(
                                        //             child: Icon(
                                        //               Icons.camera_alt,
                                        //               color: Colors.white,
                                        //             ),
                                        //             backgroundColor: AppColors
                                        //                 .backgroundColor,
                                        //           ),
                                        //           SizedBox(
                                        //             height: 5,
                                        //           ),
                                        //           Text("Add Your Photos",
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //               style: TextStyle(
                                        //                   fontSize: 10)),
                                        //         ],
                                        //       ),
                                        //     )
                                        //     // Container(
                                        //     //   margin: EdgeInsets.only(left: 20),
                                        //     //   height: 50,
                                        //     //   width: 50,
                                        //     //   decoration: BoxDecoration(
                                        //     //     color:
                                        //     //         AppColors.backgroundColor,
                                        //     //     borderRadius:
                                        //     //         BorderRadius.circular(30),
                                        //     //   ),
                                        //     //   child: const Center(
                                        //     //     child: Icon(
                                        //     //       Icons.camera_alt,
                                        //     //       color: Colors.white,
                                        //     //     ),
                                        //     //   ),
                                        //     // )
                                        //   ],
                                        // ),
                                        SizedBox(
                                          width: Get.width * 0.5,
                                          child: Obx(
                                        ()=>_con.loadingSendReview.value?Center(child: CircularProgressIndicator(),): RaisedButton(
                                              onPressed: () async {
                                                _con.loadingSendReview.value = true;
                                                var apiResponse = await HttpService.addReview(
                                                    userId: StaticVars.id,
                                                    productId: watchId.toString(),
                                                    rating: ratingValue.round(),
                                                    commentContent: reviewController.text.toString());
                                                // loadingReview.value=false;
                                                if (apiResponse['status'] == "success") {
                                                  _con.loadingSendReview.value = false;

                                                  Get.back();
                                                  reviewController.clear();
                                                  Get.snackbar("Message",
                                                      "Your Review is Recorded. Thanks for Reviewing Our Product",
                                                      backgroundColor: Colors.white,
                                                      boxShadows: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: const Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ]);
                                                  // Get.back();
                                                } else {
                                                  _con.loadingSendReview.value = false;
                                                  Get.snackbar("Message",
                                                      "${apiResponse['status']}",
                                                      backgroundColor: Colors.white,
                                                      boxShadows: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: const Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ]);
                                                  // Get.snackbar(
                                                  //   "Message",
                                                  //   "${apiResponse['status']}",
                                                  // );
                                                }

                                              },
                                              child: const Text(
                                                "Send Review",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              color: AppColors.backgroundColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                        ),
                                      ],
                                    );
                                  }),
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  backgroundColor: Color(0xffeff6fd),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                );

                                // myBottomSheet(context);
                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: true,
                                //   // set to false if you want to force a rating
                                //   builder: (context) => _dialog,
                                // );
                              },
                            ),
                          )
                        ],
                      ),
                      hSizedBox8,
                      StarRating(
                        rating: double.parse(
                                _con.watchDetailsM.value.ratingCount.toString())
                            .round(),
                      ),
                      hSizedBox8,
                      Text(
                        _con.watchDetailsM.value.description ?? "".toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(.4),
                          fontSize: 15,
                        ),
                      ),
                      hSizedBox20,
                      Row(
                        children: [
                          // ...List.generate(
                          //   _con.colorList.length,
                          //   (index) {
                          //     return Obx(
                          //       () => GestureDetector(
                          //         onTap: () {
                          //           _con.isSelectColor.value = index;
                          //         },
                          //         child: Container(
                          //           margin:
                          //               const EdgeInsets.symmetric(horizontal: 3),
                          //           height: _con.isSelectColor.value == index
                          //               ? 35
                          //               : 24,
                          //           width: _con.isSelectColor.value == index
                          //               ? 35
                          //               : 24,
                          //           decoration: BoxDecoration(
                          //             color: _con.colorList[index],
                          //             shape: BoxShape.circle,
                          //             border: Border.all(
                          //                 color: Colors.white, width: 3),
                          //             boxShadow: const [
                          //               BoxShadow(
                          //                 color: Colors.black12,
                          //                 blurRadius: 10.0,
                          //                 spreadRadius: .5,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // wSizedBox30,
                          Obx(
                            () => !cartController.loading.value
                                ? Expanded(
                                    child: cartIndex.value == -1
                                        ? AppButton(
                                            text: AppString.addtocart,
                                            onPressed: () async {
                                              if (!userLoginStatus!) {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        AlertDialogWidget(
                                                          onPositiveClick: () {
                                                            Get.off(
                                                                LoginScreen());
                                                          },
                                                          title: "Warning",
                                                          subTitle:
                                                              "Please login first",
                                                        ));
                                              } else {
                                                cartIndex.value = cartController
                                                    .cart.products!
                                                    .indexWhere((element) =>
                                                        element.id ==
                                                        _con.watchDetailsM.value
                                                            .id);

                                                print(cartIndex.value);
                                                await cartController.addItem(
                                                    _con.watchDetailsM.value,
                                                    cartIndex.value);
                                                // Get.to(ShoppingCartScreen());
                                                // await cartController.addToCart(watchId.toString());
                                                // if(cartController.cartModel.value.status == 'success'){
                                                barController.pageIndex.value =
                                                    1;
                                                // Get.off(BottomBarScreen());
                                                //   cartController.viewCart();
                                                Get.back();
                                                Get.back();
                                                Get.back();
                                              }
                                            },
                                          )
                                        : AppButton(
                                            text: AppString.removeFromCart,
                                            onPressed: () async {
                                              if (!userLoginStatus!) {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        AlertDialogWidget(
                                                          onPositiveClick: () {
                                                            Get.off(
                                                                LoginScreen());
                                                          },
                                                          title: "Warning",
                                                          subTitle:
                                                              "Please login first",
                                                        ));
                                              } else {
                                                cartController.removeFullItem(
                                                    _con.watchDetailsM.value,
                                                    cartIndex.value);
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
                                  )
                                : CircularProgressIndicator(),
                          ),
                        ],
                      ),
                      hSizedBox10,
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  myBottomSheet(BuildContext context) {
    return showBottomSheet(
      context: context,
      builder: (context) => Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 2,
          ),
          Text("What is Your Rate?")
        ],
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
