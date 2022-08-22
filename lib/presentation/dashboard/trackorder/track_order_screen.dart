import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';

import 'track_order_controller.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({Key? key}) : super(key: key);
  final TrackOrderController _con = Get.put(TrackOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: appBar(
        leadingPressed: () {
          Get.offAndToNamed(AppRoutes.bottomBarScreen);
        },
        backgroundColor: Colors.transparent,
        text: AppString.trackOrder,
        back: true,
        actionIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height / 2,
                  color: Colors.grey.shade200,
                  child: Obx(
                    () => _con.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : GoogleMap(
                            onCameraMove: (position) {},
                            markers: _con.markers,
                            mapType: _con.currentMapType,
                            onMapCreated: _con.onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                _con.locationData!.latitude!,
                                _con.locationData!.longitude!,
                              ),
                              zoom: 11,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.parcel,
                          height: 60,
                          width: 60,
                        ),
                        wSizedBox10,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Order Id -  DEL015789564",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              hSizedBox2,
                              const Text(
                                "24-07-2021 05:25PM",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              hSizedBox4,
                              const Text(
                                "Expected Delivery July 29",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * .08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageConstant.distance,
                          height: 110,
                        ),
                        wSizedBox14,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.pickuppoint,
                                style: const TextStyle(
                                  color: Color(0xff6C6C6C),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              hSizedBox6,
                              const Text(
                                "367 Rainbow Drive, United States",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              hSizedBox4,
                              const Divider(
                                color: Color(0xffD2D2D2),
                              ),
                              hSizedBox4,
                              Text(
                                AppString.deliverypoint,
                                style: const TextStyle(
                                  color: Color(0xff6C6C6C),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              hSizedBox6,
                              const Text(
                                "1439 Pearlman Avenue, United States",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  hSizedBox20,
                  Text(
                    AppString.deliveryinfo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  hSizedBox12,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(ImageConstant.intro3),
                          ),
                        ),
                      ),
                      wSizedBox14,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jeffrey Keenan ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            hSizedBox4,
                            const StarRating(
                              rating: 4,
                              size: 14,
                            ),
                            hSizedBox4,
                            const Text(
                              "5+ Years Experience",
                              style: TextStyle(
                                color: Color(0xffAAAAAA),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(ImageConstant.calling),
                      ),
                      wSizedBox8,
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: AppColors.appColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(ImageConstant.chamsgt),
                      ),
                    ],
                  ),
                  hSizedBox20,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
