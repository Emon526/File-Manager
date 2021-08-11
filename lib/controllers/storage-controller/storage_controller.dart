import 'dart:io';

import 'package:disk_space/disk_space.dart';
import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/config/permission_settings.dart';
import 'package:filemanager/helpers/config/pie_chart_paint.dart';
import 'package:filemanager/models/recent_model.dart';
import 'package:filemanager/screens/storage/folder_inner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final FileManagerController fileManagerController = FileManagerController();

  var _totalSpace;
  var _freeSpace;
  var _usedSpace;

  var allPath;
  var downloadPath;

  // observable variables
  var isPermit = false.obs;
  var totalSpace = 0.0.obs;
  var freeSpace = 0.0.obs;
  var usedSpace = 0.0.obs;
  var spacePercentage = 0.obs;
  RxList<Directory> storageList = RxList<Directory>();
  RxList<Directory> publicFolders = RxList<Directory>();
  Rx<Directory> selectedStorage = Directory("/storage/emulated/0").obs;
  var _openResult = "unknown".obs;

  var appExtention = ['apk'];
  var archievesExtention = ['zip', 'rar'];
  var imageExtention = ['jpg', 'png', 'jpeg', 'webp', 'gif'];
  var videoExtention = ['mp4', 'mov', 'mkv', 'avi', 'webm'];
  var audioExtention = [
    'mp3',
    '3ga',
    '3gpp',
    'aa',
    'aa3',
    'aac',
    'aax',
    'amr',
    'm4a',
    'mpc',
    'wav',
    'wma',
    'webm',
    'wv'
  ];
  var docExtention = [
    'pdf',
    'doc',
    'docx',
    'odt',
    'xls',
    'xlsx',
    'ods',
    'ppt',
    'pptx',
    'txt'
  ];

  //recent file
  var recentList = <RecentModel>[];
  final box = GetStorage();
  final _getStorage = GetStorage();
  Map storageLis = {};

  //theming
  var isDarkTheme = false.obs;
  final themeStorage = GetStorage();

  // initailizing permission
  @override
  void onInit() {
    super.onInit();
    _getPermission();
    fetchStorageSpace();
    fetchStorageList();
    setFilePath();
    print("Init selecstoreag: $selectedStorage");

    //recent file call
    if (isDataAvailable()) {
      print("Yes recent data  available");
      restoreTasks();
    } else {
      print("recent data not available");
    }

    // theming call
    if (isSavedDark()) {
      isDarkTheme = true.obs;
      print("Dark Mode");
    } else {
      isDarkTheme = false.obs;
      print("light Mode");
    }
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
    downloadPath = selectedStorage.value.path + '/Download';
  }

  // opening a file on other app
  Future<void> openFileWithDefaultApp(FileSystemEntity fileSystemEntity) async {
    print("THis is: ${fileSystemEntity.path}");
    String filePath = fileSystemEntity.path;
    OpenResult _result = await OpenFile.open(filePath);

    print("Result message: " + _result.message);
    _openResult.value = "type=${_result.type}  message=${_result.message}";

    RecentModel recentModel =
        RecentModel(key: UniqueKey().toString(), path: filePath);
    addAndStoreTask(recentModel);
    
  }

  // get file extension
  String getFileExtention(FileSystemEntity fileSystemEntity) {
    String fileExtention =
        fileSystemEntity.path.split('/').last.split('.').last.toLowerCase();
    if (appExtention.contains(fileExtention)) {
      return "app";
    } else if (imageExtention.contains(fileExtention)) {
      return "image";
    } else if (videoExtention.contains(fileExtention)) {
      return "video";
    } else if (docExtention.contains(fileExtention)) {
      return "doc";
    } else if (audioExtention.contains(fileExtention)) {
      return "audio";
    } else if (archievesExtention.contains(fileExtention)) {
      return "archieve";
    } else {
      return "unknown";
    }
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

  // download folder
  downloadFolder() {
    navigatePage(downloadPath);
  }

  // all folder
  allFolder() {
    navigatePage(allPath);
  }

// recent file operation
  void addAndStoreTask(RecentModel task) {
    recentList.add(task);

    final Map storageMap = {};

    storageMap['name'] = task.path;
    storageMap['key'] = task.key;

    storageLis[task.key] = storageMap;
    box.write('tasks', storageLis);
    print("Worked");
    update();
  }

  void restoreTasks() {
    storageLis = box.read('tasks');

    storageLis.forEach((key, value) {
      final task = RecentModel(path: value['name'], key: key);

      recentList.add(task);
    });

    update();
  }

  Future<void> recentopenFileWithDefaultApp(String path) async {
    OpenResult _result = await OpenFile.open(path);

    print("Result message: " + _result.message);
    _openResult.value = "type=${_result.type}  message=${_result.message}";

    print("Open");
  }

  //data avaible or no
  bool isDataAvailable() {
    print("Read data");
    return _getStorage.read("data") ?? false;
  }

  void saveDataAvailable(bool isData) {
    _getStorage.write("data", isData);
  }

  //new user
  void changeAppTheme(state) {
    if (state == true) {
      isDarkTheme = true.obs;
      Get.changeTheme(ThemeData.dark());
      saveThemeData(isDarkTheme.value);
      print("Dark Mode");
    } else {
      isDarkTheme = false.obs;
      Get.changeTheme(ThemeData.light());
      print("Light Mode");
      saveThemeData(isDarkTheme.value);
    }
  }

  ThemeData getThemeData() {
    print("Got Theme");
    return isSavedDark() ? ThemeData.dark() : ThemeData.light();
  }

  bool isSavedDark() {
    print("Read Theme");
    return themeStorage.read("theme") ?? false;
  }

  void saveThemeData(bool isDark) {
    themeStorage.write("theme", isDark);
  }

  //is new user or not

}
