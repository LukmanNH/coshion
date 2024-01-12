import 'package:get/get.dart';

import '../controllers/on_progress_controller.dart';

class OnProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnProgressController>(
      () => OnProgressController(),
    );
  }
}
