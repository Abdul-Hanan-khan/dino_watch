import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/core/static/static_vars.dart';
import 'package:watch_app/model/my_orders_model.dart';
import 'package:watch_app/presentation/auth/login/login_controller.dart';
import 'package:watch_app/services/http_service.dart';

class MyOrderController extends GetxController {

  Rx<MyOrdersModel> allOrders=MyOrdersModel().obs;
  RxBool loadingOrders=false.obs;
  LoginScreenController loginCon=Get.find();
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOrder();
    // getAllBrands();
  }

  void getAllOrder()async{
    loadingOrders.value=true;
    allOrders.value= (await HttpService.getAllOrders(loginCon.user.value.userId.toString()))!;
    print(allOrders.value);
    loadingOrders.value=false;

  }
  //
  // RxList<MyOrder> myorderList = RxList([
  //   MyOrder(
  //     price: 250,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Amazfit GTS2 Mini gold Smart Watch ",
  //   ),
  //   MyOrder(
  //     price: 350,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Richard Mille RM 72-01 Automatic Lifestyle Chronograph watch",
  //   ),
  //   MyOrder(
  //     price: 299,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Amazfit GTS2 Mini gold Smart Watch ",
  //   ),
  //   MyOrder(
  //     price: 455,
  //     quantity: 1.obs,
  //     wimage: ImageConstant.intro3,
  //     wname: "Swatch Big Brand Chrono BIOCERAMIC watch",
  //   )
  // ]);

  // double subTotal() {
  //   RxDouble? total = 0.0.obs;
  //   for (int i = 0; i < myorderList.length; i++) {
  //     total.value += myorderList[i].price * myorderList[i].quantity.value;
  //   }
  //   return total.value;
  // }
}

// class MyOrder {
//   String wimage;
//   String wname;
//   int price;
//   RxInt quantity;
//
//   MyOrder({
//     required this.price,
//     required this.quantity,
//     required this.wimage,
//     required this.wname,
//   });
// }
