import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/order_detials_model.dart';
import 'package:watch_app/services/http_service.dart';

class OrderDetailsController extends GetxController {

  OrderDetailsController();

  OrderDetailsModel orderDetailsModel = OrderDetailsModel();

  RxBool loading = false.obs;



  void loadOrderDetails(String orderId) async {
    loading.value = true;
    orderDetailsModel = (await HttpService.loadOrderDetails(orderId))!;

    loading.value = false;
  }
}
