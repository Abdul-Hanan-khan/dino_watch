import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/presentation/commamn/app_bar.dart';
import 'package:watch_app/presentation/dashboard/all_brands/all_brands_controller.dart';
import 'package:watch_app/presentation/dashboard/all_brands/products_by_brands_screen.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/app_string.dart';
var brandsController = Get.put(AllBrandsController());

class AllBrandsScreen extends StatelessWidget {

  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor:AppColors.secondaryColor,
        elevation: 0,
        leading: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                constraints: const BoxConstraints(),
                icon: Image.asset(
                 ImageConstant.back,
                  color:
                       Colors.black,
                  height: 18,
                ),
                onPressed: () {
                      Get.back();
                    },
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: (){
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
            );
          },
          child: Text(
            AppString.allBrands,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                    onPressed: () {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate()
                      );
                    },
                    icon: const Icon(Icons.search,color: Colors.black,),
                  ),
          )
        ],
      ),
      body: Obx(() => brandsController.loadingAllBrands.value
          ? const Center(
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

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var brand in brandsController.allBrandsM.value.brandlist!) {
      if (brand.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(brand.name!);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return GestureDetector(
          onTap: (){
            int index= brandsController.allBrandsM.value.brandlist!.indexWhere((element) => element.name == result);
            brandsController.getProductsByBrand(brandsController.allBrandsM.value.brandlist![index].termId.toString());
            Get.to(ProductsByBrandScreen());
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var brand in  brandsController.allBrandsM.value.brandlist!) {
      if (brand.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(brand.name!);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return GestureDetector(
          onTap: (){
            int index= brandsController.allBrandsM.value.brandlist!.indexWhere((element) => element.name == result);
            brandsController.getProductsByBrand(brandsController.allBrandsM.value.brandlist![index].termId.toString());
            Get.to(ProductsByBrandScreen());
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}

