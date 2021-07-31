import 'package:filemanager/file_manager_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  print("init");
  runApp(FileManagerApp());
}
