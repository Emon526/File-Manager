import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/config/permission_settings.dart';
import 'package:get/get.dart';

class StorageController extends GetxController{
  bool? isPermit;

  final FileManagerController fileManagerController = FileManagerController();

  // initailizing permission 
  @override
  void onInit() {
    super.onInit();
    _getPermission();
    
  }

  // request for storage permission
  _getPermission() async{
    isPermit = await PermissionSettings.promptPermissionSetting();
    update();
    
  }

  // fetch device storage space
  List<double> fetchStorageSpace(){
    return [12, 45];
  }

  // 
}