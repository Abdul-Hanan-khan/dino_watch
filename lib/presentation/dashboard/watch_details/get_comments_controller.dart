import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/get_comments_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/services/http_service.dart';

class GetCommentsController extends GetxController {
  int watchId = 0;
  RxBool loading = false.obs;
  Rx<GetCommentModel> allComments = GetCommentModel().obs;


  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getComments("2017");
    // getAllBrands();
  }


  getComments(String watchId) async {
    loading.value = true;
    allComments.value = (await HttpService.getComments(productID: watchId))!;
    loading.value = false;
  }

  RxInt isSelectColor = 0.obs;

}
