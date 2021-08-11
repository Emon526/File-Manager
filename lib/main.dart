import 'package:filemanager/file_manager_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  await GetStorage.init();
  runApp(FileManagerApp());
}
