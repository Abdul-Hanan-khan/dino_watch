import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';

class WatchDetailController extends GetxController {

  WatchDetailController(this.watchId){

  }
  int watchId=0;
  RxBool loading=false.obs;

  RxInt isSelectColor = 0.obs;

  List<Color> colorList = [
    const Color(0xff1151A5),
    const Color(0xff030311),
    const Color(0xff72692B),
  ];

  getWatchDetails(int watchId){
     loading.value=true;




     loading.value=false;



  }
}
