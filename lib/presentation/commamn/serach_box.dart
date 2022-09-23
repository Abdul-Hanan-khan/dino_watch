import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_app/model/search_model.dart';
import 'package:watch_app/presentation/dashboard/search/search_controller.dart';

import '../../core/app_export.dart';

Widget searchBox({TextEditingController? controller, required String hint}) {
  SearchController con=Get.find();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: const Color(0xffCCCCCC)),
    ),
    child: TextField(
      controller: controller,
      onSubmitted: (searchInfo) async {},
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(.35),
          fontSize: 15.0,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            ImageConstant.searchbox,
            color: Colors.black.withOpacity(.7),
          ),
        ),

        focusedBorder: InputBorder.none,
        border: InputBorder.none,
      ),
      onChanged: (value){
        // if(!value.isEmpty && value != "" && value.length > 1){
        //   print(value.length);
          con.performSearchWithApi(value);
        // }

      },
    ),
  );
}
