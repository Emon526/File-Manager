import 'package:disk_space/disk_space.dart';
import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/config/permission_settings.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  bool? isPermit;

  final FileManagerController fileManagerController = FileManagerController();

  double? _totalSpace;
  double? _freeSpace;
  double? _usedSpace;
  // initailizing permission
  @override
  void onInit() {
    super.onInit();
    _getPermission();
    fetchStorageSpace();
  }

  // request for storage permission
  _getPermission() async {
    isPermit = await PermissionSettings.promptPermissionSetting();
    update();
  }

  // fetch device storage space
  void fetchStorageSpace() async {
    try {
      _totalSpace = await DiskSpace.getTotalDiskSpace;
      _freeSpace = await DiskSpace.getFreeDiskSpace;
      _usedSpace = (_totalSpace! - _freeSpace!);

      update();
    } catch (e) {
      _totalSpace = 0;
      _freeSpace = 0;
      _usedSpace = 0;
      update();
    }
  }

  // get free space
  double? getFreeSpace() {
    return (_freeSpace! / 1024).toPrecision(2);
  }

  // get used space
  double? getUsedSpace() {
    return (_usedSpace! / 1024).toPrecision(2);
  }

  // get used space in percentage
  int getUsedSpacePercent(){
    return ((_usedSpace! / _totalSpace!) * 100).toInt();
  }

  //
}
