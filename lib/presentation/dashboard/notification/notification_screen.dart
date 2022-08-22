import 'package:flutter/material.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/app_button.dart';
import 'package:watch_app/presentation/dashboard/notification/notification_controller.dart';

import '../../../core/app_export.dart';
import 'notification_list_screen.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  final Notificationcontroller _con = Get.put(Notificationcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.notification,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => _con.isNotification.value == false
              ? notificationPermission()
              : NotificationListScreen(),
        ),
      ),
    );
  }

  Padding notificationPermission() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.notibg,
            height: 200,
            width: Get.width,
          ),
          hSizedBox20,
          Text(
            AppString.receiveNotifications,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          hSizedBox10,
          Text(
            AppString.notiinfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 14,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: List.generate(
                _con.permissionList.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      _con.onAdd(index);
                    },
                    child: Row(
                      children: [
                        Obx(
                          () => InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              if (_con.isselect.contains(index)) {
                                _con.isselect.remove(index);
                              } else {
                                _con.isselect.add(index);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              padding: const EdgeInsets.all(4),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.yellowColor,
                                  width: 2,
                                ),
                              ),
                              child: _con.isselect.contains(index)
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.yellowColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        wSizedBox16,
                        Text(
                          _con.permissionList[index]["text"],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff9B9999),
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          AppButton(
            width: Get.width * 0.55,
            text: AppString.turnNotificationOn,
            onPressed: () {
              _con.isNotification.value = true;
            },
          ),
          hSizedBox6,
          TextButton(
            onPressed: () {},
            child: Text(
              AppString.skipsthisnow,
              style: const TextStyle(
                  color: Color(0xff4F4E4E), fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
