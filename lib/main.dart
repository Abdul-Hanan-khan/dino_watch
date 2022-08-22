import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:watch_app/presentation/dashboard/checkout/checkout_controller.dart';
import 'package:watch_app/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LazyBinding().dependencies();
  runApp(const MyApp());
}

class LazyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
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
