import 'package:filemanager/helpers/config/permission_settings.dart';
import 'package:get/get.dart';

class StorageController extends GetxController{
  bool? isPermit;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getPermission();
    
  }

  _getPermission() async{
    isPermit = await PermissionSettings.promptPermissionSetting();
    update();
    
  }
}