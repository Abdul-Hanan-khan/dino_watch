import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/model/products_by_brand.dart';
import 'package:watch_app/services/http_service.dart';

class AllBrandsController extends GetxController {

  RxBool loadingAllBrands =false.obs;
  RxBool loadingProductByBrand =false.obs;
  RxList isFavdiscount = [].obs;

  Rx<AllBrands> allBrandsM = AllBrands().obs;
  Rx<ProductByBrand> prodByBrandM = ProductByBrand().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBrands();
  }

  onFavdiscount(int index) {
    if (isFavdiscount.contains(index)) {
      isFavdiscount.remove(index);
    } else {
      isFavdiscount.add(index);
    }
  }

  RxList isFavtrending = [].obs;

  onFavtrending(int index) {
    if (isFavtrending.contains(index)) {
      isFavtrending.remove(index);
    } else {
      isFavtrending.add(index);
    }
  }

  getAllBrands()async{
    loadingAllBrands.value=true;
    allBrandsM.value =(await HttpService.getAllBrands())!;
    loadingAllBrands.value=false;





    // Map<String, dynamic> tempMap=({
    //
    // });
    // String tempChar="${brandsController.allBrandsM.value.brandlist![index].name![0]}";
    // List<Brandlist> tempList=<Brandlist>[];
    // for (var element in brandsController.allBrandsM.value.brandlist!) {
    //   if(element.name![0]==tempChar){
    //     tempList.add(element);
    //   }
    // }
    //









  }
  getProductsByBrand(String termId)async{
    loadingProductByBrand.value=true;
    prodByBrandM.value =(await HttpService.getProductsByBrand(termId))!;
    loadingProductByBrand.value=false;

  }





}
