import 'package:coshion/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PageIndexController extends GetxController {
  //TODO: Implement PageIndexController
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    pageIndex.value = i;
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.CART);
        break;
      case 2:
        Get.offAllNamed(Routes.ON_PROGRESS);
        break;
      case 3:
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }
}
