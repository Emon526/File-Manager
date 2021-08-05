import 'dart:io';

import 'package:disk_space/disk_space.dart';
import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/config/permission_settings.dart';
import 'package:filemanager/helpers/config/pie_chart_paint.dart';
import 'package:filemanager/screens/storage/folder_inner.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  final FileManagerController fileManagerController = FileManagerController();

  var _totalSpace;
  var _freeSpace;
  var _usedSpace;

  var allPath;
  var audioPath;
  var videoPath;
  var imagePath;
  var documentsPath;
  var downloadPath;
  var appsPath;
  var archivesPath;

  // observable variables
  var isPermit = false.obs;
  var totalSpace = 0.0.obs;
  var freeSpace = 0.0.obs;
  var usedSpace = 0.0.obs;
  var spacePercentage = 0.obs;
  RxList<Directory> storageList = RxList<Directory>();
  RxList<Directory> publicFolders = RxList<Directory>();
  Rx<Directory> selectedStorage = Directory("/storage/emulated/0").obs;

  // initailizing permission
  @override
  void onInit() {
    super.onInit();
    _getPermission();
    fetchStorageSpace();
    fetchStorageList();
    setFilePath();
    print("Init selecstoreag: $selectedStorage");
  }

  // request for storage permission
  _getPermission() async {
    isPermit((await PermissionSettings.promptPermissionSetting()));
  }

// ************************** Storage operation ***************************

  // fetch device storage space
  void fetchStorageSpace() async {
    try {
      _totalSpace = await DiskSpace.getTotalDiskSpace;
      _freeSpace = await DiskSpace.getFreeDiskSpace;
      _usedSpace = (_totalSpace! - _freeSpace!);

      freeSpace((_freeSpace! / 1024));
      usedSpace((_usedSpace! / 1024));

      spacePercentage(((_usedSpace! / _totalSpace!) * 100).toInt());
    } catch (e) {
      print("Error at: $e");
    }
  }

  // paint pie chart
  PieChartPaint paintPieChart() {
    return PieChartPaint(usedSpace.toDouble(), freeSpace.toDouble(), 40.0);
  }

// ************************** File Operation *******************************
  // fetch storage list
  void fetchStorageList() async {
    storageList.value = await FileManager.getStorageList();

    selectedStorage.value = storageList.first;
  }

  // set storage
  setSelectedStorage(entity) {
    selectedStorage.value = entity;
    print("Current: ${selectedStorage.value}");
    setFilePath();
  }

  // seperate storage base name
  String getStorageName(entity) {
    return FileManager.basename(entity) == '0'
        ? "Internal Storage"
        : "External Storage";
  }

  // file path set
  void setFilePath() {
    allPath = selectedStorage.value.path;
    audioPath = selectedStorage.value.path + '/Music';
    videoPath = selectedStorage.value.path + '/Movies';
    imagePath = selectedStorage.value.path + '/Pictures';
    documentsPath = selectedStorage.value.path + '/Documents';
    downloadPath = selectedStorage.value.path + '/Download';
    appsPath = selectedStorage.value.path + '/Download';
    archivesPath = selectedStorage.value.path + '/Download';
  }

  // image folder
  navigatePage(String path) {
    Get.to(
      FolderInner(
        folderPath: Directory(path),
        baseStorage: selectedStorage.value,
      ),
    );
  }

  // image folder
  imagesFolder() {
    
    navigatePage(imagePath);
  }

  // video folder
  videoFolder() {
    navigatePage(videoPath);
  }

  // documents folder
  documentsFolder() {
    navigatePage(documentsPath);
  }

  // audio folder
  audioFolder() {
    navigatePage(audioPath);
  }

  // apps folder
  appsFolder() {
    navigatePage(appsPath);
  }

  // archives folder
  archivesFolder() {
    navigatePage(archivesPath);
  }

  // download folder
  downloadFolder() {
    navigatePage(downloadPath);
  }

  // all folder
  allFolder() {
    navigatePage(allPath);
  }
}
