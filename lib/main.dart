import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/presentation/bottomBar/bottombar_controller.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_app/services/local_notification_service.dart';
import 'core/utils/app_theme.dart';

bool? userLoginStatus;
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  });
  LazyBinding().dependencies();
  runApp(MyApp());
  getLoginStatus();


  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

}

getLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userLoginStatus = prefs.getBool('loginStatus') ?? false;
  print(userLoginStatus);
}

class LazyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomBarController());
  }
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var carController = Get.put(ShoppingCartController());

  final HomeController bottomCtr = Get.put(HomeController());

  @override
  void initState() {


    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      // final routeSetting = value!.data['route'];
      // print(routeSetting);
      LocalNotificationService.display(value!);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage()));
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("received");
      if (event.notification != null) {
        print(event.notification!.body);
        print(event.notification!.title);
      }
      LocalNotificationService.display(event);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final routeSetting = event.data["route"];
      print(routeSetting);
      LocalNotificationService.display(event);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage()));
    });

    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      theme: AppTheme.themeData,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        // MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}