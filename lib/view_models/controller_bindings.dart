import 'package:get/get.dart';

import 'app_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
