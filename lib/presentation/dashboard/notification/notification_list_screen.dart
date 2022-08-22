import 'package:flutter/material.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/presentation/dashboard/notification/notification_controller.dart';

class NotificationListScreen extends StatelessWidget {
  NotificationListScreen({Key? key}) : super(key: key);
  final Notificationcontroller _con = Get.put(Notificationcontroller());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) {
        return const Divider();
      },
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: _con.list.length,
      itemBuilder: (_, index) {
        final String dateString = _con.list[index]['time'];
        final DateTime date = DateTime.parse(dateString);
        final item = _con.list[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSizedBox10,
            Text(
              date.formatDate(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            hSizedBox10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color(0xffFFEED3)
                          : const Color(0xffFFE5E9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    item["dp"],
                    color: index % 2 == 0
                        ? AppColors.yellowColor
                        : AppColors.appColor,
                  ),
                ),
                wSizedBox16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item["type"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            date.formatTime(),
                            style: const TextStyle(
                                color: Color(0xff858585), fontSize: 13),
                          ),
                        ],
                      ),
                      hSizedBox6,
                      Text(
                        item["message"],
                        style: const TextStyle(
                            color: Color(0xff858585), fontSize: 14),
                      ),
                    ],
                  ),
                ),
                wSizedBox10,
              ],
            ),
            hSizedBox10,
          ],
        );
      },
    );
  }
}
