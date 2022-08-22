import 'package:watch_app/core/app_export.dart';

import 'package:intl/intl.dart';

class Notificationcontroller extends GetxController {
  RxList isselect = RxList([]);

  RxBool isNotification = false.obs;

  onAdd(int index) {
    if (isselect.contains(index)) {
      isselect.remove(index);
    } else {
      isselect.add(index);
    }
  }

  List permissionList = [
    {"text": "Nearby Favorite Stores"},
    {"text": "Exclusive Coupons & Rewards".tr},
    {"text": "Top Sale Offers ".tr},
    {"text": "Special Offers".tr},
  ];
  List<Map> list = [
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-17T10:29:35.000Z",
      "message": "Your order 2 Accent Chairs has been shipped!",
      "unRead": false
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-16T10:31:12.000Z",
      "message": "Special Big Sale up to 50% Off all product today?",
      "unRead": false
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-16T10:29:35.000Z",
      "message": "Your order 6 Alvarado Lounge Chair has been shipped!",
      "unRead": true
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-15T09:41:18.000Z",
      "message": "Adam Bosman accepted your friend request",
      "unRead": false
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-14T09:40:58.000Z",
      "message":
          "Kitchen Island Pros and Coins/ 10 Inspiring Empty - Nest Makeovers/ where to Save Money on a Land...",
      "unRead": false
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-14T09:40:58.000Z",
      "message": "Your order 20 Alvarado Lounge Chair has been shipped!",
      "unRead": true
    },
    {
      "type": "Your Appoinment is Booked",
      "dp": ImageConstant.appointmentbooked,
      "time": "2020-06-14T09:40:58.000Z",
      "message":
          "Kitchen Island Pros and Coins/ 10 Inspiring Empty - Nest Makeovers/ where to Save Money on a Land...",
      "unRead": false
    }
  ];
}

const String dateFormatter = 'dd-MM-yyyy';
const String timeFormatter = 'jm';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  String formatTime() {
    final formatter = DateFormat(timeFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
