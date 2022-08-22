import 'package:flutter/material.dart';

import '../../core/app_export.dart';

Widget searchBox({TextEditingController? controller, required String hint}) {
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
        // suffixIcon: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     ImageConstant.close,
        //     color: Colors.black.withOpacity(.35),
        //   ),
        // ),

        focusedBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    ),
  );
}
