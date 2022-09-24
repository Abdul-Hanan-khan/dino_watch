import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/main.dart';
import 'package:watch_app/presentation/dashboard/all_brands/all_brands_screen.dart';
import 'package:watch_app/presentation/dashboard/favorite/favorite_screen.dart';
import 'package:watch_app/presentation/dashboard/home/home_controller.dart';
import 'package:watch_app/presentation/dashboard/home/home_screen.dart';
import 'package:watch_app/presentation/dashboard/profile/profile_screen.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_screen.dart';

import '../commamn/app_bar.dart';
import '../commamn/app_dialog.dart';
import '../dashboard/editProfile/edit_profile_controller.dart';
import 'bottombar_controller.dart';

import '../../core/app_export.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final ProfileEditController _editprofilecon =
      Get.put(ProfileEditController());
  ShoppingCartController cartController = Get.find();
  HomeController homeController=Get.find();
  final BottomBarController _con = Get.find();

  // sdf

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: drawerOpen(),
        key: _con.scaffoldKey,
        appBar: _con.pageIndex.value == 0
            ? appBar(
                text: "",
                leadingPressed: () {
                  _con.openDrawer();
                },
                back: false,
                actionIcon: true,
                action: ImageConstant.scan,
                search: true,
              )
            : _con.pageIndex.value == 1
                ? appBar(
                    text: AppString.shoppingCart,
                    back: false,
                    actionIcon: true,
                    leadingPressed: () {
                      _con.openDrawer();
                    },
                  )
                : _con.pageIndex.value == 2
                    ? appBar(
                        text: AppString.favorite,
                        back: false,
                        actionIcon: true,
                        leadingPressed: () {
                          _con.openDrawer();
                        },
                      )
                    : appBar(
                        actionPressed: () {
                          Get.toNamed(AppRoutes.editProfileScreen);
                        },
                        backgroundColor: AppColors.appColor,
                        action: ImageConstant.editprofile,
                        text: AppString.profile,
                        back: false,
                        actionIcon: true,
                        leadingPressed: () {
                          _con.openDrawer();
                        },
                      ),
        body: _con.pageIndex.value == 0
            ? HomeScreen()
            : _con.pageIndex.value == 1
                ? ShoppingCartScreen()
                : _con.pageIndex.value == 2
                    ? FavoriteScreen()
                    : _con.pageIndex.value == 3
                        ? ProfileScreen()
                        : HomeScreen(),
        bottomNavigationBar: bottombar(),
      ),
    );
  }

  bottombar() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0.5, 0.6),
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _con.icons.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _con.pageIndex.value == index
                        ? AppColors.backgroundColor
                        : null,
                  ),
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () => _con.onTap(index),
                        icon: Image.asset(
                          _con.icons[index],
                          color: _con.pageIndex.value == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      index == 1 && cartController.cart.products!.value.length>0 // at cart logic
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20)),
                                child:  Center(
                                  child: Text(
                                    '${cartController.cart.products!.length}',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      index == 2 && homeController.favouriteList.length>0 // at cart logic
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20)),
                                child:  Center(
                                  child: Text(
                                    '${homeController.favouriteList.length}',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerOpen() {
    return Drawer(
      backgroundColor: AppColors.appColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.1),
                Center(
                  child: Container(
                    height: Get.height * .15,
                    width: Get.height * .15,
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      ImageConstant.watchLogo,
                    ),
                  ),
                ),
                hSizedBox36,
                const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
                hSizedBox36,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _con.drawerList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _con.drawerIndex.value = index;
                        _con.drawerIndex.value == 0
                            ? Get.toNamed(AppRoutes.orderSummaryScreen)
                            : _con.drawerIndex.value == 1
                                ? Get.toNamed(AppRoutes.inviteFriendScreen)
                                : _con.drawerIndex.value == 2
                                    ? Get.toNamed(AppRoutes.paymentScreen)
                                    : _con.drawerIndex.value == 3
                                        ? Get.to(const AllBrandsScreen())
                                        : _con.drawerIndex.value == 4
                                            // ? Get.toNamed(AppRoutes.faqscreen)
                                            ? StaticVars.customLauncher(Uri.parse(
                                                'https://dannidion.com/frequently-asked-questions/'))
                                            : _con.drawerIndex.value == 5
                                                ? Platform.isIOS
                                                    ? showDialog(
                                                        barrierColor:
                                                            const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.76),
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return CupertinoAlertDialog(
                                                            title: Text(
                                                              AppString.logout,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            content: Text(
                                                              AppString
                                                                  .surelogout,
                                                            ),
                                                            actions: <Widget>[
                                                              CupertinoDialogAction(
                                                                isDefaultAction:
                                                                    true,
                                                                child: Text(
                                                                  AppString
                                                                      .cancel,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                onPressed: () =>
                                                                    Get.back(),
                                                              ),
                                                              CupertinoDialogAction(
                                                                  child: Text(
                                                                    AppString
                                                                        .logout,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    SharedPreferences
                                                                        prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    prefs.setBool(
                                                                        'loginStatus',
                                                                        false);
                                                                    userLoginStatus =
                                                                        false;
                                                                    Get.offAllNamed(
                                                                      AppRoutes
                                                                          .loginScreen,
                                                                    );
                                                                  })
                                                            ],
                                                          );
                                                        })
                                                    : logoutDialog(
                                                        context: Get.context,
                                                        onTap: () async {
                                                          SharedPreferences
                                                              prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          prefs.setBool(
                                                              'loginStatus',
                                                              false);
                                                          userLoginStatus =
                                                              false;
                                                          prefs.setString(
                                                              'userId', '');
                                                          prefs.setString(
                                                              'userName', '');
                                                          prefs.setString(
                                                              'userEmail', '');
                                                          Get.offAllNamed(
                                                              AppRoutes
                                                                  .loginScreen);

                                                          StaticVars.userName =
                                                              '';
                                                          StaticVars.email = '';
                                                        },
                                                      )
                                                : null;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        child: Row(
                          children: [
                            Image.asset(
                              _con.drawerList[index].image,
                              height: 20,
                              width: 20,
                            ),
                            wSizedBox16,
                            Text(
                              _con.drawerList[index].title,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(StaticVars.avatar)),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                    wSizedBox20,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_editprofilecon.firstName.value} ${_editprofilecon.lastName.value} ",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          hSizedBox4,
                          Text(
                            '${StaticVars.email}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                hSizedBox30,
              ],
            ),
          ),
          Positioned(
            left: Get.width * 0.69,
            top: Get.height * 0.04,
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.appColor,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  ImageConstant.cross,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
