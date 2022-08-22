import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  RxList<Widget> tabbar = ([
    Center(child: Text(AppString.top)),
    Center(child: Text(AppString.account)),
    Center(child: Text(AppString.tags)),
    Center(child: Text(AppString.categories)),
  ]).obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
