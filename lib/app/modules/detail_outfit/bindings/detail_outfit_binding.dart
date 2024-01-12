import 'package:get/get.dart';

import '../controllers/detail_outfit_controller.dart';

class DetailOutfitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOutfitController>(
      () => DetailOutfitController(),
    );
  }
}
