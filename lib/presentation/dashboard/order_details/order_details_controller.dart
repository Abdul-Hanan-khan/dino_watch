import 'package:watch_app/core/app_export.dart';
import 'package:watch_app/model/order_detials_model.dart';
import 'package:watch_app/services/http_service.dart';

class OrderDetailsController extends GetxController {

  bool activePending=false;
  bool activeProcessing=false;
  bool activeCompleted=false;
  int currentStep=0;

  OrderDetailsController();

  OrderDetailsModel orderDetailsModel = OrderDetailsModel();

  RxBool loading = false.obs;

  checkStatus(){
    if(orderDetailsModel.order!.status== "pending"){
      activePending=true;
      activeProcessing=false;
      activeCompleted=false;

      currentStep=0;
    }else if(orderDetailsModel.order!.status== "processing"){
      activePending=true;
      activeProcessing=true;
      activeCompleted=false;
      currentStep=1;
    }else{
      activeProcessing=true;
      activePending=true;
      activeCompleted=true;
      currentStep=2;
    }
  }



  void loadOrderDetails(String orderId) async {
    loading.value = true;
    orderDetailsModel = (await HttpService.loadOrderDetails(orderId))!;
if(!orderDetailsModel.order.isNull){
  checkStatus();
}

    loading.value = false;
  }
}
