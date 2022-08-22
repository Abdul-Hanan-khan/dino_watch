import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';

import 'filter_controller.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);
  final FilterController _con = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.filter,
        back: true,
        backgroundColor: Colors.white,
        actionIcon: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.cuisines,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox20,
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  _con.cuisinesList.length,
                  (index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          _con.onCuisines(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: _con.cuisinesSelectList.contains(index)
                                ? const Color(0xffFFF0F2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _con.cuisinesSelectList.contains(index)
                                    ? AppColors.appColor
                                    : const Color(0xffEAECEF)),
                          ),
                          child: Text(
                            _con.cuisinesList[index],
                            style: TextStyle(
                              color: _con.cuisinesSelectList.contains(index)
                                  ? AppColors.appColor
                                  : const Color(0xffB8BBC6),
                              fontWeight:
                                  _con.cuisinesSelectList.contains(index)
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              hSizedBox20,
              Text(
                AppString.sortby,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox14,
              Column(
                children: List.generate(
                  _con.sortbyList.length,
                  (index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          _con.onSortby(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: _con.sortbySelectList.contains(index)
                                ? const Color(0xffFFF0F2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _con.sortbySelectList.contains(index)
                                    ? AppColors.appColor
                                    : const Color(0xffEAECEF)),
                          ),
                          child: Text(
                            _con.sortbyList[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: _con.sortbySelectList.contains(index)
                                  ? AppColors.appColor
                                  : Colors.black,
                              fontWeight: _con.sortbySelectList.contains(index)
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              hSizedBox20,
              Text(
                AppString.filter,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox14,
              Column(
                children: List.generate(
                  _con.filterList.length,
                  (index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          _con.onFilter(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: _con.filterSelectList.contains(index)
                                ? const Color(0xffFFF0F2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _con.filterSelectList.contains(index)
                                    ? AppColors.appColor
                                    : const Color(0xffEAECEF)),
                          ),
                          child: Text(
                            _con.filterList[index],
                            style: TextStyle(
                                color: _con.filterSelectList.contains(index)
                                    ? AppColors.appColor
                                    : Colors.black,
                                fontWeight:
                                    _con.filterSelectList.contains(index)
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              hSizedBox20,
              Text(
                AppString.price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox14,
              Obx(
                () => Column(
                  children: [
                    RangeSlider(
                      min: 0,
                      max: 600,
                      divisions: 600,
                      labels: RangeLabels(
                        " \$ ${_con.currentRangeValues.value.start.round().toString()}",
                        "\$ ${_con.currentRangeValues.value.end.round().toString()}",
                      ),
                      activeColor: AppColors.appColor,
                      inactiveColor: const Color(0xffEFEFF4),
                      values: _con.currentRangeValues.value,
                      onChanged: (RangeValues value) {
                        _con.currentRangeValues.value = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " \$ ${_con.currentRangeValues.value.start.round().toString()}",
                          style: const TextStyle(color: Color(0xff8E8E8E)),
                        ),
                        Text(
                          " \$ ${_con.currentRangeValues.value.end.round().toString()}",
                          style: const TextStyle(color: Color(0xff8E8E8E)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              hSizedBox30,
            ],
          ),
        ),
      ),
    );
  }
}
