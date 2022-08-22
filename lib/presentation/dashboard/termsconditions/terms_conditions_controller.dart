import '../../../core/app_export.dart';

class TermsConditionsController extends GetxController {
  RxBool isTC = false.obs;
  RxBool ispolicy = false.obs;
  RxString searchText = "".obs;
  RxBool isSearch = false.obs;
  RxBool isLoading = false.obs;
  RxBool noData = false.obs;
  // CategoryModel? categoryModel;
  List termsConditionList = [
    {
      "id": 1,
      "subTitle": "",
      "description":
          "Ut enim ad minima veniam, quis nostrum exercitation nem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fug iat quo voluptas nulla pariatur?",
    },
    {
      "id": 2,
      "subTitle": "",
      "description":
          "There are many variations of passages of Lorem available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    },
  ];
}
