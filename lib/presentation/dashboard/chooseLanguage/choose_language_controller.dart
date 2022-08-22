import 'package:get/get.dart';

class ChooseLanguageController extends GetxController {
  // RxInt isSelectlan = 0.obs;

  RxBool isfree = true.obs;

  RxList isSelectlan = [].obs;
  onFav(int index) {
    isSelectlan.elementAt(index);
  }
}
