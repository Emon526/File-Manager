import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var isFirstTime = true.obs;
  final _getStorage = GetStorage();
  final storeKey = "isFirstTime";

  @override
  void onInit() {
    if (isUserFirstTime()) {
      isFirstTime = true.obs;
    } else {
      isFirstTime = false.obs;
    }
    super.onInit();
  }

  bool isUserFirstTime() {
    print("Get initaial Status");
    return _getStorage.read(storeKey) ?? false;
  }

  void saveUserStatus(bool status) {
    _getStorage.write(storeKey, status);
    print("Your old now");
  }
}
