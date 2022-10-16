import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/services/http_service.dart';

class WatchDetailController extends GetxController {
  int watchId = 0;
  RxBool loading = false.obs;
  RxBool loadingSendReview = false.obs;
  Rx<WatchDetailsModel> watchDetailsM = WatchDetailsModel().obs;

  WatchDetailController(this.watchId) {
    getWatchDetails(watchId.toString());
  }

  getWatchDetails(String watchId) async {
    loading.value = true;
    watchDetailsM.value =
        (await HttpService.getWatchDetails(productID: watchId))!;
    loading.value = false;
  }

  RxInt isSelectColor = 0.obs;

}
