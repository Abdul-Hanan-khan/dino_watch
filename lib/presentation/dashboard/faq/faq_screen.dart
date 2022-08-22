import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/expansion.dart';

import 'faq_controller.dart';

class FAQscreen extends StatelessWidget {
  FAQscreen({Key? key}) : super(key: key);
  final FAQController _con = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.faq,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSizedBox16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                AppString.fs,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            hSizedBox16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                AppString.fsdetails,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xff8D8D8D),
                  fontSize: 14,
                ),
              ),
            ),
            hSizedBox20,
            support(
              icon: ImageConstant.website,
              text: AppString.website,
            ),
            hSizedBox20,
            support(
              icon: ImageConstant.emailus,
              text: AppString.emailUs,
            ),
            hSizedBox20,
            support(
              icon: ImageConstant.terms,
              text: AppString.terms,
            ),
            hSizedBox36,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xffCCCCCC),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset(
                      ImageConstant.searchbox,
                      height: 20,
                      color: const Color(0xff707070),
                    ),
                    onPressed: () {},
                  ),
                  Flexible(
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w500),
                        isDense: true,
                        labelStyle: TextStyle(color: AppColors.appIconColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            hSizedBox8,
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _con.faqList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => InkWell(
                    onTap: () {
                      if (_con.isselect.contains(index)) {
                        _con.isselect.remove(index);
                      } else {
                        _con.isselect.add(index);
                      }
                    },
                    borderRadius: BorderRadius.circular(0),
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10.0,
                                  spreadRadius: .5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: Get.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _con.faqList[index]["title"],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                _con.isselect.contains(index)
                                    ? const Icon(
                                        Icons.expand_less,
                                        color: Color(0xff8D8D8D),
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.expand_more,
                                        color: Color(0xff8D8D8D),
                                        size: 30,
                                      ),
                              ],
                            ),
                          ),
                          ExpandedSection(
                            expand: _con.isselect.contains(index),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10.0,
                                    spreadRadius: .5,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  _con.faqList[index]["dics"],
                                  style: const TextStyle(
                                    height: 1.6,
                                    color: Color(0xff8D8D8D),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            hSizedBox10,
          ],
        ),
      ),
    );
  }

  Widget support({
    required String text,
    required String icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xffFFF2DD),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
            ),
          ),
          wSizedBox20,
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff414141),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
