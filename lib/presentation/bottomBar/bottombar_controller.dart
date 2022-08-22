import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';

import '../../core/app_export.dart';

class BottomBarController extends GetxController {
  RxInt drawerIndex = 0.obs;
  RxInt pageIndex = Get.arguments != null && Get.arguments is int
      ? RxInt(Get.arguments)
      : 0.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  RxInt isTap = 0.obs;

  List icons = [
    ImageConstant.home,
    ImageConstant.cart,
    ImageConstant.favorite,
    ImageConstant.profile,
  ];

  onTap(index) {
    pageIndex.value = index;
  }

  RxList<DrawerTab> drawerList = RxList([
    DrawerTab(
      image: ImageConstant.mappin,
      title: AppString.deliveryAddress,
    ),
    DrawerTab(
      image: ImageConstant.adduser,
      title: AppString.invite,
    ),
    DrawerTab(
      image: ImageConstant.creditcard,
      title: AppString.paymentMethods,
    ),
    DrawerTab(
      image: ImageConstant.help,
      title: AppString.helpfaq,
    ),
    DrawerTab(
      image: ImageConstant.logout,
      title: AppString.logOut,
    ),
  ]);
}

class DrawerTab {
  String title;
  String image;

  DrawerTab({
    required this.title,
    required this.image,
  });
}
