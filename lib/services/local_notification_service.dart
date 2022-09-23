
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:(id, title, body, payload) {
        print('notification is received ');

      },
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        iOS: initializationSettingsIOS,
        android: const AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String? route) async{
      if(route != null){
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  static void display(RemoteMessage message) async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;


      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "VultureApp",
          "Vulture channel",
          // color: const Color.fromARGB(255, 255, 0, 0),
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS:   IOSNotificationDetails(
          presentAlert: true,  // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
          presentBadge: true,  // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
          presentSound: true,  // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
          sound: 'assets/sound/iphone_notification.mp3',  // Specifics the file path to play (only from iOS 10 onwards)
          badgeNumber: 1, // The application's icon badge number
          // attachments: List<IOSNotificationAttachment>?, (only from iOS 10 onwards)
          subtitle: 'fucking notifications', //Secondary description  (only from iOS 10 onwards)
          // threadIdentifier: String? (only from iOS 10 onwards)
        ),

      );


      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}