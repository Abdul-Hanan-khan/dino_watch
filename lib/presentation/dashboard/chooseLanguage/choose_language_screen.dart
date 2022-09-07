import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';

import 'choose_language_controller.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({Key? key}) : super(key: key);
  final ChooseLanguageController _con = Get.put(ChooseLanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.chooseLanguage,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.freeServer,
                style: const TextStyle(
                  color: Color(0xff9DA4AB),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hSizedBox18,
              Obx(
                () => GestureDetector(
                  onTap: () {
                    if (_con.isSelectlan.isNotEmpty) {
                      _con.isSelectlan.clear();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: .5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Container(
                        //   height: 35,
                        //   width: 35,
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.grey,
                        //     image: DecorationImage(
                        //       image: AssetImage(ImageConstant.india),
                        //     ),
                        //   ),
                        // ),
                        // wSizedBox20,
                        const Expanded(
                          child: Text(
                            "ENG",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff373946),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _con.isSelectlan.isEmpty
                                ? AppColors.yellowColor
                                : Colors.white,
                            border: Border.all(color: AppColors.yellowColor),
                          ),
                          child: _con.isSelectlan.isEmpty
                              ? const Icon(
                                  Icons.done,
                                  size: 15,
                                  color: Colors.white,
                                )
                              : null,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              hSizedBox18,
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   height: 80,
              //   width: Get.width,
              //   decoration: BoxDecoration(
              //     color: AppColors.appColor,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(10),
              //         height: 50,
              //         width: 50,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(
              //             10,
              //           ),
              //         ),
              //         child: Image.asset(ImageConstant.crown),
              //       ),
              //       wSizedBox16,
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             AppString.goPremium,
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //           hSizedBox4,
              //           Text(
              //             AppString.trial,
              //             style: const TextStyle(
              //               color: Color(0xffF6DBDF),
              //               fontSize: 14,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // hSizedBox18,
              // ListView.separated(
              //   separatorBuilder: (context, index) {
              //     return const Padding(
              //       padding: EdgeInsets.symmetric(vertical: 8.0),
              //       child: Divider(),
              //     );
              //   },
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: 6,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return Obx(
              //       () => GestureDetector(
              //         onTap: () {
              //           if (_con.isSelectlan.isNotEmpty) {
              //             _con.isSelectlan.clear();
              //           }
              //           _con.isSelectlan.add(index);
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 10),
              //           child: Row(
              //             children: [
              //               Container(
              //                 height: 40,
              //                 width: 40,
              //                 decoration: const BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: Colors.grey,
              //                   image: DecorationImage(
              //                     image: AssetImage(ImageConstant.india),
              //                   ),
              //                 ),
              //               ),
              //               wSizedBox20,
              //               const Expanded(
              //                 child: Text(
              //                   "India",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16,
              //                       color: Color(0xff373946)),
              //                 ),
              //               ),
              //               Container(
              //                 height: 20,
              //                 width: 20,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: _con.isSelectlan.contains(index)
              //                       ? AppColors.yellowColor
              //                       : Colors.white,
              //                   border: _con.isSelectlan.contains(index)
              //                       ? null
              //                       : Border.all(color: const Color(0xffFFEED3)),
              //                 ),
              //                 child: _con.isSelectlan.contains(index)
              //                     ? const Icon(
              //                         Icons.done,
              //                         size: 15,
              //                         color: Colors.white,
              //                       )
              //                     : null,
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              hSizedBox18
            ],
          ),
        ),
      ),
    );
  }
}
