import 'package:watch_app/core/app_export.dart';

class PrivacyPolicyController extends GetxController {
  RxList isagree = [].obs;
  RxBool save = false.obs;
  onFav(int index) {
    if (isagree.contains(index)) {
      isagree.remove(index);
    } else {
      isagree.add(index);
    }
  }
}
