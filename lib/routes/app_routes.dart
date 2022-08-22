import 'package:get/get.dart';
import 'package:watch_app/presentation/dashboard/addnewcard/add_new_card_screen.dart';

import '../presentation/auth/changepassword/change_password_screen.dart';
import '../presentation/auth/createnewpassword/create_new_password_screen.dart';
import '../presentation/auth/forgotPassword/forgot_password_screen.dart';
import '../presentation/auth/intro/intro_screen.dart';
import '../presentation/auth/login/login_screen.dart';
import '../presentation/auth/signup/signup_screen.dart';
import '../presentation/auth/splash/splash_screen.dart';
import '../presentation/auth/verifyYourEmail/verify_your_email_screen.dart';
import '../presentation/bottomBar/bottombar_screen.dart';
import '../presentation/dashboard/checkout/checkout_screen.dart';
import '../presentation/dashboard/chooseLanguage/choose_language_screen.dart';
import '../presentation/dashboard/contact_us/contact_us_screen.dart';
import '../presentation/dashboard/editProfile/edit_profile_screen.dart';
import '../presentation/dashboard/faq/faq_screen.dart';
import '../presentation/dashboard/filter/filter_screen.dart';
import '../presentation/dashboard/invite_friend/invite_friend_screen.dart';
import '../presentation/dashboard/my_orders/my_orders_screen.dart';
import '../presentation/dashboard/notification/notification_screen.dart';
import '../presentation/dashboard/order_summary/order_summary_screen.dart';
import '../presentation/dashboard/payment/payment_screen.dart';
import '../presentation/dashboard/privacypolicy/privacy_policy_screen.dart';
import '../presentation/dashboard/reviews/reviews_screen.dart';
import '../presentation/dashboard/search/search_screen.dart';
import '../presentation/dashboard/see_more/see_more_screen.dart';
import '../presentation/dashboard/setting/settings.dart';
import '../presentation/dashboard/successfully/successfully_screen.dart';
import '../presentation/dashboard/termsconditions/terms_conditions_screen.dart';
import '../presentation/dashboard/trackorder/track_order_screen.dart';
import '../presentation/dashboard/watch_details/watch_details_screen.dart';

class AppRoutes {
  static String introductionscreen = '/introductionscreen';
  static String loginScreen = '/loginScreen';
  static String signupScreen = '/signupScreen';
  static String forgotPasswordScreen = '/forgotPasswordScreen';
  static String verifyYourEmailScreen = '/verifyYourEmailScreen';
  static String createNewPasswordScreen = '/createNewPasswordScreen';
  static String changePasswordScreen = '/changePasswordScreen';
  static String bottomBarScreen = '/bottomBarScreen';
  static String watchDetailScreen = '/watchDetailScreen';
  static String seeMoreScreen = '/seeMoreScreen';
  static String searchScreen = '/searchScreen';
  static String checkoutScreen = '/checkoutScreen';
  static String orderSummaryScreen = '/orderSummaryScreen';
  static String paymentScreen = '/paymentScreen';
  static String successfullyScreen = '/successfullyScreen';
  static String addNewCardScreen = '/addNewCardScreen';
  static String editProfileScreen = '/editProfileScreen';
  static String notificationScreen = '/notificationScreen';
  static String reviewsScreen = '/reviewsScreen';
  static String chooseLanguageScreen = '/chooseLanguageScreen';
  static String myOrdersScreen = '/myOrdersScreen';
  static String faqscreen = '/faqscreen';
  static String contactUsScreen = '/contactUsScreen';
  static String inviteFriendScreen = '/inviteFriendScreen';
  static String termsConditionsScreen = '/termsConditionsScreen';
  static String privacyPolicyScreen = '/privacyPolicyScreen';
  static String settingScreen = '/settingScreen';
  static String filterScreen = '/filterScreen';
  static String trackOrderScreen = '/trackOrderScreen';
  static String splashScreen = '/splashScreen';

  static List<GetPage> pages = [
    GetPage(name: introductionscreen, page: () => IntroScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signupScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyYourEmailScreen, page: () => VerifyYourEmailScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(
        name: createNewPasswordScreen, page: () => CreateNewPasswordScreen()),
    GetPage(name: bottomBarScreen, page: () => BottomBarScreen()),
    GetPage(name: watchDetailScreen, page: () => WatchDetailScreen()),
    GetPage(name: seeMoreScreen, page: () => SeeMoreScreen()),
    GetPage(name: searchScreen, page: () => SearchScreen()),
    GetPage(name: checkoutScreen, page: () => CheckoutScreen()),
    GetPage(name: orderSummaryScreen, page: () => OrderSummaryScreen()),
    GetPage(name: paymentScreen, page: () => PaymentScreen()),
    GetPage(name: successfullyScreen, page: () => const SuccessfullyScreen()),
    GetPage(name: addNewCardScreen, page: () => AddNewCardScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: reviewsScreen, page: () => ReviewsScreen()),
    GetPage(name: chooseLanguageScreen, page: () => ChooseLanguageScreen()),
    GetPage(name: myOrdersScreen, page: () => MyOrdersScreen()),
    GetPage(name: faqscreen, page: () => FAQscreen()),
    GetPage(name: contactUsScreen, page: () => ContactUsScreen()),
    GetPage(name: inviteFriendScreen, page: () => InviteFriendScreen()),
    GetPage(name: termsConditionsScreen, page: () => TermsConditionsScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(name: trackOrderScreen, page: () => TrackOrderScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];
}
