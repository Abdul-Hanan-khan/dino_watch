import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/search_model.dart';
import 'package:watch_app/services/http_service.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool loading = false.obs;
  Rx<SearchModel> searchModel = SearchModel().obs;
  RxList<Products> searchList=<Products>[].obs;
  late final TabController tabController;
  RxList<Widget> tabbar = ([
    Center(child: Text(AppString.top)),
    Center(child: Text("Red")),
    Center(child: Text('Black')),
    Center(child: Text('Grey')),
  ]).obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void performSearchWithApi(searchString) async {
    loading.value = true;
    if(!searchString.isEmpty && searchString != "" && searchString.length > 1){
      searchModel.value = (await HttpService.search(searchString))!;
      for (var element in searchModel.value.products!) {
        searchList.value.add(element);
      }
    }else{
      searchList.clear();
    }
    loading.value = false;
    print(searchList.value);
  }
}
