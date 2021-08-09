import 'package:filemanager/controllers/content-controller/image_controller.dart';
import 'package:get/instance_manager.dart';

class ContentControllerBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageController());
  }
}
