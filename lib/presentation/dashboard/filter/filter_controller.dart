import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';

class FilterController extends GetxController {
  RxList cuisinesSelectList = [].obs;
  RxList sortbySelectList = [].obs;
  RxList filterSelectList = [].obs;

  Rx<RangeValues> currentRangeValues = Rx(const RangeValues(100, 500));

  static String valueToString(double value) {
    return value.toStringAsFixed(0);
  }

  List cuisinesList = [
    "Analog Watch",
    "Pilot Watch",
    "Digital Watch",
    "Field Watch",
    "Automatic Watch",
    "Smart Watch",
    "Quartz Watch",
    "Mechanical Watch",
    "Dress Watch",
  ];

  onCuisines(int index) {
    if (cuisinesSelectList.contains(index)) {
      cuisinesSelectList.remove(index);
    } else {
      cuisinesSelectList.add(index);
    }
  }

  List sortbyList = [
    "Top Rated",
    "Nearest Me",
    "Cost High to Low",
    "Cost Low to High ",
    "Most Popular ",
  ];

  onSortby(int index) {
    if (sortbySelectList.contains(index)) {
      sortbySelectList.remove(index);
    } else {
      sortbySelectList.add(index);
    }
  }

  List filterList = [
    "Open Now",
    "Credit Cards",
    "Alcohol Served",
  ];

  onFilter(int index) {
    if (filterSelectList.contains(index)) {
      filterSelectList.remove(index);
    } else {
      filterSelectList.add(index);
    }
  }
}
