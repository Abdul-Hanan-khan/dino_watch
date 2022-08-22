import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/serach_box.dart';
import 'package:watch_app/presentation/dashboard/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController _con = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.srch,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              searchBox(hint: AppString.search),
              hSizedBox10,
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.black.withOpacity(.4),
                        labelColor: Colors.black,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        controller: _con.tabController,
                        tabs: _con.tabbar,
                        indicatorWeight: 1.0,
                        isScrollable: false,
                      ),
                    ),
                    hSizedBox20,
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const ClampingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: const Color(0xff707070).withOpacity(.15),
                          thickness: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFAF2),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10.0,
                                    spreadRadius: .5,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                ImageConstant.search,
                                color: AppColors.yellowColor,
                              ),
                            ),
                            wSizedBox20,
                            const Text(
                              "Analog Watch",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              ImageConstant.close,
                              height: 15,
                              width: 15,
                            )
                          ],
                        );
                      },
                    ),
                    hSizedBox10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
