import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:get/instance_manager.dart';

class BindingStorageController implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StorageController());
  }
}
