import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final _getStor = GetStorage();
  String key = "userkey";
  var isOld = false.obs;

  @override
  void onInit() {
    //check user type
    if (isOldYser()) {
      isOld = true.obs;
      print("Old User");
    } else {
      isOld = false.obs;
      print("New User");
    }
    super.onInit();
  }

  bool isOldYser() {
    print("Read data");
    return _getStor.read("user") ?? false;
  }

  void saveolduser(bool isData) {
    _getStor.write("user", isData);
  }
}
