import 'package:flutter/material.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/dashboard/all_brands/all_brands_controller.dart';
import 'package:watch_app/presentation/dashboard/all_brands/products_by_brands_screen.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/app_string.dart';

class AllBrandsScreen extends StatelessWidget {
  var brandsController = Get.put(AllBrandsController());

  AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: AppString.allBrands,
        back: true,
        actionIcon: true,
      ),
      body: Obx(() => brandsController.loadingAllBrands.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: brandsController.allBrandsM.value.brandlist!.length,
                  itemBuilder: (context, index) {

                return Card(
                  child: GestureDetector(
                    onTap: (){
                      brandsController.getProductsByBrand(brandsController.allBrandsM.value.brandlist![index].termId.toString());
                      Get.to(ProductsByBrandScreen());
                    },
                    child: ListTile(
                      title: Text(brandsController.allBrandsM.value.brandlist![index].name.toString()),
                    ),
                  ),
                );
              }),
            )),
    );
  }
}
