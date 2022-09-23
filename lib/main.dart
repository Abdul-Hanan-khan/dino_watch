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
import 'core/utils/app_theme.dart';

bool? userLoginStatus;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class MyApp extends StatelessWidget {
  var carController = Get.put(ShoppingCartController());
  final HomeController bottomCtr = Get.put(HomeController());

  MyApp({Key? key}) : super(key: key);

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